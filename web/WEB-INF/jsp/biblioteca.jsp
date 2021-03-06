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
            urlAction = request.getContextPath() + "/biblioteca/insert.html";
            break;
        case Update:
            labelButton = "Actualizar";
            urlAction = request.getContextPath() + "/biblioteca/update.html";
            break;
        case Delete:
            labelButton = "Borrar";
            urlAction = request.getContextPath() + "/biblioteca/delete.html";
            break;
        default:
            throw new RuntimeException("El valor de 'formOperation' no es válido" + formOperation);
    }
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
        <div class="row">
            <div class="span12">&nbsp;</div>
        </div>
        <div class="row">
            <div class="offset1 span10 well">
                <h3>Biblioteca</h3>
                <form action="<%=urlAction%>" method="post" >
                    <fieldset>
                        <label class="control-label" for="id">Id:</label>
                        <input class="input-large disabled " id="id" name="id" type="text" value="${biblioteca.idBiblioteca}" readonly="readonly">

                        <label class="control-label" for="nombre">Nombre:</label>
                        <input class="input-xlarge" id="nombre" type="text" name="nombre" value="${biblioteca.nombre}" >

                        <label class="control-label" for="tipo">Tipo:</label>
                        <input class="input-xlarge" id="tipo" type="text" name="tipo" value="${biblioteca.tipo}" >

                        <label class="control-label" for="direccion">Dirección:</label>
                        <input class="input-xlarge" id="direccion" type="text" name="direccion" value="${biblioteca.direccion}" >

                        <label class="control-label" for="codPostal">CodPostal:</label>
                        <input class="input-xlarge" id="codPostal" type="text" name="codPostal" value="${biblioteca.codPostal}" >

                        <label class="control-label" for="telefono">Telefono:</label>
                        <input class="input-xlarge" id="telefono" type="text" name="telefono" value="${biblioteca.telefono}" >

                        <label class="control-label" for="web">Web:</label>
                        <input class="input-xlarge" id="web" type="text" name="web" value="${biblioteca.web}" >

                        <label class="control-label" for="email">Email:</label>
                        <input class="input-xlarge" id="email" type="text" name="email" value="${biblioteca.email}" >
                        
                        <label class="control-label" for="catalogo">Catalogo:</label>
                        <input class="input-xlarge" id="catalogo" type="text" name="catalogo" value="${biblioteca.catalogo}" >
                      
                        
                    </fieldset>
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
                    <%} %>
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