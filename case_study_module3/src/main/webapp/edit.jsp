<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/2/2024
  Time: 6:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Phone</title>
</head>
<body>
<h1>Chỉnh sửa sản phẩm</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/">Quay lại danh sách sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Nhập thông tin mới của sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name" id="name" value="${requestScope['phone'].getName()}"></td>
            </tr>
            <tr>
                <td>Giá sản phẩm ($): </td>
                <td><input type="number" name="price" id="price" value="${requestScope['phone'].getPrice()}"></td>
            </tr>
            <tr>
                <td>Dung lượng sản phẩm (GB): </td>
                <td><input type="number" name="storage" id="storage" value="${requestScope['phone'].getStorage()}"></td>
            </tr>
            <tr>
                <td>Trạng thái: </td>
                <td>
                    <select id="status" name="status">
                            <option <c:if test="${requestScope['phone'].getStatus() == 'Hàng mới'}">selected</c:if>>Hàng mới</option>
                            <option <c:if test="${requestScope['phone'].getStatus() == 'Hàng đã sử dụng'}">selected</c:if>>Hàng đã sử dụng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Xuất xứ: </td>
                <td><input type="text" name="origin" id="origin" value="${requestScope['phone'].getOrigin()}"></td>
            </tr>
            <tr>
                <td>Nhãn hiệu: </td>
                <td>
                    <select id="brand" name="brand">
                        <c:forEach var="brand" items="${brands}">
                            <option value="${brand}"
                                    <c:if test="${brand == requestScope['phone'].getBrand()}">selected</c:if>>${brand}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Xác nhận"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
