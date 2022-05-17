<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Your Notes</title>

<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@ include file="navbar.jsp"%>
	</div>

	<div class="container" style="padding: 40px;">
		<!-- This is Add form  -->
		<form action=SaveNoteServlet method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label>
				<input type="text"
				name=title
				class="form-control"
				id="title"
				placeholder="Enter Title of your note"
				required />
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea id="content"
				name="content"
				placeholder="Enter your content here"
				class="form-control"
				required
				style="height: 300px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>