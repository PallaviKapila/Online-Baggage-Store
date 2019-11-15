
<%-- 
    Document   : login
    Created on : 20 Jun, 2019, 10:54:07 AM
    Author     : Pallavi
--%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="dbvars.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Category</title>
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
        $(".dellink").click(function(e){
        e.preventDefault();
        var cid=$(this).attr("id");
        var pr1=$(this).parent();//td
        var pr = $(this).parent().parent();//tr
        if(confirm("Are u sure you want to delete"))
        {
        $.ajax({
        type: 'post',
        url: 'delcat.jsp',
        data: {"catid":cid},
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
        <%@include file="adminheader.jsp"%>
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <h2><span>Manage Category</span></h2>
                </div>
                <div class="content-bottom">
                    <form name ="form1" method="post" enctype="multipart/form-data">
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="catname" type="text" placeholder="Category Name" required>
                            </div>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="catpic" type="file">
                            </div>
                        </div>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Add">
                        </div>
                        
                        <%
                          String cname="", imagename="",path="";
                          boolean successful=true;
                          boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                          
                          if(isMultipart)
                        {
   
                            FileItemFactory factory = new DiskFileItemFactory();
                            ServletFileUpload upload = new ServletFileUpload(factory);
                            List<FileItem> items = null;

                            try
                            {
                                 items = upload.parseRequest(request);
                            }
                            catch (FileUploadException e)
                            {
                                e.printStackTrace();
                            }
                            
                            for(FileItem myitem:items)
                            {
                                 if (myitem.isFormField())
                                 {
                                    String itemName1 = myitem.getFieldName();//
                                    String value=myitem.getString();//

                                    if(itemName1.equals("catname")) //control's name - textbox name
                                    {
                                        cname=value;//
                                    }
                                 }
                                 else
                                 {
                                    String type=myitem.getContentType();
                                    long size=myitem.getSize()/1024; //kbytes
                                    
                                    if(size==0)
                                    {
                                        imagename="noimage.png";
                                    }
                                    else if((type.equals("image/pjpeg") || type.equals("image/jpeg")
                                               || type.equals("image/png") || type.equals("image/x-png")
                                               || type.equals("image/gif")))
                                    {
                                                imagename=new java.util.Date().getTime()+myitem.getName();
                                                path=getServletContext().getRealPath("/") + "uploads\\" + imagename;

                                                File savefile=new File(path);
                                                myitem.write(savefile);    
                                    }
                                    else
                                    {
                                        successful=false;
                                        out.println("Only pictures are allowed");
                                    }    
                                 } 
   
                           }
                           if(successful==true)
                          {
                            try
                            {
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                                try
                                {
                                    String q = "insert into managecat (catname,catpic) values(?,?)";
                                    PreparedStatement myst = myconn.prepareStatement(q);
                                    myst.setString(1, cname);
                                    myst.setString(2, imagename);
                                    int myres = myst.executeUpdate();
                                    if(myres>0)
                                    {
                                        out.print("Category added successfully");
                                    }
                                    else
                                    {
                                        out.print("Category not added successfully");
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
                       }
                    }  
                    
                    %> 
                    </form>
                    <h4 align="center">Already Added Categories</h4><br/>
                    <%
                         try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String unm = request.getParameter("uname");
                        
                           String q = "select * from managecat";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                          
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               out.print("<table class = 'table table-hover'>"
                               + "<tr>"
                               + "<th>Pitcure</th>"
                               + "<th>Name</th>"
                               + "<th>Update</th><th>Delete</th></tr>");
                               do
                               {
                                   out.print("<tr>"
                                   + "<td><img src='uploads/" + myres.getString("catpic") + "' height='75'</td>"
                                   + "<td>" + myres.getString("catname") + "</td>"
                                   + "<td><a href='updatecat.jsp?cid=" + myres.getString("catid") + "' >Update</a></td>"
                                   + "<td><a class='dellink' href='' id=" + myres.getString("catid") + "' >Delete</a></td></tr>");
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
                </div>
            </div>
        </div>
    </section>
    <!-- /login -->
        <%@include file="footer.jsp"%>
    </body>
</html>
