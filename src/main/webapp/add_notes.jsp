<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add-Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h2>Welcome to Add Notes Page</h2>
		<br>
		
		<!-- This is add form  -->
		<form action ="SaveNotes" method = "post">
			<div class="mb-3">
				<label for="Title" class="form-label">Note-Title</label> 
				<input required 
				name ="title"
				type="text" 
				class="form-control"
				id="Title" 
				aria-describedby="emailHelp" 
				placeholder ="Enter Note-Title here" />
				
			</div>
			<div class="mb-3">
				<label for="Content" class="form-label">Note-Content</label>
				<textarea required 
				name ="Content"
				id="Content" 
				class = "form-control" 
				style ="height:250px;"
				placeholder ="Enter Note-Content here">
				</textarea>
			</div>
			<div class ="container text-center">
			
			<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
</body>
</html>