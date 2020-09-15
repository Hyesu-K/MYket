package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.ReplyMapper;

public class ReplyDao {
	private Class<ReplyMapper> cls = ReplyMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	public int replyCount(int bno) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("bno", bno);
			return session.getMapper(cls).replyCount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public List<Map<String,Integer>> replylist(int bno) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).select(bno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return list;
	}

	public String selectNickname(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectNickname(id);
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	public void replyInsert(Reply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(reply);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return;
		
	}

	public void replyDelete(int rno) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).delete(rno);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return;
	}

}
