<%-- 
    Document   : proddetails
    Created on : 7 Jul, 2019, 2:21:22 PM
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
        else
           {
           %>
        <%@include file="header.jsp"%>
        <%
         }
        %>
        
        <%
           String pname="",descp="",pic=""/*,cat="",subcat=""*/;
           double rate=0,dis=0,remamt=0;
           int stock = 0;
           try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                try
                    {
                    String q = "select * from manageprod where prodid=?";
                    //String q = "select prodname,rate,discount,stock,description,propic,catname,subcatname from manageprod,managecat,managesubcat where prodid=?";

                    PreparedStatement myst = myconn.prepareStatement(q);
                    myst.setString(1, request.getParameter("pid"));
                    ResultSet myres = myst.executeQuery();
                    
                    if(myres.next()==true)
                    {
                       pname = myres.getString("name");
                       descp = myres.getString("description");
                       rate = myres.getDouble("rate");
                       stock = myres.getInt("stock");
                       dis = myres.getDouble("discount");
                       remamt = rate-((rate*dis)/100);
                       pic = myres.getString("prodpic");
                       /*cat = myres.getString("catname");
                       subcat = myres.getString("subcatname");*/
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
         
         <%
            if(request.getParameter("s1")!=null)
            {
                if(session.getAttribute("uname")!=null)
                {
                    try
                    {
                        String pid="",un="";
                        double qt=0,tc=0;
                        qt = Double.parseDouble(request.getParameter("qty"));
                        tc=remamt*qt;
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                        try
                            {
                            String q = "insert into carttable (prodid,prodname,rate,qty,tc,pic,username) values(?,?,?,?,?,?,?)";

                            PreparedStatement myst = myconn.prepareStatement(q);
                            myst.setString(1, request.getParameter("pid"));
                            myst.setString(2, pname);
                            myst.setDouble(3, remamt);
                            myst.setDouble(4, qt);
                            myst.setDouble(5, tc);
                            myst.setString(6, pic);
                            myst.setString(7, session.getAttribute("uname").toString());
                            int count = myst.executeUpdate();

                            if(count==1)
                            {
                               response.sendRedirect("showcart.jsp");
                            }
                            else 
                            {
                                out.print("Problem while adding to cart, try again!");
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
                    }
                    else
                    {
                        response.sendRedirect("login.jsp");
                    }
                }
             
          %>
         <section class="banner-bottom py-lg-5 py-3">
         <div class="container">
            <div class="inner-sec-shop pt-lg-4 pt-3">
               <div class="row">
                  <div class="col-lg-4 single-right-left ">
                     <div class="grid images_3_of_2">
                        <div class="flexslider1">
                           
                         <div class="thumb-image"> <img src="uploads/<%= pic%>" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-8 single-right-left simpleCart_shelfItem">
                     <h5 style="color:crimson"><b>Product Name</b></h5>
                     <h3><%out.print(pname);%></h3><br/>
                     <h5 style="color:greenyellow"><b>Price</b></h5>
                     <p><span class="item_price"><%out.print(remamt);%></span>
                        <del><%out.print(rate);%></del>
                     </p><br/>
                      <h5 style="color:gold"><b>Rating</b></h5>
                     <div class="rating1">
                        <ul class="stars">
                           <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                        </ul>
                     </div><br/>
                     <h5 style="color:blue"><b>Description:</b></h5>
                     <div class="description">
                     <%out.print(descp);%>
                        </div><br/>
                 
                     <div class="occasion-cart">
                        <div class="toys single-item singlepage"> 
                            <div class="contact-list-grid"> 
                           <form method="post">
                               <h4 style="color:red"><b>Quantity:</b></h4>
                              <div class="form-group contact-forms"> 
                                  <select name="qty" required>
                                      <option value=""> Choose </option>
                                      <%
                                         if(stock>=10)
                                         {
                                             for(int x=1;x<=10;x++)
                                             {
                                                 out.print("<option>" + x +"</option>");
                                             }
                                         }
                                         else
                                         {
                                              for(int x=1;x<=stock;x++)
                                             {
                                                 out.print("<option>" + x +"</option>");
                                             }
                                         }
                                       %>
                                  </select><br/><br/>
                              </div>
                               <button type="submit" class="toys-cart ptoys-cart add" name="s1">
                              Add to Cart
                              </button>
                           </form>
                        </div>
                     </div>
                  </div>
                  </div>
                   </div>
            </div>
         </div>
    </section>
         <%@include file ="footer.jsp"%>
    </body>
</html>
