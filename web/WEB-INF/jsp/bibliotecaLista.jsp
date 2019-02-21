<%@page import="ejemplo03.dominio.Biblioteca"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="ejemplo03.dominio.Biblioteca"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Biblioteca> bibliotecas = (List<Biblioteca>) request.getAttribute("bibliotecas");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/bootstrap-responsive.css" rel="stylesheet">
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
        <script type="text/javascript"  src="<%=request.getContextPath()%>/js/bootstrap.js" ></script>
    </head>
    <body style="background:#FDFDFD">
        <div class="row-fluid">
            <div class="span12">&nbsp;</div>
        </div>
        <div class="row-fluid">
            <div class="offset1  span10">
                <div class="row-fluid">
                    <div class="span12">
                        <a id="btnNuevo" class="btn btn-primary" href="<%=request.getContextPath()%>/biblioteca/newForInsert.html">Nueva biblioteca</a>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <table class="table table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Nombre</th>
                                    <th>Tipo</th>
                                    <th>Direccion</th>
                                    <th>Cod postal</th>
                                    <th>Telefono</th>
                                    <th>Web</th>
                                    <th>Email</th>
                                    <th>Catalogo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Biblioteca biblioteca : bibliotecas) {
                                %>
                                <tr>
                                    <td><a href="<%=request.getContextPath()%>/biblioteca/readForUpdate.html?id=<%=biblioteca.getIdBiblioteca()%>" title="Editar" ><%=biblioteca.getIdBiblioteca()%></a></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getNombre())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getTipo())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getDireccion())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getCodPostal())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getTelefono())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getWeb())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getEmail())%></td>
                                    <td><%=HtmlUtils.htmlEscape(biblioteca.getCatalogo())%></td>
                                    <td>
                                        <a href="<%=request.getContextPath()%>/biblioteca/readForDelete.html?id=<%=biblioteca.getIdBiblioteca()%>" title="Borrar" ><i class="icon-trash"></i></a>
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