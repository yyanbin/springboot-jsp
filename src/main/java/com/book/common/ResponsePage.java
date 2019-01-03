package com.book.common;

import java.util.List;


public class ResponsePage {
    private int total;
    private List rows;

    public ResponsePage(int total, List rows) {
        this.total=total;
        this.rows=rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
