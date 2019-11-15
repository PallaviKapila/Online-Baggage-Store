<%-- 
    Document   : orderhis
    Created on : 10 Jul, 2019, 5:30:01 PM
    Author     : Pallavi
--%>
<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baggage Online Store</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%
            if(session.getAttribute("n")==null)
            {
                response.sendRedirect("login.jsp");
            }
         %>
          <%
            if(session.getAttribute("n")==null)
           {
         %>
         <%@include file="header.jsp"%>
         <%
          }
          else if(session.getAttribute("utype").toString().equalsIgnoreCase("normal"))
           {
           %>
        <%@include file="header.jsp"%>
        <%
          }
        else if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
           {
           %>
        <%@include file="adminheader.jsp"%>
        <%
         }
     
           %>
        
        
         <section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3 align="center">Your Order History</h3><br/>
                     <div class="checkout-right">
        <%

            String ordt="",oid="",pmode="",q="";
            String st="";
            double rate=0,tc=0,qty=0,a=0,gtotal=0;
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    PreparedStatement myst = null;
                    if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
                    {
                        q = "select * from ordertable";
                        myst = myconn.prepareStatement(q);
                    }
                    else
                    {
                       q = "select * from ordertable where username=?";
                       myst = myconn.prepareStatement(q);
                       myst.setString(1, session.getAttribute("uname").toString());
                    }
                    
                    ResultSet myres = myst.executeQuery();
                    if(myres.next()==true)
                    {
                       out.print("<table class = 'table table-hover'>");
                       out.print("<tr>");
                       out.print("<th>Order ID</th>");
                       out.print("<th>Payment Mode</th>");
                       out.print("<th>Date</th>");
                       out.print("<th>Amount</th>");
                       out.print("<th>Status</th>");
                       out.print("<th>Show Product</th>");
                       if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
                       {
                           out.print("<th>Update Status</th>");
                       }
                       out.print("</tr>");
                       do
                       {
                          oid = myres.getString("orderid");
                          pmode = myres.getString("pmode");
                          ordt = myres.getString("orderdt");
                          gtotal = myres.getDouble("billamt");
                          if(session.getAttribute("utype").toString().equalsIgnoreCase("admin"))
                          {
                          out.print("<tr>"
                                   + "<td>" + oid + "</td>"
                                   + "<td>" + pmode + "</td>"
                                   + "<td>" + ordt + "</td>"
                                   + "<td>" + gtotal + "</td>"
                                   + "<td>" + myres.getString("status") +"</td>"
                                   + "<td><a href='prodhis.jsp?orid="+ oid + "'>Details</a></td>"
                                   + "<td><a href='updatestatus.jsp?orid="+ oid + "&currst=" + myres.getString("status") + "'>Update Status</a></td>"
                                   +"</tr>");
                          }
                          else
                          {
                           out.print("<tr>"
                                   + "<td>" + oid + "</td>"
                                   + "<td>" + pmode + "</td>"
                                   + "<td>" + ordt + "</td>"
                                   + "<td>" + gtotal + "</td>"
                                   + "<td>" + myres.getString("status") +"</td>"
                                   + "<td><a href='prodhis.jsp?orid="+ oid + "'>Order Details</a></td>"
                                   +"</tr>");   
                          }
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
