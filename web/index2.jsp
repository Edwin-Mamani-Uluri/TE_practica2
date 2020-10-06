<%@page import="com.emergentes.modelo.Usuarios" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>
        <%
        if(session.getAttribute("listaest") == null){
            ArrayList<Usuarios> listaux = new ArrayList<Usuarios>();
            session.setAttribute("listaest", listaux);
        }    
        ArrayList<Usuarios> lista = (ArrayList<Usuarios>) session.getAttribute("listaest");
        %>
        <h1>Lista de Usuarios</h1>       
        <a href="Controlador2?op=1">Registrar Nuevos Usuarios</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Correo Electronico</th>
            </tr>       
        <%
        if(lista != null){
            for(Usuarios item : lista){
        %>
        <tr>
              <td><%= item.getId() %></td>
            <td><%= item.getNombre() %></td>
            <td><%= item.getApellido() %></td>
            <td><%= item.getCorreo() %></td>
            <td><a href="Controlador2?op=2&id=<%= item.getId()%>">Modificar</a></td>
            <td><a href="Controlador2?op=3&id=<%= item.getId()%>"
                   onclick="return confirm('Esta Seguro de Eliminar al Usuario');">Eliminar</a></td>
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

