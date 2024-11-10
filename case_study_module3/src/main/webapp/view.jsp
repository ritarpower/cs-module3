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

        div {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 440px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #C20000;
        }

        a {
            text-align: center;
        }

        table {
            width: 80%;
            max-width: 600px;
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

<p>
    <a href="/" class="back-button">Quay lại</a>
</p>
</body>
</html>

