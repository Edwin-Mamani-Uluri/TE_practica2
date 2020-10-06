<%@page import="com.emergentes.modelo.Inscripcion" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscripcion en Curso</title>
    </head>
    <body>
        <%
        if(session.getAttribute("listaest") == null){
            ArrayList<Inscripcion> listaux = new ArrayList<Inscripcion>();
            session.setAttribute("listaest", listaux);
        }    
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) session.getAttribute("listaest");
        %>
        <h1>Lista de Inscritos</h1>
        <a href="Controlador1?op=1">Inscribirse Algun Curso</a>
        <br><br>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Curso</th>
            </tr>       
        <%
        if(lista != null){
            for(Inscripcion item : lista){
        %>
        <tr>
              <td><%= item.getId() %></td>
            <td><%= item.getNombre() %></td>
            <td><%= item.getApellido() %></td>
            <td><%= item.getCurso() %></td>
            <td><a href="Controlador1?op=2&id=<%= item.getId()%>">Modificar</a></td>
            <td><a href="Controlador1?op=3&id=<%= item.getId()%>"
                   onclick="return confirm('Esta Seguro de Eliminar el Registro');">Eliminar</a></td>
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

