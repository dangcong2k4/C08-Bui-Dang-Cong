package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(0,"Iphone",1200,"màu tím","apple"));
        productList.add(new Product(1,"Redmi 11",1200,"màu Đen","xiaomi"));
        productList.add(new Product(2,"Samsung s22 utra",1200,"hồng","Samsung"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void edit(int id, Product product) {

        for (int i = 0;i<productList.size();i++){
            if (productList.get(i).getId()==id){
                productList.set(i,product);
            }

        }
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size() ; i++) {
            if (productList.get(i).getId() == id){
                productList.remove(productList.get(i));
            }
        }
    }

    @Override
    public Product findByName(String nameProduct) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().equals(nameProduct)) {
                return productList.get(i);
            }
        }
        return null;
    }
}
