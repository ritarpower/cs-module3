package com.example.case_study_module3.service.PhoneService;

import com.example.case_study_module3.model.Phone;

import java.util.List;

public interface IPhoneService {
    List<Phone> findAll();

    Phone findById(int id);

    void add(Phone phone);

    void edit(Phone phone);

    void delete(Phone phone);

    List<Phone> find(String name,int storage, String brand);

    List<Phone> find(int storage, String brand);
}
