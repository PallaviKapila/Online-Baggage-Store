<%-- 
    Document   : checkout
    Created on : 10 Jul, 2019, 5:25:51 PM
    Author     : Pallavi
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Baggage Online Store</title>
        <%@include file="extfiles.jsp"%>
        <%
                            if(session.getAttribute("n")==null)
                            {
                                response.sendRedirect("login.jsp");
                            }
    %>
         <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function()
            {
                $("#payment-grid").hide();
                $('.payment').click(function(){
                    var a=$(this).val();
                    
                    if(a=="online")
                    {
                        $("#payment-grid").show(1000);
                    }
                    
                })
            }) 
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
            if(session.getAttribute("utype").toString().equalsIgnoreCase("normal"))
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
        
        <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <h2><span>Checkout</span></h2>
                </div>
                <div class="content-bottom">
        <%
            if(request.getParameter("s1")!=null)
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                    try
                    {
                        String add=request.getParameter("address");
                        String pmode = request.getParameter("pmode");
                        String bnname = request.getParameter("bankname");
                        String cardno = request.getParameter("cardno");
                        String name= request.getParameter("name");
                        String expdt = request.getParameter("expdt");
                        String cvv = request.getParameter("cvv");
                        String username = session.getAttribute("uname").toString();
                        String billtot = session.getAttribute("gtot").toString();
                        String st = "Payment received, processing";
                        
                        SimpleDateFormat myformat = new SimpleDateFormat("yyyy-MM-dd");
                        
                        String orderdt = myformat.format(new Date());
                        
                        String q = "insert into ordertable (address,pmode,bankname,cardno,name,expdt,cvv,username,billamt,status,orderdt) value(?,?,?,?,?,?,?,?,?,?,?)";
                        
                        PreparedStatement myst = myconn.prepareStatement(q);
                        myst.setString(1, add);
                        myst.setString(2, pmode);
                        myst.setString(3, bnname);
                        myst.setString(4, cardno);
                        myst.setString(5, name); 
                        myst.setString(6, expdt);
                        myst.setString(7, cvv);
                        myst.setString(8, username);
                        myst.setString(9, billtot);
                        myst.setString(10, st);
                        myst.setString(11, orderdt);
                        
                        int count = myst.executeUpdate();
                        
                        if(count==1)
                        {
                            response.sendRedirect("ordthx.jsp");
                        }
                        else
                        {
                            out.print("Some error occured,try again!");
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
                     out.print("Error in connection "+e.getMessage());
                }
            }
            
            
        %>
                    <form name="form5" enctype="multipart/form-data">
                        <div class="field-group">
                            <div class="content-input-field">
                                <b>Address</b><br/>
                                <input type="text" name="address" required>
                            </div>
                        </div>
                        <b>Payment Mode</b><br/>
                                
                                <label><input type = "radio" name = "pmode" class="payment" value="online" id="show">Debit Card</label><br/>
                                <label><input type = "radio" name = "pmode"class="payment" value="online" id = "show">Credit Card</label><br/>
                    <div id="payment-grid">
                         <div class="field-group" >

                            <div class="content-input-field">
                              <select name="bankname" class="container" class="content-grid" class="content-bottom" required>
                                    <option value ="">Choose your card</option>
                                    <option>VISA</option>
                                    <option>MasterCard</option>
                                    <option>RuPay</option>
                                    <option>Maestro</option>
                               </select>
                            </div>
                        </div><br/>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input type="text" name="cardno" placeholder="Card Number" minlength="16" maxlength="16" required> 
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="name" type="text" placeholder="Name on Card" required> 
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="expdt" type="text" placeholder="Expiry Date(mm/yyyy)" minlength="7" maxlength="7" required>
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="cvv" type="password" placeholder="CVV" minlength="3" maxlength="3"required>
                            </div>
                        </div>
                
                        </div>    
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Make Payment">
                        </div>
                    </form>
                </div></div></div></section>
   <%@include file ="footer.jsp"%>
        
    </body>
</html>
