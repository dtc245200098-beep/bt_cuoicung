
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.productmanagement.model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
    boolean editing = product != null;
    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title><%= editing ? "Sửa sản phẩm" : "Thêm sản phẩm" %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            padding: 40px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 12px #ddd;
        }
        h2 {
            text-align: center;
            color: #1b365d;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button, .back {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 18px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        button {
            background: #2f855a;
            color: white;
        }
        .back {
            background: #718096;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">

    <h2><%= editing ? "SỬA SẢN PHẨM" : "THÊM SẢN PHẨM" %></h2>

    <form action="<%= path %>/products" method="post">

        <input type="hidden" name="action"
               value="<%= editing ? "update" : "insert" %>">

        <% if (editing) { %>
            <input type="hidden" name="id"
                   value="<%= product.getId() %>">
        <% } %>

        <label>Tên sản phẩm</label>
        <input type="text" name="name" required maxlength="255"
               value="<%= editing ? product.getName() : "" %>">

        <label>Giá sản phẩm (VNĐ)</label>
        <input type="number" name="price" min="0" step="0.01" required
               value="<%= editing ? product.getPrice() : "" %>">

        <label>Số lượng</label>
        <input type="number" name="quantity" min="0" step="1" required
               value="<%= editing ? product.getQuantity() : "" %>">

        <button type="submit">
            <%= editing ? "Cập nhật sản phẩm" : "Thêm sản phẩm" %>
        </button>

        <a class="back" href="<%= path %>/products">
            Quay lại
        </a>

    </form>

</div>
</body>
</html>
