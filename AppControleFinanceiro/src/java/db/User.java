/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author t2s-user-cod218
 */
public class User {
    private String login;
    private String name;
    private String role;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS users("
                + "login VARCHAR(50) UNIQUE NOT NULL,"
                + "name VARCHAR(200) NOT NULL,"
                + "role VARCHAR(20) NOT NULL,"
                + "password_hash LONG NOT NULL"
                + ")";
    }
    
    public static ArrayList<User> getUsers() throws Exception{
        ArrayList<User> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from users");
        while(rs.next()){
            String login = rs.getString("login");
            String name = rs.getString("name");
            String role = rs.getString("role");
            list.add(new User(login, name, role));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static User getUser(String login, String password) throws Exception{
        User user = null;
        Connection con = DbListener.getConnection();
        String sql = "SELECT * from users WHERE login=? AND password_hash=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setLong(2, password.hashCode());
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            String name = rs.getString("name");
            String role = rs.getString("role");
            user = new User(login, name, role);
        }
        rs.close();
        stmt.close();
        con.close();
        return user;
    }
    
    public static void insertUser(String login, String name, String role, String password) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "INSERT INTO users(login, name, role, password_hash) "
                + "VALUES(?,?,?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.setString(2, name);
        stmt.setString(3, role);
        stmt.setLong(4, password.hashCode());
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void deleteUser(String login) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "DELETE FROM users WHERE login = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, login);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
     public static void changePassword(String login, String password) throws Exception{
        Connection con = DbListener.getConnection();
        String sql = "UPDATE users SET password_hash = ? WHERE login = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setLong(1, password.hashCode());
        stmt.setString(2, login);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public User(String login, String name, String role) {
        this.login = login;
        this.name = name;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
