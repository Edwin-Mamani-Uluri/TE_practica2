<%@page import="com.emergentes.modelo.Libros" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Libros</title>
    </head>
    <body>
        <%
        if(session.getAttribute("listaest") == null){
            ArrayList<Libros> listaux = new ArrayList<Libros>();
            session.setAttribute("listaest", listaux);
        }    
        ArrayList<Libros> lista = (ArrayList<Libros>) session.getAttribute("listaest");
        %>
        <h1>Lista de Libros</h1>
        <a href="Controlador4?op=1">Registrar Nuevos Libros</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Resumen</th>
                <th>Medio</th>
            </tr>       
        <%
        if(lista != null){
            for(Libros item : lista){
        %>
        <tr>
              <td><%= item.getId() %></td>
            <td><%= item.getTitulo() %></td>
            <td><%= item.getAutor() %></td>
            <td><%= item.getResumen() %></td>
            <td><%= item.getMedio() %> </td>
            <td><a href="Controlador4?op=2&id=<%= item.getId()%>">Modificar</a></td>
            <td><a href="Controlador4?op=3&id=<%= item.getId()%>"
                   onclick="return confirm('Esta Seguro de Eliminar el Libro');">Eliminar</a></td>
        </tr>
        <%
            }
        }
        %>
        </table>
        <br><br>
        <a href="superIndex.jsp" onclick="return confirm('Antes de Salir No Olvides de Eliminar Todos los Registros que Hiciste');">Volver Al Menu Principal</a><br>
    </body>
</html>
