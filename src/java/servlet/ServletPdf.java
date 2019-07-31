/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import dao.DaoFactory;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Entrevista;
import modelo.Inscricao;
import util.DataFormat;

/**
 *
 * @author euzebio
 */
@WebServlet(name = "ServletPdf", urlPatterns = {"/ServletPdf"})
public class ServletPdf extends HttpServlet {

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
        Document document = new Document(PageSize.A4, 42, 42, 42, 42);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            DaoFactory daoFactory = new DaoFactory();
            DataFormat dataFormat = new DataFormat();
            String opcao = request.getParameter("opcao");
            Image figura;
            Paragraph p;
            PdfPCell cel1;
            PdfPCell cel2;
            PdfPCell cel3;
            PdfPCell cel4;
            PdfPCell cel5;
            PdfPTable tabela;
            List<Inscricao> inscricoes = new ArrayList<Inscricao>();
            List<Entrevista> entrevistas = new ArrayList<Entrevista>();
            switch (opcao) {
                case "inscricao":
                    PdfWriter.getInstance(document, new FileOutputStream("/home/ti/NetBeansProjects/pnaes/web/lista_de_inscritos.pdf"));
                    document.setPageSize(PageSize.A4.rotate());
                    document.open();

                    figura = Image.getInstance("/home/ti/NetBeansProjects/pnaes/web/img/logo123.png");
                    figura.setAlignment(Element.ALIGN_CENTER);
                    document.add(figura);
                    figura.setSpacingAfter(20);
                    p = new Paragraph("Lista de Inscritos",FontFactory.getFont(FontFactory.TIMES_BOLD, 18));
                    p.setAlignment(1);
                    document.add(p);
                    p = new Paragraph(" ");
                    document.add(p);
                    tabela = new PdfPTable(new float[]{0.3f,1.0f,0.5f,0.8f,0.8f});
                    cel1 = new PdfPCell(new Paragraph("Inscrição"));
                    cel2 = new PdfPCell(new Paragraph("Aluno"));
                    cel3 = new PdfPCell(new Paragraph("CPF"));
                    cel4 = new PdfPCell(new Paragraph("Bolsa 1 opção"));
                    cel5 = new PdfPCell(new Paragraph("Bolsa 2 opção"));
                    tabela.addCell(cel1);
                    tabela.addCell(cel2);
                    tabela.addCell(cel3);
                    tabela.addCell(cel4);
                    tabela.addCell(cel5);

                    inscricoes = daoFactory.getInscricaoDao().listar();
                    for (Inscricao i : inscricoes) {
                        cel1 = new PdfPCell(new Paragraph(i.getId().toString()));
                        cel2 = new PdfPCell(new Paragraph(i.getAluno().getNome()));
                        cel3 = new PdfPCell(new Paragraph(i.getAluno().getCpf()));
                        cel4 = new PdfPCell(new Paragraph(i.getBolsa1().getNome()));
                        cel5 = new PdfPCell(new Paragraph(i.getBolsa2().getNome()));
                        tabela.addCell(cel1);
                        tabela.addCell(cel2);
                        tabela.addCell(cel3);
                        tabela.addCell(cel4);
                        tabela.addCell(cel5);
                    }
                    document.add(tabela);
                    document.close();
                    
                    out.println("<br/><br/><br/><br/><br/><br/><br/>");                
                    out.println("<center><a href='lista_de_inscritos.pdf' target='_blank'> CLIQUE AQUI PARA VER O RELATORIO GERADO</a></center>");
                break;
                case "entrevista":
                    PdfWriter.getInstance(document, new FileOutputStream("/home/euzebio/NetBeansProjects/pnaes/web/lista_de_entrevista.pdf"));
                    document.setPageSize(PageSize.A4.rotate());
                    document.open();

                    figura = Image.getInstance("/home/euzebio/NetBeansProjects/pnaes/web/img/logo123.png");
                    figura.setAlignment(Element.ALIGN_CENTER);
                    document.add(figura);
                    figura.setSpacingAfter(20);
                    p = new Paragraph("Lista de Entrevistas",FontFactory.getFont(FontFactory.TIMES_BOLD, 18));
                    //p = new Paragraph("Data "+dataFormat.formatarData(data), FontFactory.getFont(FontFactory.TIMES_BOLD, 14));
                    p.setAlignment(1);
                    document.add(p);
                    p = new Paragraph(" ");
                    document.add(p);
                    tabela = new PdfPTable(new float[]{0.3f,1.0f,0.8f,0.5f});
                    cel1 = new PdfPCell(new Paragraph("Inscrição"));
                    cel2 = new PdfPCell(new Paragraph("Aluno"));
                    cel3 = new PdfPCell(new Paragraph("Curso"));
                    cel4 = new PdfPCell(new Paragraph("Horario"));
                    tabela.addCell(cel1);
                    tabela.addCell(cel2);
                    tabela.addCell(cel3);
                    tabela.addCell(cel4);

                    entrevistas = daoFactory.getEntrevistaDao().listar();
                    for (Entrevista e : entrevistas) {
                        cel1 = new PdfPCell(new Paragraph(e.getInscricao().getId().toString()));
                        cel2 = new PdfPCell(new Paragraph(e.getInscricao().getAluno().getNome()));
                        cel3 = new PdfPCell(new Paragraph(e.getInscricao().getAluno().getCurso().getNome()));
                        cel4 = new PdfPCell(new Paragraph(dataFormat.formatarHora(e.getDataEntrevista())));
                        tabela.addCell(cel1);
                        tabela.addCell(cel2);
                        tabela.addCell(cel3);
                        tabela.addCell(cel4);
                    }
                    document.add(tabela);
                    document.close();
                    
                    out.println("<br/><br/><br/><br/><br/><br/><br/>");                
                    out.println("<center><a href='lista_de_entrevista.pdf' target='_blank'> CLIQUE AQUI PARA VER O RELATORIO GERADO</a></center>");
                    
                break;    
            }
        } catch (DocumentException ex) {
            Logger.getLogger(ServletPdf.class.getName()).log(Level.SEVERE, null, ex);
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
