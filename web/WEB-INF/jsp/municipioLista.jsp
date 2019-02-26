<%@page import="ejemplo03.dominio.Municipio"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Municipio> municipios = (List<Municipio>) request.getAttribute("municipio");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Municipio</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background:#FDFDFD">

        <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/index.html">Directorio de bibliotecas</a>
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


        <div class="row-fluid">
            <div class="span12">&nbsp;</div>
        </div>
        <div class="row-fluid">
            <div class="offset1  span10">
                <div class="row-fluid">
                    <div class="span12">
                        <a id="btnNuevo" class="btn btn-primary" href="<%=request.getContextPath()%>/municipio/newForInsert.html">Nuevo municipio</a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <table class="table table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Cod. municipio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Municipio municipio : municipios) {
                                %>
                                <tr>
                                    <td><a href="<%=request.getContextPath()%>/municipio/readForUpdate.html?id=<%=municipio.getIdMunicipio()%>" title="Editar" ><%=municipio.getIdMunicipio()%></a></td>
                                    <td><%=HtmlUtils.htmlEscape(Integer.toString(municipio.getCodMunicipio()))%></td>

                                    <td>
                                        <a href="<%=request.getContextPath()%>/municipio/readForDelete.html?id=<%=municipio.getIdMunicipio()%>" title="Borrar" ><span class="glyphicon glyphicon-trash"></span></a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="span1"></div>
        </div>
    </body>
</html>