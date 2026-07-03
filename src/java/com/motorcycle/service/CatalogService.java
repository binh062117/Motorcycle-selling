package com.motorcycle.service;

import com.motorcycle.dao.BrandDao;
import com.motorcycle.dao.CategoryDao;
import com.motorcycle.dao.ProductDao;
import com.motorcycle.model.Brand;
import com.motorcycle.model.Category;
import com.motorcycle.model.Product;
import java.util.List;
import java.util.Optional;

public class CatalogService {
    private final ProductDao productDao = new ProductDao();
    private final BrandDao brandDao = new BrandDao();
    private final CategoryDao categoryDao = new CategoryDao();

    public List<Product> search(String keyword, String brand, String category, String priceFilter) {
        return productDao.search(keyword, brand, category, priceFilter);
    }

    public Optional<Product> findProduct(int id) {
        return productDao.findById(id);
    }

    public List<Brand> findBrands() {
        return brandDao.findAll();
    }

    public List<Category> findCategories() {
        return categoryDao.findAll();
    }

    public Product saveProduct(Product product) {
        return productDao.save(product);
    }

    public boolean deleteProduct(int id) {
        return productDao.delete(id);
    }

    public Brand saveBrand(Brand brand) {
        return brandDao.save(brand);
    }

    public boolean deleteBrand(int id) {
        return brandDao.delete(id);
    }

    public Optional<Brand> findBrand(int id) {
        return brandDao.findById(id);
    }

    public Optional<Category> findCategory(int id) {
        return categoryDao.findById(id);
    }
}
