package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;


public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
	//최대 no
	public int maxno() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxno();
		}catch(Exception e) {
			e.printStackTrace();
		}finally { 
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//게시글 작성하기
	public boolean insert(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(board);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	
	//게시글 갯수
	public int boardCount(String column, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String[] cols = column.split(",");
				map.put("col1",cols[0]);
				if(cols.length > 1) {
					map.put("col2",cols[1]);
				}
				if(cols.length > 2) {
					map.put("col3",cols[2]);
				}
			}
			map.put("find", find);
			return session.getMapper(cls).boardCount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//게시글 목록
	public List<Board> list(int pageNo, int limit, String column, String find){
		SqlSession session = MyBatisConnection.getConnection();
		
		try {
			map.clear();
			map.put("start",(pageNo-1) * limit);
			map.put("limit",limit);
			if(column != null) {
				String[] cols = column.split(",");
				map.put("col1",cols[0]);
				if(cols.length > 1) {
					map.put("col2",cols[1]);
				}
				if(cols.length > 2) {
					map.put("col3",cols[2]);
				}
			}
			map.put("find", find);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return null;
	}
	
	//게시물 정보
	public Board selectOne(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no",no);
			return session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//게시물 조회 건수 증가
	public void readcntAdd(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(no);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		
			}
	}
	
	
	//게시글 수정
	public boolean update(Board board) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).update(board);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		 
		}
		return false;
	}
	
	//게시글 삭제
	public boolean delete(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(no);
			if(cnt > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		
			}
		return false;
	}

}
