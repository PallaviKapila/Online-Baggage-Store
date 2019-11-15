<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
                out.print("<h4 align='center'>Already Added Sub Categories</h4><br/>");
                out.print("<table class = 'table table-hover'>"
                + "<tr>"
                + "<th>Pitcure</th>"
                + "<th>Name</th>"
                + "<th>Update</th><th>Delete</th></tr>");
                do
                {
                    out.print("<tr>"
                    + "<td><img src='uploads/" + myres.getString("subcatpic") + "' height='75'</td>"
                    + "<td>" + myres.getString("subcatname") + "</td>"
                    + "<td><a href='updatesubcat.jsp?scid=" + myres.getString("subcatid") + "' >Update</a></td>"
                    + "<td><a class='dellink' href='' id=" + myres.getString("subcatid") + "' >Delete</a></td></tr>");
                }
                while(myres.next()==true);
                out.print("</table>");
            }
            else
            {
                out.print("No records found");
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