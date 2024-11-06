package com.example.case_study_module3.repository.UserRepository;

import com.example.case_study_module3.model.User;
import com.example.case_study_module3.repository.BaseRepository;

import java.util.List;

public interface IUserRepository {
    List<User> getUsers();
}
