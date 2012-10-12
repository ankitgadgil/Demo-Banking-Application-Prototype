<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<%
Connection con = null;
	ResultSet rs = null;
	Statement ps=null,ps1=null;
	//String user_name=null;
	int acc_no=0;
	try
	{
		String user_name = (String)request.getParameter("user");
		//HttpSession hs1=request.getSession(true);
		
		//String user_name=(String)hs1.getValue("un");

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con = DriverManager.getConnection("jdbc:odbc:bankweb2");
		String sql="SELECT acc_no FROM user WHERE u_name ='"+user_name+"'";
		ps = con.createStatement();
		rs=ps.executeQuery(sql);
	  
		 while(rs.next())
		{	   
			acc_no=rs.getInt(1);
			
		} 

out.println("<HTML>");
out.println("<HEAD>");
out.println("<TITLE> Banking Profile </TITLE>");

out.println("</HEAD>");
out.println("<BODY>");
out.println("<h2> WELCOME, "+user_name+"</h2>");
out.println("<center><h1> CVPL Bank </h1> </center>");
out.println("<div align=\"right\"> <a href=\"index.html\"> <button type=\"submit\"> Logout </button> </a> </div>");
out.println("<div id=\"one\" style=\"float:left;\">");

out.println("<form name=\"form1\" method=\"post\" action=\"CheckBalance.jsp?user="+user_name+"\"><button type=\"submit\" \"> Check for account balance </button></a></form>");

out.println("<form name=\"form2\" method=\"post\" action=\"PayBill.jsp?user="+user_name+"\"><button type=\"submit\" > Pay existing bills </button></form>");

out.println("<form name=\"form3\" method=\"post\" action=\"RequestChequebook.jsp?user="+user_name+"\"><button type=\"submit\" onclick=\"showChq();return false;\"> Order for a cheque book </button></form>");

out.println("<form name=\"form4\" method=\"post\" action=\"AccountStmt.jsp?user="+user_name+"\"><button type=\"submit\" onclick=\"showStmt();return false;\"> View account statement online </button></form>");

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

	catch(SQLException se)
	{
		se.printStackTrace();	
	}

	finally
	{	
		rs.close();
		ps.close();
		con.close();
	}
%>