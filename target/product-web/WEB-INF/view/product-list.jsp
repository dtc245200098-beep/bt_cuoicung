
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.productmanagement.model.Product" %>

<%
    List<Product> products =
        (List<Product>) request.getAttribute("products");

    String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 12px #ddd;
        }

        h1 {
            text-align: center;
            color: #1b365d;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .add { background: #2f855a; }
        .edit { background: #2c5282; }
        .delete { background: #e53e3e; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #1b365d;
            color: white;
        }

        tr:nth-child(even) {
            background: #f7fafc;
        }

        .empty {
            padding: 25px;
            color: #666;
        }
    </style>
</head>

<body>
<div class="container">

    <h1>QUẢN LÝ SẢN PHẨM</h1>

    <a class="btn add" href="<%= path %>/products?action=new">
        + Thêm sản phẩm
    </a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên sản phẩm</th>
                <th>Giá (VNĐ)</th>
                <th>Số lượng</th>
                <th>Thao tác</th>
            </tr>
        </thead>

        <tbody>
        <% if (products != null && !products.isEmpty()) {
            for (Product p : products) { %>

            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td><%= p.getPrice() %></td>
                <td><%= p.getQuantity() %></td>
                <td>
                    <a class="btn edit"
                       href="<%= path %>/products?action=edit&id=<%= p.getId() %>">
                        Sửa
                    </a>

                    <form action="<%= path %>/products"
                          method="post"
                          style="display:inline"
                          onsubmit="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">

                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= p.getId() %>">

                        <button class="btn delete" type="submit">
                            Xóa
                        </button>
                    </form>
                </td>
            </tr>

        <%  }
           } else { %>

            <tr>
                <td colspan="5" class="empty">
                    Chưa có sản phẩm nào.
                </td>
            </tr>

        <% } %>
        </tbody>
    </table>

</div>
</body>
</html>
