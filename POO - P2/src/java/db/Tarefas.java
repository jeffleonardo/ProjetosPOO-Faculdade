package db;

import java.sql.*;
import java.util.ArrayList;
import web.jeffersonDbListener;

/**
 *
 * @author t2s-user-cod218
 */
public class Tarefas {
    private int id;
    private String title;
    private String user;
    
    public static String getCreateStatement(){
        return "CREATE TABLE IF NOT EXISTS jefferson_tasks("
                + "id int NOT NULL AUTO_INCREMENT,"
                + "title VARCHAR(100) NOT NULL,"
                + "user VARCHAR(100) NOT NULL,"
                + ")";
    }  
    
    public static ArrayList<Tarefas> getTarefas() throws Exception{
        ArrayList<Tarefas> list = new ArrayList<>();
        Connection con = jeffersonDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from tarefas");
        while(rs.next()){
            int id = rs.getInt("id");
            String title = rs.getString("title");
            String user = rs.getString("user");
            list.add(new Tarefas(id,title, user));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void insertTarefas(int id, String title, String user) throws Exception{
        Connection con = jeffersonDbListener.getConnection();
        String sql = "INSERT INTO tarefas(title, user) "
                + "VALUES(?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, user);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void deleteTarefas(int id) throws Exception{
        Connection con = jeffersonDbListener.getConnection();
        String sql = "DELETE FROM tarefas WHERE id = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Tarefas(int id, String title, String user) {
        this.id = id;
        this.title = title;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }    
}