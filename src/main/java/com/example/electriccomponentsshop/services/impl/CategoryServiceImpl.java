package com.example.electriccomponentsshop.services.impl;


import com.example.electriccomponentsshop.config.ModelMap;
import com.example.electriccomponentsshop.dto.CategoryDTO;
import com.example.electriccomponentsshop.entities.Category;
import com.example.electriccomponentsshop.repositories.CategoryRepository;
import com.example.electriccomponentsshop.services.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@AllArgsConstructor
@Service
public class CategoryServiceImpl implements CategoryService {
    final CategoryRepository categoryRepository;

    final ModelMap modelMap;

    @Override
    public List<Category> findCategoriesByParentCategoryIdIsNull() {
        return categoryRepository.findNoneParent();
    }

    @Override
    public List<Category> findAll() {
        List<Category> categories = categoryRepository.findAll();
        return categories;
    }

    @Override
    public Category getById(String id) {
        try {
            Integer cId = Integer.parseInt(id);

            Optional<Category> category = categoryRepository.findById(cId);
            if (category.isEmpty()) {
                throw new NoSuchElementException("Không tìm thấy danh mục này");
            } else return category.get();
        } catch (NumberFormatException e) {
            throw new NoSuchElementException("Không có danh mục này");
        }
    }

    @Override
    public Category addCategory(String name) {
        return categoryRepository.save(new Category(name));
    }

    @Override
    public void deleteCategory(Integer id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public Category updateCategory(CategoryDTO categoryDTO) {
        Category category = categoryRepository.findById(categoryDTO.getId()).get();
        category.setName(categoryDTO.getName());
        return category;
    }


    public Category getCategoryById(Integer id) {
        Optional<Category> categoryOptional = categoryRepository.findById(id);
        if (categoryOptional.isEmpty()) {
            throw new NoSuchElementException();
        }
        return categoryOptional.get();
    }
}
