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
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<p>
    <a href="?action=find">Tìm kiếm sản phẩm</a>
</p>
<p>
    <a href="?action=add">Thêm mới sản phẩm</a>
</P>
<table>
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Dung lượng</th>
        <th>Trạng thái</th>
        <th>Xuất xứ</th>
        <th>Nhãn hiệu</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${phones}" var="p" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><a href="?action=view&id=${p.getId()}">${p.getName()}</a></td>
            <td>${p.getPrice()} $</td>
            <td>${p.getStorage()} GB</td>
            <td>${p.getStatus()}</td>
            <td><a href="?action=edit&id=${p.getId()}">Cập nhật</a></td>
            <td><a href="?action=delete&id=${p.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
