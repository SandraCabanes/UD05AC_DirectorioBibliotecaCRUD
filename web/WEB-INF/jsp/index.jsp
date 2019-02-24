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

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">Directorio de bibliotecas</a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/bibliotecas.html">Bibliotecas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>/municipios.html">Municipios</a>
                    </li>
            </div>
        </nav>
        <div class="container">
            <div class="card">
                <img class="card-img-top" src="https://www.bristol.ac.uk/media-library/sites/library/images/library-home-wml-650x250.jpg" width="3500px" height="300px" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Directorio de bibliotecas de la comunidad valenciana</h5>
                    <p class="card-text">Web que permita acceder a la información de de las bibliotecas existentes en toda la Comunidad Valenciana, actualizado el 19 de febrero de 2018, para un acceso rápido sin necesidad de más búsquedas en internet.</p>
                    <a href="https://github.com/SandraCabanes/UD05AC_DirectorioBibliotecaCRUD" class="btn btn-primary">GitHub</a>
                </div>
            </div>

        </div>
    </body>
</html>