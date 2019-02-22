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
                        <a id="btnNuevo" class="btn btn-primary" href="<%=request.getContextPath()%>/municipio/newForInsert.html">Nueva municipio</a>
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
                                        <a href="<%=request.getContextPath()%>/municipio/readForDelete.html?id=<%=municipio.getIdMunicipio()%>" title="Borrar" ><i class="icon-trash"></i></a>
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