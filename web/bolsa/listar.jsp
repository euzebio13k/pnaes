<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Bolsa</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Cadastrar Bolsa</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/bolsa/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Cadastar Bolsa</button></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar bolsa</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome da bolsa">
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                <i class="fa fa-check-square-o"></i>Buscar
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <%                                                        
                                                        List<Bolsa> bolsas = new ArrayList<Bolsa>();
                                                        String nomeBolsa;
                                                        if (request.getParameter("pesquisa") != null) {
                                                            if (request.getParameter("pesquisa") != "") {
                                                                nomeBolsa = request.getParameter("pesquisa");
                                                                bolsas = daoFactory.getBolsaDao().pesquisarPor(nomeBolsa, "nome");
                                                            } else {
                                                                bolsas = daoFactory.getBolsaDao().listar();
                                                            }
                                                        } else {
                                                            bolsas = daoFactory.getBolsaDao().listar();
                                                        }
                                                    %>    
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th>Valor</th>
                                                            <th>Editar</th>
                                                            <th>Excluir</th>
                                                        </tr>
                                                        <%
                                                            for (Bolsa b : bolsas) {
                                                                if (b.getId() != 0) {
                                                        %>
                                                        <tr>
                                                            <td><%=b.getId()%></td>
                                                            <td><%=b.getNome()%></td>
                                                            <td>R$ = <%=b.getValor()%></td>
                                                            <td><a href="alterar.jsp?id=<%=b.getId()%>"><img src="/pnaes/img/editar.png"/></a></td>
                                                            <td><a href="#" onclick="apagar(<%=b.getId()%>)"><img src="/pnaes/img/excluir.png"/></a></td>

                                                        </tr>
                                                        <%
                                                                }
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