package com.emergentes;

import com.emergentes.modelo.Inscripcion;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controlador1", urlPatterns = {"/Controlador1"})
public class Controlador1 extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int op = Integer.parseInt(request.getParameter("op"));
    int id,pos;
    
     HttpSession ses = request.getSession();
     ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaest");
    if(op == 1){
        Inscripcion p = new Inscripcion();
        request.setAttribute("miinscripcion", p);
        request.getRequestDispatcher("editar1.jsp").forward(request, response);
    }
    if(op == 2){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      Inscripcion p1 = lista.get(pos);
      request.setAttribute("miinscripcion", p1);
      request.getRequestDispatcher("editar1.jsp").forward(request, response);
    }
    if(op == 3){
      id = Integer.parseInt(request.getParameter("id"));
      pos = buscarIndice(request, id);
      lista.remove(pos);
      ses.setAttribute("listaest", lista);
      response.sendRedirect("index1.jsp");
    }
    }
    
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int pos;
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String curso = request.getParameter("curso"); 
        Inscripcion per = new Inscripcion();
        
        per.setId(id);
        per.setNombre(nombre);
        per.setApellido(apellido);
        per.setCurso(curso);
        String nuevo = request.getParameter("nuevo");
        
        HttpSession ses = request.getSession();
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaest");
        
        if(nuevo.equals("true")){
            lista.add(per);
        }else
        {
         pos = buscarIndice(request, id);
         lista.set(pos, per);
        }
        response.sendRedirect("index1.jsp");
    }
    
    private int buscarIndice(HttpServletRequest request, int id){
        HttpSession ses = request.getSession();
        ArrayList<Inscripcion> lista = (ArrayList<Inscripcion>) ses.getAttribute("listaest");
        
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
