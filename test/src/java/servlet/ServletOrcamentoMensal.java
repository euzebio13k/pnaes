/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.OrcamentoMensal;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletOrcamentoMensal", urlPatterns = {"/ServletOrcamentoMensal"})
public class ServletOrcamentoMensal extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                    
            DaoFactory daoFactory = new DaoFactory();
            OrcamentoMensal orcamentoMensal = new OrcamentoMensal();
            Aluno aluno = new Aluno();
            String opcao = request.getParameter("opcao");
            
            switch(opcao){
                
                case"cadastrar":
                    //Setando dados do Despesa Mensal
                    orcamentoMensal.setRenda(Double.parseDouble(request.getParameter("renda")));
                    orcamentoMensal.setRendaDeps(Double.parseDouble(request.getParameter("rendaDeps")));
                    orcamentoMensal.setOutrasRendas(Double.parseDouble(request.getParameter("outrasRendas")));
                    orcamentoMensal.setMoradia(Double.parseDouble(request.getParameter("moradia")));
                    orcamentoMensal.setAgua(Double.parseDouble(request.getParameter("agua")));
                    orcamentoMensal.setEnergia(Double.parseDouble(request.getParameter("energia")));
                    orcamentoMensal.setTelefone(Double.parseDouble(request.getParameter("telefone")));
                    orcamentoMensal.setFarmacia(Double.parseDouble(request.getParameter("farmacia")));
                    orcamentoMensal.setOutrasDespesas(Double.parseDouble(request.getParameter("outrasDespesas")));
                    
                    aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    orcamentoMensal.setAluno(aluno);
                    //Chamando o metodo inserir do dao e redirecionando para listar Orçamento
                    daoFactory.getOrcamentoMensalDao().inserirOuAlterar(orcamentoMensal);
                    response.sendRedirect("home.jsp");
                   
                break;
                case"alterar":
                    //Setando dados do Despesa Mensal
                    orcamentoMensal.setId(Integer.parseInt(request.getParameter("id")));
                    orcamentoMensal.setMoradia(Double.parseDouble(request.getParameter("moradia")));
                    orcamentoMensal.setAgua(Double.parseDouble(request.getParameter("agua")));
                    orcamentoMensal.setEnergia(Double.parseDouble(request.getParameter("energia")));
                    orcamentoMensal.setTelefone(Double.parseDouble(request.getParameter("telefone")));
                    orcamentoMensal.setFarmacia(Double.parseDouble(request.getParameter("farmacia")));
                    orcamentoMensal.setOutrasDespesas(Double.parseDouble(request.getParameter("outras")));
                    aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    orcamentoMensal.setAluno(aluno);
                    
                    //Chamando o metodo alterar do dao e redirecionando para listar Despesa Mensal
                    daoFactory.getOrcamentoMensalDao().inserirOuAlterar(orcamentoMensal);
                    response.sendRedirect("listar.jsp");
                break;
                case"excluir":
                    //Setando dados do Despesa Mensal
                    orcamentoMensal.setId(Integer.parseInt(request.getParameter("id")));
                    //Chamando o metodo excluir do dao e redirecionando para listar Despesa Mensal
                    daoFactory.getOrcamentoMensalDao().excluir(orcamentoMensal);
                    response.sendRedirect("orcamentoMensal/listar.jsp");
                                
            }
            
          
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
