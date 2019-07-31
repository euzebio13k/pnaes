<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Edital</title>        
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
        </script>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <% session.getAttribute("aluno_id");
        %>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Cadastro de Orçamento Mensal</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>


                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>

                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletOrcamentoMensal?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                       

                                                                <div class="form-body">
                                                                    <div class="form-body">
                                                                        <h4 class="form-section"><i class="ft-user"></i>Dados das Despesas Mensais</h4>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="moradia">Moradia:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="moradia" id="moradia" class="form-control" placeholder="Moradia  no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="agua">Agua:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="agua" id="agua" class="form-control" placeholder="Agua no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="energia">Energia:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="energia" id="energia" class="form-control" placeholder="Energia no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="telefone">Telefone:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="telefone" id="telefone" class="form-control" placeholder="Telefone no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="farmacia">Farmacia:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="farmacia" id="farmacia" class="form-control" placeholder="Farmacia no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="outrasDespesas">Outras Despesas:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="outrasDespesas" id="outrasDespesas" class="form-control" placeholder="Outras Despesas no formato 00.00">
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
                                                        </div>                                                            
                                                    </form>
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

