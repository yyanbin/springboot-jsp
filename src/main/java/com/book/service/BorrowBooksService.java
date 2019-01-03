package com.book.service;

import com.book.common.ResponsePage;
import com.book.entity.BorrowBooksEntity;
import com.book.dao.BorrowBooksDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BorrowBooksService {
    @Autowired
    private BorrowBooksDao borrowBooksDao;

    public ResponsePage queryList(int page , int rows) {
        List<BorrowBooksEntity> borrowBooksEntities = borrowBooksDao.selectAll(page,rows);
        int count = borrowBooksDao.selectAllCount();
        return new ResponsePage(count,borrowBooksEntities);
    }
}
