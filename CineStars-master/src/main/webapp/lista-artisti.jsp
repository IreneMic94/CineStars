<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="it.generationitaly.cinestars.entity.Artista"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Attori</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-fluid">
				<img
					src="https://media.tenor.com/JewZ29ammecAAAAM/purple-and-brown-chewing-gum.gif"
					alt="Logo" width="30" height="24"
					class="d-inline-block align-text-top">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
					aria-controls="navbarNavAltMarkup" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<a class="nav-link active" aria-current="page" href="home.jsp">Home</a>

						<div>
							<a class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">Generi</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="search-film?genere=Drammatico">Drammatico</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Avventura">Avventura</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Azione">Azione</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Comico">Comico</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Commedia">Commedia</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Fantascienza">Fantascienza</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item"
									href="search-film?genere=Thriller">Thriller</a></li>
							</ul>
						</div>
						<div>
							<form class="d-flex" role="search" action="search-film">
								<input name="nome" class="form-control me-2" type="search"
									placeholder="Cerca Film" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">Cerca</button>
							</form>
						</div>

						<a class="nav-link disabled"> <% out.println(session.getAttribute("utenteUsername"));%>
						</a>
					</div>
				</div>
				<form action="logout" method="post">
					<button type="submit">Logout</button>
				</form>
			</div>
		</nav>
	</header>
	<div>
		<form class="d-flex" role="search" action="artisti-by-nome"
			method="get">
			<input name="ricerca" class="form-control me-2" type="search"
				placeholder="Cerca Attori" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Cerca</button>
		</form>
	</div>
	<%
	List<Artista> artisti = (List<Artista>) request.getAttribute("artisti");
	%>
	<%
	if (!artisti.isEmpty()) {
	%>
	<%
	for (Artista artista : artisti) {
	%>
	<div class="card mb-3, mx-auto" style="max-width: 540px;">
		<div class="row g-0">
			<div class="col-md-4">
				<a href="info-artista?id=<%= artista.getId()%>">
					<img src="<%=artista.getFotoMedia()%>" class="img-fluid rounded-start"
					alt="artista">
				</a>
			</div>
			<div class="col-md-8">
				<div class="card-body">
					<h5 class="card-title"><%=artista.getNome() + " " + artista.getCognome()%></h5>
					<p class="card-text"><%=artista.getBiografia()%></p>
					<p class="card-text">
						<small class="text-muted"><%=artista.getMansione()%></small>
					</p>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<%
	} else {
	%>
	<p>Nessun artista trovato</p>
	<%
	}
	%>
	
	<%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>