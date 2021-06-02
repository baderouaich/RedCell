package Backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bader
 */

public class Connexion 
{
    public static Connection Seconnecter()
    {
        try
        {
           Class.forName("oracle.jdbc.driver.OracleDriver");
            
           java.sql.Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","RedCell","RedCell");
 
           System.out.println("Successfully connected to oracle database RedCell");

           return conn;
        }
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(Connexion.class.getName()).log(Level.SEVERE, null, ex);
        } 

        return null;
    }

}
