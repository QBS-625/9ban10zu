package com.example.erxueqi.Controller;

import com.example.erxueqi.entity.Class;
import com.example.erxueqi.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/classes")
public class ClassController {

    @Autowired
    private ClassService classService;

    // 新增班级
    @PostMapping
    public Class saveClass(@RequestBody com.example.erxueqi.entity.Class cls) {
        return classService.saveClass(cls);
    }

    // 根据 ID 查询班级
    @GetMapping("/{id}")
    public com.example.erxueqi.entity.Class getClassById(@PathVariable Integer id) {
        return classService.getClassById(id);
    }

    // 查询所有班级
    @GetMapping
    public List<com.example.erxueqi.entity.Class> getAllClasses() {
        return classService.getAllClasses();
    }

    // 根据 ID 删除班级
    @DeleteMapping("/{id}")
    public void deleteClassById(@PathVariable Integer id) {
        classService.deleteClassById(id);
    }

    // 更新班级信息
    @PutMapping
    public com.example.erxueqi.entity.Class updateClass(@RequestBody com.example.erxueqi.entity.Class cls) {
        return classService.updateClass(cls);
    }
}