package com.book.entity;

import lombok.Data;

import java.util.Date;

@Data
public class ResourceEntity {
    private String id;
    private String name;
    private String parentId;
    private String url;
    private String flag;
    private int order;
    private int leave;
    private Date createTime;
}
