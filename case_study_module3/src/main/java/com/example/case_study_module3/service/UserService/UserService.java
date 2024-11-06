package com.example.case_study_module3.service.UserService;

import com.example.case_study_module3.model.User;
import com.example.case_study_module3.repository.UserRepository.IUserRepository;
import com.example.case_study_module3.repository.UserRepository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> findAll() {
        return userRepository.getUsers();
    }
}
