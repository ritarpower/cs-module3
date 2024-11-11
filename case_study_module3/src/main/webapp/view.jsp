<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/2/2024
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Mô tả sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f9f9f9;
        }

        .product-container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 800px;
            padding: 20px;
        }

        .product-image {
            flex: 0 0 350px; /* Hình ảnh chiếm 350px */
            margin-right: 20px;
        }

        .product-info {
            flex: 1; /* Thông tin sản phẩm chiếm phần còn lại */
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #C20000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0f7fa;
        }

        td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        td:first-child {
            font-weight: bold;
            color: #007BFF;
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
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
            text-align: center;
        }

        .back-button:hover {
            background-color: #d0d0d0;
        }
    </style>
</head>
<body>
<div>
    <h1>Thông tin chi tiết sản phẩm</h1>
</div>

<div class="product-container">
    <div class="product-image">
        <c:choose>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 16 Promax'}">
                <img src="${pageContext.request.contextPath}/images/iphone-16-pro-max-sa-mac.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 16 Pro'}">
                <img src="${pageContext.request.contextPath}/images/iphone-16-pro-max-sa-mac.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 16 Plus'}">
                <img src="${pageContext.request.contextPath}/images/iphone-16-plus.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 16'}">
                <img src="${pageContext.request.contextPath}/images/iphone-16-blue.png"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 15 Promax'}">
                <img src="${pageContext.request.contextPath}/images/iphone-15-pro-max.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Iphone 15 Plus'}">
                <img src="${pageContext.request.contextPath}/images/iphone-15-plus.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Samsung Galaxy Z Fold 6'}">
                <img src="${pageContext.request.contextPath}/images/samsung-galaxy-z-fold6-xam.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Samsung Galaxy Z Flip 6'}">
                <img src="${pageContext.request.contextPath}/images/samsung-galaxy-z-flip6-xanh.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Oppo Reno 12'}">
                <img src="${pageContext.request.contextPath}/images/oppo-reno12-5g.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
            <c:when test="${requestScope['phone'].getName() == 'Xiaomi Redmi Note 13'}">
                <img src="${pageContext.request.contextPath}/images/xiaomi-redmi-note-13.jpg"
                     alt="${requestScope["phone"].getName()}" style="max-height: 350px; object-fit: cover;">
            </c:when>
        </c:choose>
    </div>

    <div class="product-info">
        <table>
            <tr>
                <td colspan="2" style="text-align: center;font-size: 20px">${requestScope["phone"].getName()}</td>
            </tr>
            <tr>
                <td>Giá sản phẩm ($):</td>
                <td>${requestScope["phone"].getPrice()}</td>
            </tr>
            <tr>
                <td>Dung lượng (GB):</td>
                <td>${requestScope["phone"].getStorage()}</td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td>${requestScope["phone"].getStatus()}</td>
            </tr>
            <tr>
                <td>Xuất xứ:</td>
                <td>${requestScope["phone"].getOrigin()}</td>
            </tr>
            <tr>
                <td>Hãng:</td>
                <td>${requestScope["phone"].getBrand()}</td>
            </tr>
        </table>
    </div>
</div>
<p>
    <a href="/" class="back-button">Quay lại</a>
</p>
</body>
</html>

