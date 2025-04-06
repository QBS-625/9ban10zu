package com.example.erxueqi.service;

import com.example.erxueqi.entity.Class;

import java.util.List;

public interface ClassService {

    Class saveClass(Class clazz);
    Class getClassById(Integer id);
    List<Class> getAllClasses();
    void deleteClassById(Integer id);

    Class updateClass(Class clazz);
}