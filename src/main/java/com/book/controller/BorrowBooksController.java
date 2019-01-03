package com.book.controller;

import com.book.common.ResponsePage;
import com.book.entity.BorrowBooksEntity;
import com.book.service.BorrowBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/borrowBooks")
@RestController
public class BorrowBooksController {
    @Autowired
    private BorrowBooksService borrowBooksService;

    @RequestMapping("/list.do")
    public ResponsePage queryList(@RequestParam(required = false,defaultValue="1") int page,
                                  @RequestParam(required = false,defaultValue="20")int rows){
        return borrowBooksService.queryList(page,rows);
    }
}
