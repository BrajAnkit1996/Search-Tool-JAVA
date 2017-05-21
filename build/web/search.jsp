<%-- 
    Document   : search
    Created on : 4 Apr, 2017, 5:34:22 PM
    Author     : MMI
--%>

<%@page import="java.util.List"%>
<%@page import="com.mmi.MMIMain"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/style.js"></script>
         <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
    	<div class="row">
			<div class="col-md-10">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">SEARCH RESULTS</h3>
						<div class="pull-right">
							<span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
								<i class="glyphicon glyphicon-filter"></i>
							</span>
						</div>
					</div>
					<div class="panel-body">
						<input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
					</div>
        <table class="table table-hover" id="dev-table">
						<thead>
							<tr>
								<th>#</th>
								<th>Result :-</th>
							</tr>
						</thead>
						<tbody>
        <%
            
           String str = request.getParameter("searchtext");
           String dest = request.getParameter("srcpath");
           
            MMIMain mmimain = new MMIMain();

            try {
                int filesize = mmimain.searchIndex(str.toLowerCase(), 258, dest).size();
                    List list= mmimain.searchIndex(str.toLowerCase(), 258, dest);
                    //out.println(list.get(0));
                    //System.out.println("Size :" + mmimain.searchIndex("vishwajit pathak", 10, indexDir).size());
                    
                    
                    for(int i = 0; i<filesize-1; i++)
                    { %>
                        <!--out.println(list.get(i)+"<br>");-->
                        
                        <tr>
                            <td><%=i%></td>
                            <td><%=list.get(i)%></td>
                        </tr>
                   <% }

                } catch (Exception e) {
            System.out.println("Search Exception :" + e);
} %></tbody></table></div></div>
     
    </body>
</html>
