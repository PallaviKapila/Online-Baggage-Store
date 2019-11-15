<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%
    try
        {
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
        try
        {
        String q = "select * from managesubcat where catid=?";

        PreparedStatement myst = myconn.prepareStatement(q);
        myst.setString(1, request.getParameter("catid"));
        ResultSet myres = myst.executeQuery();

        if(myres.next()==true)
        {
             out.print("<option value=''>Choose Sub Category</option>");
            do
            {
                out.print("<option value='" + myres.getString("subcatid") + "'>" + myres.getString("subcatname") + "</option>");
            }
            while(myres.next()==true);
        }
        else
        {
            out.print("<option value=''>No Sub Category found</option>");
        }
        }
        catch(Exception e)
        {
            out.print("Error occured due to "+e.getMessage());
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