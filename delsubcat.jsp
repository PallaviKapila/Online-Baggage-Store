<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%
           try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn =  DriverManager.getConnection(dburl, dbuname, dbpass);
            try
            {
                String q = "delete from managesubcat where subcatid=?";//CATID IS AUTO INCREMENTED IN OUR TABLE
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("scatid"));
                int count=myst.executeUpdate();
                if(count==1)
                {
                   out.print("done");
                }
                else
                {
                    out.print("notdone");
                }
                
                
            }
            catch(Exception e)
            {
                out.print("Error in query" + e.getMessage());
            }
            finally
            {
                myconn.close();
            }
        }   
         catch(Exception e)
        {
            out.print("Error in connection" + e.getMessage());
        }
        %>
