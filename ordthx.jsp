<%-- 
    Document   : thx.jsp
    Created on : 20 Jun, 2019, 6:31:45 PM
    Author     : Pallavi
--%>
<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
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
       
    <%
            String rd="";
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    String q = "select * from ordertable where username=? order by orderid desc";

                    PreparedStatement myst = myconn.prepareStatement(q);
                    myst.setString(1, session.getAttribute("uname").toString());
                    ResultSet myres = myst.executeQuery();
                    
                    if(myres.next()==true)
                    {
                       rd = myres.getString("orderid");
                       q="select * from carttable where username=?";
                       
                       myst = myconn.prepareStatement(q);
                       myst.setString(1, session.getAttribute("uname").toString());
                       
                       ResultSet myres1 = myst.executeQuery();
                       while(myres1.next())
                       {
                           q = "insert into orderitems(prodid,prodname,rate,qty,tc,pic,username,orderid) values(?,?,?,?,?,?,?,?)";
                           
                           myst = myconn.prepareStatement(q);
                           myst.setString(1, myres1.getString("prodid"));
                           myst.setString(2, myres1.getString("prodname"));
                           myst.setString(3, myres1.getString("rate"));
                           myst.setString(4, myres1.getString("qty"));
                           myst.setString(5, myres1.getString("tc"));
                           myst.setString(6, myres1.getString("pic"));
                           myst.setString(7, myres1.getString("username"));
                           myst.setString(8, rd);
                           myst.executeUpdate();
                           
                           q = "update manageprod set stock=stock-? where prodid=?";
                           
                           myst = myconn.prepareStatement(q);
                           myst.setString(1, myres1.getString("qty"));
                           myst.setString(2, myres1.getString("prodid"));
                           
                           myst.executeUpdate();
                       }
                       
                       q = "delete from carttable where username=?";
                           
                           myst = myconn.prepareStatement(q);
                           myst.setString(1, session.getAttribute("uname").toString());
                           
                           myst.executeUpdate();
                    }
                    else 
                    {
                        out.print("Some error occured, try again!");
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
        <section class="banner-bottom py-5">
        <div class="container py-md-5">
        <div class="col-lg-6 ab-info-con ab-inf-page text-left">
            <h3><b>Thanks For Shopping. Your Order No. is <%=rd%></b></h3>
                </div>
        </div>
        </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>
