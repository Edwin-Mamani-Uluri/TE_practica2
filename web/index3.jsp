<%@page import="com.emergentes.modelo.Productos" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
    </head>
    <body>
        <%
        if(session.getAttribute("listaest") == null){
            ArrayList<Productos> listaux = new ArrayList<Productos>();
            session.setAttribute("listaest", listaux);
        }    
        ArrayList<Productos> lista = (ArrayList<Productos>) session.getAttribute("listaest");
        %>
        <h1>Lista de Productos</h1>
        <a href="Controlador3?op=1">Registrar Nuevos Productos</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Producto</th>
                <th>Categoria</th>
                <th>Existencia</th>
                <th>Precio</th>
            </tr>       
        <%
        if(lista != null){
            for(Productos item : lista){
        %>
        <tr>
              <td><%= item.getId() %></td>
            <td><%= item.getProducto() %></td>
            <td><%= item.getCategoria() %></td>
            <td><%= item.getExistencia() %></td>
            <td><%= item.getPrecio() %> Bs</td>
            <td><a href="Controlador3?op=2&id=<%= item.getId()%>">Modificar</a></td>
            <td><a href="Controlador3?op=3&id=<%= item.getId()%>"
                   onclick="return confirm('Esta Seguro de Eliminar el Producto');">Eliminar</a></td>
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


