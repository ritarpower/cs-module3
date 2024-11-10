package com.example.case_study_module3.controller;

import com.example.case_study_module3.model.Brand;
import com.example.case_study_module3.model.Phone;
import com.example.case_study_module3.model.User;
import com.example.case_study_module3.service.BrandService.BrandService;
import com.example.case_study_module3.service.BrandService.IBrandService;
import com.example.case_study_module3.service.PhoneService.IPhoneService;
import com.example.case_study_module3.service.PhoneService.PhoneService;
import com.example.case_study_module3.service.UserService.IUserService;
import com.example.case_study_module3.service.UserService.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PhoneServlet", value = "")
public class PhoneServlet extends HttpServlet {
    private final IPhoneService phoneService = new PhoneService();
    private final IUserService userService = new UserService();
    private final IBrandService brandService = new BrandService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;
            case "find":
                showFindForm(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFindForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("find.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add.jsp");
        List<Brand> brands = brandService.getAllBrands();
        request.setAttribute("brands", brands);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Phone phone = phoneService.findById(id);
        List<Brand> brands = brandService.getAllBrands();
        RequestDispatcher dispatcher;
        if (phone == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("brands", brands);
            request.setAttribute("phone", phone);
            dispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Phone phone = phoneService.findById(id);
        RequestDispatcher dispatcher;
        if (phone == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("phone", phone);
            dispatcher = request.getRequestDispatcher("delete.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Phone phone = phoneService.findById(id);
        RequestDispatcher dispatcher;
        if (phone == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("phone", phone);
            dispatcher = request.getRequestDispatcher("view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Phone> phones = phoneService.findAll();
        List<Brand> brands = brandService.getAllBrands();
        request.setAttribute("brands", brands);
        request.setAttribute("phones", phones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "find":
                find(request, response);
                break;
            case "login":
                login(request, response);
                break;
            default:
                break;
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (isValidUser(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            try {
                response.sendRedirect("/");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private boolean isValidUser(String username, String password) {
        List<User> users = userService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserName().equals(username) && users.get(i).getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    private void find(HttpServletRequest request, HttpServletResponse response) {
        List<Brand> brands = brandService.getAllBrands();
        String name = request.getParameter("name");
        int storage = Integer.parseInt(request.getParameter("storage"));
        String brand = request.getParameter("brand");
        List<Phone> phones;
        if(name.isEmpty()){
            phones = phoneService.find(storage, brand);
        } else {
            phones = phoneService.find(name, storage, brand);
        }
        RequestDispatcher dispatcher;
        if (phones.isEmpty()) {
            dispatcher = request.getRequestDispatcher("list.jsp");
            request.setAttribute("brands", brands);
            request.setAttribute("message", "Không tìm thấy sản phẩm!");
        } else {
            dispatcher = request.getRequestDispatcher("list.jsp");
            request.setAttribute("message", "Tìm thấy " + phones.size() + " sản phẩm:");
            request.setAttribute("phones", phones);
            request.setAttribute("brands", brands);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        List<Brand> brands = brandService.getAllBrands();
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int storage = Integer.parseInt(request.getParameter("storage"));
        String status = request.getParameter("status");
        String origin = request.getParameter("origin");
        String brand = request.getParameter("brand");
        Phone phone = new Phone(name, price, storage, status, origin, brand);
        phoneService.add(phone);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add.jsp");
        request.setAttribute("brands", brands);
        request.setAttribute("message", "Đã thêm mới thành công!");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        List<Brand> brands = brandService.getAllBrands();
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int storage = Integer.parseInt(request.getParameter("storage"));
        String status = request.getParameter("status");
        String origin = request.getParameter("origin");
        String brand = request.getParameter("brand");
        Phone phone = phoneService.findById(id);
        RequestDispatcher dispatcher;
        if (phone == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            phone.setName(name);
            phone.setPrice(price);
            phone.setStorage(storage);
            phone.setStatus(status);
            phone.setOrigin(origin);
            phone.setBrand(brand);
            phoneService.edit(phone);
            request.setAttribute("phone", phone);
            request.setAttribute("brands", brands);
            request.setAttribute("message", "Cập nhật thành công!");
            dispatcher = request.getRequestDispatcher("edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Phone phone = phoneService.findById(id);
        if (phone == null) {
            request.getRequestDispatcher("error-404.jsp");
        } else {
            phoneService.delete(phone);
            try {
                response.sendRedirect("/");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}