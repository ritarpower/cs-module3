package com.example.case_study_module3.repository.PhoneRepository;

import com.example.case_study_module3.model.Phone;

import java.util.List;

public interface IPhoneRepository {
    List<Phone> findAll();

    Phone findById(int id);

    void add(Phone phone);

    void edit(Phone phone);

    void delete(Phone phone);

    List<Phone> findByNameAndStatus(String name, int storage);
}
