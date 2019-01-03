package com.book.service;

import com.book.dao.ResourceDao;
import com.book.entity.ResourceEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResourceService {
    @Autowired
    private ResourceDao resourceDao;

    public List<ResourceEntity> selectMenu(){
        List<ResourceEntity> resourceEntities = resourceDao.selectMenu();
        return resourceEntities;
    }
}
