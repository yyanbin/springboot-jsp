package com.book.dao;

import com.book.entity.BorrowBooksEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowBooksDao {

    void insert(BorrowBooksEntity entity);

    List<BorrowBooksEntity> selectAll(@Param("page") int page , @Param("rows") int rows);

    int selectAllCount();
}
