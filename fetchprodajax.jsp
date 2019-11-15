<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%
    try
        {
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
        try
        {
        String q = "select * from manageprod where subcatid=?";

        PreparedStatement myst = myconn.prepareStatement(q);
        myst.setString(1, request.getParameter("scid"));
        ResultSet myres = myst.executeQuery();

        if(myres.next()==true)
        {
            out.print("<h4 align='center'>Already added products</h4>");
            out.print("<table class = 'table table-hover'>"
                              + "<tr>"
                              + "<th>Pitcure</th>"
                              + "<th>Name</th>"
                              + "<th>Rate</th>"
                              + "<th>Discount</th>"
                              + "<th>Stock</th>"
                              + "<th>Description</th>"
                              + "<th>Update</th><th>Delete</th></tr>");
            do
            {
                out.print("<tr>"
                +"<td><img src='uploads/" + myres.getString("prodpic") + "' height='75'</td>"
                + "<td>" + myres.getString("name") + "</td>"
                + "<td>" + myres.getString("rate") + "</td>"
                + "<td>" + myres.getString("discount") + "</td>"
                + "<td>" + myres.getString("stock") + "</td>"
                + "<td>" + myres.getString("description") + "</td>"
                + "<td><a href='updateprod.jsp?pid=" + myres.getString("prodid") + "' >Update</a></td>"
                + "<td><a class='dellink' href='' id=" + myres.getString("prodid") + "' >Delete</a></td></tr>");
            }
            while(myres.next());
            out.print("</table>");
        }
        else
        {
            out.print("<option value=''>No product found</option>");
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