package sevice.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import sevice.ICustomerSevice;

import java.util.List;

public class CustomerSevice implements ICustomerSevice {
    private final ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> findAllCustomer() {
        return customerRepository.findAllCustomer();
    }

    @Override
    public boolean add(Customer customer) {
        return customerRepository.add(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> search(String name, String address) {
        return null;
    }

    @Override
    public void isDelete(int id) {
        customerRepository.isDelete(id);
    }

    @Override
    public boolean isUpdate(Customer customer) {
        return customerRepository.isUpdate(customer);
    }
}
