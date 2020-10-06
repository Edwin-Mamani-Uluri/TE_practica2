<%@page import="com.emergentes.modelo.Inscripcion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        Inscripcion item = (Inscripcion) request.getAttribute("miinscripcion");
        boolean nuevo = true;
        if(item.getId() > 0){
            nuevo = false;
        }
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscripcion</title>
    </head>
    <body>  
        <h1>Inscripcion en Curso</h1>
        <form action="Controlador1" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= item.getId()  %>" /></td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td><input type="text" name="nombre" value="<%= item.getNombre()  %>" /></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><input type="text" name="apellido" value="<%= item.getApellido()  %>" /></td>
                </tr>
                <tr>
                    <td>Curso</td>
                    <td>
                    <select name="curso">
                    <option value='Programacion'>Programacion
                    <option value='Electronica'>Electronica
                    <option value='Calculo I, II'>Calculo I, II
                    <option value='Ingles Tecnico'>Ingles Tecnico
                    <option value='Fisica I, II'>Fisica I, II
                    <option value='Diseño de Paginas Web'>Diseño de Paginas Web
                    </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="hidden" name="op" value="4" />
                    <input type="hidden" name="nuevo" value="<%= nuevo%>" />
                    <td><input type="submit" value="Enviar"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

