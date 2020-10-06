package com.emergentes;

import com.emergentes.modelo.Libros;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controlador4", urlPatterns = {"/Controlador4"})
public class Controlador4 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
     HttpSession ses = request.getSession();
     ArrayList<Libros> lista = (ArrayList<Libros>) ses.getAttribute("listaest");
    if(op == 1){
        Libros p = new Libros();
        request.setAttribute("milibro", p);
        request.getRequestDispatcher("editar4.jsp").forward(request, response);
    }
    if(op == 2){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      Libros p1 = lista.get(pos);
      request.setAttribute("milibro", p1);
      request.getRequestDispatcher("editar4.jsp").forward(request, response);
    }
    if(op == 3){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      lista.remove(pos);
      ses.setAttribute("listaest", lista);
      response.sendRedirect("index4.jsp");
    }
    }
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int pos;
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String resumen = request.getParameter("resumen");
        String medio = request.getParameter("medio");
        Libros per = new Libros();
        
        per.setId(id);
        per.setTitulo(titulo);
        per.setAutor(autor);
        per.setResumen(resumen);
        per.setMedio(medio);
        String nuevo = request.getParameter("nuevo");
        
        HttpSession ses = request.getSession();
        ArrayList<Libros> lista = (ArrayList<Libros>) ses.getAttribute("listaest");
        
        if(nuevo.equals("true")){
            lista.add(per);
        }else
        {
         pos = buscarIndice(request, id);
         lista.set(pos, per);
        }
        response.sendRedirect("index4.jsp");
    }
    
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Libros> lista = (ArrayList<Libros>) ses.getAttribute("listaest");
        
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
