package service.impl;

import service.IUserService;
import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;

import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public void insertUser(User user) {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public boolean isDeleteUser(int id) {
        return userRepository.isDeleteUser(id);
    }

    @Override
    public boolean isUpdateUser(User user) {
        return userRepository.isUpdateUser(user);
    }

    @Override
    public List<User> searchByCountry(String countrySearch) {
        return userRepository.searchByCountry(countrySearch);
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) {
        userRepository.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permission) {
        userRepository.addUserTransaction(user, permission);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
        userRepository.insertUpdateUseTransaction();
    }

    @Override
    public List<User> displayListUser() {
        return userRepository.displayListUser();
    }

    @Override
    public boolean isEditUser(User user) {
        return userRepository.isEditUser(user);
    }

    @Override
    public boolean isDeleteUserCall(int id) {
        return userRepository.isDeleteUserCall(id);
    }

}
