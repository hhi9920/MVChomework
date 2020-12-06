<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Login</title>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<style>
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
.header {
  padding: 30px;
  text-align: center;
  background: #1abc9c;
  color: white;
}

</style>
</head>

<body onload='document.f.username.focus();'>
		<!-- Sidebar/menu -->
		<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
		  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
		  <div class="w3-container">
			<h3 class="w3-padding-64"><b>Web Framework<br>Homework#2</b></h3>
		  </div>
		  <div class="w3-bar-block">
			<a href="/MVCHomework/" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Home</a> 
    		<a href="${pageContext.request.contextPath}/grades" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">View all grades</a> 
   			<a href="${pageContext.request.contextPath}/gradesbysemester" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Grades by semester</a> 
			<a href="${pageContext.request.contextPath}/gradesbydivision" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Grades by division</a> 
			<a href="${pageContext.request.contextPath}/createClass" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Create class</a> 
		   <c:if test="${pageContext.request.userPrincipal.name != null}">
			<a href="javascript:document.getElementById('logout').submit()" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Logout</a>
		   </c:if>
		  </div>
		
		<form id="logout" action="<c:url value="/logout" />" method="post">
		   <input type="hidden" name="${_csrf.parameterName}"
			   value="${_csrf.token}" />
		</form>
		
		</nav>
<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-green w3-xlarge w3-padding">
		<a href="javascript:void(0)" class="w3-button w3-green w3-margin-right" onclick="w3_open()">+</a>
		<span>Web Framework Homework#2</span>
	  </header>
	  
	  <!-- Overlay effect when opening sidebar on small screens -->
	  <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
	  
	  <!-- !PAGE CONTENT! -->
	  <div class="w3-main" style="margin-left:340px;margin-right:40px">
<br>
<br>
<br>
<br>
<h2>Login Form</h2>
<p>Please press the login button.</p>
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>

<div id="id01" class="modal">
  
	<form name='f' action="<c:url value="/login"/>" method='POST' class="modal-content animate" action="/action_page.php" >
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	</div>
	
	<c:if test="${not empty logoutMsg}">
			<div style="color: #0000ff"> <h3>${logoutMsg}</h3> </div>
	</c:if>
		
	<c:if test="${not empty errorMsg}">
			<div style="color: #ff0000"> <h3>${errorMsg}</h3>
			</div>
	</c:if>

    <div class="container">
      <label for="uname"><b>Id</b></label>
      <input type="text" placeholder="Enter Username" name="username" value='' required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
        
      <button type="submit" value="Login">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
	  </label>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw">Forgot <a href="#">password?</a></span>
    </div>
  </form>
</div>
<!-- W3.CSS Container -->

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}

</script>

</body>
</html>