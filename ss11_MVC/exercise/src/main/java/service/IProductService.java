package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();

    void add(Product product);

    Product findById(int id);

    void edit(int id, Product product);

    void delete(int id);

    Product findByName(String nameProduct);
}
