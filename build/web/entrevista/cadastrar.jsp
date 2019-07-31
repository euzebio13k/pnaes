<%-- 
    Document   : entrevistar
    Created on : 17/05/2018, 08:17:06
    Author     : ronan
--%>

<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Entrevista</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Entrevistar</h4>
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
                                                        Entrevista entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                                                    %>
                                                    <div class="col-md-3">
                                                        <img src="/pnaes/img/alunos/<%=entrevista.getInscricao().getAluno().getCpf()%>/<%=entrevista.getInscricao().getAluno().getCpf()%>" width="150" height="200">
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEntrevista?opcao=entrevistar&e_id=<%=entrevista.getId()%>">
                                                        <div class="form-body">
                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>
                                                                    <th>Numero da Inscrição:</th>
                                                                    <td><%=entrevista.getInscricao().getId()%></td>
                                                                </tr> 
                                                                <tr>
                                                                    <th>Nome:</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getNome()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>CPF:</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getCpf()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="observacao">Observação</label></td>
                                                                    <td><textarea  cols="40" rows="4" name="observacao"></textarea></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="df">Documentos Faltantes</label></td>
                                                                    <td><input type="text" name="df" value="<%=entrevista.getInscricao().getDocumentosFaltantes()%>" id="df" class="form-control" placeholder="Valor" required></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="vulnerabilidade">Vulnerabilidade Social</label></td>
                                                                    <td><select id="resultado" name="vulnerabilidade" class="form-control" required>
                                                                            <option value="Nula">Nula</option>
                                                                            <option value="Baixa">Baixa</option>
                                                                            <option value="Media">Media</option>
                                                                            <option value="Alta">Alta</option>
                                                                        </select></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="resultado">Resultado</label></td>
                                                                    <td><select id="resultado" name="resultado" class="form-control" required>
                                                                                    <option selected="" disabled="">Selecione o Resultado</option>
                                                                                    <option value="Aprovado">Aprovado</option>
                                                                                    <option value="Eliminado">Eliminado</option>
                                                                        </select></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                        <i class="ft-x"></i> Limpar
                                                                    </button>
                                                                    <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                        <i class="fa fa-check-square-o"></i>Enviar
                                                                    </button></td>
                                                                </tr>
                                                            </table>
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