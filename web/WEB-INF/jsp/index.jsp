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
        
        <h2>DIRECTORIO BIBLIOTECAS</h2>
        <h6>Selecciona una opción</h6>
         <a id="btnBibliotecas" class="btn btn-primary" href="<%=request.getContextPath()%>/index2.html">BIBLIOTECAS</a>
         <a id="btnMunicipios" class="btn btn-secondary" href="<%=request.getContextPath()%>/index3.html">MUNICIPIOS</a>

    </body>
</html>