/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Dependente;
import modelo.Uf;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletDependente", urlPatterns = {"/ServletDependente"})
public class ServletDependente extends HttpServlet {

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
            Dependente dependente = new Dependente();
            Aluno aluno = new Aluno();
            Uf ufe = new Uf();
            GregorianCalendar dtn = new GregorianCalendar();
            SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
            String opcao = request.getParameter("opcao");
            try {
                switch (opcao) {

                    case "cadastrar":
                        //Setando dados do Dependente
                        dependente.setNome(request.getParameter("nome"));
                        dependente.setCpf(request.getParameter("cpf"));
                        dependente.setRg(request.getParameter("rg"));
                        ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                        dependente.setUfExpedicao(ufe);
                        dtn.setTime(formatador.parse(request.getParameter("dtn")));
                        dependente.setDtn(dtn);
                        dependente.setSexo(request.getParameter("sexo"));
                        dependente.setTelefone(request.getParameter("telefone"));
                        dependente.setEmail(request.getParameter("email"));
                        dependente.setGrauParentesco(request.getParameter("grauParentesco"));
                        dependente.setTipoDeficiente(request.getParameter("tipoDeficiencia"));
                        dependente.setAtividadeProf(request.getParameter("atividadeProf"));
                        dependente.setRenda(Double.parseDouble(request.getParameter("renda")));
                        aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        dependente.setEndereco(aluno.getEndereco());
                        dependente.setAluno(aluno);
                        //Chamando o metodo inserir do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().inserirOuAlterar(dependente);
                        response.sendRedirect("dependente/listar.jsp");
                    break;
                    case "alterar":
                        //Setando dados do Dependente
                        dependente = (Dependente) daoFactory.getDependenteDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                        dependente.setNome(request.getParameter("nome"));
                        dependente.setCpf(request.getParameter("cpf"));
                        dependente.setRg(request.getParameter("rg"));
                        dependente.setSexo(request.getParameter("sexo"));
                        ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                        dependente.setUfExpedicao(ufe);
                        dtn.setTime(formatador.parse(request.getParameter("dtn")));
                        dependente.setDtn(dtn);
                        dependente.setTelefone(request.getParameter("telefone"));
                        dependente.setEmail(request.getParameter("email"));
                        dependente.setGrauParentesco(request.getParameter("grauParentesco"));
                        //dependente.setRenda(Double.parseDouble(request.getParameter("renda")));
                        dependente.setTipoDeficiente(request.getParameter("tipoDeficiencia"));
                        dependente.setAtividadeProf(request.getParameter("atividadeProf"));
                        dependente.setRenda(Double.parseDouble(request.getParameter("renda")));
                        //Chamando o metodo alterar do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().inserirOuAlterar(dependente);
                        response.sendRedirect("dependente/listar.jsp");
                    break;
                    case "excluir":
                        //Setando dados do Dependente
                        dependente.setId(Integer.parseInt(request.getParameter("id")));
                        //Chamando o metodo excluir do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().excluir(dependente);
                        response.sendRedirect("dependente/listar.jsp");
                    break;

                }
            } catch (ParseException ex) {
                Logger.getLogger(ServletDependente.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Erro na Data!");
                out.println("<br><br><br><br><br><center><font color='red'><h1>Data de nascimento invalida!</h1></font></center");
                //out.println("<a href='home.jsp'>voltar</a>");
            } catch (NumberFormatException ne) {
                Logger.getLogger(ServletDependente.class.getName()).log(Level.SEVERE, null, ne);
                System.out.println("Erro na renda!");
                out.println("<br><br><br><br><br><center><font color='red'><h1>Renda invalida!<br>A renda deve estar no formato 00.00</h1></font></center");    
                //out.println("<a href='home.jsp'>voltar</a>");
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
