package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import model.Member;
import model.Reply;

public interface ReplyMapper {

	@Select("SELECT COUNT(*) cnt FROM reply where bno = #{bno}")
	int replyCount(Map<String, Object> map);

	@Select("SELECT * FROM reply WHERE bno = #{bno}")
	List<Map<String, Integer>> select(int bno);

	@Select("SELECT nickname FROM member WHERE id = #{id}")
	String selectNickname(String id);

	@Insert("insert into reply (bno,id,content,author,regdate) "+"values (#{bno},#{id},#{content},#{author},now())")
	void insert(Reply reply);

	@Delete("DELETE FROM reply WHERE rno = #{rno}")
	void delete(int rno);
}
