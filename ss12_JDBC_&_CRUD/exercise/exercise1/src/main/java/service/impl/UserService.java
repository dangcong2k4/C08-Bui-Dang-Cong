package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private final IUserRepository userRepository = new UserRepository();
    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> search(String country) {
        return userRepository.search(country);
    }

    @Override
    public void isDelete(int id) {
        userRepository.isDelete(id);
    }

    @Override
    public boolean isUpdate(User user) {
        return userRepository.isUpdate(user);
    }
}
