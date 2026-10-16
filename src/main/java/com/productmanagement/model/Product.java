
package com.productmanagement.model;

import java.math.BigDecimal;

public class Product {

    private int id;
    private String name;
    private BigDecimal price;
    private int quantity;

    // Constructor không tham số
    public Product() {
    }

    // Constructor đầy đủ
    public Product(int id, String name,
                   BigDecimal price, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    // Constructor dùng khi thêm sản phẩm mới
    public Product(String name, BigDecimal price,
                   int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
