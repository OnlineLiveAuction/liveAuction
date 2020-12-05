<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <style>
        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
      </style>
      <!-- Custom styles for this template -->
      
    <link href="../resources/css/navbar.css" rel="stylesheet">
    <title>Welcome!</title>
  </head>
  <body>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a class="navbar-brand" href="#"> <i class="fa fa-usd text-center text-white" aria-hidden="true"></i>Online Auction</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
      
        <div class="collapse navbar-collapse" id="navbarsExample03">
          <ul class="navbar-nav  mr-auto">
            
            <li class="nav-item active mr-auto">
              <a class="nav-link" href="#"><i class="fa fa-home" aria-hidden="true"></i>Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active mr-auto">
                <a class="nav-link" href="#"><i class="fa fa-list" aria-hidden="true"></i>Bidding List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active mr-auto">
                <a class="nav-link" href="#"><i class="fa fa-product-hunt" aria-hidden="true"></i>roduct List <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item mr-auto">
                <button class="btn btn-outline-info mr-1 "><i class="fa fa-plus-circle" aria-hidden="true"></i>Add product</button>
                  
                  </li>
          </ul>
                  <ul class="navbar-nav ml-auto">
            <li class="nav-item ml-auto" >
              <button class="btn btn-success  " data-target="#mymodel" data-toggle="modal">login/signup</button>
            </li>
          </ul>
          
            
            <div class="modal fade" id="mymodel">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="text-center text-primary">Login</h3>


                        </div>
                        <div class="modal-body">
                            <form>
                                
                                <div class="form-group">
                                  <label><i class="fa fa-envelope fa-2x"></i>Email:</label>
                                  <input type="text" name="username" class="form-control">

                              </div>
                                <div class="form-group">
                                    <label><i class="fa fa-lock fa-2x"></i>Password:</label>
                                    <input type="password" name="username" class="form-control">

                                </div>
                                
                              </form>
                              <div class="text-center form-sm mt-2">
                                <button class="btn btn-info">Sign in <i class="fa fa-sign-in ml-1"></i></button>
                              </div>
                          </div>
                          <!--
                        <div class="modal-footer justify-content-center">
                            <button class="btn btn-danger " data-dismiss="modal">Signup</button>
                        </div>
                      -->
                        <div class="modal-footer">
                          <div class="options text-right">
                            <p class="pt-1">New Member? <a href="#" class="blue-text">Register</a></p>
                          </div>
                          <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>

                </div>
              
            </div>
          
            <!---
            <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
              <div class="dropdown-menu" aria-labelledby="dropdown03">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
            
        --> 
        
    </li>
    </ul>
          </ul>
          <!--
          <form class="form-inline my-2 my-md-0">
            
            <input class="form-control" type="text" placeholder="Search">
            
          </form>-->
        </div>
      </nav>
      <div class="container">
        <div class="md-form mt-0">
          <input class="form-control" type="text"placeholder="Search" aria-label="Search">
        </div>
      </div>
      <div class="product-info">
        <div class="container">
            <div class="row">
              <div class="col-12">
                  <table class="table table-image table-dark table-striped">
                    <thead>
                      <tr>
                        <th scope="col">category</th>
                        <th scope="col">Image</th>
                        <th scope="col">description</th>
                        <th scope="col">item_name</th>
                        <th scope="col">bid-Price(Rs)</th>
                        <th scope="col">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">bike</th>
                        <td class="w-25">
                            <img src="../resources/image/bike.jpg" class="img-fluid img-thumbnail" alt="item_type">
                        </td>
                        <td>You can try the following code to set src to the img tag in HTML from the system drive.<button type="button" class="btn btn-link">Read more..</button></td>
                        <td>bike</td>
                        <td>78000</td>
                        <td> <button class="btn btn-primary " >Register</button></td>
                      </tr>
                      <tr>
                        <th scope="row">car</th>
                        <td class="w-25">
                            <img src="image/car.jpg" class="img-fluid img-thumbnail" alt="Sheep">
                        </td>
                        <td>Bootstrap Grid can be useful<button type="button" class="btn btn-link">Read more..</button></td>
                        <td>Cristina</td>
                        <td>1.434</td>
                        <td><button class="btn btn-success " >Participate</button></td>
                      </tr>
                      <tr>
                        <th scope="row">speaker</th>
                        <td class="w-25">
                            <img src="..image/speaker.jpg" class="img-fluid img-thumbnail" alt="item_type">
                        </td>
                        <td>You can try the following code to set src to the img tag in HTML from the system drive.</td>
                        <td>bike</td>
                        <td>78000</td>
                        <td> <button class="btn btn-primary " >Register</button></td>
                      </tr>
                    </tbody>
                  </table>   
              </div>
            </div>
          </div></div>

  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

  
 </body>
</html>
 