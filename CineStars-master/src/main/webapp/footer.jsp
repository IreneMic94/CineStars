<%@ page import="it.generationitaly.cinestars.entity.Artista"%>
<%@ page import="it.generationitaly.cinestars.entity.Pellicola"%>
<%@ page import="java.util.List" %>
<!-- Footer -->
<footer class="bg-dark text-center text-white">
<%
String nomeRicerca3 = (String) request.getAttribute("nomeRicerca");
String filtro2 = (String) request.getAttribute("filtro");
%>
  <!-- Grid container -->
  <div class="container p-4">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://it-it.facebook.com/" role="button" target="_blank">
      	<i class="fab fa-facebook-f">FACEBOOK</i>
      </a>

      <!-- Twitter -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://twitter.com/?lang=it" role="button" target="_blank">
      	<i class="fab fa-twitter">TWITTER</i>
      </a>

      <!-- Google -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://www.google.it/" role="button" target="_blank">
      	<i class="fab fa-google">GOOGLE</i>
      </a>

      <!-- Instagram -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://www.instagram.com/" role="button" target="_blank">
      	<i class="fab fa-instagram">INSTAGRAM</i>
      </a>

      <!-- Linkedin -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://it.linkedin.com/" role="button" target="_blank">
      	<i class="fab fa-linkedin-in">LINKEDIN</i>
      </a>

      <!-- Github -->
      <a class="btn btn-outline-info btn-floating m-1" href="https://github.com/" role="button" target="_blank">
      	<i class="fab fa-github">GITHUB</i>
      </a>
    </section>
    <!-- Section: Social media -->

    <!-- Section: Links -->
    <section class="">
      <!--Grid row-->
      <div class="row">
        <!--Grid column-->
        <div class="col-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">RICERCA</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <a class="btn btn-outline-info btn-floating m-1" href="ricerca-globale?filtro=persone&nomeRicerca=" role="button">PERSONE</a>
              <a class="btn btn-outline-info btn-floating m-1" href="ricerca-globale?filtro=film&nomeRicerca=" role="button">FILM</a>
            </li>
            <li>
              <a class="btn btn-outline-info btn-floating m-1" href="ricerca-globale?filtro=serieTv&nomeRicerca=" role="button">SERIE TV</a>
              <a class="btn btn-outline-info btn-floating m-1" href="<%=request.getContextPath()%>" role="button">HOME</a>
            </li>
          </ul>
        </div>
        <!--Grid column-->      

        <!--Grid column-->
        <div class="col-6 mb-4 mb-md-0">
          <h5 class="text-uppercase">CONTATTI</h5>

          <ul class="list-unstyled mb-0">
            <li>
              <p class="text-white">Sede: Reggio Calabria, Lungomare Falcomatà 3, RC</p>
            </li>
            <li>
              <p class="text-white">E-mail: info@cinestars.com</p>
            </li>
            <li>
              <p class="text-white">Telefono: + 01 234 567 88</p>
            </li>
            <li>
              <p class="text-white">Fax: + 01 234 567 89</p>
            </li>
          </ul>
        </div>
        <!--Grid column-->
        
        <!-- Section: Text -->
	    <section class="mb-4">
	      <p>
	       Utilizziamo i cookies per una migliore esperienza su Cinestars. Per maggiori informazioni consultare la nostra cookie policy. Continuando ad utilizzare Cinestars si accettano i termini della nostra cookie policy.
	       <button style="margin-left:5px"class="btn btn-outline-info">OK</button>
	      </p>
	    </section>
	    <!-- Section: Text -->
        
      </div>
      <!--Grid row-->
    </section>
    <!-- Section: Links -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="https://it.wikipedia.org/wiki/Francesco_Cozza_(calciatore)" target="_blank">ciccioCozza.com</a>
  </div>
  <!-- Copyright -->
</footer>
<!-- Footer -->