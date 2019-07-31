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
import modelo.Empresa;
import modelo.Endereco;


/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletEmpresa", urlPatterns = {"/ServletEmpresa"})
public class ServletEmpresa extends HttpServlet {

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
            Aluno aluno = new Aluno();
            Empresa empresa = new Empresa();
            Endereco endereco= new Endereco();
            String opcao = request.getParameter("opcao");
            
            switch(opcao){
                    case "cadastrar":
                        //Setando dados do Empresa
                        empresa.setNome(request.getParameter("nome"));
                        empresa.setRazaoSocial(request.getParameter("razaoSocial"));
                        empresa.setTelefone(request.getParameter("telefone"));
                        empresa.setCnpj(request.getParameter("cnpj"));
                        empresa.setEmail(request.getParameter("email"));
                        empresa.setResponsavel(request.getParameter("responsavel"));
                        //Setando dados do Endereço
                        endereco.setLogradouro(request.getParameter("logradouro"));
                        endereco.setNumero(request.getParameter("numero"));
                        endereco.setBairro(request.getParameter("bairro"));
                        endereco.setComplemento(request.getParameter("complemento"));
                        endereco.setCep(request.getParameter("cep"));
                        aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        endereco.setPessoa(empresa);
                        empresa.setAluno(aluno);
                        empresa.setEndereco(endereco);
                        //Chamando o metodo inserir do dao e redirecionando para listar aluno                       
                        daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                          response.sendRedirect("empresa/listar.jsp");
                     break;
                    case "alterar":
                        //Setando dados do Empresa
                        empresa = daoFactory.getEmpresaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                        empresa.setNome(request.getParameter("nome"));
                        empresa.setRazaoSocial(request.getParameter("razaoSocial"));
                        empresa.setTelefone(request.getParameter("telefone"));
                        empresa.setCnpj(request.getParameter("cnpj"));
                        empresa.setEmail(request.getParameter("email"));
                        empresa.setResponsavel(request.getParameter("responsavel"));
                        //Setando dados do Endereço
                        endereco.setLogradouro(request.getParameter("logradouro"));
                        endereco.setNumero(request.getParameter("numero"));
                        endereco.setBairro(request.getParameter("bairro"));
                        endereco.setComplemento(request.getParameter("complemento"));
                        endereco.setCep(request.getParameter("cep"));
                        endereco.setId(empresa.getEndereco().getId());
                        endereco.setPessoa(empresa.getEndereco().getPessoa());
                        empresa.setEndereco(endereco);
                        //Chamando o metodo alterar do dao e redirecionando para listar empresa                     
                        daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                        response.sendRedirect("empresa/listar.jsp");
                    break;
                    case "excluir":
                        //Setando dados do Aluno
                        empresa.setId(Integer.parseInt(request.getParameter("id")));
                        //Chamando o metodo excluir do dao e redirecionando para listar aluno  
                        daoFactory.getEmpresaDao().excluir(empresa);
                        response.sendRedirect("empresa/listar.jsp");
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
