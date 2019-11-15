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
        <title>Update Sub-Category</title>
        <%@include file="extfiles.jsp"%>
    </head>
    <body>
        <%@include file="adminheader.jsp"%>
        <%
            String cati="",subcname="",subcpic="";
               try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String uname = request.getParameter("un");
                           String q = "select * from managesubcat where subcatid=?";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                           myst.setString(1, request.getParameter("scid"));
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               cati = myres.getString("catid");
                               subcname = myres.getString("subcatname");
                               subcpic = myres.getString("subcatpic");
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
        <!--/login -->
    <section class="banner-bottom py-5">
        <div class="container">
            <div class="content-grid">
                <div class="text-center icon">
                    <h2><span>Update Sub-Category</span></h2>
                </div>
                <div class="content-bottom">
                    <form name ="form1" method="post" enctype="multipart/form-data">
                        <div class="field-group">
                            <div class="content-input-field">
                                <select name="cat" id="cat" class="container" class="content-grid" class="content-bottom" required>
                                    <option value ="">Choose Category</option>
                                    <%
                                        try
                           {
                           Class.forName("com.mysql.jdbc.Driver");
                           Connection myconn = DriverManager.getConnection(dburl,dbuname,dbpass);
                           try
                           {
                           String q = "select * from managecat";
                           
                           PreparedStatement myst = myconn.prepareStatement(q);
                          
                           ResultSet myres = myst.executeQuery();
                           
                           if(myres.next()==true)
                           {
                               do
                               {
                                   if(myres.getString("catid").equals(cati))
                                   {
                                       out.print("<option selected value='" + myres.getString("catid") + "'>" + myres.getString("catname") + "</option>");
                                   }
                                   else
                                   {
                                       out.print("<option value='" + myres.getString("catid") + "'>" + myres.getString("catname") + "</option>");
                                   }
                                   
                               }
                               while(myres.next()==true);
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
                                </select>
                            </div>
                        </div><br/>
                         <div class="field-group">

                            <div class="content-input-field">
                                <input name="scatname" value="<%out.print(subcname);%>" type="text" placeholder="Sub-Category Name" required>
                            </div>
                        <%out.print("<img src = 'uploads/"+ subcpic + "'height='75'>");%><br/>
                        Choose new image , if required<br/>
                        </div>
                        <div class="field-group">
                            <div class="content-input-field">
                                <input name="subcatpic" type="file">
                            </div>
                        </div>
                        
                        <div class="content-input-field">
                            <input type="submit" name="s1" value="Update">
                        </div>
                        
                        <%
                          String scname="",cid="", imagename="",path="";
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

                                    if(itemName1.equals("cat")) //control's name - textbox name
                                    {
                                        cid=value;//
                                    }
                                    else if(itemName1.equals("scatname")) //control's name - textbox name
                                    {
                                        scname=value;//
                                    }
                                 }
                                 else
                                 {
                                    String type=myitem.getContentType();
                                    long size=myitem.getSize()/1024; //kbytes
                                    
                                    if(size==0)
                                    {
                                        imagename=subcpic;
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
                                    String q = "update managesubcat set catid=? , subcatname = ? , subcatpic = ? where subcatid = ? ";
                                    PreparedStatement myst = myconn.prepareStatement(q);
                                    myst.setString(1, cid);
                                    myst.setString(2, scname);
                                    myst.setString(3, imagename);
                                    myst.setString(4, request.getParameter("scid"));
                                    int myres = myst.executeUpdate();
                                    if(myres>0)
                                    {
                                        response.sendRedirect("managesubcat.jsp");
                                    }
                                    else
                                    {
                                        out.print("Sub-Category not updated successfully");
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
