<%@page import="java.util.List"%>
<%@page import="ejemplo03.dominio.Biblioteca"%>
<%@page import="java.util.Set"%>
<%@page import="org.springframework.web.util.HtmlUtils"%>
<%@page import="com.fpmislata.persistencia.dao.BussinessMessage"%>
<%@page import="ejemplo03.presentacion.FormOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FormOperation formOperation = (FormOperation) request.getAttribute("formOperation");
    String labelButton = null;
    String urlAction;
    switch (formOperation) {
        case Insert:
            labelButton = "Insertar";
            urlAction = request.getContextPath() + "/municipio/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/municipio/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/municipio/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es válido" + formOperation);
    }
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
        <div class="row">
            <div class="span12">&nbsp;</div>
        </div>
        <div class="row">
            <div class="offset1 well">
                <h3>Municipio</h3>
                <form action="<%=urlAction%>" method="post" >
                    <fieldset>
                        <label class="control-label" for="id">Id:</label>
                        <input class="input-large disabled " id="id" name="id" type="text" value="${municipio.idMunicipio}" readonly="readonly">

                        <label class="control-label" for="codMunicipio">Nombre:</label>
                        <input class="input-xlarge" id="codMunicipio" type="text" name="codMunicipio" value="${municipio.codMunicipio}" >
                    </fieldset>

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
                                        List<Biblioteca> bibliotecas = (List<Biblioteca>) request.getAttribute("bibliotecas");

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
                                            <a href="<%=request.getContextPath()%>/biblioteca/readForDelete.html?id=<%=biblioteca.getIdBiblioteca()%>" title="Borrar" ><span class="glyphicon glyphicon-trash"></span></a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <% if (request.getAttribute("bussinessMessages") != null) {%>
                    <div class="alert alert-error alert-block">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <ul>
                            <%for (BussinessMessage bussinessMessage : (Set<BussinessMessage>) request.getAttribute("bussinessMessages")) {%>
                            <li>
                                <%if (bussinessMessage.getFieldName() != null) {
                                        out.print("<strong>" + HtmlUtils.htmlEscape(bussinessMessage.getFieldName()) + "</strong>");
                                    }
                                %>
                                <%=HtmlUtils.htmlEscape(bussinessMessage.getMessage())%>
                            </li>
                            <%} %>
                        </ul>
                    </div>
                    <%}%>
                    <div class="form-actions">
                        <button id="aceptarBtn" class="btn btn-primary" type="submit"><%=labelButton%></button>
                        <a class="btn" href="<%=request.getContextPath()%>/index.html" >Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
        <script>

        </script>
    </body>
</html>