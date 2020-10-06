<%@page import="com.emergentes.modelo.Productos" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        Productos item = (Productos) request.getAttribute("miproducto");
        boolean nuevo = true;
        if(item.getId() > 0){
            nuevo = false;
        }
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Productos</title>
    </head>
    <body>  
        <h1>Regsitro de Productos</h1>
        <form action="Controlador3" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= item.getId()  %>" /></td>
                </tr>
                <tr>
                    <td>Producto</td>
                    <td><input type="text" name="producto" value="<%= item.getProducto()  %>" /></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td>
                    <select name="categoria">
                   <option value='Nuevo'>Nuevo
                    <option value='Estrella'>Estrella
                    <option value='Seguidores'>Seguidores
                    <option value='Apoyo'>Apoyo
                    <option value='Temporada'>Temporada
                    <option value='A La Baja'>A La Baja
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Existencia</td>
                    <td><input type="text"  name="existencia" value="<%= item.getExistencia()  %> " /></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="text"  name="precio" value="<%= item.getPrecio()  %> " /></td>
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


