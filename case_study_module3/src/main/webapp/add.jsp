<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/2/2024
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add New Phone</title>
</head>
<body>
<h1>Thêm mới sản phẩm</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/">Quay lại trang chính</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm ($): </td>
                <td><input type="number" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Dung lượng (GB): </td>
                <td><input type="number" name="storage" id="storage"></td>
            </tr>
            <tr>
                <td>Trạng thái: </td>
                <td>
                    <select name="status" id="status">
                        <option>Hàng mới</option>
                        <option>Hàng đã sử dụng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Xuất xứ: </td>
                <td><input type="text" name="origin" id="origin"></td>
            </tr>
            <tr>
                <td>Nhãn hiệu: </td>
                <td>
                    <select id="brand" name="brand">
                        <c:forEach var="brand" items="${brands}">
                            <option value="${brand}">${brand}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Thêm mới"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
