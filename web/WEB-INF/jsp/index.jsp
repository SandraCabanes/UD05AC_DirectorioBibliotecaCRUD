<%-- 
    Document   : index
    Created on : 22-feb-2019, 12:39:28
    Author     : Sandra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        
        <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.8.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
    </head>
    <body>
        
        <div class="card" style="width: 18rem;">
  <img class="card-img-top" src="..." alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
        
        <h2>DIRECTORIO BIBLIOTECAS</h2>
        <h6>Selecciona una opción</h6>
         <a id="btnBibliotecas" class="btn btn-primary" href="<%=request.getContextPath()%>/index2.html">BIBLIOTECAS</a>
         <a id="btnMunicipios" class="btn btn-secondary" href="<%=request.getContextPath()%>/index3.html">MUNICIPIOS</a>

    </body>
</html>