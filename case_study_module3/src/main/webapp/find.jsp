<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/3/2024
  Time: 6:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Finding Phone</title>
</head>
<body>
<h1>Tìm kiếm thông tin sản phẩm</h1>
<p>
    <a href="/">Quay lại</a>
</p>
<form method="post">
    <fieldset>
        <legend>Nhập thông tin tìm kiếm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Dung lượng (GB):</td>
                <td>
                    <select id="storage" name="storage">
                        <option>128</option>
                        <option>256</option>
                        <option>512</option>
                        <option>1024</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Tìm kiếm"></td>
            </tr>
        </table>
    </fieldset>
</form>

<c:if test='${requestScope["phones"] != null}'>
    <fieldset>
        <h3>Thông tin sản phẩm</h3>
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
                    <td>${p.getOrigin()}</td>
                    <td>${p.getBrand()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </fieldset>
</c:if>
</body>
</html>
