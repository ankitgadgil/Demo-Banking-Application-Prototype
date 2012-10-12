<%@page import= "java.util.*" %>
<%@page import= "java.sql.*" %>

<%
	String user_name = (String)request.getParameter("user");
	

	Connection con = null;
	ResultSet rs = null,rs1=null;
	Statement ps=null,ps1=null;
	try
	{
	  int bal=0;
	  int uid=0;
	  String user_pwd=null;
	  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  con = DriverManager.getConnection("jdbc:odbc:bankweb2");
	  
	  //String query="SELECT  FROM user,bill,user_bill WHERE user.u_id=user_bill.u_id and bill.bill_id=user_bill.bill_id and user.acc_no=";  
	 // put acc_no use session for acc_no from menu page 
	 
		String query =" SELECT balance,u_id FROM user WHERE u_name='"+user_name+"'";	

	  ps = con.createStatement();
	  rs=ps.executeQuery(query);
	  while(rs.next())
		{   
		
			bal=rs.getInt(1);
			uid=rs.getInt(2);
		} 

		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<script language = \"Javascript\" src=\"PayBill.js\"> </script>");
		out.println("<TITLE> Banking Profile </TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<h2> User: "+user_name+"</h2>");
		out.println("<center><h1> CVPL Bank </h1> </center>");
		out.println("<div align=\"right\"> <a href=\"Login.html\"> <button type=\"submit\"> Logout </button> </a> </div>");
		out.println("<div id=\"one\" style=\"float:left;\">");

		
		out.println("<h2> Available Balance: "+bal+"/-</h2>");
		out.println("Enter your Password: &nbsp;&nbsp;&nbsp; <input type=password name=\"pwd\" id=\"pwd\">");
		out.println("</br></br><h3>Choose a bill to pay</h3>");
		out.println(" Choose a Bill Type: <select name=\"bill\" id=\"bill\"><option>Telephone Bill</option><option>Internet Bill</option>");
		out.println("<option>Electricity Bill</option>");
		out.println("</select>");
		out.println("</br></br>Enter Bill Amount: <input type=text name=\"bill_amt\" id=\"bill_amt\">");
		out.println("</br></br><input type=\"button\" onclick=\"payBill();\" value=\"Pay Bill\">");
		out.println("</br><br>");
		out.println("Status : &nbsp;&nbsp;<input type=\"text\" name=\"status\" id=\"status\" readonly=\"readonly\" size=55% border=0/>");
		

		out.println("<hr>");
		out.println("</div>");
		out.println("<div id=\"two\" style=\"float:left;\">");
		out.println("</div>");
		out.println("<div id=\"three\" style=\"float:right;\">");
		out.println("<img src=\"1.jpg\" alt=\"Big Bank\">");
		out.println("</div>");
		out.println("</BODY>");
		out.println("</HTML>");
		
		
	}
catch(SQLException e)
{	
	e.printStackTrace();
}
finally
{
	rs.close();
	ps.close();
	con.close();
}
%>



