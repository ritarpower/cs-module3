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
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        div {
            margin-top: 20px;
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

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px 0;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #1a73e8;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #155ab6;
        }

        a {
            text-align: center;
        }

        legend {
            font-size: 20px;
        }

        span {
            font-size: 18px;
            color: red;
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
    <h1>Thêm mới sản phẩm</h1>
</div>

<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<form method="post">
    <fieldset>
        <legend>Nhập thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input type="text" name="name" id="name" pattern="^[a-zA-Z0-9]+(?: [a-zA-Z0-9]+)*$" required></td>
            </tr>
            <tr>
                <td>Giá sản phẩm ($):</td>
                <td><input type="number" step="any" pattern="[+]?[0-9]*[.]?[0-9]+" name="price" id="price" required>
                </td>
            </tr>
            <tr>
                <td>Dung lượng (GB):</td>
                <td>
                    <select name="storage" id="storage" required>
                        <option>128</option>
                        <option>256</option>
                        <option>512</option>
                        <option>1024</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Trạng thái:</td>
                <td>
                    <select name="status" id="status" required>
                        <option>Hàng mới</option>
                        <option>Hàng đã sử dụng</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Xuất xứ:</td>
                <td><input type="text" name="origin" id="origin" pattern="^([A-ZÀ-Ẵ][a-zà-ỹ]*(\s[A-ZÀ-Ẵ][a-zà-ỹ]*)*)?$"
                           required></td>
            </tr>
            <tr>
                <td>Hãng:</td>
                <td>
                    <select id="brand" name="brand" required>
                        <option>Iphone</option>
                        <option>Samsung</option>
                        <option>Oppo</option>
                        <option>Huawei</option>
                        <option>Xiaomi</option>
                        <option>Vivo</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Thêm mới"></td>
            </tr>
        </table>
    </fieldset>
</form>

<p>
    <a href="/" class="back-button">Quay lại</a>
</p>

</body>
</html>
