<%-- 
    Document   : processUploadedFile
    Created on : 3 Apr, 2017, 5:37:20 PM
    Author     : MMI
--%>

<%@page import="org.apache.lucene.index.IndexWriter"%>
<%@page import="com.mmi.MMIMain"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index Create Page</title>
    </head>
    <body>
    <%@page import="java.io.File"%>
    <%@page import="java.util.*,org.apache.commons.fileupload.FileItem"%>        
        <%
            
            String token = request.getParameter("path");
            String destination = request.getParameter("location");
            session.setAttribute("destinationpath", destination);
            //Scanner fileIn = new Scanner(new File(token));
            
            MMIMain mmimain = new MMIMain();
         
                BufferedReader br = new BufferedReader(new FileReader(token));

                String line1 = null, line2 = null;
                line1 = br.readLine();
                IndexWriter ir = mmimain.openIndex(destination);
                while (line1 != null)
                {
                    //line2 = br.readLine();
                    line2=line1.trim();
                    mmimain.createIndex(line2, line2, ir);   
                   line1 = br.readLine();
                }  
                
            mmimain.closeIndex();
            
response.sendRedirect("auploadFile.jsp");
     %>
     
    </body>
</html>
