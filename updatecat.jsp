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
        <title>Update Category</title>
        <%@include file="extfiles.jsp"%>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function()
    {
        $(".dellink").click(function()
        {
        return confirm('Are you sure you want to continue?');
    });
 });
        </script>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <%
            String catname="",catpic="";
           try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
            try
            {
                String q = "select *from  managecat where catid=?";
                PreparedStatement myst = myconn.prepareStatement(q);
                myst.setString(1, request.getParameter("cid"));
                
                ResultSet myres = myst.executeQuery();
                if(myres.next())
                {
                    catname = myres.getString("catname");
                    catpic = myres.getString("catpic");
                }
                else
                {
                    out.print("No details found");
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
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <h2><span>Update Category</span></h2>
                </div>
                <div class="content-bottom">
                    <form name ="form1" method="post" enctype="multipart/form-data">
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="catname" type="text" placeholder="Category Name" value="<% out.print(catname);%>">
                            </div><br/>
                            <% out.print("<img src = 'uploads/" + catpic + "' height='100'>");%><br/>
                            Choose new image, if required
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="catpic" type="file">
                            </div>
                        </div>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Update">
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
                                        imagename=catpic;
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
                                    String q = "update managecat set catname=?, catpic=? where catid=?";
                                    PreparedStatement myst = myconn.prepareStatement(q);
                                    myst.setString(1, cname);
                                    myst.setString(2, imagename);
                                    myst.setString(3, request.getParameter("cid"));
                                    int myres = myst.executeUpdate();
                                    if(myres>0)
                                    {
                                        response.sendRedirect("managecat.jsp");
                                    }
                                    else
                                    {
                                        out.print("Category not updated successfully");
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
                </div>
            </div>
        </div>
    </section>
    <!-- /login -->
        <%@include file="footer.jsp"%>
    </body>
</html>
