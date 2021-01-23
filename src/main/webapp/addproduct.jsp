<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ page import="java.util.List" %>
    <%@ page import="dao.UserDao" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.Date" %>
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="resources/css/addproduct.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="addproduct.css">
	
	
	
		<%
    		int signedin = 0;
			System.out.println(session.getAttribute("username"));
    		if(session.getAttribute("username") != null) signedin = 1;
    		
    		int alreadyAdded = 0;
    		if (request.getParameter("alreadyPresent") != null)
            {  
                  String n = request.getParameter("alreadyPresent");
                  if(n.equals("yes"))
                  {
                   	alreadyAdded = 1;
                  }
           }
    		
    		int rld=0;
    		if (request.getParameter("rld") != null)
            {  
                  String n = request.getParameter("rld");
                  if(n.equals("yes"))
                  {
                	  rld = 1;
                  }
           }
    		
    	%>
    	
    

        <script>       
             $(document).ready(function(){
          
	             $('#signinbutton').click(function(){
	                $('#signinmodal').modal('show');
	            });
	            
	             var signin=<% out.print(signedin); %>
	             console.log(signin);
	             if(signin==0)
		             {
		                 $('#signinmodal').modal({
		                         backdrop: 'static',
		                         keyboard: false  
		                 });
		                 $('#signinmodal').modal('show');
		             }         
	             });
 
         </script>
	
	
	<script type="text/javascript">

	$(document).ready(function() {
	    $("#addCategoryButton").click(function(){
	    	$('#addCategoryModal').modal('show');
	    	
	    	var saveName = $("#productname").val();
	    	var saveMinPrice = $("#productminprice").val();
	    	var saveDesc = $("#exampleFormControlTextarea1").val();
	    	var saveCol = $("#productcol").val();
	    	var savePicture = $("#productpicture").val();
	    	var saveTime = $("#starttime").val();
	    	var saveDate = $("#biddingdate").val();
	    	
	    	
	    	
	    	
	    	localStorage.setItem("saveName", saveName);
	    	localStorage.setItem("saveMinPrice", saveMinPrice);
			localStorage.setItem("saveDesc", saveDesc);
			localStorage.setItem("saveCol", saveCol);
			localStorage.setItem("savePicture", savePicture);
			localStorage.setItem("saveTime", saveTime);
			localStorage.setItem("saveDate", saveDate);
	    	
	    	
	    }); 
	    
	    
	    var aa=<% out.print(alreadyAdded); %>
	    var rld=<% out.print(rld); %>
	    
	    if(aa == 1)
	    {
	    	alert("Category already present.");
	    	load();
	    }
	    
	    if(rld == 1)
	    {
	    	alert("Reload");
	    	load();
	    }
	    
	    
	});

	
	
  </script>
  
  <script>
		var saveName,saveMinPrice,saveDesc,saveCol,savePicture,saveTime,saveDate;
		
		
		function load(){
		
		saveName = localStorage.getItem("saveName");
		saveMinPrice = localStorage.getItem("saveMinPrice");
		saveDesc = localStorage.getItem("saveDesc");
		saveCol = localStorage.getItem("saveCol");
		savePicture = localStorage.getItem("savePicture");
		saveTime = localStorage.getItem("saveTime");
		saveDate = localStorage.getItem("saveDate");
	
		
		document.getElementById("productname").value = saveName;
		document.getElementById("productminprice").value = saveMinPrice;
		document.getElementById("exampleFormControlTextarea1").value = saveDesc;
		document.getElementById("productcol").value = saveCol;
		document.getElementById("productpicture").value = savePicture;
		document.getElementById("starttime").value = saveTime;
		document.getElementById("biddingdate").value = saveDate;
		};
		
   </script>
  
  
  
		
   <title>Add Product</title>
  </head>
  
    <body>
    
    
    
	<div class="modal fade" id="signinmodal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="text-center text-primary">Login to add a Product</h3>
                    </div>
                    <div class="modal-body">
                        <form action="checklogin">
                            
                            <div class="form-group">
                              <label class="modallabel"><i class="fa fa-envelope fa-2x"></i>Username:</label>
                              <input type="text" name="username" class="form-control">
                          </div>
                            <div class="form-group">
                                <label class="modallabel"><i class="fa fa-lock fa-2x "></i>Password:</label>
                                <input type="password" name="password" class="form-control">
                            </div>
                            <div class="text-center form-sm mt-2">
                            <input type="submit" class="btn btn-info">
                          </div>
                          </form>
                          
                      </div>
                      
                    <div class="modal-footer">
                      <div class="options text-right">
                        <p class="pt-1">New Member? <a href="registration.jsp" class="blue-text">Register</a></p>
                        <a href="index.jsp"><button type="button" class="btn btn-outline-info waves-effect ml-auto" >Close</button></a>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
    	
    	
    	<div class="modal fade" id="addCategoryModal">
    		<div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="text-center text-primary">Create Category</h3>
                    </div>
                    <div class="modal-body">
                        <form action="addCategory">
                            
                            <div class="form-group">
                              <label class="modallabel">Enter New Category Name:</label>
                              <input type="text" name="categoryNameTB" class="form-control" required>
                          </div>
                            <div class="text-center form-sm mt-2">
                            <input type="submit" value="Submit Category" class="btn btn-info" >
                          </div>
                          </form>
                          
                          
                          
                      </div>
                      
                    
                  </div>
                </div>
    	</div>
        
        
        <form action="addproduct" enctype="multipart/form-data" method="post"  >
            <div class="form-row">
                <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Product name</label>
                  <input type="text" name="productname" id="productname" class="form-control" required>
                </div>
                <div class="col-md-6 mb-6">
                  <label for="validationDefault02">Min_bid price</label>
                  <input type="number" name="productminprice" id="productminprice" class="form-control" id="validationDefault02" required>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Product Description</label>
                <textarea class="form-control" name="productdescription" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
            <div class="form-row">
              <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Product Color</label>
                  <input type="text" name="productcol" id="productcol" class="form-control" required>
                </div>
              <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Image</label>
                  <input type="file" name="productpicture" id="productpicture"  class="form-control" required>
                </div>
            </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Product Category</label>
                <%
                	
                	UserDao newUser = new UserDao();
                	List<String> categoryList = newUser.getCategories();
                	
                	%>
                
                	             
                <select class="form-control" name="categoryID" id="exampleFormControlSelect1" onchange="changeFunc(value);">
                  <%for (int i=0;i<categoryList.size();i++){%>
        			<option><%out.print(categoryList.get(i));%></option>
   				 <%}%>
                </select>
                
                <br>
                
                <div><button type="button" class="btn btn-primary" id="addCategoryButton" >Add New Category?</button></div>
                
                
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1"> Select Bidding time (bidding will be for 10 minutes)</label>
                <input type="time" name="starttime" id="starttime" class="form-control" >
                  
              </div>
              <div class="form-group">
                <label> Select Bidding date</label>
                <input type="date" name="biddingdate" id="biddingdate" class="form-control" required>    
              </div>
              
              
              <input type="hidden" name="username" value="<%out.print((String)session.getAttribute("username")); %>">
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
          
          
  
</body>
<!-- Optional JavaScript; choose one of the two! -->
<div style="height:400px"></div>
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>