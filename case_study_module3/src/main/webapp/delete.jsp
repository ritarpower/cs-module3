<%--
  Created by IntelliJ IDEA.
  User: Ritar
  Date: 11/2/2024
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Delete Phone</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh;--%>
<%--            margin: 0;--%>
<%--            background-color: #f9f9f9;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            margin-bottom: 20px;--%>
<%--            color: #C20000;--%>
<%--        }--%>

<%--        .form-container {--%>
<%--            background: white;--%>
<%--            padding: 20px;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);--%>
<%--            width: 100%;--%>
<%--            max-width: 400px;--%>
<%--        }--%>

<%--        fieldset {--%>
<%--            border: 1px solid #000;--%>
<%--            padding: 10px 20px;--%>
<%--            border-radius: 0;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>

<%--        legend {--%>
<%--            font-weight: bold;--%>
<%--            color: #C20000;--%>
<%--            padding: 0 10px;--%>
<%--        }--%>

<%--        table {--%>
<%--            width: 100%;--%>
<%--            border-collapse: collapse;--%>
<%--        }--%>

<%--        th, td {--%>
<%--            padding: 12px;--%>
<%--            text-align: left;--%>
<%--            border-bottom: 1px solid #ddd;--%>
<%--        }--%>

<%--        tr:nth-child(even) {--%>
<%--            background-color: #f2f2f2;--%>
<%--        }--%>

<%--        tr:hover {--%>
<%--            background-color: #e0e0e0;--%>
<%--        }--%>

<%--        .back-button {--%>
<%--            margin-top: 20px;--%>
<%--            background-color: #e0e0e0;--%>
<%--            color: #333;--%>
<%--            border: none;--%>
<%--            padding: 12px;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            text-decoration: none;--%>
<%--            display: inline-block;--%>
<%--            font-size: 16px;--%>
<%--            transition: background-color 0.3s;--%>
<%--        }--%>

<%--        .no-hover:hover {--%>
<%--            background-color: transparent;--%>
<%--        }--%>

<%--        .back-button:hover {--%>
<%--            background-color: #d0d0d0;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="form-container">--%>
<%--    <form id="deleteForm" method="post" action="/?action=delete&id=${requestScope['phone'].getId()}">--%>
<%--        <fieldset>--%>
<%--            <legend class="text-center">Thông tin sản phẩm</legend>--%>
<%--            <table>--%>
<%--                <tr>--%>
<%--                    <th>Tên sản phẩm:</th>--%>
<%--                    <td>${requestScope["phone"].getName()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>Giá sản phẩm ($):</th>--%>
<%--                    <td>${requestScope["phone"].getPrice()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>Dung lượng (GB):</th>--%>
<%--                    <td>${requestScope["phone"].getStorage()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>Trạng thái:</th>--%>
<%--                    <td>${requestScope["phone"].getStatus()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>Xuất xứ:</th>--%>
<%--                    <td>${requestScope["phone"].getOrigin()}</td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <th>Hãng:</th>--%>
<%--                    <td>${requestScope["phone"].getBrand()}</td>--%>
<%--                </tr>--%>
<%--                <tr class="no-hover">--%>
<%--                    <td colspan="2" class="text-center">--%>
<%--                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"--%>
<%--                                data-bs-target="#confirmModal">--%>
<%--                            Xóa--%>
<%--                        </button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </table>--%>
<%--        </fieldset>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="confirmModalLabel">Xác nhận xóa sản phẩm</h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                Bạn có chắc chắn muốn xóa sản phẩm này không?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>--%>
<%--                <button type="button" class="btn btn-danger" id="confirmDelete">Xóa</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<p>--%>
<%--    <a href="/" class="back-button">Quay lại</a>--%>
<%--</p>--%>

<%--<script>--%>
<%--    document.getElementById('confirmDelete').addEventListener('click', function () {--%>
<%--        document.getElementById('deleteForm').submit();--%>
<%--    });--%>
<%--</script>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"--%>
<%--        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>


