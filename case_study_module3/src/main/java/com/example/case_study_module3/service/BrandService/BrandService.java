package com.example.case_study_module3.service.BrandService;

import com.example.case_study_module3.model.Brand;
import com.example.case_study_module3.repository.BrandRepository.BrandRepository;
import com.example.case_study_module3.repository.BrandRepository.IBrandRepository;

import java.util.List;

public class BrandService implements IBrandService {
    private IBrandRepository brandRepository = new BrandRepository();

    @Override
    public List<Brand> getAllBrands() {
        return brandRepository.getAllBrands();
    }
}
