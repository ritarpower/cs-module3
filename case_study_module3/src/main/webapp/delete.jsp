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
    <title>Delete Phone</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<p>
    <a href="/">Quay lại trang quản lý sản phẩm</a>
</p>
<form method="post">
    <h3>Bạn chắc chắn muốn xóa sản phẩm này chứ?</h3>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td>${requestScope["phone"].getName()}</td>
            </tr>
            <tr>
                <td>Giá sản phẩm ($):</td>
                <td>${requestScope["phone"].getPrice()} $</td>
            </tr>
            <tr>
                <td>Dung lượng (GB):</td>
                <td>${requestScope["phone"].getStorage()} GB</td>
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
                <td>Nhãn hiệu:</td>
                <td>${requestScope["phone"].getBrand()}</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Xác nhận">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>