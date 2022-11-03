package board_ex.service;

import java.util.List;

import board_ex.model.*;


public class ViewArticleService {
	private static ViewArticleService instance;
	public static ViewArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ViewArticleService();
		}
		return instance;
	}
	//ViewArticleService.java의 getArticleById( ) 메소드에서는 넘어오는 인자 String id를 Int타입으로 형 변환 후,
	//BoardDao.java의 selectById( ) 메소드의 인자로 넣어 호출
	public BoardVO getArticleById(String id) throws BoardException
	{
		int article_id = 0;
		if( id != null ) article_id = Integer.parseInt(id);
		BoardDao dao = BoardDao.getInstance();
		dao.increaseReadCount(article_id);
		BoardVO rec = dao.selectById(article_id);		
		
		//System.out.println("ㅎ");
		return rec;
	}
		
}

