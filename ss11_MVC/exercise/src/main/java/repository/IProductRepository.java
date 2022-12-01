package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();

    void add(Product product);

    Product findById(int id);

    void edit(int id, Product product);

    void delete(int id);

    Product findByName(String nameProduct);
}
