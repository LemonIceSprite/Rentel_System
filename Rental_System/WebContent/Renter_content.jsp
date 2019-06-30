<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  import="java.util.*" import="jdbcfunction.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	ResultSet rs=new select_table().read_renter();
	JDBCConnection jc=new JDBCConnection();
	Connection conn=jc.getConn();
	String code=request.getParameter("username");
	//out.print(" code="+code);
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	//out.print(" name="+name);
//	int age=0;Byte gender=0;
	String age="0";
	String gender="0";
	try{
//	int age=Integer.parseInt(request.getParameter("age"));
	age=request.getParameter("age");
	//out.print(" age="+age);
//	Byte gender=Byte.parseByte(request.getParameter("gender"));
	gender=request.getParameter("gender");
	//out.print(" gender="+gender);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	String address=request.getParameter("address");
	//out.print("address="+address);
%>
<script type="text/javascript">
	function modify_Message()
	{
		//alert("hello");
		<%
		try{
		
		String sql="update renter set Password='"+password+"',Name='"+name+"',Age="
		+age+",Gender=b'"+gender+"',Address='"+address+"'  where Renter_Code='"+code+"';";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		/* pstmt.setString(1,password);
		pstmt.setString(2,name);
		pstmt.setInt(3,age);
		pstmt.setByte(4,gender);
		pstmt.setString(5,address);
		pstmt.setString(6,code); */
		pstmt.executeUpdate();
		pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
	alert("修改成功");
	} 
</script>
<script>
function feedback()
{
	<%
	String ordercode2=request.getParameter("ordercode");
	String note2=request.getParameter("note");
	new update_table().update_ordernote(ordercode2, note2);
	%>	
	alert("反馈成功");
}
</script>
</head>
<body>

<%
	int selectvalue=1;
	try{
	selectvalue=Integer.parseInt(request.getParameter("value"));
	}catch(Exception e){
		e.printStackTrace();
	}
 if(selectvalue==1){
	out.print("<table><tr><td align=center><table width=300 border=0 align=center valign=top >") ;
	out.print("<tr><td colspan=2></td></tr>");
	while(rs.next()){
		if(rs.getString(1).equals(code)){
		out.print("<tr><td align=right><font size=5 >账号:</font></td><td  align = center ><font size=5 >"+rs.getString("Renter_code")+"</font></td></tr>");
	    out.print("<tr><td align=right><font size=5 >姓名:</td><td  align = center ><font size=5 >"+rs.getString("Name")+"</font></td></tr>");
	    out.print("<tr><td align=right><font size=5 >年龄:</td><td align = center ><font size=5 >"+rs.getInt("Age")+"</font></td></tr>"); 
	    if(rs.getByte("Gender")==1){
			out.print("<tr><td align=right><font size=5 >性别:</font></td><td  align = center ><font size=5 >男</font></td></tr>");
		}else{
			out.print("<tr><td align=right><font size=5 >性别:</font></td><td  align = center ><font size=5 >女</font></td></tr>");
		}
	    out.print("<tr><td align=right><font size=5 >地址:</td><td  align = center ><font size=5 >"+rs.getString("Address")+"</font></td></tr>");
	    out.print("<tr><td align=right><font size=5 >密码:</td><td  align = center ><font size=5 >"+rs.getString("Password")+"</font></td></tr>");
	}}
    out.print("</table></td><td align=center>&nbsp;<img src=picture/avatar.jpg width=60% /></td></tr></table>") ;
 }
 else if(selectvalue==3)
 {
	rs=new select_table().read_car_message();
		out.print("<table border=2 align=center >") ;
		out.print("<tr><td>车辆编号</td><td>车型</td><td>管理员编号</td><td>时间费率</td><td>超时费率</td><td>起步价</td><td>异常描述</td></tr>");
		while(rs.next()){
			String car_code=rs.getString("Car_Code");
			String model=rs.getString("Model");
		//	String rent=rs.getString("Rent");
			String manager=rs.getString("Manage_Code");
			String note=rs.getString("note");
			String time_rate=rs.getString(7);
			String over_rate=rs.getString(8);
			String start_fare=rs.getString(9);
			out.print("<tr><td>"+car_code+"</td>");
		    out.print("<td>"+model+"</td>");
		 //   out.print("<td align = center >"+rent+"</td>"); 
		    out.print("<td>"+manager+"</td>");
		    out.print("<td>"+time_rate+"</td>");
		    out.print("<td>"+over_rate+"</td>");
		    out.print("<td>"+start_fare+"</td>");
		    out.print("<td>"+note+"</td></tr>");
		}
	    out.print("</table>") ;
 }
 else if(selectvalue==2)
 {
	 %>
<form id="modify"  method="post" action="Renter_index.jsp?username=<%=code %>">
	<h1 align="center">请修改您的信息</h1>
		<%
		while (rs.next()) {
			if (rs.getString(1).equals(code)) {		
		%>
<table width="300" border="2" align="center">
 <tr>
				<%out.print("<tr><td  align = center >原密码：</td><td  align = center >" + rs.getString("Password") + "</td></tr>");%>
				<th width="100" scope="row">新密码：</th>
				<td width="101"><input id="t1" type="text" name="password" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原名称：</td><td  align = center >" + rs.getString("Name") + "</td></tr>");%>
				<th scope="row">新名称：</th>
				<td><input id="t2" type="text" name="name" /></td>
			</tr>
			
			<tr>
				<%out.print("<tr><td  align = center >原性别：</td><td  align = center >" + rs.getByte("Gender") + "</td></tr>");%>
				<th scope="row">新性别：</th>
				<td><input id="t4" type="text" name="gender" /></td>
			</tr>
			<tr>
				<%out.print("<tr><td  align = center >原地址：</td><td  align = center >" + rs.getString("Address") + "</td></tr>");%>
				<th scope="row">新地址:</th>
				<td><input id="t5" type="text" name="address" /></td>
			</tr>
			<tr>
				<th colspan="2" scope="row"><input type="submit" style="background-color: #ababab;width: 76px;height: 36px;color: #FFFFFF" value="提交"
					onclick="modify_Message()" /></th>
			</tr>
		</table>
</table>
</form>
	 <%}
		}
	 
 }else if(selectvalue==4)
 {
	 %>
	 <%
	 rs=new select_table().read_car_message();
		out.print("<table border=2 align=center >") ;
		out.print("<tr><td>车辆编号</td><td>车型</td><td>管理员编号</td><td>时间费率</td><td>超时费率</td><td>起步价</td><td>异常描述</td></tr>");
		while(rs.next()){
			String car_code=rs.getString(1);
			String model=rs.getString(2);
		//	String rent=rs.getString("Rent");
			String manager=rs.getString(3);
			String note=rs.getString(6);
			String time_rate=rs.getString(7);
			String over_rate=rs.getString(8);
			String start_fare=rs.getString(9);
			out.print("<tr><td>"+car_code+"</td>");
		    out.print("<td>"+model+"</td>");
		 //   out.print("<td align = center >"+rent+"</td>"); 
		    out.print("<td>"+manager+"</td>");
		    out.print("<td>"+time_rate+"</td>");
		    out.print("<td>"+over_rate+"</td>");
		    out.print("<td>"+start_fare+"</td>");
		    out.print("<td>"+note+"</td></tr>");
		}
	    out.print("</table>") ;
%>
	<form id="addbill" action="Renter_index.jsp?value=10&username=<%=code%>" method="post"  action="">
<table width="291" border="0" align="center">
  <tr>
    <td width="116" height="38">所选择车辆：</td>
    <td width="168"><input type="text" name="car_code" /></td>
  </tr>
  <tr>
    <td height="44">预计使用时长：</td>
    <td><input type="text" name="order_time" /></td>
  </tr>
  <tr>
    <td height="37" colspan="2"><table width="303" border="0">
      <tr>
        <td height="31" align="center"><input type="reset" value="重置" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"  /></td>
        <td align="left"><input type="submit" value="提交" onclick="" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"/></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>


	 <%
 }else if(selectvalue==5)
 {
	 rs=new select_table().read_order();
	 out.print("<br>");
	 out.print("<table width=600 border=2 align=center >") ;
		out.print("<tr><td>订单号</td><td>车辆编号</td><td>租用开始时间</td><td>租用结束时间</td><td>异常描述</td></tr>");
		while(rs.next()){
			if(rs.getString(6).equals(code)){
			out.print("<tr><td  align = center >"+rs.getString(1)+"</td>");
		    out.print("<td  align = center >"+rs.getString(2)+"</td>");
		    out.print("<td align = center >"+rs.getString(3)+"</td>"); 
		    out.print("<td  align = center >"+rs.getString(4)+"</td>");
		    out.print("<td  align = center >"+rs.getString(5)+"</td></tr>");
		}} 	
	    out.print("</table>") ;
	 
 }else if (selectvalue == 6) {
		float remain = new select_table().read_remain2(code);
		out.print("<h2>尊敬的用户</h2><p><h2>您当前的余额为：" + remain+"￥</h2>");
	}else if (selectvalue == 7) {
		float add = 0;
		try {
			add = Integer.parseInt(request.getParameter("addremain"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		float remain = new update_table().update_remain2(add, code);
		//out.print("余额为：" + remain);
%>

<form id="addremain" action="" method="post"
	action="Renter_index.jsp?username=<%=code%>">
	<table width="516" border="0" align="center">
		<tr  height=70>
			<td width="166">
				<div align="right">
				<font size="5">您当前余额为：</font></div>
			</td>
			<td width="170" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<font size="5"><%=remain %>￥</font></td>
		</tr>
		<tr height=70>
			<td><div align="right"><font size="5">你所充值的金额为：</font></div></td>
			<td><input type="text" name="addremain"  /> 元</td>
		</tr>
		<tr>
			<td colspan="2"><div align="center">
					<input type="submit" value="确认" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF" />
				</div></td>
		</tr>
	</table>
</form>
<%
	}else if(selectvalue==8){

		rs = new select_table().read_bill_view();
		out.print("<br><table width=660 border=2 align=center >");
		out.print(
				"<tr><td>账单号</td><td>订单号</td><td>车主编号</td><td>租用开始时间</td><td>租用结束时间</td><td>预计时间</td><td>实际使用时间</td><td>费用</td><td>异常描述</td></tr>");
		while (rs.next()) {
				if (rs.getString(10).equals(code)) {
					out.print("<tr><td  align = center >" + rs.getString(1) + "</td>");
					out.print("<td  align = center >" + rs.getString(2) + "</td>");
					out.print("<td  align = center >" + rs.getString(3) + "</td>");
					out.print("<td  align = center >" + rs.getString(4) + "</td>");
					out.print("<td  align = center >" + rs.getString(5) + "</td>");
					out.print("<td align = center >" + rs.getString(6) + "</td>");
					out.print("<td  align = center >" + rs.getString(7) + "</td>");
					out.print("<td  align = center >" + rs.getString(8) + "</td>");
					out.print("<td  align = center >" + rs.getString(9) + "</td></tr>");
				}
		}
		out.print("</table>");
		
	}else if(selectvalue==10){
		java.util.Date date=new java.util.Date();
		Timestamp starttime = new Timestamp(date.getTime());  
		//out.print(starttime);
		int order_time=0;
		try{
			order_time=Integer.parseInt(request.getParameter("order_time"));
			}catch(Exception e){
				e.printStackTrace();
			}
		String rent="1";
		String car_code=request.getParameter("car_code");
		try{
			String sql="update car set rent=b'"+rent+"' where Car_Code='"+car_code+"';";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		try{
			String sql="INSERT INTO `order` (Car_Code,Start_time,Renter_Code)"
			+ " VALUES('"+car_code+"','"+starttime+"','"+code+"') ;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		String ordercode=new select_table().getOrderCode2();
		new insert_table().bill(ordercode, order_time);	
		String sql = "select * from bill_view where Order_Code = "+ordercode+";";
		//int ordercode_i=Integer.parseInt(ordercode);
		//System.out.println("ccccc"+sql+"!");//输出connection success表示数据库已成功连接
		PreparedStatement stmt = conn.prepareStatement(sql);
		//stmt.setInt(1, ordercode_i);
		rs = stmt.executeQuery();
		out.print("<table width=400 border=2 align=center >") ;
		out.print("<tr><td colspan=2></td></tr>");
		while(rs.next()){
			out.print("<h2>账单信息</h2>");
			out.print("<tr><td>账单号:</td><td  align = center >"+rs.getString(1)+"</td></tr>");
		    out.print("<tr><td>订单号:</td><td  align = center >"+rs.getString(2)+"</td></tr>");
		    out.print("<tr><td>车辆号:</td><td align = center >"+rs.getString(3)+"</td></tr>"); 
		    out.print("<tr><td>开始时间:</td><td  align = center >"+rs.getString(4)+"</td></tr>");
		    out.print("<tr><td>结束时间:</td><td  align = center > </td></tr>");
		    out.print("<tr><td>预计时间:</td><td  align = center >"+rs.getString(6)+"</td></tr>");
		    out.print("<tr><td>实际时间:</td><td  align = center > </td></tr>");
		    out.print("<tr><td>金额:</td><td  align = center > </td></tr>");
		}
		rs.close();
		stmt.close();
		%>
		<tr>
        <th  colspan="2" scope="row"  height="31" align="center"><input type="submit" value="结束" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF" onclick="javascript:location.href='Renter_index.jsp?value=11&username=<%=code %>&ordercode=<%=ordercode %>'" />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"  value="返回" onclick="javascript:location.href='Renter_index.jsp?value=1&username=<%=code %>'" /></th>
     	</tr>
	    <% out.print("</table>") ;
	    
	}else if(selectvalue==11){
		String ordercode=request.getParameter("ordercode");
		java.util.Date date2=new java.util.Date();
		Timestamp endtime = new Timestamp(date2.getTime()); 
		try{
			String s1="update `order`  set `End_time` = '"+endtime+"' where `Order_Code`='"+ordercode+"'; ";
			PreparedStatement pstmt=conn.prepareStatement(s1);
			pstmt.executeUpdate();
			pstmt.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		//输出订单信息
		 String sql = "select * from bill_view where Order_Code = "+ordercode+";";
		PreparedStatement stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(); 
		//rs=new select_table().read_bill_view(ordercode);
		out.print("<table width=400 border=2 align=center >") ;
		out.print("<tr><td colspan=2></td></tr>");
		float money=0;
		//out.print("in");
		while(rs.next()){
			if(rs.getFloat(7)>rs.getFloat(6)){
			    money = rs.getFloat(6)*rs.getFloat(11) + (rs.getFloat(7)-rs.getFloat(6))*rs.getFloat(12) + rs.getFloat("Start_fare");
			}else{
			    money = rs.getFloat(6)*rs.getFloat(11) + rs.getFloat("Start_fare");
			}
		}
		 sql = "update bill set money = "+money+" where Order_Code = '"+ordercode+"';";
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    pstmt.executeUpdate(sql);
		rs=stmt.executeQuery(); 
		while(rs.next()){
			out.print("<h2>账单信息</h2>");
			out.print("<tr><td>账单号:</td><td  align = center >"+rs.getString(1)+"</td></tr>");
		    out.print("<tr><td>订单号:</td><td  align = center >"+rs.getString(2)+"</td></tr>");
		    out.print("<tr><td>车辆号:</td><td align = center >"+rs.getString(3)+"</td></tr>"); 
		    out.print("<tr><td>开始时间:</td><td  align = center >"+rs.getString(4)+"</td></tr>");
		    out.print("<tr><td>结束时间:</td><td  align = center > "+rs.getString(5)+"</td></tr>");
		    out.print("<tr><td>预计时间:</td><td  align = center >"+rs.getString(6)+"</td></tr>");
		    out.print("<tr><td>实际时间:</td><td  align = center >"+rs.getString(7)+" </td></tr>");
		    out.print("<tr><td>金额:</td><td  align = center >"+rs.getString(8)+" </td></tr>");
		}
		rs.close();
		stmt.close();
	}
	else if(selectvalue==9){
		%>
	<form id="addnote" action="" method="post" action="Renter_index.jsp?username=<%=code%>">
		<table width="361" border="0" align="center">
  <tr>
    <td width="169">您要反馈的订单号：</td>
    <td width="182"><input type="text" name="ordercode"></td>
  </tr>
  <tr>
    <td height="211" colspan="2" align="center"><h3>反馈信息</h3>

        <textarea name="note" id="textarea" cols="45" rows="10"></textarea>

    <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td align="center"><input type="reset" value="重置" style="background-color: #545454;width: 76px;height: 36px;color: #FFFFFF"/></td>
    <td align="center"><input type="submit" style="background-color: #545454;width: 76px;height: 36px;color: #FFFFFF" value="提交" onclick=feedback() /></td>
  </tr>
</table>
</form>	
		<%
	}else if(selectvalue==13){
		 
		 float cut = 0;
			try {
				cut = Integer.parseInt(request.getParameter("cutremain"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			float remain2 = new update_table().update_remain4(cut, code);
			//out.print("余额为：" + remain);
	%>
	
	<form id="addremain" action="" method="post"
		action="Renter_index.jsp?username=<%=code%>">
		<table width="456" border="0" align="center">
			<tr height=70>
				<td width="166">
					<div align="right"><font size="5">当前余额为：</font></div>
				</td>
				<td width="170" align="left"><font size="5">&nbsp;&nbsp;&nbsp;&nbsp;<%=remain2 %>￥</font></td>
			</tr>
			<tr height=70>
				<td><div align="right"><font size="5">你所提现的金额为：</font></div></td>
				<td><input type="text" name="cutremain"  /><font size="5">元</font></td>
			</tr>
			<tr height=70>
				<td colspan="2"><div align="center">
						<input type="submit" value="确认" style="background-color: #8f8fbd;width: 76px;height: 36px;color: #FFFFFF"  />
					</div></td>
			</tr>
		</table>
	</form>	 
	<% 	 
	 }
%>
</body>
</html>