<%@page import="com.emergentes.modelo.Libros" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
        Libros item = (Libros) request.getAttribute("milibro");
        boolean nuevo = true;
        if(item.getId() > 0){
            nuevo = false;
        }
  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Libros</title>
    </head>
    <body>  
        <h1>Registro de Libros</h1>
        <form action="Controlador4" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="id" value="<%= item.getId()  %>" /></td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td><input type="text" name="titulo" value="<%= item.getTitulo()  %>" /></td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td><input type="text" name="autor" value="<%= item.getAutor()  %>" /></td>
                </tr>
                <tr>
                    <td>Resumen</td>
                    <td><p><textarea name='resumen' value='<%= item.getResumen()  %>' rows='5' cols='50'></textarea></p></td>
                </tr>
                <tr>
                    <td>Medio</td>
                    <td>Fisico<input type="checkbox" name="medio" value="Fisico" ></td>
                </tr><tr>
                    <td></td>
                    <td>Magnetico<input type="checkbox" name="medio" value="Magnetico" ></td>
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
