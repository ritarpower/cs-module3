package com.example.case_study_module3.repository.UserRepository;

import com.example.case_study_module3.model.User;
import com.example.case_study_module3.repository.BaseRepository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private final String GET_ALL_USERS = "SELECT * FROM user";

    @Override
    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL_USERS);
            while (resultSet.next()) {
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                users.add(new User(userName, password));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
    }
}
