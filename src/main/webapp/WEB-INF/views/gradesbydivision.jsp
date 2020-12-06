<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>

</head>
<body>
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
	  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>

	  <div class="w3-bar-block">
		<a href="/MVCHomework/" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Go To Home</a> 
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
	
	<br><br>
	<table class="formtable">
	
		<tr>
		<c:forEach var="grade" items="${grades}">
			<td class="label">구분(${grade.division})</td>
		</c:forEach>
		<td>수강 학점의 총 합</td>
		</tr>
		
		<tr>
		<c:set var="sum" value="0"/>
		<c:forEach var="grade" items="${grades}">
			<td class="label"> ${grade.grade}</td>
			<c:set var= "sum" value="${sum +grade.grade}"/>
		</c:forEach>
		<!-- sum of grades -->
			<td class="label"> <c:out value="${sum}"/> </td>
		</tr>
		
	</table>

	<script>
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