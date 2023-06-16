package Service;

import Dao.User;
import Dao.UserDao;

import java.util.List;

public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    public boolean login(String userid, String password) {
        User user = userDao.findByUserId(userid);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    public List<User> getAllUsers() {
        return userDao.findAll();
    }
}
