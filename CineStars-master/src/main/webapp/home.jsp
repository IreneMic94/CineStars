<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="it.generationitaly.cinestars.entity.Artista"%>
<%@ page import="it.generationitaly.cinestars.entity.Filmografia"%>
<%@ page import="it.generationitaly.cinestars.entity.Genere"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="it.generationitaly.cinestars.entity.Recensione"%>
<%@ page import="it.generationitaly.cinestars.entity.Utente"%>
<%@ page import="java.util.List"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<style type="text/css">
.module {
      padding-top: 1rem;
      padding-left: 3rem;      
      background: rgb(131,58,180);
      background: linear-gradient(90deg, rgba(131,58,180,0) 0%, rgba(0,0,0,0.35066526610644255) 50%, rgba(0,0,0,0) 100%);
      
    }
        
      section.inner_content div.column_content.flex.scroller.loaded {
         min-height: 0;
        height: auto;
    }
    
    section.inner_content.video div.column_content.flex.scroller {
        min-height: 295px;
    }
    
    section.inner_content div.column_content.flex.scroller {
        width: 100%;
        max-width: var(--maxPrimaryPageWidth);
        min-height: 355px;
        overflow-x: scroll;
        overflow-y: hidden;
        transition: height .5s linear;
    }
    
    div.column_wrapper div.column_content {
        padding-top: 20px;
    }
    
    div.scroller {
        -webkit-overflow-scrolling: touch;
        overflow-y: hidden;
        overflow-x: scroll;
        white-space: nowrap;
        padding-bottom: 10px;
    }
     
    html {
        --scrollerGrey: 219,219,219;
     }

    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar {
        height: 8px;
        width: 8px;
    }
    div.scroller::-webkit-scrollbar {
        height: 8px;
        width: 8px;
    }
    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar-thumb {
        background-color: rgba(var(--scrollerGrey), 1);
        border-radius: 20px;
    }
    div.scroller::-webkit-scrollbar-thumb {
        background-color: rgba(var(--scrollerGrey), 1);
        border-radius: 20px;
    }
    section.inner_content div.column_content.flex.scroller::-webkit-scrollbar-track {
        background: transparent;
    }
    div.scroller::-webkit-scrollbar-track {
        background: transparent;
        }
        
      /* START CAROUSEL */

    .carousel-background {
     padding: 1rem;
     position: relative;
     margin-top: 3rem;
     background: rgb(34, 139, 195);
     background: linear-gradient(0deg, rgba(34, 139, 195, 1) 0%,
      rgba(158, 45, 253, 0.8309698879551821) 100%);
     padding: 3px;
    }    
    
    .carousel-item {
     height: 32rem;
     background: #777;
     position: relative;
     background-position: center;
     background-size: cover;
    }
      
      .carousel-caption {
     background: rgb(131, 58, 180);
     background: linear-gradient(90deg, rgba(131, 58, 180, 0) 0%,
      rgba(0, 0, 0, 0.35066526610644255) 50%, rgba(0, 0, 0, 0) 100%);
    }
    
/*   END CAROUSEL  */
    
      .card-style {
      max-width: 10rem;
       display: inline-block;
       margin-right: 3rem;
       background: transparent;
    border: transparent;
    color: white;
    }
    
    .div-text {
       font-size:19px;
      text-overflow: ellipsis;
      white-space: nowrap;
        overflow: hidden;
    }
    
    .tile {
      
      height: 20rem;
      margin: 0 auto;
      position: relative;
      cursor: pointer;
    }
    
    .image {
      position: absolute;
      width: 100%;
      height: 100%;
      background-image: url('https://i.ibb.co/rxVVSy3/Progetto-senza-titolo.png');
      background-size: cover;
    }
    
    .overlay {
      position: absolute;
      width: 100%;
      height: 100%;
      display: flex;
      flex-direction: column;
      backdrop-filter: blur(6px);
       clip-path: polygon(0 calc(100% - 60px),100% calc(100% - 60px),100% 100%,0% 100%);
      transition: all 0.5s;
    }
    
    .tile:hover .overlay {
      clip-path: polygon(0 0,100% 0,100% 100%,0% 100%); 
    }
    
    .hidden-text {
      border: solid transparent 15px;
      flex: 1 0 auto;
      display: flex;
      align-items: center;
      margin: 0 auto;
      color: white;
    }
    
    .visible-text {
      flex: 0 0 100px;
      width: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      text-transform: uppercase;
      font-size: 2rem;
      color: white;
    }
</style>

<script>
 		function alreadyLogged(){
 			alert("Non puoi registrarti se sei già loggato. Effettua il logout se vuoi creare un altro account.");
 		}
