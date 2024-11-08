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
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin-bottom: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        legend {
            font-size: 24px;
            color: red;
        }

        td, th {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f1f1f1;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-button {
            margin-top: 20px;
            background-color: #e0e0e0;
            color: #333;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #e0e0e0;
        }

        .message {
            color: #d9534f;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<form method="post" action="/?action=find">
    <fieldset>
        <legend>Nhập thông tin tìm kiếm sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input type="text" name="name" id="name" pattern="^[a-zA-Z0-9]+(?: [a-zA-Z0-9]+)*$" required></td>
            </tr>
            <tr>
                <td>Dung lượng (GB):</td>
                <td>
                    <select id="storage" name="storage" required>
                        <option>128</option>
                        <option>256</option>
                        <option>512</option>
                        <option>1024</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Tìm kiếm"></td>
            </tr>
        </table>
    </fieldset>
</form>

<p>
    <a href="/" class="back-button">Quay lại</a>
</p>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<c:if test='${requestScope["phones"] != null}'>
    <fieldset style="background-color: white;">
        <table>
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Dung lượng</th>
                <th>Trạng thái</th>
                <th>Xuất xứ</th>
                <th>Hãng</th>
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
