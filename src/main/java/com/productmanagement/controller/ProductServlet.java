
package com.productmanagement.controller;

import com.productmanagement.dao.ProductDAO;
import com.productmanagement.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private final ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("new".equals(action)) {
                request.getRequestDispatcher(
                    "/WEB-INF/view/product-form.jsp"
                ).forward(request, response);

            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(
                    request.getParameter("id"));

                Product product = dao.getProductById(id);

                if (product == null) {
                    response.sendError(404, "Khong tim thay san pham");
                    return;
                }

                request.setAttribute("product", product);
                request.getRequestDispatcher(
                    "/WEB-INF/view/product-form.jsp"
                ).forward(request, response);

            } else {
                request.setAttribute(
                    "products", dao.getAllProducts());

                request.getRequestDispatcher(
                    "/WEB-INF/view/product-list.jsp"
                ).forward(request, response);
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (NumberFormatException e) {
            response.sendError(400, "ID khong hop le");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        try {
            if ("delete".equals(action)) {
                int id = Integer.parseInt(
                    request.getParameter("id"));

                dao.deleteProduct(id);

            } else if ("add".equals(action)
                    || "update".equals(action)) {

                String name = request.getParameter("name");
                BigDecimal price = new BigDecimal(
                    request.getParameter("price"));
                int quantity = Integer.parseInt(
                    request.getParameter("quantity"));

                if (name == null || name.isBlank()
                        || price.signum() < 0 || quantity < 0) {
                    response.sendError(400,
                        "Thong tin san pham khong hop le");
                    return;
                }

                if ("add".equals(action)) {
                    dao.addProduct(
                        new Product(name.trim(), price, quantity)
                    );

                } else {
                    int id = Integer.parseInt(
                        request.getParameter("id"));

                    dao.updateProduct(
                        new Product(id, name.trim(), price, quantity)
                    );
                }

            } else {
                response.sendError(400, "Thao tac khong hop le");
                return;
            }

            response.sendRedirect(
                request.getContextPath() + "/products");

        } catch (SQLException e) {
            throw new ServletException(e);
        } catch (NumberFormatException | NullPointerException e) {
            response.sendError(400, "Du lieu khong hop le");
        }
    }
}
