package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		//mybatis-config.xml 설정파일이랑 연결
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	
	public List<Comment>selectComment(){
		//*** 연결객체 Connection => SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			return session.selectList("CommentMapper.selectComment");
		}finally {
			session.close(); //연결객체 반환
		}
	}
	
	public Comment selectCommentByPK(int commentNo) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			Comment c= session.selectOne("CommentMapper.selectCommentByPK",map);
			return c;
		}finally {
			session.close(); //연결객체 반환
		}
	}
	
	public void insertComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.insertComment";
			int result = session.insert(statement, c);
			if(result>0)session.commit();
			else session.rollback();
			//*****mybatis는 수동 커밋
		}finally {
			session.close(); //연결객체 반환
		}
	}

	public void deleteCommentByPK(int commentNo) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			HashMap map = new HashMap();
			map.put("commentNo", commentNo);
			int result= session.delete("CommentMapper.deleteCommentByPK",map);
			if(result>0)session.commit();
		}finally {
			session.close(); //연결객체 반환
		}

	}
	
	public void modifyComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement = "CommentMapper.modifyComment";
			int result = session.update(statement, c);
			if(result>0)session.commit();
			else session.rollback();
			//*****mybatis는 수동 커밋
		}finally {
			session.close(); //연결객체 반환
		}
	}
	
}
