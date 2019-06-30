package jdbcfunction;
import java.sql.*;
import java.util.*;
import jdbcfunction.JDBCConnection;
public class insert_table {
	Connection conn=new JDBCConnection().getConn();
	public void bill(String order_code,int order_time){
		String sql3="INSERT INTO bill (Order_Code,Order_time) VALUES('"+order_code+"',"+order_time+") ;";
		try{
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql3);
			stmt.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

	}
}
