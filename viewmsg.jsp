<%-- 
    Document   : signup
    Created on : 19 Jun, 2019, 6:39:51 PM
    Author     : Pallavi
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbvars.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-Up</title>
        <%@include file="extfiles.jsp"%> 
    </head>
    <body>
       
       <%
           if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
           {
         %>
         <%@include file="adminheader.jsp"%>
         <%
          }
          else
           {
           %>
        <%@include file="header.jsp"%>
        <%
         }
        %>
        
        
        <%
           if(request.getParameter("s2")!=null)
           {
               response.sendRedirect("showcat.jsp");
           }
           else if(request.getParameter("s3")!=null)
           {
               response.sendRedirect("checkout.jsp");
           }
         %>
         <section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3 align="center">Messages</h3><br/>
                     <div class="checkout-right">
           <%   
          try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    String q = "select * from contact ";

                    PreparedStatement myst = myconn.prepareStatement(q);
                    ResultSet myres = myst.executeQuery();
                    
                    if(myres.next()==true)
                    {
                       int b=1;
                       out.print("<table class = 'table table-hover'>");
                       out.print("<tr>");
                       out.print("<th>Sr No.</th>");
                       out.print("<th>Name</th>");
                       out.print("<th>Username</th>");
                       out.print("<th>Phone</th>");
                       out.print("<th>Message</th>");
                       out.print("</tr>");
                       do
                       {
                           String n = myres.getString("name");
                           String unm = myres.getString("username");
                           String ph = myres.getString("phone");
                           String msg = myres.getString("message");
                          out.print("<tr>"
                                   + "<td>" + b + "</td>"
                                   + "<td>" + n+ "</td>"
                                   + "<td>" + unm + "</td>"
                                   + "<td>" + ph + "</td>"
                                   + "<td>" + msg + "</td>"
                                   +"</tr>");
                       b++;
                       }
                       while(myres.next());
                       out.print("</table><br/><br/>");
                       
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
                               out.print("Error in connection "+e.getMessage());
                           }
                      
           %>
                     </div></div></div></div>
         </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>
