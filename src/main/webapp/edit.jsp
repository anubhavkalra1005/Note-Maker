<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit your Note</title>

<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@ include file="navbar.jsp"%>
	</div>

	<%
		int note_id = Integer.parseInt(request.getParameter("note_id").trim());

		Session s = FactoryProvider.getFactory().openSession();
		Note note = (Note) s.get(Note.class, note_id);
	%>

	<div class="container" style="padding: 40px;">
		<!-- This is Add form  -->
		<form action=UpdateServlet method="post">
		<input type="hidden" name="note_id" value="<%= note.getId() %>" >
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" value="<%=note.getTitle()%>" name=title
					class="form-control" id="title"
					placeholder="Enter Title of your note"
					required />
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea id="content" name="content"
					placeholder="Enter your content here" class="form-control" required
					style="height: 300px;"><%=note.getContent()%></textarea>
			</div>
			<div class="container text-center">
				<a href="all_notes.jsp"><button type="button" class="btn btn-primary">Back</button></a>
				<button type="submit" class="btn btn-success">Edit</button>
			</div>
		</form>
	</div>
</body>
</html>