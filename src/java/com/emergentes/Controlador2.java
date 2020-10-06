package com.emergentes;

import com.emergentes.modelo.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controlador2", urlPatterns = {"/Controlador2"})
public class Controlador2 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
     HttpSession ses = request.getSession();
     ArrayList<Usuarios> lista = (ArrayList<Usuarios>) ses.getAttribute("listaest");
    if(op == 1){
        Usuarios p = new Usuarios();
        request.setAttribute("miusuario", p);
        request.getRequestDispatcher("editar2.jsp").forward(request, response);
    }
    if(op == 2){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      Usuarios p1 = lista.get(pos);
      request.setAttribute("miusuario", p1);
      request.getRequestDispatcher("editar2.jsp").forward(request, response);
    }
    if(op == 3){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      lista.remove(pos);
      ses.setAttribute("listaest", lista);
      response.sendRedirect("index2.jsp");
    }
    }
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int pos;
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("contraseña");
        Usuarios per = new Usuarios();
        
        per.setId(id);
        per.setNombre(nombre);
        per.setApellido(apellido);
        per.setCorreo(correo);
        per.setContraseña(contraseña);
        String nuevo = request.getParameter("nuevo");
        
        HttpSession ses = request.getSession();
        ArrayList<Usuarios> lista = (ArrayList<Usuarios>) ses.getAttribute("listaest");
        
        if(nuevo.equals("true")){
            lista.add(per);
        }else
        {
         pos = buscarIndice(request, id);
         lista.set(pos, per);
        }
        response.sendRedirect("index2.jsp");
    }
    
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Usuarios> lista = (ArrayList<Usuarios>) ses.getAttribute("listaest");
        
        int i = 0;
        if(lista.size() > 0){
            while(i < lista.size()){
                if(lista.get(i).getId() == id){
                    break;
                }else i++;
            }
        }
        return i;
    }
}