<%-- 
    Document   : auploadFile.jsp
    Created on : 3 Apr, 2017, 5:27:17 PM
    Author     : MMI
--%>

<%@page import="java.util.List"%>
<%@page import="com.mmi.MMIMain"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>File Upload Example using Apache commons File Upload Utility </title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/style.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  
  <script>
      
function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Hide download link
    downloadLink.style.display = "none";

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}

function exportTableToCSV(filename) {
    var csv = [];
	var rows = document.querySelectorAll("table tr");
	
    for (var i = 0; i < rows.length; i++) {
		var row = [], cols = rows[i].querySelectorAll("td, th");
		
        for (var j = 0; j < cols.length; j++) 
            row.push(cols[j].innerText);
        
		csv.push(row.join(","));		
	}

    // Download CSV file
    downloadCSV(csv.join("\n"), filename);
}

 

</script>

  </head>
  <body>
      
      <%--<form action="processUploadedFile.jsp" method="post">
        <input type="text" name ="path" id="path" placeholder="enter the path of file">
        <input type="file" name="fileName" id="myFile" onchange="myFunction()"><br>
        <input type="submit" value="Upload">
    </form>--%>
        
  <div class="container">
      <h2>Search Data</h2>
      
  <ul class="nav nav-tabs">
    <li><a data-toggle="tab" href="#menu1">Create Index</a></li>
    <li><a data-toggle="tab" href="#menu2">Search String/Word</a></li>
  </ul>

  <div class="tab-content">
      
    <div id="menu1" class="tab-pane fade">
        
        <div class="container">
            
            <h3>Create Index(Enter File Path)</h3><br>
            
                <form action="processUploadedFile.jsp" method="POST">
                    
                    <div class="col-sm-4">
                        <input type="text"  name="path" id="path"  class="form-control"  placeholder="Enter the File location">
                    </div>
                    
                    <div class="col-sm-4">
                        <input type="text"  name="location" id="loaction"  class="form-control"  placeholder="Enter path loaction to Create Index">
                    </div>
                    
                    <div class="col-sm-2">
                        <button type="submit" name="submit" class="btn btn-primary btn-block">Submit</button>
                    </div><br><br><br>
          
          <%--<input type="text" name ="path" id="path" placeholder="enter the path of file">
<input type="submit" value="Upload">--%>
          
                </form>
        </div>
    </div>
    <div id="menu2" class="tab-pane fade">
        <div class="container">
       <h3>Search String/Word</h3><br>
            
                <form action="" method="POST">
                    
                    <div class="col-sm-4">
                        <input type="text"  name="searchtext" id="searchtext"  class="form-control"  placeholder="Enter String to be searched">
                    </div>
                    <div class="col-sm-4">
                        <input type="text"  name="srcpath" id="srcpath"  class="form-control"  placeholder="loactoion of indexCreated" value="<%=session.getAttribute("destinationpath")%>" readonly>
                    </div>
                    
                    <div class="col-sm-2">
                        <button type="search" name="search" class="btn btn-primary btn-block">Search</button>
                    </div><br><br><br>
          
          <%--<input type="text" name ="path" id="path" placeholder="enter the path of file">
<input type="submit" value="Upload">--%>
          
                </form>
          
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
} %></tbody></table><br>
<button type="submit" onclick="exportTableToCSV('result.csv')" name="CSV" class="btn btn-warning col-sm-2" style="margin-top: 20px; margin-bottom: 20px;">Export to CSV</button>
<button type="submit" onClick ="" name="PDF" class="btn btn-danger col-sm-2" style="margin-top: 20px; margin-bottom: 20px; margin-left: 20px;">Export to PDF</button></div></div>
    </div>
    </div>
  </div>
</div>
  </body>
</html>
