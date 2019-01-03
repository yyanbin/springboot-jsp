package com.book.controller;

import com.book.entity.ResourceEntity;
import com.book.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/resource")
@RestController
public class ResourceController {
    @Autowired
    private ResourceService resourceService;

    @RequestMapping("/selectMenu")
    public List<ResourceEntity> selectMenu(){
        List<ResourceEntity> resourceEntities = resourceService.selectMenu();
        return  resourceEntities;
    }
}
