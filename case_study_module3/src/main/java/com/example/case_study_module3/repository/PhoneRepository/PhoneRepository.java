package com.example.case_study_module3.repository.PhoneRepository;

import com.example.case_study_module3.model.Brand;
import com.example.case_study_module3.model.Phone;
import com.example.case_study_module3.repository.BaseRepository;
import com.example.case_study_module3.repository.BrandRepository.BrandRepository;
import com.example.case_study_module3.repository.BrandRepository.IBrandRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhoneRepository implements IPhoneRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private IBrandRepository brandRepository = new BrandRepository();
    private final String SELECT_ALL = "SELECT * FROM phone JOIN brand ON phone.brand_id = brand.brand_id";
    private final String SELECT_BY_PHONE_ID = "SELECT * FROM phone WHERE phone_id = ?";
    private final String ADD_PHONE = "INSERT INTO phone(phone_name,phone_price,phone_storage,phone_status,phone_origin,brand_id) VALUES (?, ?, ?, ?, ?, ?)";
    private final String EDIT_PHONE = "UPDATE phone SET phone_name = ?, phone_price = ?, phone_storage = ?, phone_status = ?, phone_origin = ?, brand_id = ? where phone_id = ?";
    private final String DELETE_PHONE = "DELETE FROM phone WHERE phone_id = ?";

    @Override
    public List<Phone> findAll() {
        Connection c = baseRepository.getConnection();
        List<Phone> phones = new ArrayList<>();
        try {
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL);
            while (rs.next()) {
                int id = rs.getInt("phone_id");
                String name = rs.getString("phone_name");
                double price = rs.getDouble("phone_price");
                int storage = rs.getInt("phone_storage");
                String status = rs.getString("phone_status");
                String origin = rs.getString("phone_origin");
                String brand = rs.getString("brand_name");
                phones.add(new Phone(id, name, price, storage, status, origin, brand));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phones;
    }

    @Override
    public Phone findById(int id) {
        Phone phone = null;
        Connection c = baseRepository.getConnection();
        try {
            PreparedStatement stmt = c.prepareStatement(SELECT_BY_PHONE_ID);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("phone_name");
                double price = rs.getDouble("phone_price");
                int storage = rs.getInt("phone_storage");
                String status = rs.getString("phone_status");
                String origin = rs.getString("phone_origin");
                int brandId = rs.getInt("brand_id");
                Brand brand = brandRepository.getBrandById(brandId);
//                PreparedStatement stmt2 = c.prepareStatement("SELECT brand_name FROM brand WHERE brand_id = ?");
//                stmt2.setInt(1, brandId);
//                ResultSet rs2 = stmt2.executeQuery();
//                if (rs2.next()) {
//                    String brand = rs2.getString("brand_name");
                phone = new Phone(id, name, price, storage, status, origin, brand.getName());
//                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phone;
    }

    @Override
    public void add(Phone phone) {
        Connection c = baseRepository.getConnection();
        try {
            Brand brand = brandRepository.getBrandByName(phone.getBrand());
            PreparedStatement prepared = c.prepareStatement(ADD_PHONE);
            prepared.setString(1, phone.getName());
            prepared.setDouble(2, phone.getPrice());
            prepared.setInt(3, phone.getStorage());
            prepared.setString(4, phone.getStatus());
            prepared.setString(5, phone.getOrigin());
            prepared.setInt(6, brand.getId());
            prepared.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(Phone phone) {
        Connection c = baseRepository.getConnection();
        try {
            Brand brand = brandRepository.getBrandByName(phone.getBrand());
            PreparedStatement prepared = c.prepareStatement(EDIT_PHONE);
            prepared.setString(1, phone.getName());
            prepared.setDouble(2, phone.getPrice());
            prepared.setInt(3, phone.getStorage());
            prepared.setString(4, phone.getStatus());
            prepared.setString(5, phone.getOrigin());
            prepared.setInt(6, brand.getId());
            prepared.setInt(7, phone.getId());
            prepared.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(Phone phone) {
        Connection c = baseRepository.getConnection();
        try {
            PreparedStatement prepared = c.prepareStatement(DELETE_PHONE);
            prepared.setInt(1, phone.getId());
            prepared.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Phone> findByNameAndStatus(String name, int storage) {
        List<Phone> phones = new ArrayList<>();
        Connection c = baseRepository.getConnection();
        try {
            PreparedStatement stmt = c.prepareStatement("SELECT * FROM phone WHERE phone_name LIKE CONCAT('%',?,'%') AND phone_storage LIKE ?");
            stmt.setString(1, name);
            stmt.setInt(2, storage);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("phone_id");
                String name1 = rs.getString("phone_name");
                double price = rs.getDouble("phone_price");
                String status = rs.getString("phone_status");
                String origin = rs.getString("phone_origin");
                int brandId = rs.getInt("brand_id");
                Brand brand = brandRepository.getBrandById(brandId);
                phones.add(new Phone(id, name1, price, storage, status, origin, brand.getName()));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return phones;
    }
}
