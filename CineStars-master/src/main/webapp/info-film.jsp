<%@ page language="java" contentType="text/html; charset=charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="it.generationitaly.cinestars.entity.Artista"%>
<%@ page import="it.generationitaly.cinestars.entity.Recensione"%>
<%@ page import="it.generationitaly.cinestars.entity.WatchList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<%
Pellicola pellicola = (Pellicola) request.getAttribute("pellicola");

List<Artista> artisti = (List<Artista>) request.getAttribute("artisti");

List<Recensione> recensioni = (List<Recensione>) request.getAttribute("recensioni");

Recensione recensione1 = (Recensione) request.getAttribute("recensione");

List<WatchList> watchlisti = (List<WatchList>) request.getAttribute("watchlisti");
%>
<meta charset="UTF-8">
<title><%=pellicola.getNome()%></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<script>
	function watchlistNoLogged() {
		var error2 = document.getElementById("error2")
		if (error2) {
			alert("Effettua il login per aggiungere il film alla watchlist")
		} else {
			error.textContent = ""
		}
	}

	function changeImage() {
		if (document.getElementById("imgClickAndChange").src == "https://i.ibb.co/xGnQZpD/711451.png") {
			document.getElementById("imgClickAndChange").src = "https://cdn-icons-png.flaticon.com/512/1053/1053399.png";
			alert("Aggiunto alla watchlist")
		} else {
			document.getElementById("imgClickAndChange").src = "https://i.ibb.co/xGnQZpD/711451.png";
		}
	}
</script>
<style>
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
	
#salva:hover {
	color: white;
	background-color: rgb(70, 70, 70);
}

.rating {
	float: left;
	border: none;
}

.rating:not(:checked)>input {
	position: absolute;
/* 	top: -9999px; */
	clip: rect(0, 0, 0, 0);
}

.rating:not(:checked)>label {
	float: right;
	width: 1em;
	padding: 0 .1em;
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 200%;
	line-height: 1.2;
	color: #ddd;
}

.rating:not(:checked)>label:before {
	content: '★ ';
}

.rating>input:checked ~ label {
	color: #f70;
}

.rating:not(:checked)>label:hover, .rating:not(:checked)>label:hover ~
	label {
	color: gold;
}

.rating>input:checked+label:hover, .rating>input:checked+label:hover ~
	label, .rating>input:checked ~ label:hover, .rating>input:checked ~
	label:hover ~ label, .rating>label:hover ~ input:checked ~ label {
	color: #ea0;
}

.rating>label:active {
	position: relative;
}

.left {
	
}

.btn-info:hover {
	background-color: lightblue;
	color: black;
}
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
      width: 1320px;
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
</head>
<body
	style="background: rgb(83, 45, 185); background: linear-gradient(0deg, rgba(83, 45, 185, 1) 0%, rgba(38, 44, 106, 1) 57%); color: rgba(205, 206, 215, 255)">
	<header>
		<%@ include file="navbar.jsp"%>
	</header>
	<% boolean watch=false; 
if(watchlisti!=null) 
 for(WatchList watchlist: watchlisti ){ 
  if(watchlist.getPellicola().getId()==pellicola.getId()){ 
   watch=true; 
   break; 
  } 
 }
