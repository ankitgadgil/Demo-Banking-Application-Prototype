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
		out.println("<script language = \"Javascript\" src=\"IssueChequebook.js\"> </script>");
		out.println("<TITLE> Banking Profile </TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("<h2> User: "+user_name+"</h2>");
		out.println("<center><h1> CVPL Bank </h1> </center>");
		out.println("<div align=\"right\"> <a href=\"index.html\"> <button type=\"submit\"> Logout </button> </a> </div>");
		out.println("<div id=\"one\" style=\"float:left;\">");

		
		out.println("Enter your Password: &nbsp;&nbsp;&nbsp; <input type=password name=\"pwd\" id=\"pwd\">");
		out.println("</br></br>Number of cheque books");
		out.println("<select name=\"cb_no\" id=\"cb_no\"><option>1</option><option>2</option>");
		out.println("</select>");
		out.println("</br></br> Number of leaves <select name=\"cb_leaves\" id=\"cb_leaves\"><option>25</option><option>50</option></select></br>");
		out.println("</br></br><input type=\"button\" onclick=\"issueChequebook();\" value=\"Request Chequebook\">");
		out.println("</br><br>");
		out.println("Status : &nbsp;&nbsp;<input type=\"text\" name=\"status\" id=\"status\" readonly=\"readonly\" size=60% border=0/>");


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



