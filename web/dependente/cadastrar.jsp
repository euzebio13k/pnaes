<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Dependente</title>
        <script language=JavaScript src="../jquery.js" type="text/javascript"></script>
        <script type="text/javascript" >
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Cadastro de Dependente</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDependente?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cpf">CPF</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="rg">RG</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição</label>
                                                                <div class="col-md-9">
                                                                    <select id="ufe" name="ufe" class="form-control">
                                                                        <option selected="" disabled="">Selecione a UF de Expedição</option>
                                                                        <%
                                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="sexo">Sexo</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom">
                                                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof">
                                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="email">Email</label>
                                                                <div class="col-md-9">
                                                                    <input type="email" name="email" id="email"  class="form-control" placeholder="Email">
                                                                </div>
                                                            </div>                                                
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone</label>
                                                                <div class="col-md-9">
                                                                    <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="grauParentesco">Grau de Parentesco</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="grauParentesco" id="grauParentesco"  class="form-control" placeholder="Grau de Parentesco">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividadeProf">Atividade Ocupacional</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividadeProf" name="atividadeProf" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione a Atividade Profissional</option>
                                                                        <option value="Desempregado">Desempregado</option>
                                                                        <option value="Empregado CLT">Empregado de carteira Assinada</option>
                                                                        <option value="Autonomo">Autonomo</option>
                                                                        <option value="Funcionanio Publico">Funcionario Publico</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Renda</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda"  class="form-control" placeholder="Renda Mensa no formato 00.00">
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