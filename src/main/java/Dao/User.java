package Dao;

import java.time.LocalDateTime;

public class User {
    private String userid;
    private String password;
    private boolean isApproved;
    private String name;

    // Constructors
    public User() {
    }

    public User(String userid, String password, boolean isApproved, String name) {
        this.userid = userid;
        this.password = password;
        this.isApproved = isApproved;
        this.name = name;
    }

    // Getters and Setters
    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isApproved() {
        return isApproved;
    }

    public void setApproved(boolean approved) {
        isApproved = approved;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // toString() method
    @Override
    public String toString() {
        return "User{" +
                "userid='" + userid + '\'' +
                ", password='" + password + '\'' +
                ", isApproved=" + isApproved +
                ", name='" + name + '\'' +
                '}';
    }
}
