package web;

import db.Tarefas;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author t2s-user-cod218
 */
public class jeffersonDbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:P2-POO.db";
    public static Exception exception = null;

    public static Connection getConnection() throws Exception{
       return DriverManager.getConnection(URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute(Tarefas.getCreateStatement());
            if(Tarefas.getTarefas().isEmpty()){
                Tarefas.insertTarefas(1, "TarefaPOO", "jefferson");
            }    
            stmt.close();
            con.close();
        } catch (Exception ex) {
            exception = ex;
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
} 