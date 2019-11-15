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
                String q = "delete from  managecat where catid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("catid"));
                int count = myst.executeUpdate();
                
                if(count==1)
                {
                    out.print("done");
                }
                else
                {
                    out.print("Not done");
                }
            }
            catch(Exception e)
            {
                out.print("Error Occured " + e.getMessage());
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
