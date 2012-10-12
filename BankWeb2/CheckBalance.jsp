<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>

<%	
	Connection con = null;
	ResultSet rs = null;
	Statement ps=null;
	try
	{
		String user_name = (String)request.getParameter("user");
	  
		String user_pass = (String)request.getParameter("pwd");
	  
		 int bal=0;
		int msg=0;
		String user_pwd=null;
	  
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con = DriverManager.getConnection("jdbc:odbc:bankweb2");
		String sql="SELECT u_pass, balance FROM user WHERE u_name ='"+user_name+"'";
		
		ps = con.createStatement();
		rs=ps.executeQuery(sql);
	  
		while(rs.next())
		{   
			user_pwd=rs.getString(1);
			bal=rs.getInt(2);
		} 
	  
	  out.println("<HTML>");
	out.println("<HEAD>");
	out.println("<TITLE> Banking Profile </TITLE>");
	out.println("</HEAD>");
	out.println("<BODY>");
	
	out.println("<h2> User: "+user_name+"</h2>");
	out.println("<center><h1> CVPL Bank </h1> </center>");
	out.println("<div align=\"right\"> <a href=\"index.html\"> <button type=\"submit\"> Logout </button> </a> </div>");
	out.println("<div id=\"one\" style=\"float:left;\">");
	  
	  out.println("<h3> Your account balance is: INR "+bal+"/-");

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