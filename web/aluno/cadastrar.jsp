<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../imports.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Aluno</title>

        <script type="text/javascript" >
            $(document).ready(function () {
                $('#cat').change(function () {
                    $('#curso').load('../cursoajax.jsp?categoria=' + $('#cat').val());
                });

            });
        </script>

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
                                                <h4 class="card-title" id="striped-row-layout-icons">Sistema PNAES</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>

                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=preencher&id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="matricula">Matricula</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="matricula" id="matricula" class="form-control" placeholder="Numero de Matricula" required>
                                                                        <div class="form-control-position">
                                                                            <i class="ft-user"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso</label>
                                                                <div class="col-md-9">
                                                                    <select id="cat" name="cat" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione Modalidade</option>
                                                                        <%
                                                                            List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                            for (Categoria categoria : categorias) {
                                                                                out.print("<option value=" + categoria.getId() + ">" + categoria.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="curso">Curso</label>
                                                                <div class="col-md-9">
                                                                    <select id="curso" name="curso" class="form-control" required>
                                                                    </select>
                                                                </div>
                                                            </div>        
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodo">Periodo</label>
                                                                <div class="col-md-9">
                                                                    <select id="periodo" name="periodo" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione Ano/Modulo/Periodo</option>
                                                                        <option value="1 Ano/Modulo/Periodo">1 Ano/Modulo/Periodo</option>
                                                                        <option value="2 Ano/Modulo/Periodo">2 Ano/Modulo/Periodo</option>
                                                                        <option value="3 Ano/Modulo/Periodo">3 Ano/Modulo/Periodo</option>
                                                                        <option value="4 Periodo">4 Periodo</option>
                                                                        <option value="5 Periodo">5 Periodo</option>
                                                                        <option value="6 Periodo">6 Periodo</option>
                                                                        <option value="7 Periodo">7 Periodo</option>
                                                                        <option value="8 Periodo">8 Periodo</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="onibus" value="Onibus" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="onibus">Onibus</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="carro" value="Carro" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="carro">Carro</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="moto" value="Moto" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="moto">Moto</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="bicicleta" value="Bicicleta" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="bicicleta">Bicicleta</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="ape" value="A pé" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ape">A pé</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="carona" value="Carona" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="carona">Carona</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou o Ensino Medio em Escola:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPu" value="Publico" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPu">Pública</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPa" value="Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPa">Particular</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPp" value="Publica/Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPp">Pública/Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Escola:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPu" value="Publico" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPu">Pública</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPa" value="Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPp" value="Publica/Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPp">Pública/Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="entrada">Como você ingressou no IFTO:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada1" value="Ampla concorrencia" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada1">Vestibular por ampla concorrência</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada2" value="Cota" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada2">Vestibular por cotas</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada3" value="Sisu" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada3">Sisu por ampla concorrência</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada4" value="SisuCota" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada4">Sisu por cotas</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="visita">Qual o melhor horario para uma visita, se necessário:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="visita" id="visita1" value="Manha" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita1">Manhã</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="visita" id="visita2" value="Tarde" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita2">Tarde</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="visita" id="visita3" value="Noite" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita3">Noite</label>
                                                                        </div>
                                                                        <div class="form-group row">
                                                                            <label class="col-md-3 label-control" for="renda">Renda do Aluno:</label>
                                                                            <div class="col-md-9">
                                                                                <input type="text" name="renda" id="renda" class="form-control" placeholder="Renda Aluno no formato 00.00">
                                                                            </div>
                                                                        </div>
                                                                    </div>
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
