<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Note Taker :All notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>All notes :</h2>
		<div class="row">
		<!-- 12 grid -->
		<div class="col-12">
		<%
		Session s = FactoryProvider.getFactory().openSession();	
		Query q = s.createQuery("from Note");
		List<Note> list =q.list();
		for(Note note : list){
			
		%>	
		<div class="card mt-3 " >
		  <img src="image/notebook.png" style="max-width: 50px;"class="card-img-top m-4" alt="...">
		  <div class="card-body">
		    <h5 class="card-title"> <%= note.getTitle() %></h5>
		    <p class="card-text"><%= note.getContent() %>  </p>
		    <p ><b class="text-primary"><%= note.getNewDate()  %></b></p>
		    
		    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
		    <a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary"> Edit</a>
		  </div>
		</div>
		<%
		
			//out.println(" Title : " + note.getTitle() + " Content : " + note.getContent()+" <br> ");
		}
		
		
		%>
		
		</div>
		
		
		
		</div>
		
		<br>
	</div>
</body>
</html>