</script>
</head>
<body
	style="background: rgb(83, 45, 185); background: linear-gradient(0deg, rgba(83, 45, 185, 1) 0%, rgba(38, 44, 106, 1) 57%); color: rgba(205, 206, 215, 255)">
	<header>
		<%@ include file="navbar.jsp"%>
	</header>

	<main role="main">
		<div class="container marketing">
			<%
			List<Pellicola> pellicole = (List<Pellicola>) request.getAttribute("pellicole");
			%>
			<%
			List<Pellicola> pellicole2 = (List<Pellicola>) request.getAttribute("pellicole2");
			%>
			<%
			List<Pellicola> pellicole3 = (List<Pellicola>) request.getAttribute("pellicole3");
			%>
			<%
			List<Pellicola> pellicole4 = (List<Pellicola>) request.getAttribute("pellicole4");
			%>
			<div id="carouselExampleAutoplaying"
				class="carousel carousel-light slide" data-bs-ride="carousel">

				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleDark"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>

				<div class="carousel-background">

				<div class="carousel-inner">

					<%
					for (int i = 0; i < 3; i++) {
						if (i == 0) {
					%>

					<div
						onclick="window.location='info-pellicola?id=<%=pellicole.get(i).getId()%>';"
						class="carousel-item active" data-bs-interval="5000"
						style="background-image: url(<%=pellicole.get(i).getFotoCarosello()%>)">
						<div class="carousel-caption d-none d-md-block">
							<h5><%=pellicole.get(i).getNome()%></h5>
						</div>
					</div>

					<%
					} else {
						
					%>

					<div
						onclick="window.location='info-pellicola?id=<%=pellicole.get(i).getId()%>';"
						class="carousel-item" data-bs-interval="4000"
						style="background-image: url(<%=pellicole.get(i).getFotoCarosello()%>)">
						<div class="carousel-caption d-none d-md-block">
							<h5><%=pellicole.get(i).getNome()%></h5>
						</div>
					</div>

					<%
					}
					%>
					<%
					}
					%>

				</div>
				</div>

				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>

				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>

			</div>

			<br> <br>



			<!-- Three columns of text below the carousel -->

			<h2>Di tendenza</h2>

			<div class="column_content flex scroller loaded module">

				<%
				for (Pellicola pellicola : pellicole2) {
				%>
				<div class="card card-style">
					<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
						style="height: 15rem; width: 10rem"
						src="<%=pellicola.getFotoLocandina()%>" class="card-img">
					</a>
					<div class="card-title div-text" style="height: 30px">
						<%=pellicola.getNome()%>
					</div>
				</div>
				<%
				}
				%>
			</div>


			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<h2>Ultimi Trailer</h2>

			<div class="column_content flex scroller loaded module">
				<%
				for (Pellicola pellicola : pellicole3) {
				%>
				<div class="card card-style"
					style="max-width: 20rem; margin-right: 2rem;">
					<!--   				<iframe style="height: 10rem; width:15rem"  class="card-img" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
					<%--   				<iframe width="560" height="315" src="<%= pellicola.getTrailer() %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> --%>
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="<%=pellicola.getTrailer()%>" allowfullscreen></iframe>
					</div>
					<div class="card-title div-text">
						<%=pellicola.getNome()%>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<hr class="featurette-divider">

			<h2>Ultime uscite</h2>

			<div class="column_content flex scroller loaded module">
				<%
				for (Pellicola pellicola : pellicole3) {
				%>
				<div class="card card-style">
					<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
						style="height: 15rem; width: 10rem"
						src="<%=pellicola.getFotoLocandina()%>" class="card-img">
					</a>
					<div class="card-title div-text">
						<%=pellicola.getNome()%>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<hr class="featurette-divider">

			<h2>Serie TV</h2>

			<div class="column_content flex scroller loaded module">
				<%
				for (Pellicola pellicola : pellicole4) {
				%>
				<div class="card card-style">
					<a href="info-pellicola?id=<%=pellicola.getId()%>"> <img
						style="height: 15rem; width: 10rem"
						src="<%=pellicola.getFotoLocandina()%>" class="card-img">
					</a>
					<div class="card-title div-text">
						<%=pellicola.getNome()%>
					</div>
				</div>
				<%
				}
				%>
			</div>

			<hr class="featurette-divider">

			<div class="row tile">
				<div class="image"></div>
				<div class="overlay">
					<div class="hidden-text">
						<div class="col-md-7">
							<h2 class="featurette-heading">Registrati oggi</h2>
							<p>Ottieni l'accesso per mantenere i tuoi elenchi
								personalizzati, per tenere traccia di quello che hai visto e
								filtrare cosa guardare dopo, indipendentemente dal fatto che sia
								nei cinema, in TV o disponibile su servizi di streaming popolari
								come Netflix, Amazon Prime Video, Disney Plus, Rakuten TV, e
								Apple TV Plus.</p>
						</div>
						<div class="col-md-5">
							<ul>
								<li>Goditi Cinestars senza spam</li>
								<li>Mantieni la watchlist personale</li>
								<li>Filtra secondo i tuoi servizi di streaming e trova
									qualcosa da vedere</li>
								<li>Tieni traccia dei film e delle serie TV che hai visto</li>
								<li>Crea liste personalizzate</li>
								<li>Contribuisci e migliora il nostro database</li>
							</ul>
						</div>
					</div>
					<div class="visible-text">
						<% if (session == null || session.getAttribute("utenteUsername") == null) { %>
						<form action="form-registra-utente.jsp" method="post">
							<button class="btn btn-lg btn-outline-info" type="submit"
								style="margin-top: 75px;">Registrati</button>
						</form>
						<% } else {%>
							<button class="btn btn-lg btn-outline-info" onclick="alreadyLogged()"
								style="margin-top: 75px;">Registrati</button>
						<% } %>
					</div>
				</div>
			</div>


			<hr class="featurette-divider">

			<!-- /END THE FEATURETTES -->

		</div>
		<!-- /.container -->

	</main>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>