<%-- 
    Document   : adminhome
    Created on : 22 Jun, 2019, 1:03:42 PM
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
        <script src="js/jquery.js"></script>
        <script>
     $(document).ready(function()
    {
        $(".dellink").click(function(e){
        e.preventDefault();
        var cid=$(this).attr("id");
        var pr1=$(this).parent();//td
        var pr = $(this).parent().parent();//tr
        if(confirm("Are u sure you want to delete"))
        {
        $.ajax({
        type: 'post',
        url: 'delcart.jsp',
        data: {"pid":cid},
        beforeSend: function()
        {
          pr1.append("<img src='uploads/loader.gif'>")  
        },
        success: function(reslt)
        {
          if($.trim(reslt)=="done")
          {
              pr.css({'backgroundColor':'#fb6c6a'});
              pr.fadeOut(600,function(){
                  //pr.remove();
              })
          }
          else 
          {
              alert("Some Problem occured");
          }
      },
          error: function(e)
          {
              alert("Error in ajax");
          }
        });
    }
        })
 });
        </script>
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
                     <h3 align="center">Your Shopping Cart</h3><br/>
                     <div class="checkout-right">
           <%   
           String pname="",un="",pic="",ppid="";
           double rate=0,tc=0,qty=0,gtotal=0;
          
           try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    String q = "select * from carttable where username=?";

                    PreparedStatement myst = myconn.prepareStatement(q);
                    myst.setString(1, session.getAttribute("uname").toString());
                    ResultSet myres = myst.executeQuery();
                    
                    if(myres.next()==true)
                    {
                       int b=1;
                       out.print("<table class = 'table table-hover'>");
                       out.print("<tr>");
                       out.print("<th>SL No.</th>");
                       out.print("<th>Product</th>");
                       out.print("<th>Product Name</th>");
                       out.print("<th>Price</th>");
                       out.print("<th>Quantity</th>");
                       out.print("<th>Total Cost</th>");
                       out.print("<th>Remove</th>");
                       out.print("</tr>");
                       do
                       {
                          pname = myres.getString("prodname");
                          rate = myres.getDouble("rate");
                          tc = myres.getDouble("tc");
                          qty = myres.getDouble("qty");
                          gtotal += myres.getDouble("tc");
                          pic = myres.getString("pic");
                          ppid = myres.getString("prodid");
                          out.print("<tr>"
                                   + "<td>" +b+ "</td>"
                                   + "<td><img height='100' src='uploads/" +pic+"'></td>"
                                   + "<td>" + pname+ "</td>"
                                   + "<td>" + rate+ "</td>"
                                   + "<td>" + qty+ "</td>"
                                   + "<td>" + tc+ "</td>"
                                   + "<td><a href='' id='" + ppid + "'class=dellink>Remove</a></td>"
                                   +"</tr>");
                       b++;
                       }
                       while(myres.next());
                       out.print("</table><br/><br/>");
                       session.setAttribute("gtot", gtotal);
                       out.print("<b>Your cart total is Rs."+gtotal+"</b><br/>");
                    }
                    else 
                    {
                        out.print("No records found");
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
                               out.print("Error in connection "+e.getMessage());
                           }
                      
           %>
           <form name="form1">
               <input type="submit" name="s2" style="color:brown" value="Continue Shopping">
               <input type="submit" name="s3" style="color:brown" value="Checkout">
           </form>
                     </div></div></div></div>
         </section>
        <%@include file ="footer.jsp"%>
    </body>
</html>

