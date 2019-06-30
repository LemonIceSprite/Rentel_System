package jdbcfunction;
import java.sql.*;
import jdbcfunction.JDBCConnection;

public class update_table {
	Connection conn=new JDBCConnection().getConn();
	public float update_remain(float add,String code)
	{
		float remain = new select_table().read_remain(code);
		remain=remain+add;
		try{
		String sql="update owner_balance set remain="+remain+" where Owner_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return remain;
	}
	public float update_remain2(float add,String code)
	{
		float remain = new select_table().read_remain2(code);
		remain=remain+add;
		try{
		String sql="update renter_balance set remain="+remain+" where Renter_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return remain;
	}
	public float update_remain3(float cut,String code)
	{
		float remain = new select_table().read_remain(code);
		remain=remain-cut;
		if(remain<0)
			return 0;
		try{
		String sql="update owner_balance set remain="+remain+" where Owner_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return remain;
	}
	public float update_remain4(float cut,String code)
	{
		float remain = new select_table().read_remain2(code);
		remain=remain-cut;
		if(remain<0)
			return 0;
		try{
		String sql="update renter_balance set remain="+remain+" where Renter_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return remain;
	}
	public void update_ordertime(String ordertime ,String code)
	{
		try{
		String sql="update bill set Order_time="+ordertime+" where Renter_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void update_ordernote(String ordercode,String note)
	{
		try{
		String sql="UPDATE  `order` SET `note` = '"+note+"' WHERE `Order_Code` = ' "+ordercode+"' ;";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public void update_carnote(String carcode,String note)
	{
		try{
		String sql="UPDATE  car SET `note` = '"+note+"' WHERE `Car_Code` = '"+carcode+"' ;";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
