package com.example.case_study_module3.service;

import com.example.case_study_module3.model.Phone;
import com.example.case_study_module3.repository.IPhoneRepository;
import com.example.case_study_module3.repository.PhoneRepository;

import java.util.List;

public class PhoneService implements IPhoneService {
    private final IPhoneRepository phoneRepository = new PhoneRepository();

    @Override
    public List<Phone> findAll() {
        return phoneRepository.findAll();
    }

    @Override
    public Phone findById(int id) {
        return phoneRepository.findById(id);
    }

    @Override
    public void add(Phone phone) {
        phoneRepository.add(phone);
    }

    @Override
    public void edit(Phone phone) {
        phoneRepository.edit(phone);
    }

    @Override
    public void delete(Phone phone) {
        phoneRepository.delete(phone);
    }

    @Override
    public List<Phone> findByNameAndStatus(String name, int storage) {
        return phoneRepository.findByNameAndStatus(name, storage);
    }


}
