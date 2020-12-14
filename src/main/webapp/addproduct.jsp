<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link href="resources/css/addproduct.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/addproduct.css">
	
	
	
	<%
    		int signedin = 0;
			System.out.println(session.getAttribute("username"));
    		if(session.getAttribute("username") != null) signedin = 1;
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
                              <label><i class="fa fa-envelope fa-2x"></i>Email:</label>
                              <input type="text" name="username" class="form-control">
                          </div>
                            <div class="form-group">
                                <label><i class="fa fa-lock fa-2x"></i>Password:</label>
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
                        <button type="button" class="btn btn-outline-info waves-effect ml-auto" ><a href="index.jsp">Close</a></button>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
    	
        
        
        <form action="addproduct" method="post" >
            <div class="form-row">
                <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Product name</label>
                  <input type="text" name="productname"  class="form-control" required>
                </div>
                <div class="col-md-6 mb-6">
                  <label for="validationDefault02">Min_bid price</label>
                  <input type="number" name="productminprice" class="form-control" id="validationDefault02" required>
                </div>
              </div>
              <div class="form-group">
                <label for="exampleFormControlTextarea1">Product Description</label>
                <textarea class="form-control" name="productdescription" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
              <div class="col-md-6 mb-6">
                  <label for="validationDefault01">Product Color</label>
                  <input type="text" name="productcol"  class="form-control" required>
                </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1">Product Category</label>
                <select class="form-control" name="categoryID" id="exampleFormControlSelect1">
                  <option>bike</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                </select>
              </div>
              <div class="form-group">
                <label for="exampleFormControlSelect1"> Select Bidding time (bidding will be for 5 minutes)</label>
                <input type="time" name="starttime" class="form-control" >
                  
              </div>
              <div class="form-group">
                <label> Select Bidding date</label>
                <input type="text" name="biddingdate" class="form-control" required>    
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