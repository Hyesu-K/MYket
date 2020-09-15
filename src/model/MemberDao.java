package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;

public class MemberDao {
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	//회원정보 보기
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//회원추가
	public int insert(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	

	
	//회원 목록 보기
	public List<Member> list(){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//아이디찾기
	public String findid(String email,String birth) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).idSearch(email, birth);
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	//비번 찾기
	public String findpw(String id, String email, String birth) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).pwSearch(id, email, birth);  
		}catch (Exception e) {
			e.getStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//정보 수정
	public int update(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).update(mem);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//비밀번호 변경
	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).updatePass(id, pass);	 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//회원 삭제
	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int idchk(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).chkid(id);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}

	public int nickchk(String nickname) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).chknick(nickname);	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	

}
