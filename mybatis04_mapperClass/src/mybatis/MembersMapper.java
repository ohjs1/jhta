package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import test.vo.MembersVo;

public interface MembersMapper {
	@Insert("insert into members values(#{num}, #{name}, #{phone}, #{addr}, sysdate)")
	int insert(MembersVo vo);
	
	@Select("select * from members")
	List<MembersVo> select();
	
	@Select("select * from members where num = #{num}")
	List<MembersVo> select2(int num);
	
	@Delete("delete from members where num = #{num}")
	int delete(int num);
	
	@Update("update members set name = #{name}, phone = #{phone}, addr = #{addr} where num = #{num}")
	int update(MembersVo vo);
}
