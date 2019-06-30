package jdbcfunction;
import java.sql.*;
public class test02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JDBCConnection jc=new JDBCConnection();
		Connection conn=jc.getConn();
		try{
		String sql="update renter set Password=22222,Name=?,Age=?,gender=?,address=?,password=? where Renter_Code=?;";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,"22222");
		pstmt.setString(2,"lihua");
		pstmt.setInt(3,12);
		pstmt.setByte(4,(byte) 1);
		pstmt.setString(5,"beijin");
		pstmt.setString(6,"11111");
		
		pstmt.executeUpdate();
		pstmt.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
