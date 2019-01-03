package com.book.dao;

import com.book.entity.ResourceEntity;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ResourceDao {
   @Select("select * from y_resource where 1=1")
   List<ResourceEntity> selectMenu();
}
