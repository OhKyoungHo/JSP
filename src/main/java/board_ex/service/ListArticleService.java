package board_ex.service;

import java.util.List;

import board_ex.model.*;

public class ListArticleService {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 6;	// 한페이지당 레코드 수
	
	//싱글톤 패턴
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		int pageNum =1;//페이지 값이 없을때 1페이지로 설정
		if(pNum != null) pageNum = Integer.parseInt(pNum);//pNum이 String 값이라서 형변환
		
		/*		페이지번호		시작레코드번호		끝레코드번호
		 * 			1			1				6	
		 * 			2			7				12			
		 * 			3			13				18			*/
		//시작레코드번호//한페이지당 필요한 레코드 수를 6으로 지정해서 -5
		int startRow = (pageNum*countPerPage)-5;
		//끝레코드번호
		int endRow 	 = pageNum* countPerPage;
		
		//시작레코드와 끝레코드를 mList에 붙여주기
		 List <BoardVO> mList = BoardDao.getInstance().selectList(startRow,endRow);			
		//붙여준 mList반환
		 return mList;
	}
	//페이지수를 구해주는 메소드
	public int getTotalPage() throws BoardException
	{
		//전체 레코드 수
		totalRecCount = BoardDao.getInstance().getTotalCount();
		
		//pageTotalCount=(int)Math.ceil(totalRecCount/countPerPage);
		//전체 페이지수 = 전체레코드 / 한페이지 당 레코드 수
		pageTotalCount = totalRecCount /countPerPage;
		//만약 전체레코드 / 한페이지 당 레코드 수한 값의 나머지가 0보다 큰 경우 전체페이지수 +1
		if(totalRecCount%countPerPage>0) pageTotalCount++;
		
		
		//전체 레코드 수에 따른 페이지 수
		return pageTotalCount;	//페이지 수 리턴
	}
	
		
}
