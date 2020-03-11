package com.itheima.ssm.dao;

import com.itheima.ssm.domain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {


    //member在最新mysql里面是关键字，找这个bug找了好久...
    @Select("select * from `member` where id = #{id}")
    public Member findById(String id) throws Exception;
}
