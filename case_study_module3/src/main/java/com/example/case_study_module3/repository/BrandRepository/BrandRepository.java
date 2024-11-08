package com.example.case_study_module3.repository.BrandRepository;

import com.example.case_study_module3.model.Brand;
import com.example.case_study_module3.repository.BaseRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandRepository implements IBrandRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private final String GET_ALL = "select * from brand";
    private final String FIND_BY_ID = "select brand_name from brand where brand_id = ?";
    private final String FIND_BY_NAME = "select brand_id from brand where brand_name = ?";


    @Override
    public List<Brand> getAllBrands() {
        List<Brand> brands = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ALL);
            while (resultSet.next()) {
                int id = resultSet.getInt("brand_id");
                String name = resultSet.getString("brand_name");
                Brand brand = new Brand(id, name);
                brands.add(brand);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return brands;
    }

    @Override
    public Brand getBrandById(int id) {
        Brand brand = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String brandName = resultSet.getString("brand_name");
                brand = new Brand(id, brandName);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return brand;
    }

    @Override
    public Brand getBrandByName(String name) {
        Brand brand = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_NAME);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                int id = resultSet.getInt("brand_id");
                brand = new Brand(id, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return brand;
    }


}
