package com.example.erxueqi.service;

import com.example.erxueqi.entity.Class;
import com.example.erxueqi.service.ClassService;
import com.example.erxueqi.respository.ClassRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.reflect.generics.repository.ClassRepository;


import java.util.List;

@Service
public class ClassServiceImpl implements ClassService {

    @Autowired
    private ClassRespository classRspository;

    @Override
    public Class saveClass(Class clazz) {
        return classRspository.save(clazz);
    }

    @Override
    public Class getClassById(Integer id) {
        return classRspository.findById(id).orElse(null);
    }

    @Override
    public List<Class> getAllClasses() {
        return classRspository.findAll();
    }

    @Override
    public void deleteClassById(Integer id) {
        classRspository.deleteById(id);
    }

    @Override
    public Class updateClass(Class clazz) {
        return classRspository.save(clazz);
    }
}