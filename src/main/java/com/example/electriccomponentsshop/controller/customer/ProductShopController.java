package com.example.electriccomponentsshop.controller.customer;
import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.entities.Category;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.CategoryRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.CategoryService;
import com.example.electriccomponentsshop.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping(path = "/product")
public class ProductShopController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoryRepository categoryRepository;


    @GetMapping(value = "/list")
    public String showListProduct (Model model, @RequestParam(name="index",defaultValue = "0") String index) {
        Page<Product> products =  productRepository.findAllByStatus(PageRequest.of(Integer.parseInt(index),10),1);
        model.addAttribute("products", products.getContent());
        model.addAttribute("total",products.getTotalPages());

        List<Category> categories = categoryRepository.findNoneParent();
        model.addAttribute("categories", categories);

        return "onlinePage/productList";
    }

    @GetMapping(value = "")
    public String getProductByCateInFirstPage (@RequestParam String cate,
                                               @RequestParam String pageNo, ModelMap model) {
        Category category = null;
        List<Product> products = null;

        try {
            int no = Integer.parseInt(pageNo);

            int pageNum = (int) Math.ceil(productService.countByCate(cate)/18.0);
            List<Category> categories = categoryRepository.findAll();

            category = categoryService.getById(cate);
            products = productService.getProductByCate(cate, no, 18);

            model.addAttribute("categories", categories);
            model.addAttribute("products", products);
            model.addAttribute("category", category);
            model.addAttribute("pageNum", pageNum);
            model.addAttribute("active", no);
        } catch (Exception e) {
            throw e;
        }

        return "onlinePage/product-by-cgr";
    }
}
