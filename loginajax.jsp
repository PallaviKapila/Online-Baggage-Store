<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%
                       try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String unm = request.getParameter("uname");
                           String pass = request.getParameter("pass");
                           
                           
                           String q = "select * from signup where (Username=? or Phone = ?) and Password = ?";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1,unm);
                           myst.setString(2,unm);
                           myst.setString(3,pass);
                           
                           
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               session.setAttribute("n",myres.getString("name"));
                               session.setAttribute("uname",myres.getString("username"));
                               session.setAttribute("phone",myres.getString("phone"));
                               session.setAttribute("utype",myres.getString("usertype"));
                               if(myres.getString("usertype").equalsIgnoreCase("admin"))
                               {
                                   out.print("admin");
                               }
                               else
                               {
                                    out.print("normal");
                               }       
                           }
                           else
                           {
                               out.print("Incorrect");
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