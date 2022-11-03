package board_ex.model;



import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import guest.model.Message;
import guest.model.MessageException;

public class BoardDao
{
	
	// Single Pattern 
	private static BoardDao instance;
	
	// DB 연결시  관한 변수  
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@192.168.0.26:1521:xe";
	private static final String		dbUser		=	"scott";
	private static final String		dbPass		=	"tiger";
	
	
	private Connection	 		con;	
	
	//--------------------------------------------
	//#####	 객체 생성하는 메소드 (싱글톤 방식)
	public static BoardDao	getInstance() throws BoardException
	{
		if( instance == null )
		{
			instance = new BoardDao();
		}
		return instance;
	}
	
	private BoardDao() throws BoardException
	{
	
		try{
			
			/********************************************
			1. 오라클 드라이버를 로딩
				( DBCP 연결하면 삭제할 부분 )
		*/
			Class.forName( dbDriver );	
		}catch( Exception ex ){
			throw new BoardException("DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	/************************************************
	 * 함수명 : insert
	 * 역할 :	게시판에 글을 입력시 DB에 저장하는 메소드 
	 * 인자 :	BoardVO
	 * 리턴값 : 입력한 행수를 받아서 리턴
	*/
	public int insert( BoardVO rec ) throws BoardException
	{

		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			
			//* sql 문장 만들기
			String putQuery		= "INSERT INTO board_ex(seq,title,writer,content,regdate, cnt, pass)"
					+ " VALUES(seq_board.nextval,?,?,?,sysdate,0,?)";  

			ps		= con.prepareStatement( putQuery );
			//* sql 문장의 ? 지정하기
			ps.setString(1, rec.getTitle());
			ps.setString(2, rec.getWriter());
			ps.setString(3, rec.getContent());
			ps.setString(4, rec.getPass());
			 ps.executeUpdate();
			 ps.close();

			 //현재의 입력하려는 글번호로 보내는 sql작성
			 String sql2= "SELECT seq_board.currval as seq FROM dual";
			 ps	= con.prepareStatement( sql2 );
			 rs= ps.executeQuery();
			 if(rs.next()) {
				 //컬럼 이름이 seq인 것을 반환하겠다
				 return rs.getInt("seq");
			 }
			//없는 경우
			return 0;
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}


	/************************************************
	 * 함수명 : selectList
	 * 역할 :	전체 레코드를 검색하는 함수
	 * 인자 :	없음
	 * 리턴값 : 테이블의 한 레코드를 BoardVO 지정하고 그것을 ArrayList에 추가한 값
	*/

	public List<BoardVO> selectList() throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BoardVO> mList = new ArrayList<BoardVO>();
		boolean isEmpty = true;
		
		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			
			// * sql 문장만들기
			String sql = "SELECT seq,title,writer,regdate,cnt FROM board_ex";
			// * 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			// * 전송하기
			// * 결과 받아 List<BoardVO> 변수 mList에 지정하기
			while(rs.next()) {
				BoardVO vo =new BoardVO();
				vo.setSeq(rs.getInt("SEQ"));
				vo.setTitle(rs.getString("TITLE"));
				vo.setWriter(rs.getString("WRITER"));
				vo.setRegdate(rs.getString("REGDATE"));
				vo.setCnt(rs.getInt("CNT"));
				mList.add(vo);
				isEmpty=false;
			}

			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
	
	//--------------------------------------------
	
	/************************************************
	 * 함수명 : selectById
	 * 역할 :	게시글번호에 의한 레코드 검색하는 함수
	 * 인자 :	int seq
	 * 리턴값 : 결과 받아 BoardVO변수 rec에 지정한 값들을 리턴
	*/
	public BoardVO selectById(int seq) throws BoardException
	{
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		BoardVO rec = new BoardVO();
		
		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			// * sql 문장만들기
			String sql = "SELECT* FROM board_ex WHERE seq=?";
			
			// * 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			rs = ps.executeQuery();
			// * 전송하기
			while(rs.next()) {
				rec.setSeq(rs.getInt("SEQ"));
				rec.setTitle(rs.getString("TITLE"));
				rec.setWriter(rs.getString("WRITER"));
				rec.setContent(rs.getString("CONTENT"));
				rec.setRegdate(rs.getString("REGDATE"));
				rec.setCnt(rs.getInt("CNT"));
				rec.setPass(rs.getString("PASS"));
				
			}
			// * 결과 받아 BoardVO변수 rec에 지정하기
			//결과로 얻어온 ResultSet의 데이터를 BoardVO.java클래스의 멤버변수로 담는다	
			return rec;
		}catch( Exception ex ){
			throw new BoardException("게시판 ) DB에 글번호에 의한 레코드 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}

	//--------------------------------------------
	//#####	 
	/************************************************
	 * 함수명 : increaseReadCount
	 * 역할 :	게시글 보여줄 때 조회수 1 증가
	 * 인자 :	int seq
	 * 리턴값 : cnt 값이 1이 늘어간 값을 리턴
	*/
	public void increaseReadCount( int seq ) throws BoardException
	{

		PreparedStatement ps = null;
		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			// * sql 문장만들기
			String sql ="UPDATE board_ex SET cnt = cnt + 1 WHERE seq = ?";
			// * 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			// * 전송하기
			ps.executeUpdate();
			
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 볼 때 조회수 증가시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	//--------------------------------------------
	//#####	 게시글 수정할 때
	/************************************************
	 * 함수명 : update
	 * 역할 :	게시글 수정할 때 수정한 화면을 출력
	 * 인자 :	BoardVO rec 
	 * 리턴값 : 수정한 값들을 rec에 넣어서 전송값을 리턴
	*/
	public int update( BoardVO rec ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			// * sql 문장만들기
			String sql= "UPDATE board_ex SET content=?,title=?, regdate=sysdate where seq=? AND pass=?";
			// * 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setString(1, rec.getContent());
			ps.setString(2, rec.getTitle());
			ps.setInt(3, rec.getSeq());
			ps.setString(4, rec.getPass());
			

			return ps.executeUpdate();
		
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 수정시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
	
	//--------------------------------------------
	//#####	 게시글 삭제할 때
	/************************************************
	 * 함수명 : delete
	 * 역할 :	게시글 삭제
	 * 인자 :	int seq, String pass 
	 * 리턴값 : 값들을 삭제한 것을 리턴
	*/
	public int delete( int seq, String pass ) throws BoardException
	{

		PreparedStatement ps = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
		
			// * sql 문장만들기
			String sql = "DELETE FROM board_ex WHERE seq=? AND pass=?";
			
			// * 전송객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, seq);
			ps.setString(2, pass);
			return ps.executeUpdate();
			
		}catch( Exception ex ){
			throw new BoardException("게시판 ) 게시글 삭제시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	/************************************************
	 * 함수명 : selectList
	 * 역할 :	시작페이지와 끝페이지 설정
	 * 인자 :	int seq, String pass 
	 * 리턴값 : 시작페이지와 끝페이지 값이 설정된 것을 리턴
	*/
	
	public List<BoardVO> selectList(int firstRow, int endRow) throws BoardException{
	PreparedStatement ps = null;
	ResultSet rs = null;
	List<BoardVO> mList = new ArrayList<BoardVO>();
	boolean isEmpty = true;
	try{

		con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
		
		// * sql 문장만들기
		String sql = "SELECT*"
				+ " FROM board_ex"
				+ " WHERE seq IN(SELECT seq"
				+ " FROM (SELECT rownum rnum,seq FROM (SELECT rownum,seq FROM board_ex ORDER BY seq DESC))"
				+ " WHERE rnum>=? AND rnum<=?)"
				+ " ORDER BY seq DESC";
		// * 전송객체 생성
		ps = con.prepareStatement(sql);
		// 전송값 얻어오기
		ps.setInt(1, firstRow);
		ps.setInt(2, endRow);
		rs = ps.executeQuery();
		
		// * 전송하기
		while(rs.next()) {
			//BoardVO의 새로운 객체 vo 생성
			BoardVO vo =new BoardVO();
			//vo 값에 세팅
			vo.setSeq(rs.getInt("SEQ"));
			vo.setTitle(rs.getString("TITLE"));
			vo.setWriter(rs.getString("WRITER"));
			vo.setRegdate(rs.getString("REGDATE"));
			vo.setCnt(rs.getInt("CNT"));
			// * 결과 받아 List<BoardVO> 변수 mList에 지정하기
			mList.add(vo);
			isEmpty=false;
		}
		
		if( isEmpty ) return Collections.emptyList();
		
		return mList;
	}catch( Exception ex ){
		throw new BoardException("게시판 ) 시작페이지, 끝페이지 값 설정 오류  : " + ex.toString() );	
	} finally{
		if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
		if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
		if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
	}		
}
	
	/************************************************
	 * 함수명 : getTotalCount
	 * 역할 :	메세지 전체 레코드 수를 검색
	 * 인자 :없음 
	 * 리턴값 :RCNT(count(*))(레코드 전체 수) 값을 가져와서 count값에 넣어서 리턴
	*/
	public int getTotalCount() throws BoardException{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("EmpDAO 객체 생성 - 드라이버로딩");
			// 1. 연결객체(Connection) 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			System.out.println("디비 연결 성공");
			// 2. sql 문장 만들기
			String sql = "SELECT count(*) RCNT FROM board_ex";
			 //3. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//rs.next() 값이 있을 경우 RCNT에서 값을 얻어와 count에 저장
			if(rs.next()) {count = rs.getInt("RCNT");};
			//count 값 리턴
			return  count;
			
		}catch( Exception ex ){
			throw new BoardException( " 게시판) DB에 페이지 개수 출력 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
	
}