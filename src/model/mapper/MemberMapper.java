package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member (id,pass,nickname,birth,email,picture) values (#{id},#{pass},#{nickname},#{birth},#{email},#{picture})")
	int insert(Member mem);

	@Select({"<script>",
				"select*from member ",
				"<if test='id != null'> where binary id=#{id}</if>",
		 	"</script>"})
	List<Member> select(Map<String, Object> map);

	
	
	
	@Select("select id from member where email=#{email} and birth=#{birth}") 
	String idSearch(@Param("email") String email, @Param("birth") String birth);

	@Select("select pass from member where id=#{id} and email=#{email} and birth=#{birth}") 
	String pwSearch(@Param("id") String id, @Param("email") String email, @Param("birth") String birth);

	@Update("update member set pass=#{pass},nickname=#{nickname},email=#{email},birth=#{birth},picture=#{picture} where id=#{id}")
	int update(Member mem);

	@Update("update member set pass=#{pass} where id=#{id}")
	int updatePass(String id, String pass);

	@Delete("delete from member where id=#{id}")
	int delete(String id);

	@Select("select count(*) from member where id=#{id}")
	int chkid(String id);

	@Select("select count(*) from member where nickname=#{nickname}")
	int chknick(String nickname);
	
}
