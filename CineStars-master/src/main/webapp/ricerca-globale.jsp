<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="it.generationitaly.cinestars.entity.Artista"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="it.generationitaly.cinestars.entity.Genere"%>

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
<!-- <link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<%@ include file="navbar.jsp"%>
	</header>
	<!-- 	<div class="form-floating m-auto" style="width:300px; height:85px"> -->
	<!-- 		<form class="d-flex" role="search" action="artisti-by-nome" -->
	<!-- 			method="get"> -->
	<!-- 			<input name="ricerca" class="form-control me-2" type="search" -->
	<!-- 				placeholder="Cerca Attori" aria-label="Search"> -->
	<!-- 			<button class="btn btn-outline-success" type="submit">Cerca</button> -->
	<!-- 		</form> -->
	<!-- 	</div> -->
	<%
	List<Pellicola> filmByAnno = (List<Pellicola>) request.getAttribute("filmByAnno");
	List<Artista> artisti = (List<Artista>) request.getAttribute("artisti");
	List<Pellicola> pellicole = (List<Pellicola>) request.getAttribute("pellicole");
	String nomeRicerca = (String) request.getAttribute("nomeRicerca");
	String filtro = (String) request.getAttribute("filtro");
	int numeroArtisti = (int) request.getAttribute("numeroArtisti");
	int numeroFilm = (int) request.getAttribute("numeroFilm");
	int numeroSerie = (int) request.getAttribute("numeroSerie");
	String genere = (String) request.getAttribute("genere");
	%>
	<div class="container px-4 text-center">
      <div class="row gx-5">
        <div class="col">
	         <div class="p-3">
				<div class="card card-topic" style="width: 18rem;">
					  <div class="card-header bg-primary">
					    Filtra per
					  </div>
					 <div class="list-group">
                        <a href="ricerca-globale?filtro=film&nomeRicerca=<%=nomeRicerca%>" class="list-group-item list-group-item-action">Film<span class="badge bg-primary rounded-pill"><%=numeroFilm %></span></a>
                        <a href="ricerca-globale?filtro=serieTv&nomeRicerca=<%=nomeRicerca%>" class="list-group-item list-group-item-action">Serie-Tv <span class="badge bg-primary rounded-pill"><%=numeroSerie%></span></a>
					 	<a href="ricerca-globale?filtro=persone&nomeRicerca=<%=nomeRicerca%>" class="list-group-item list-group-item-action">Persone <span class="badge bg-primary rounded-pill"><%=numeroArtisti%></span></a>
					 	<form action="ricerca-globale">
					 	<div class="list-group-item">Anno di Uscita 
					 	<div class="input-group mb-3">
					 	  <span class="input-group-text">Da</span>
						  <input type="text" class="form-control" name="anno1">
						  <span class="input-group-text">a</span>
						  <input type="text" class="form-control" name="anno2">
						  <input type="hidden" class="form-control" value="film" name="filtro">
						  <input type="hidden" class="form-control" value="<%=nomeRicerca %>" name="nomeRicerca">
						  <button class="btn btn-outline-primary" type="submit">Vai</button>
						</div>
						</div>
		               </div>
		               </form>
					</div>
	         </div>
        </div>
       <div class="col-6">
         <div class="p-3">
			<%
			if (artisti!=null && !artisti.isEmpty() ) {
			%>
			<h1 style="margin-left: 10px">Artisti</h1>
			<%
			for (Artista artista : artisti) {
			%>
			<div class=" card mb-3 mx-auto shadow-lg rounded"
				style="max-width: 540px ;background-color: rgba(255, 255, 255, 0);">
				<div class="row g-0">
					<div class="col-md-4">
						<a href="info-artista?id=<%= artista.getId()%>">
							<img src="<%=artista.getFotoGrande()%>" class="img-fluid rounded-start" alt="artista"></a>
					</div>
					<div class="col-md-8">
						<div class="card-body" 
							>
							<h5 class="card-title"><%=artista.getNome() + " " + artista.getCognome()%></h5>
							<p class="card-text">
								<small class="text-muted"><%=artista.getMansione()%></small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} 
			if (pellicole!=null && !pellicole.isEmpty()) {
			%>
			<h1 style="margin-left: 10px">Titoli</h1>
			<%
			for (Pellicola pellicola : pellicole) {
			%>
			<div class="card mb-3 mx-auto shadow-lg bg-white rounded"
				style="max-width: 540px;">
				<div class="row g-0">
					<div class="col-md-4">
						<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
							src="<%=pellicola.getFotoLocandina()%>"
							class="img-fluid rounded-start" alt="artista">
						</a>
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title"><%=pellicola.getNome() + " (" + pellicola.getAnno() + ") "%></h5>
							<p class="card-text">
								<small class="text-muted"><%=pellicola.getDistribuzione()%></small>
							</p>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} 
			if (filmByAnno!=null && !filmByAnno.isEmpty()) {
				%>
				<h1 style="margin-left: 10px">Titoli</h1>
				<%
				for (Pellicola pellicola : filmByAnno) {
				%>
				<div class="card mb-3 mx-auto shadow-lg bg-white rounded"
					style="max-width: 540px;">
					<div class="row g-0">
						<div class="col-md-4">
							<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
								src="<%=pellicola.getFotoLocandina()%>"
								class="img-fluid rounded-start" alt="artista">
							</a>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=pellicola.getNome() + " (" + pellicola.getAnno() + ") "%></h5>
								<p class="card-text">
									<small class="text-muted"><%=pellicola.getDistribuzione()%></small>
								</p>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				} 
			%>
         </div>
       </div>
       <div class="col">
         <div class="p-3">
         
         </div>
       </div>
      </div>
    </div>
    <%@ include file="footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>