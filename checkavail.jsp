<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%
    try
        {
        Class.forName("com.mysql.jdbc.Driver");
        Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
        try
        {
        String uname = request.getParameter("un");
           
        String q = "select * from signup where username=?";

        PreparedStatement myst = myconn.prepareStatement(q);
        ResultSet myres = myst.executeQuery();

        if(myres.next())
        {
           out.print("Username already exists"); 
        }
        else
        {
            out.print("Username Available");
        }
        }
        catch(Exception e)
        {
            out.print("Error occured due to"+e.getMessage());
        }
        finally
        {
            myconn.close();
        }

        }
    catch(Exception e)
    {
        out.print("Error in connection"+e.getMessage());
    }

%>