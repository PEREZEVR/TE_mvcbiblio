<%@page import="com.emergentes.modelo.Libro" %>
<%@page import="com.emergentes.modelo.LibroDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            LibroDAO lista=(LibroDAO) session.getAttribute("gestor");
        %>
        <h1>LISTADO</h1>
        <p><a href="../Principal?op=nuevo">NUEVO</a></p>
        <%
            if (lista.getLibros().size()>0) {
        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>TITULO</th>
                <th>AUTOR</th>
                <th>ESTADO</th>
                <th></th>
                <th></th>
            </tr>
            <%
                for (Libro item : lista.getLibros()) {  
            %>
            <tr>
                <th><%= item.getId() %></th>
                <th><%= item.getTitulo() %></th>
                <th><%= item.getAutor() %></th>
                <th><%= item.getEstado() %></th>
                <th><a href="../Principal?op=editar&id=<%= item.getId()%>">EDITAR</a></th>
                <th><a href="../Principal?op=eliminar&id=<%= item.getId()%>">ELIMINAR</a></th>
            </tr>
            <%
                }
            %>
        </table>
            <%
            }else{
                    out.println("<p> NO EXISTEN REGISTROS");;
                }
            %>
    </body>
</html>
