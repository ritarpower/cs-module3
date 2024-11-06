package com.example.case_study_module3.repository.BrandRepository;

import com.example.case_study_module3.model.Brand;

import java.util.List;

public interface IBrandRepository {
    List<Brand> getAllBrands();

    Brand getBrandById(int id);

    Brand getBrandByName(String name);
}
