<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="it.generationitaly.cinestars.entity.Artista"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<%
Artista artista = (Artista) request.getAttribute("artista");
List<Pellicola> pellicole = (List<Pellicola>) request.getAttribute("pellicole");
%>
<meta charset="ISO-8859-1">
<title><%=artista.getNome()%> <%=artista.getCognome()%></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body
	style="background: linear-gradient(0deg, rgba(83, 45, 185, 1) 0%, rgba(38, 44, 106, 1) 57%); color: rgba(205, 206, 215, 255)">
	<header>
		<%@ include file="navbar.jsp"%>
	</header>

	<main>
		<div class="container" style="margin-top: 3rem;">
			<div class="row g-0">
				<div class="col-md-4">
					<img height="540px" width="380px"
						src="<%=artista.getFotoGrande()%>" style="border-radius: 5%">
				</div>
				<div class="col-md-8" style="border: 5px solid transparent;">
					<div class="card-body">
						<h2 class="card-title" style="margin-left: 20px;"><%=artista.getNome()%>
							<%=artista.getCognome()%></h2>
						<p class="card-text"
							style="width: 700px; margin-left: 20px; margin-top: 25px;"><%=artista.getBiografia()%></p>
						<table
							style="margin-left: 10px; margin-top: 30px; width: 700px; text-align: center">
							<thead>
								<tr>
									<th>Ruolo</th>
									<th>Data di nascita</th>
									<th>Nazione</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=artista.getMansione()%></td>
									<td><%=artista.getDataNascita()%></td>
									<td><%=artista.getNazione()%></td>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row" style="background: rgb(131, 58, 180); background: linear-gradient(90deg, rgba(131, 58, 180, 0) 0%, rgba(0, 0, 0, 0.35066526610644255) 50%, rgba(0, 0, 0, 0) 100%);">
						<h2>Conosciuto Per</h2>
					<%
					for (Pellicola pellicola : pellicole) {
					%>
					<div class="col-lg-2">
					<div class="card"
						style="border: 5px solid transparent; background-color: transparent">
						<center>
						<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
							src="<%=pellicola.getFotoLocandina()%>" class="card-img-top"
							style="width: 10rem; height: 15rem; border-radius: 5%" alt="...">
						</a>
						</center>
						<div class="card-body">
							<center>
								<h5 class="card-title"><%=pellicola.getNome()%></h5>
							</center>
						</div>
						</div>
					</div>
					<%
					}
					%>
			</div>
		</div>

	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>

<%@ include file="footer.jsp"%>

</html>