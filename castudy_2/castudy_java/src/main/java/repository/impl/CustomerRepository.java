package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String  SELECT_ALL ="select customer.*, customer_type.`name` as customer_type from customer\n" +
                       "join customer_type on customer_type.id = customer.customer_type_id;";
    private final String INSERT_CUSTOMER = "insert into customer(`name`,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id) values(?,?,?,?,?,?,?,?);";
    private final String DELETE_CUSTOMER = "delete from customer where id = ?;";
    private final String UPDATE_CUSTOMER="update customer set `name` = ?,date_of_birth= ?, gender =?, id_card =?,phone_number =?, email =?,address =?, customer_type_id =? where id = ?;";
    private final String SELECT_CUSTOMER_BY_ID = "select id,`name`,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id from customer where id = ?;";
    private final String SEARCH_CUSTOMER = "select * from customer where `name` like ? and address like ? ;";
    @Override
    public List<Customer> findAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try(PreparedStatement ps = connection.prepareStatement(SELECT_ALL)){
            System.out.println(ps);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String customerType = resultSet.getString("customer_type");
                Customer customer = new Customer(id, name, dateOfBirth, gender, idCard, phoneNumber, email, address, customerType);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection =BaseRepository.getConnectDB();
        try(PreparedStatement ps = connection.prepareStatement(INSERT_CUSTOMER)){
                ps.setString(1,customer.getName());
                ps.setString(2,customer.getDateOfBirth());
                ps.setBoolean(3,customer.getGender());
                ps.setString(4,customer.getIdCard());
                ps.setString(5,customer.getPhoneNumber());
                ps.setString(6,customer.getEmail());
                ps.setString(7,customer.getAddress());
                ps.setString(8,customer.getCustomerType());
                return ps.executeUpdate()>0;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;

        try(Connection connection = BaseRepository.getConnectDB();
            PreparedStatement statement =connection.prepareStatement(SELECT_CUSTOMER_BY_ID);) {
            statement.setInt(1,id);
            System.out.println(statement);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String customerType = rs.getString("customer_type_id");
                customer = new Customer(id,name,dateOfBirth,gender,idCard,phoneNumber,email,address,customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> search(String name, String address) {
        List<Customer> customerList =new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SEARCH_CUSTOMER);
            statement.setString(1,"%"+ name +"%");
            statement.setString(2,"%"+ address +"%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                String name1 = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                Boolean gender = resultSet.getBoolean("gender");
                String idCard = resultSet.getString("id_card");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address1 = resultSet.getString("address");
                String customerType = resultSet.getString("customer_type_id");
                customerList.add(new Customer(name1,dateOfBirth,gender,idCard,phoneNumber,email,address1,customerType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void isDelete(int id) {
        Connection connection =BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isUpdate(Customer customer) {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getDateOfBirth());
            preparedStatement.setBoolean(3, customer.getGender());
            preparedStatement.setString(4, customer.getIdCard());
            preparedStatement.setString(5, customer.getPhoneNumber());
            preparedStatement.setString(6, customer.getEmail());
            preparedStatement.setString(7, customer.getAddress());
            preparedStatement.setString(8, customer.getCustomerType());
            preparedStatement.setInt(9, customer.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}
