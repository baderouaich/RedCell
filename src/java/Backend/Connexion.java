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
    private static Connection conn;
    
    /*
    Best way to avoid error: 
        java.sql.SQLException: Listener refused the connection with the following error: ORA-12519, TNS:no appropriate service handler found The Connection descriptor used by the client was: localhost:1521:xe
    is not to connect all the time to database, just once will do.
    */
    public static Connection Seconnecter()
    {
        try
        {
            if(conn == null)
            {
               Class.forName("oracle.jdbc.driver.OracleDriver");

               conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "RedCell", "RedCell");

               System.out.println("Successfully connected to oracle database RedCell");
            }
            return conn;
        }
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(Connexion.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } 
    }
    /*
    public static Connection Seconnecter()
    {
        try
        {
           Class.forName("oracle.jdbc.driver.OracleDriver");
            
           Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "RedCell", "RedCell");
 
           System.out.println("Successfully connected to oracle database RedCell");

           return conn;
        }
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(Connexion.class.getName()).log(Level.SEVERE, null, ex);
        } 

        return null;
    }
*/
}
