package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatis.vo.MyUsersVo;

public interface MembersMapper {
	@Insert("insert into myusers values(#{id}, #{pw}, #{email}, sysdate)")
	public int insert(MyUsersVo vo);
	
	@Select("select * from myusers")
	public List<MyUsersVo> selectAll();
	
	@Select("select * from myusers where id = #{id}")
	public MyUsersVo selectOne(String id);
	
	@Delete("delete from myusers where id = #{id}")
	public int deleteOne(String id);
	
	@Update("update myusers set pw=#{pw}, email=#{email} where id = #{id}")
	public int updateOne(MyUsersVo vo);
}
