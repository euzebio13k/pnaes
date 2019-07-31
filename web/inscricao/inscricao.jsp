<%-- 
    Document   : inscricao
    Created on : 05/03/2018, 20:32:36
    Author     : euzebio
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Bolsa</title>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <div class="content-header-right col-md-6 col-12" >
                            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="card-bootstrap.html">Cards</a>
                                    <a class="dropdown-item" href="component-buttons-extended.html">Buttons</a>
                                </div>
                            </div>
                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Dados da Inscrição</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <%    
                                                        List<Bolsa> bolsas;
                                                        GregorianCalendar dataAtual = new GregorianCalendar();
                                                        if (dataAtual.getTimeInMillis() >= edital.getDataInicial().getTimeInMillis() && dataAtual.getTimeInMillis() <= edital.getDataFinal().getTimeInMillis()) {
                                                           
                                                        } else {
                                                    %>
                                                    <script>
                                                        window.alert("Não tem nenhum edital aberto");
                                                        window.location.href = "../home.jsp";
                                                    </script>
                                                    <%
                                                        }

                                                    %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=inscricao&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <input type="hidden" name="ed" value="<%=edital.getId()%>">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="reprovou">Nome das discipplinas que reprovou no ultimo semestre</label>
                                                                <div class="col-md-9">
                                                                    <textarea  class="form-control" id="reprovou" cols="40" rows="4" name="reprovou"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ano">Em que ano recebeu bolsa pela ultima vez</label>
                                                                <div class="col-md-9">
                                                                    <select id="ano" name="ano" class="form-control" required>
                                                                        <option value="Nunca">Nunca recebi bolsa</option>
                                                                        <option value="2015">2015</option>
                                                                        <option value="2016">2016</option>
                                                                        <option value="2017">2017</option>
                                                                        <option value="2018">2018</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bolsaAnterior">Qual a ultima bolsa que recebeu</label>
                                                                <div class="col-md-9">
                                                                    <select id="ufe" name="bolsaAnterior" class="form-control">
                                                                        
                                                                        <%

                                                                            bolsas = daoFactory.getBolsaDao().listar();
                                                                            for (Bolsa b : bolsas) {
                                                                                out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>                
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bolsa1">1 opção de bolsa</label>
                                                                <div class="col-md-9">
                                                                    <select id="bolsa1" name="bolsa1" class="form-control" required>
                                                                        <option>Selecione a bolsa</option>
                                                                        <%
                                                                            bolsas = daoFactory.getBolsaDao().listar();
                                                                            for (Bolsa b : bolsas) {
                                                                                out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bolsa2">2 opção de bolsa</label>
                                                                <div class="col-md-9">
                                                                    <select id="bolsa2" name="bolsa2" class="form-control" required>
                                                                        <option value="">Selecione a bolsa</option>
                                                                        <%
                                                                            bolsas = daoFactory.getBolsaDao().listar();
                                                                            for (Bolsa b : bolsas) {
                                                                                out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i>Enviar
                                                                </button>
                                                            </div>

                                                        </div>
                                                    </form>
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