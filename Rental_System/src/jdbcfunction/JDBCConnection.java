package jdbcfunction;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class JDBCConnection {
	private final static String URL="jdbc:mysql://localhost:3306/Renter_System?useSSL=false&serverTimezone=UTC";
	private final static String USER_NAME="root";
	private final static String PASSWORD="990710whM";
	private static Connection conn=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	//��ȡ����
	public static Connection getConn(){
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("zhuce success");
			conn =DriverManager.getConnection(URL,USER_NAME,PASSWORD);
			System.out.println("connection success!");	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("success!!!");
		return conn;
	}
	public Connection getCon()
	{
		return conn;
	}
	public static void close(Connection conn,Statement ps,ResultSet rs){
		if(rs!=null)
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		if(ps!=null)
			try{
				ps.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		if(conn!=null)
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
	}
	public static void main(String[] args){
		getConn();
		close(conn,ps,rs);
	}
}
