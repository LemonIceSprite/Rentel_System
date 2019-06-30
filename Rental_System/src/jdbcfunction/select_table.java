package jdbcfunction;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import jdbcfunction.JDBCConnection;
public class select_table {
	Connection conn=new JDBCConnection().getConn();
	public ResultSet read_departments()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select  *  from  departments");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_renter()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select  *  from  renter");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_owner()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select  *  from  owner");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_manager()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select  *  from  manager");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_car()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select  *  from  car");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_order()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery(" SELECT  *  FROM  `order`;");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_bill_view()
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT * FROM bill_view;");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_bill_view(String ordercode)
	{
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT * FROM bill_view where Order_Code = "+ordercode+";");
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public ResultSet read_carcode(String code)
	{
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT Car_Code FROM car WHERE Owner_Code='"+code+"';";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public float read_remain(String code)
	{
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT remain FROM owner_balance WHERE Owner_Code='"+code+"';";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				return rs.getFloat(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public float read_remain2(String code)
	{
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT remain FROM renter_balance WHERE Renter_Code='"+code+"';";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				return rs.getFloat(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public ResultSet read_car_message()
	{
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT * FROM car_message WHERE Rent=b'0';";
			ResultSet rs=stmt.executeQuery(sql);
			return rs;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	public String getOrderCode(Timestamp start_time)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式，不显示毫秒
		String str = df.format(start_time);
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT Order_Code FROM `order` WHERE Start_time='"+str+"';";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				return rs.getString(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return "?";
	}
	public String getOrderCode2()
	{
		try{
			Statement stmt = conn.createStatement();
			String sql="SELECT MAX(Order_Code) FROM `order`;";
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				return rs.getString(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return "?";
	}
	public void out()
	{
		System.out.println("hello!out");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
