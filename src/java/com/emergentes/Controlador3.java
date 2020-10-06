package com.emergentes;

import com.emergentes.modelo.Productos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controlador3", urlPatterns = {"/Controlador3"})
public class Controlador3 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
     HttpSession ses = request.getSession();
     ArrayList<Productos> lista = (ArrayList<Productos>) ses.getAttribute("listaest");
    if(op == 1){
        Productos p = new Productos();
        request.setAttribute("miproducto", p);
        request.getRequestDispatcher("editar3.jsp").forward(request, response);
    }
    if(op == 2){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      Productos p1 = lista.get(pos);
      request.setAttribute("miproducto", p1);
      request.getRequestDispatcher("editar3.jsp").forward(request, response);
    }
    if(op == 3){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      lista.remove(pos);
      ses.setAttribute("listaest", lista);
      response.sendRedirect("index3.jsp");
    }
    }
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int pos;
        String producto = request.getParameter("producto");
        String categoria = request.getParameter("categoria");
        String existencia = request.getParameter("existencia");
        String precio = request.getParameter("precio");
        Productos per = new Productos();
        
        per.setId(id);
        per.setProducto(producto);
        per.setCategoria(categoria);
        per.setExistencia(existencia);
        per.setPrecio(precio);
        String nuevo = request.getParameter("nuevo");
        
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>) ses.getAttribute("listaest");
        
        if(nuevo.equals("true")){
            lista.add(per);
        }else
        {
         pos = buscarIndice(request, id);
         lista.set(pos, per);
        }
        response.sendRedirect("index3.jsp");
    }
    
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Productos> lista = (ArrayList<Productos>) ses.getAttribute("listaest");
        
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