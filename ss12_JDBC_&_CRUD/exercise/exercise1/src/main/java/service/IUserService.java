package service;

import model.User;

import java.util.List;

public interface IUserService {
    boolean add(User user);

    User selectUser(int id);

    List<User> findAll();

    List<User> search(String country);

    void isDelete(int id);

    boolean isUpdate(User user);
}
