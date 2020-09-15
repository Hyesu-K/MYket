package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;

public interface BoardMapper {

	@Select("select ifnull(MAX(no),0) from board")
	int maxno();

	@Insert("insert into board (no,id,category1,category2,subject,content,author,regdate,readcnt,datetime,file1) "
			+"values (#{no},#{id},#{category1},#{category2},#{subject},#{content},#{author},now(),0,#{datetime},#{file1})")
	void insert(Board board);

	@Select({"<script>",
		"select count(*) from board ",
		"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
		"</script>"})
	int boardCount(Map<String,Object> map);

	@Select({"<script>",
				"select*from board ",
				"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
				"<if test='col2 != null'> or ${col2} like '%${find}%'</if>",
				"<if test='col3 != null'> or ${col3} like '%${find}%'</if>",
				"<when test='no != null'>where no = #{no}</when>",
				"<otherwise>order by regdate desc</otherwise>",
			"</script>"})
	List<Board> select(Map<String, Object> map);

	
	
	
	@Update("update board set readcnt = readcnt+1 where no=#{no}")
	void readcntAdd(int no);

	@Update("update board set category2=#{category2},subject=#{subject},content=#{content},file1=#{file1},datetime=#{datetime} where no=#{no}")
	void update(Board board);

	@Delete("delete from board where no=#{value}")
	int delete(int no);

	
}
