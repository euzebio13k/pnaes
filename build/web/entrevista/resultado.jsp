<%-- 
    Document   : listarEntrevista
    Created on : 15/02/2018, 08:15:22
    Author     : ronan
--%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Resultado</title>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            function apagar(id) {
                if (window.confirm("Deseja realmente excluir?")) {
                    var url = "../ServletBolsa?opcao=excluir&id=" + id;
                    window.location = url;
                }
            }
        </script>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">
            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Resultado</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Inscrição</th>
                                                            <th>Aluno</th>
                                                            <th>Observação</th>
                                                            <th>Resultado</th>                   
                                                        </tr>
                                                        <%
                                                            List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().listar();
                                                            for (Entrevista e : entrevistas) {
                                                                out.println("<tr>");
                                                                out.println("<td>" + e.getInscricao().getId() + "</td>");
                                                                out.println("<td>" + e.getInscricao().getAluno().getNome() + "</td>");
                                                                out.println("<td>" + e.getObservacao() + "</td>");
                                                                out.println("<td>" + e.getResultado() + "</td>");
                                                            }
                                                        %>
                                                    </table>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>