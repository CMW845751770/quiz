package cn.edu.tju.system.mapper;

import cn.edu.tju.system.entity.User;
import org.apache.ibatis.annotations.Param;


public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByEmail(@Param("email") String email) ;

    int updatePasswordByEmail(@Param("email") String email,@Param("password")String password) ;

    int updateStatusByEmail(@Param("email") String email,@Param("status") boolean status);

    Integer selectTotalCount() ;

    User selectByEmailStatus(@Param("email") String email,@Param("status")Boolean status) ;

    int updateUsernameBYPrimaryKey(@Param("id")Integer id , @Param("username")String username) ;
}