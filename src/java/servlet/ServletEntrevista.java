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
import modelo.Entrevista;
import modelo.Inscricao;
import modelo.StatusEntrevista;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletEntrevista", urlPatterns = {"/ServletEntrevista"})
public class ServletEntrevista extends HttpServlet {

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
            Inscricao inscricao;
            Entrevista entrevista = new Entrevista();
            StatusEntrevista se;
            GregorianCalendar dataEntrevista = new GregorianCalendar();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd hh:mm");
            String opcao = request.getParameter("opcao");
                       
             switch(opcao){
                    case "cadastrar":
                        int k=0,i,total = Integer.parseInt(request.getParameter("total"));
                        out.println("total = "+total);
                        for(i=0;i<total;i++){
                            if(request.getParameter("k"+i)!= null){
                                k = i;
                            }
                        }
                        out.println("k = "+k);                 
                            //Setando dados do Entrevista
                            inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id"+k)));
                            se = inscricao.getStatusEntrevista();
                            out.println("status = "+se.getStatus());
                            se.setStatus("Agendado");
                            entrevista.setSe(se);
                            entrevista.setInscricao(inscricao);
                            
                            out.println("dataEntrevista = "+request.getParameter("dataEntrevista")+" "+request.getParameter("horario"));
                            dataEntrevista.setTime(formatador.parse(request.getParameter("dataEntrevista")+" "+request.getParameter("horario")));
                            entrevista.setDataEntrevista(dataEntrevista);
                            entrevista.setLocal(request.getParameter("local"));
                            entrevista.setConcorrencia("");
                            entrevista.setDimensaoSocial("");
                            entrevista.setDimensaoAmbiental("");
                            entrevista.setDimensaoEconomica("");
                            entrevista.setDimensaoCultural("");
                            entrevista.setParticipaProjetos(request.getParameter("participaProjetos"));
                            entrevista.setBolsaPermanente(request.getParameter("bolsaPermanente"));
                            entrevista.setOutraBolsa(request.getParameter("outraBolsa"));
                            entrevista.setAlmocoIfto(request.getParameter("almocoIfto"));
                            entrevista.setObservacao("");
                            entrevista.setResultado("");
                            daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);                        
                         response.sendRedirect("entrevista/horario.jsp");
                    break;
                    case "alterar":
                          //Setando dados do Aluno
                            dataEntrevista.setTime(formatador.parse(request.getParameter("dataEntrevista")+" "+request.getParameter("horario")));
                            entrevista.setDataEntrevista(dataEntrevista);
                            entrevista.setLocal(request.getParameter("local"));
                            entrevista.setConcorrencia("");
                            entrevista.setDimensaoSocial("");
                            entrevista.setDimensaoAmbiental("");
                            entrevista.setDimensaoEconomica("");
                            entrevista.setDimensaoCultural("");
                            entrevista.setParticipaProjetos(request.getParameter("participaProjetos"));
                            entrevista.setBolsaPermanente(request.getParameter("bolsaPermanente"));
                            entrevista.setOutraBolsa(request.getParameter("outraBolsa"));
                            entrevista.setAlmocoIfto(request.getParameter("almocoIfto"));
                            entrevista.setObservacao("");
                            entrevista.setResultado("");
                            daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);                        
                         response.sendRedirect("entrevista/horario.jsp");
                        
                       
                        //Chamando o metodo alterar do dao e redirecionando para listar entrevista                          
                    break;
                    case "excluir":
                        //Setando dados do Aluno                        
                        entrevista.setId(Integer.parseInt(request.getParameter("id")));
                        //Chamando o metodo excluir do dao e redirecionando para listar aluno  
                        daoFactory.getEntrevistaDao().excluir(entrevista);
                        request.getRequestDispatcher("listar.jsp").forward(request, response);
                    break;
                    case "entrevistar":                        
                        entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                        entrevista.setObservacao(request.getParameter("observacao"));
                        entrevista.setResultado(request.getParameter("resultado"));
                        out.println("i_id = "+entrevista.getInscricao().getId()+" e_id = "+entrevista.getId());
                        inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(entrevista.getInscricao().getId());
                        se = inscricao.getStatusEntrevista();
                        se.setStatus("Finalizado");
                        entrevista.setSe(se);
                        entrevista.setInscricao(inscricao);
                        daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);
                        response.sendRedirect("entrevista/entrevista.jsp");                       
                    break;                        
                }            
        } catch (ParseException ex) {
            Logger.getLogger(ServletEntrevista.class.getName()).log(Level.SEVERE, null, ex);
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
