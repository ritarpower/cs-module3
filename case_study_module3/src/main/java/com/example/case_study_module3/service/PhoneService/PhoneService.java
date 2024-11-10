package com.example.case_study_module3.service.PhoneService;

import com.example.case_study_module3.model.Phone;
import com.example.case_study_module3.repository.PhoneRepository.IPhoneRepository;
import com.example.case_study_module3.repository.PhoneRepository.PhoneRepository;

import java.util.Collections;
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
    public List<Phone> find(String name, int storage, String brand) {
        return phoneRepository.find(name, storage, brand);
    }

    @Override
    public List<Phone> find(int storage, String brand) {
        return phoneRepository.find(storage, brand);
    }


}