%>
	 
	
	<main>
		<div class="container" style="margin-top: 3rem;">
			<div class="row g-0">
				<div class="col-md-4">
					<img height="640px" width="480px" style="border-radius: 1%"
						src="<%=pellicola.getFotoLocandina()%>"
						class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8" style="border: 5px solid transparent;">
					<div class="card-body">

						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<%if (session.getAttribute("utenteUsername") != null){%>
                				<%if(watch==false){ %>
                        			<form action="add-watchlist" method="post">
										<input type="hidden" name="idPellicola" value="<%=pellicola.getId()%>">
										<button type="submit" name="utenteId" value="<%=session.getAttribute("utenteId")%>" class="btn btn-lg btn-link">
										<img id="imgClickAndChange" onclick="return confirm('Vuoi aggiungere questo titolo alla tua watchlist?')"
										 src="https://cdn-icons-png.flaticon.com/512/711/711451.png"
										 width="37" />
										</button>
									</form>
                                          <%}else{ %>
                                            <form action="delete-watchlist" method="post">
								<input type="hidden" name="idPellicola" value="<%=pellicola.getId()%>">
								<button type="submit" name="utenteId" value="<%=session.getAttribute("utenteId")%>" class="btn btn-lg btn-link">
									<img id="imgClickAndChange" onclick="return confirm('Vuoi rimuovere questo titolo dalla tua watchlist?')"
										src="https://cdn-icons-png.flaticon.com/512/1053/1053399.png"
										width="37" />
								</button>
							</form>
                        <%} }%>
						</div>

						<h2 class="card-title" style="margin-left: 20px;"><%=pellicola.getNome()%></h2>
						<p class="card-text"
							style="width: 700px; margin-left: 20px; margin-top: 25px;"><%=pellicola.getDescrizione()%></p>
						<table
							style="margin-left: 10px; margin-top: 30px; width: 700px; text-align: center">
							<thead>
								<tr>
									<th>Tipologia</th>
									<th>Anno di uscita</th>
									<th>Genere</th>
									<th>Paese</th>
									<th>Durata</th>
									<th>Distribuzione</th>
									<th>Voto</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%=pellicola.getTipologia()%></td>
									<td><%=pellicola.getAnno()%></td>
									<td><%=pellicola.getGenere().getNome()%></td>
									<td><%=pellicola.getPaese()%></td>
									<%
									if (pellicola.getTipologia().equals("Film") || pellicola.getTipologia().equals("film")) {
									%>
									<td><%=pellicola.getDurata()%> minuti</td>
									<%
									} else {
									%>
									<td><%=pellicola.getDurata()%> stagioni</td>
									<%
									}
									%>
									<td><%=pellicola.getDistribuzione()%></td>
									<td><%=pellicola.getVoto()%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br><br>
			<div class="row">
				<h2>Cast</h2>
				<div class="column_content flex scroller loaded module">
				<%
				for (Artista artista : artisti) {
				%>
					<div class="card card-style">
							<a href="info-artista?id=<%=artista.getId()%>"><img
								src="<%=artista.getFotoGrande()%>" class="card-img-top"
								alt="<%=artista.getNome()%>" style="height: 220px; width: 150px">
								</a>
								<div class="card-title div-text" style="height: 30px">
								<h5 class="card-title"><%=artista.getNome() + " " + artista.getCognome()%></h5>
						</div>
				</div>
				<%
				}
				%>
			</div>
			<br> <br>
			<div class="row" style="margin-top: 4rem">
				<h2>Recensioni degli utenti</h2>
				<hr class="featurette-divider">
				<%
				for (Recensione recensione : recensioni) {
				%>
				<div>
					<form action="info-profili">
						<input type="hidden" name="id"
							value="<%=recensione.getUtente().getId()%>">
						<button type="submit" class="btn btn-outline-link"
							style="color: white;">
							<img style="margin-right: 1rem;"
								src="https://i.ibb.co/VD08Q8F/Progetto-senza-titolo-2.png">
							<span style="color: #0DCAF0"><%=recensione.getUtente().getUsername()%></span>
							<%=recensione.getVoto()%>/5
						</button>
					</form>
					<br>
					<p>
						<%=recensione.getDescrizione()%>
					</p>
					<h6>
						<%=recensione.getDataRecensione()%>
					</h6>
				</div>
				<hr class="featurette-divider">
				<%
				}
				%>
				<br>
				<%
				if (session == null || session.getAttribute("utenteUsername") == null) {
				%>
				<form action="login" method="post">
					<p class="card-text">
						<small class="text-muted"><button
								class="btn btn-outline-info" type="submit"
								style="margin-bottom: 30px">Accedi per aggiungere una
								recensione</button></small>
					</p>
				</form>
				<%
				} else {
				%>
				<div class="row">
					<div class="col-sm-12 col-md-6 col-lg-4">
						<h1>
							Valuta
							<%=pellicola.getNome()%></h1>
						<form action="add-recensione" method="post">
							<input type="hidden" name="idPellicola"
								value="<%=pellicola.getId()%>">
							<%
							if (recensione1 != null) {
							%>
							<input type="hidden" name="idRecensione"
								value="<%=recensione1.getId()%>">
							<%
							}
							%>
							<div class="form-floating">
								<textarea class="form-control" placeholder="Lascia un commento"
									id="descrizione" name="descrizione" style="height: 100px"><% if (recensione1 != null) {%><%=recensione1.getDescrizione()%><%}%></textarea>
								<label for="descrizione">Scrivi la tua recensione...</label>
							</div>
							<p class="fw-bold">Assegna un voto che riassuma al meglio la
								tua recensione</p>
							<fieldset class="rating">
								<input type="radio" id="star5" name="voto" value="5"
									<%if (recensione1 != null && recensione1.getVoto() == 5) {
	out.print("checked");
}%> />
								<label for="star5">5 stars</label> <input type="radio"
									id="star4" name="voto" value="4"
									<%if (recensione1 != null && recensione1.getVoto() == 4) {
	out.print("checked");
}%> />
								<label for="star4">4 stars</label> <input type="radio"
									id="star3" name="voto" value="3"
									<%if (recensione1 != null && recensione1.getVoto() == 3) {
	out.print("checked");
}%> />
								<label for="star3">3 stars</label> <input type="radio"
									id="star2" name="voto" value="2"
									<%if (recensione1 != null && recensione1.getVoto() == 2) {
	out.print("checked");
}%> />
								<label for="star2">2 stars</label> <input type="radio"
									id="star1" name="voto" value="1"
									<%if (recensione1 != null && recensione1.getVoto() == 1) {
	out.print("checked");
}%> />
								<label for="star1">1 star</label>
							</fieldset>
							<br> <br>
							<button id="salva" class="btn btn-success fw-bold" type="submit"
								style="margin-bottom: 30px">SALVA</button>
						</form>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	</main>
	
	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>