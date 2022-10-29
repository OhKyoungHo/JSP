package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {
	private MemberDAO() throws Exception{
		// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("EmpDAO 객체 생성 - 드라이버로딩");
	}
	//싱글톤에서는 하나의 하나'의 인스턴스만 생성하여 사용하기 때문에 없는 경우에만 
	//객체를 생성하는 것으로 설정해서 식을 작성
	static MemberDAO memberDAO = null;	//객체 생성해서 null 값으로 설정
	public static MemberDAO getInstance() throws Exception{
		//memberDAO ==null인 경우에 MemberDAO 객체 생성
		if(memberDAO ==null) memberDAO = new MemberDAO();
		return memberDAO;	//새로형성된 객체 리턴
	}//해당 경우에는 1번만 가능하도록 설정
	
	//정보를 입력했을 경우
	public void insert(MemberVO vo) throws Exception{
		//변수선언 
		Connection con= null;
		PreparedStatement ps=null;
		try {
			// 2. 연결객체 얻어오기
			String url ="jdbc:oracle:thin:@192.168.0.26:1521:xe";
			String user ="scott";
			String pass ="tiger";
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("디비 연결 성공");
			// 3. sql 문장 만들기
			String sql = "INSERT INTO form(realname, nickname, email, age) VALUES(?,?,?,?)";
			// 4. 전송 객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getRealname());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getEmail());
			ps.setInt(4, vo.getAge());
			// 5. 전송
			ps.executeUpdate();
		}finally {
			// 6. 닫기
			ps.close();
		}
	}
	
	
	
	
}
