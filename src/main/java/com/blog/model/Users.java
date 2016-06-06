package com.blog.model;

import javax.persistence.*;
import javax.validation.constraints.Size;

/**
 * Created by Sergey on 06.06.2016.
 */
@Entity
@Table(name = "users")
public class Users {
    @Size(min=6, max=15)
    private String username;
    @Size(min=8, max= 15)
    private String password;

    private boolean enabled;

    @Id
    @Column(name = "username", nullable = false, length = 50)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 50)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "enabled", nullable = false)
    public boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (enabled != users.enabled) return false;
        if (username != null ? !username.equals(users.username) : users.username != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;

        return true;
    }

//    @Override
//    public int hashCode() {
//        int result = username != null ? username.hashCode() : 0;
//        result = 31 * result + (password != null ? password.hashCode() : 0);
//        result = 31 * result + (int) enabled;
//        return result;
//    }
}
