package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Play;

public interface PlayMapper {
	@Select("select ifnull(MAX(no),0) from play")
	int maxno();

	@Insert("insert into play (no,id,subject,category,review,price,cast,date,time,place,memo) "
			+"values (#{no},#{id},#{subject},#{category},#{review},#{price},#{cast},#{date},#{time},#{place},#{memo})")
	void insert(Play play);

	@Select({"<script>",
		"select*from play ",
		"<if test='no != null'> where no = '${no}'</if>",
		"<if test='date != null'> where date = '${date}'</if>",
		"<if test='find != null'> where subject like '%${find}%' or date like '%${find}%' and category = '${category}'</if>",
		"<if test='find == null &amp;&amp; category != null'> where category = '${category}'</if>",
		"<otherwise>order by date desc</otherwise>",
	"</script>"})
	List<Play> select(Map<String, Object> map);

	@Select({"<script>",
		"select*from play ",
		"<if test='id != null'>where id = #{id}</if>",
		"<if test='date != null'> and date = #{date}</if>",
	"</script>"})
	List<Play> selectList(Map<String, Object> map);

	
	@Select({"<script>",
		"select * from play ",
		"<if test='date != null'> where date = #{date}</if>",
	"</script>"})
	List<Play> selecttodo(Map<String, Object> map);

	@Update("update play set subject=#{subject},review=#{review},file1=#{file1} where no=#{no}")
	void rupdate(Play p);

	@Select({"<script>",
		"select count(*) from play ",
		"<if test='find != null'> where subject like '%${find}%' or date like '%${find}%' and category = '${category}'</if>",
		"<if test='find == null &amp;&amp; category != null'> where category = '${category}'</if>",
	"</script>"})
	int playCount(Map<String, Object> map);

	@Select("select date_format(date,'%Y-%c') date, count(*) cnt from play where id= #{id} group by date_format(date,'%Y-%c') order by date asc LIMIT 0,12")
	List<Map<String, Integer>> chart1(String id);

	@Select("select date_format(date,'%Y-%c') date, sum(price) price from play where id= #{id} group by date_format(date,'%Y-%c') order by date asc LIMIT 0,12")
	List<Map<String, Integer>> chart2(String id);

	@Select("select date_format(date,'%w') date, count(*) cnt from play where id= #{id} group by date_format(DATE,'%w') order by date asc LIMIT 0,7")
	List<Map<String, Integer>> chart3(String id);

	@Update("update play set id=#{id},subject=#{subject},category=#{category},review=#{review},price=#{price},cast=#{cast},date=#{date},time=#{time},place=#{place},memo=#{memo},file1=#{file1} where no=#{no}")
	void update(Play p);

	@Delete("delete from play where no=#{value}")
	int delete(int no);

	@Select("SELECT * FROM play WHERE id = #{id}")
	List<Map<String, Integer>> selectList2(String id);

	
}
