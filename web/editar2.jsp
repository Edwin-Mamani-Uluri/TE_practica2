<%@page import="com.emergentes.modelo.Usuarios" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        Usuarios item = (Usuarios) request.getAttribute("miusuario");
        boolean nuevo = true;
        if(item.getId() > 0){
            nuevo = false;
        }
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
    </head>
    <body>  
        <h1>Regsitro de Usuarios</h1>
        <form action="Controlador2" method="post">
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
                    <td>Correo Electronico</td>
                    <td><input type="email"  name="correo" value="<%= item.getCorreo()  %> " /></td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td><input type="password"  name="contraseña" value="<%= item.getContraseña()  %> " /></td>
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

