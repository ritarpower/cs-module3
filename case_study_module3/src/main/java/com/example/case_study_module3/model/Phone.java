package com.example.case_study_module3.model;

public class Phone {
    private int id;
    private String name;
    private double price;
    private int storage;
    private String status;
    private String origin;
    private String brand;

    public Phone() {
    }

    public Phone(String name, double price, int storage, String status, String origin, String brand) {
        this.name = name;
        this.price = price;
        this.storage = storage;
        this.status = status;
        this.origin = origin;
        this.brand = brand;
    }

    public Phone(int id, String name, double price, int storage, String status, String origin, String brand) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.storage = storage;
        this.status = status;
        this.origin = origin;
        this.brand = brand;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStorage() {
        return storage;
    }

    public void setStorage(int storage) {
        this.storage = storage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
