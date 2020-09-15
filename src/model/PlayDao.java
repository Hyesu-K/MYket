package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.PlayMapper;

public class PlayDao {
	private Class<PlayMapper> cls = PlayMapper.class;
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
	
	//일정 등록
	public boolean insert(Play play) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(play);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return false;
	}

	//일정 정보
	public Play selectOne(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("no",no);
			return (Play) session.getMapper(cls).select(map).get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//일정 수정
	public boolean update(Play p) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).update(p);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		 
		}
		return false;
	}
	
	//일정 목록
	public List<Play> selectList(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			return session.getMapper(cls).selectList(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return null;
	}

	public List<Play> selecttodo(String today) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("date",today);
			return session.getMapper(cls).selecttodo(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//후기 작성 
	public boolean rupdate(Play p) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).rupdate(p);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		 
		}
		return false;
	}

	//후기글 갯수
	public int playCount(String category, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("category", category);
			map.put("find", find);
			return session.getMapper(cls).playCount(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	//후기 목록
	public List<Play> list(int pageNo, int limit, String category, String find) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("start",(pageNo-1) * limit);
			map.put("limit",limit);
			map.put("category", category);
			map.put("find", find);
			return session.getMapper(cls).select(map);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session); 
		}
		return null;
	}

	public List<Map<String, Integer>> chart1(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).chart1(id);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		
		}
		return list;
	}

	public List<Map<String, Integer>> chart2(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).chart2(id);
			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		
		}
		return list;
	}

	public List<Map<String, Integer>> chart3(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Map<String, Integer>> list = null;
		try {
			list = session.getMapper(cls).chart3(id);
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);		
		}
		return list;
	}


	public boolean delete(int no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(no);
			System.out.println(cnt);
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
