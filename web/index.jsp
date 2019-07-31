<%-- 
    Document   : index
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script>
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }

            }
        </script>
        <%@include file="imports.jsp" %>
    </head>
    <body>
        <div class="all-wrapper with-side-panel solid-bg-all">
            <div class="content-w">
                <%@include file="cabecalho.jsp" %>
                <%                    session.invalidate();
                %>
                <div class="content-header-right col-md-6 col-12" >
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                        <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                            <a class="dropdown-item" href="card-bootstrap.html">Cards</a>
                            <a class="dropdown-item" href="component-buttons-extended.html">Buttons</a>
                        </div>
                    </div>
                </div>

                <div class="element-box">
                    <h5 class="form-header">Cadastro de Pessoa</h5>
                    <div class="form-desc">
                        Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking
                    </div>            
                    <div style="width: 80%" >
                        <center>
                            <div class="row">
                                <div class="col-md-3"></div>


                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header">
                                            <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                            <div class="heading-elements"></div>
                                        </div>
                                        <div class="card-content collpase show">
                                            <div class="card-body">
                                                <h4 class="auth-header">Entre com seu CPF e Senha.</h4>
                                                <form method="POST" action="ServletLogin">
                                                    <div class="form-body">
                                                        
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="cpf">CPF</label>
                                                            <div class="col-md-9">
                                                                <div class="position-relative has-icon-left">
                                                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="senha">Senha</label>
                                                            <div class="col-md-9">
                                                                <div class="position-relative has-icon-left">
                                                                    <input type="password" name="senha" id="senha" class="form-control" placeholder="Senha" required>
                                                                    <div class="form-control-position">
                                                                        <i class="fa fa-briefcase"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="buttons-w">
                                                            <button type="submit" value="Entrar" class="btn btn-primary">Entrar</button>
                                                        </div>
                                                        Não é cadastrado <a href="/pnaes/pessoa/cadastrar.jsp">Cadastre-se</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3"></div>
                            </div>
                        </center>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>