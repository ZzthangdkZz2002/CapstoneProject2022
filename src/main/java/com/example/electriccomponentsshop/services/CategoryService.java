package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.config.ModelMap;
import com.example.electriccomponentsshop.dto.CategoryDTO;
import com.example.electriccomponentsshop.entities.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface CategoryService {


    List<Category> findCategoriesByParentCategoryIdIsNull();
    Category getById(String id);
    List<Category> findAll();
    Category addCategory(String name);

    void deleteCategory(Integer id);

    Category updateCategory(CategoryDTO categoryDTO);




}
