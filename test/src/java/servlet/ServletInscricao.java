/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Bolsa;
import modelo.Edital;
import modelo.Inscricao;
import modelo.StatusEntrevista;

/**
 *
 * @author euzebio
 */
@WebServlet(name = "ServletInscricao", urlPatterns = {"/ServletInscricao"})
public class ServletInscricao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            GregorianCalendar dataInscricao = new GregorianCalendar();
            DaoFactory daoFactory = new DaoFactory();
            Bolsa bolsaAnterior = new Bolsa();
            Edital edital = new Edital();
            StatusEntrevista se = new StatusEntrevista();
            if(request.getParameter("bolsaAnterior") != null && !"".equals(request.getParameter("bolsaAnterior"))){
                bolsaAnterior = daoFactory.getBolsaDao().pesquisarPorId(Integer.parseInt(request.getParameter("bolsaAnterior")));
            }else{
                bolsaAnterior.setId(0);
            }
            Bolsa bolsa1 = daoFactory.getBolsaDao().pesquisarPorId(Integer.parseInt(request.getParameter("bolsa1")));
            Bolsa bolsa2 = daoFactory.getBolsaDao().pesquisarPorId(Integer.parseInt(request.getParameter("bolsa2")));
            Aluno aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
            Inscricao inscricao = new Inscricao();
            inscricao.setReprovou(request.getParameter("reprovou"));
            inscricao.setBolsaAnterior(bolsaAnterior);
            inscricao.setBolsa1(bolsa1);
            inscricao.setBolsa2(bolsa2);
            inscricao.setAno(request.getParameter("ano"));
            inscricao.setAluno(aluno);
            inscricao.setDataInscricao(dataInscricao);
            se.setInscricao(inscricao);
            se.setStatus("Pendente");
            inscricao.setStatusEntrevista(se);
            edital.setId(Integer.parseInt(request.getParameter("ed")));
            inscricao.setEdital(edital);
            
            daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
            
            response.sendRedirect("home.jsp");        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
