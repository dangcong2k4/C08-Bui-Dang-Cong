package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    //đổ ra list
    List<Customer> findAllCustomer();
    //thêm mới
    boolean add(Customer customer);
    // lấy id hiện thị để chỉnh sửa
    Customer selectCustomer(int id);
    // tìm kiếm theo tên và địa chỉ
    List<Customer> search(String name, String address);
    // xóa theo id
    void isDelete(int id);
    // chỉnh sửa
    boolean isUpdate(Customer customer);
}
