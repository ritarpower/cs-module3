<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/2/2024
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Phone List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        h1 {
            color: white;
            background: linear-gradient(45deg, #007bff, #00bfff);
            padding: 20px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            font-size: 2.5rem;
            transition: all 0.3s ease;
        }

        .container {
            padding-top: 30px;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 10px;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card .btn {
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .card .btn:hover {
            transform: translateY(-5px);
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
            color: #333;
            transition: color 0.3s ease;
        }

        .card:hover .card-title {
            color: #007bff;
        }
    </style>
</head>
<body>
<h1 class="text-center my-4">Danh sách sản phẩm điện thoại</h1>

<c:if test="${not empty sessionScope.user}">
    <div class="text-center mb-4">
        <a href="?action=add" class="btn btn-primary mx-2">Thêm mới</a>
        <a href="?action=find" class="btn btn-success mx-2">Tìm kiếm</a>
        <a href="?action=logout" class="btn btn-secondary mx-2">Đăng xuất</a><br>
        <p>Tài khoản đang đăng nhập: <strong>${sessionScope.user}</strong></p>
        <c:if test="${sessionScope.user.equals('admin')}">
            Bạn có thể sử dụng chức năng thêm mới, cập nhật và xóa sản phẩm.
        </c:if>
        <c:if test="${sessionScope.user.equals('member')}">
            Bạn có thể sử dụng chức năng thêm mới và cập nhật sản phẩm.
        </c:if>
    </div>
</c:if>
<c:if test="${empty sessionScope.user}">
    <div class="text-center mb-4">
        <a href="?action=find" class="btn btn-success mx-2">Tìm kiếm</a>
        <a href="?action=login" class="btn btn-primary mx-2">Đăng nhập</a><br>
        <span class="text-danger">Bạn cần đăng nhập để thực hiện các thao tác thêm mới, cập nhật và xóa sản phẩm.</span>
    </div>
</c:if>

<div class="container">
    <div class="row">
        <c:forEach items="${phones}" var="p" varStatus="loop">
            <div class="col-md-3 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: center">${p.getName()}</h5>
                        <p class="card-text">Dung lượng: ${p.getStorage()} GB</p>
                        <p class="card-text">Trạng thái: ${p.getStatus()}</p>
                        <p class="card-text">Hãng: ${p.getBrand()}</p>
                        <p class="card-text" style="text-align: center"><strong>Giá: ${p.getPrice()} $</strong></p>
                        <p style="text-align: center">
                            <a href="?action=view&id=${p.getId()}" class="btn btn-info btn-sm">Xem chi tiết</a>
                            <c:if test="${sessionScope.user.equals('admin')}">
                                <a href="?action=edit&id=${p.getId()}" class="btn btn-warning btn-sm">Cập nhật</a>
                                <a href="?action=delete&id=${p.getId()}" class="btn btn-danger btn-sm">Xóa</a>
                            </c:if>
                            <c:if test="${sessionScope.user.equals('member')}">
                                <a href="?action=edit&id=${p.getId()}" class="btn btn-warning btn-sm">Cập nhật</a>
                            </c:if>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
</body>
</html>


