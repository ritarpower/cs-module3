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
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .header-container {
            background: linear-gradient(45deg, #007bff, #00bfff);
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin: 0 auto;
            padding: 20px;
        }

        h1 {
            color: white;
            font-size: 2.5rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            margin: 0;
            flex-grow: 1;
            text-align: center;
        }

        .header-container .d-flex {
            display: flex;
            align-items: center;
            flex-direction: column;
        }


        .container {
            padding-top: 30px;
        }

        .card {
            position: relative;
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

        .btn-delete {
            position: absolute;
            top: 0px;
            right: 0px;
            width: 30px;
            height: 30px;
            font-size: 20px;
            color: white;
            background-color: red;
            border: none;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-delete:hover {
            color: darkred;
        }

        .back-button {
            margin-top: 20px;
            background-color: #e0e0e0;
            color: #333;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .search-form-container {
            position: sticky;
            top: 0;
            background-color: #ffffff;
            z-index: 999;
            padding: 10px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

        .search-form-container form {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .search-form-container td {
            text-align: left;
            padding: 8px;
            width: 400px;
        }
    </style>
</head>
<body>
<div class="header-container">
    <h1 class="my-4">Danh sách sản phẩm điện thoại</h1>
    <div class="d-flex">
        <c:if test="${empty sessionScope.user}">
            <a href="?action=login" class="btn btn-primary mx-2">Đăng nhập</a>
        </c:if>
        <c:if test="${not empty sessionScope.user}">
            <p>Tài khoản đang đăng nhập: <strong>${sessionScope.user}</strong></p>
            <a href="?action=logout" class="btn btn-secondary mx-2">Đăng xuất</a>
        </c:if>
    </div>
</div>

<br>

<c:if test="${empty sessionScope.user}">
    <div class="text-center mb-4">
        <span class="text-danger">Bạn cần đăng nhập để thực hiện các thao tác thêm mới, cập nhật và xóa sản phẩm.</span>
    </div>
</c:if>


<c:if test="${not empty sessionScope.user}">
    <div class="text-center mb-4">

        <c:if test="${sessionScope.user.equals('admin')}">
            Bạn có thể sử dụng chức năng thêm mới, cập nhật và xóa sản phẩm.
        </c:if>
        <c:if test="${sessionScope.user.equals('member')}">
            Bạn có thể sử dụng chức năng thêm mới và cập nhật sản phẩm.
        </c:if>
    </div>
</c:if>

<div class="search-form-container">
    <form action="/?action=find" method="post" class="d-flex mb-4">
        <table>
            <tr>
                <td>-Nhập tên sản phẩm cần tìm:</td>
                <td>-Chọn dung lượng cần tìm:</td>
                <td>-Chọn hãng cần tìm:</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="text" name="name" id="name" class="form-control me-2"
                           placeholder="Tên sản phẩm"></td>
                <td>
                    <select id="storage" name="storage" class="form-control me-2">
                        <option>128</option>
                        <option>256</option>
                        <option>512</option>
                        <option>1024</option>
                    </select>
                </td>
                <td>
                    <select id="brand" name="brand" class="form-control me-2">
                        <c:forEach items="${brands}" var="b">
                            <option>${b.getName()}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>
                    <button type="submit" class="btn btn-success">Tìm kiếm</button>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="?action=add" class="btn btn-primary mx-2">Thêm mới</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </form>
</div>

<c:if test='${requestScope["message"] != null}'>
    <div class="text-center mb-4">
        <a href="/" class="back-button">Quay lại</a><br>
        <span class="message">${requestScope["message"]}</span><br>
    </div>
</c:if>

<form id="deleteForm" method="post" action="/?action=delete" style="display: none">
    <input type="hidden" name="id" id="deleteId">
</form>

<div class="container">
    <div class="row">
        <c:forEach items="${phones}" var="p" varStatus="loop">
            <div class="col-md-3 mb-4">
                <div class="card">
                    <c:choose>
                        <c:when test="${p.getName() == 'Iphone 16 Promax'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-16-pro-max-sa-mac.jpg"
                                 class="card-img-top" alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Iphone 16 Pro'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-16-pro-max-sa-mac.jpg"
                                 class="card-img-top" alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Iphone 16 Plus'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-16-plus.jpg" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Iphone 16'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-16-blue.png" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Iphone 15 Promax'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-15-pro-max.jpg" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Iphone 15 Plus'}">
                            <img src="${pageContext.request.contextPath}/images/iphone-15-plus.jpg" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Samsung Galaxy Z Fold 6'}">
                            <img src="${pageContext.request.contextPath}/images/samsung-galaxy-z-fold6-xam.jpg" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                        <c:when test="${p.getName() == 'Samsung Galaxy Z Flip 6'}">
                            <img src="${pageContext.request.contextPath}/images/samsung-galaxy-z-flip6-xanh.jpg" class="card-img-top"
                                 alt="${p.getName()}" style="max-height: 350px; object-fit: cover;">
                        </c:when>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: center">${p.getName()}</h5>
                        <p class="card-text" style="text-align: center">Hãng: ${p.getBrand()}</p>
                        <p class="card-text" style="text-align: center"><strong>${p.getPrice()} $</strong></p>
                        <p style="text-align: center">
                            <a href="?action=view&id=${p.getId()}" class="btn btn-info btn-sm">Xem chi tiết</a>
                            <c:if test="${sessionScope.user.equals('admin')}">
                                <a href="?action=edit&id=${p.getId()}" class="btn btn-warning btn-sm">Cập nhật</a>
                                <button class="btn-delete" onclick="openDeleteModal(${p.getId()})">&#10005;</button>
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

<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">Xác nhận xóa sản phẩm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xóa sản phẩm này không?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-danger" id="confirmDelete">Xóa</button>
            </div>
        </div>
    </div>
</div>

<script>
    function openDeleteModal(id) {
        document.getElementById('deleteId').value = id;
        let modal;
        modal = new bootstrap.Modal(document.getElementById('confirmModal'));
        modal.show();
    }

    document.getElementById('confirmDelete').addEventListener('click', function () {
        document.getElementById('deleteForm').submit();
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
</script>
</body>
</html>


