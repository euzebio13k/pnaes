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
import modelo.Documento;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletDocumento", urlPatterns = {"/ServletDocumento"})
public class ServletDocumento extends HttpServlet {

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
             Documento documento = new Documento();
             
             Aluno aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("a_id")));
             String opcao = request.getParameter("opcao");
                
            switch(opcao) {
                case "cadastrar" :
                    //Setando dados do Documento
                    documento.setRg(request.getParameter("rg"));
                    documento.setCpf(request.getParameter("cpf"));
                    documento.setRgDep(request.getParameter("rgDep"));
                    documento.setCpfDep(request.getParameter("cpfDep"));
                    documento.setCn(request.getParameter("cn"));
                    documento.setAgua(request.getParameter("agua"));
                    documento.setEnergia(request.getParameter("energia"));
                    documento.setTelefone(request.getParameter("telefone"));
                    documento.setContrato(request.getParameter("contrato"));
                    documento.setMedicacao(request.getParameter("medicacao"));
                    documento.setComproRenda(request.getParameter("comproRenda"));
                    documento.setDeficiente(request.getParameter("deficiente"));
                    documento.setCarteira(request.getParameter("carteira"));
                    documento.setDeclaracao(request.getParameter("declaracao"));
                    documento.setResultado(request.getParameter("resultado"));
                    documento.setAluno(aluno);
                    //Chamando o metodo inserir do dao e redirecionando para listar Documento                      
                    
                    daoFactory.getDocumentoDao().inserirOuAlterar(documento);
                    response.sendRedirect("documento/documento.jsp");
                break;
                case "alterar":
                    //Setando dados do Documento
                    documento.setId(Integer.parseInt(request.getParameter("id")));
                      documento.setRg(request.getParameter("rg"));
                    documento.setCpf(request.getParameter("cpf"));
                    documento.setRgDep(request.getParameter("rgDep"));
                    documento.setCpfDep(request.getParameter("cpfDep"));
                    documento.setCn(request.getParameter("cn"));
                    documento.setAgua(request.getParameter("agua"));
                    documento.setEnergia(request.getParameter("energia"));
                    documento.setTelefone(request.getParameter("telefone"));
                    documento.setContrato(request.getParameter("contrato"));
                    documento.setMedicacao(request.getParameter("medicacao"));
                    documento.setComproRenda(request.getParameter("comproRenda"));
                    documento.setDeficiente(request.getParameter("deficiente"));
                    documento.setCarteira(request.getParameter("carteira"));
                    documento.setDeclaracao(request.getParameter("declaracao"));
                    documento.setAluno(aluno);
                    daoFactory.getDocumentoDao().inserirOuAlterar(documento);
                    response.sendRedirect("documento/listar.jsp");
                break;
                case "excluir":
                    documento.setId(Integer.parseInt(request.getParameter("id")));
                    daoFactory.getDocumentoDao().excluir(documento);
                    response.sendRedirect("documento/listar.jsp");
                break;
                    
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
