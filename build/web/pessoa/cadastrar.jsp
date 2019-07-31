<%-- 
    Document   : cadastrarPessoa
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
        <%@include file="../imports.jsp" %>
        <script>
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
    </head>
    <body>
        <div class="element-box">
            <h5 class="form-header">Cadastro de Pessoa</h5>
            <div class="form-desc">
                Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking
            </div>
            <div style="width: 80%" >
                <!-- Basic form layout section start -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements"></div>
                            </div>
                            <div class="card-content collpase show">
                                <div class="card-body">
                                    <form method="Post" action="../ServletAluno?opcao=cadastrar" class="form form-horizontal">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cpf">CPF</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>
                                                </div>
                                            </div>
                                            <script>
                                                
                                            </script>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="rg">RG</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição</label>
                                                <div class="col-md-9">
                                                    <select id="ufe" name="ufe" class="form-control" required>
                                                        <option selected="" disabled="">Selecione a UF de Expedição</option>
                                                        <%
                                                            DaoFactory daoFactory = new DaoFactory();
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
                                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom" required>
                                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                                        </div>
                                                        <div class="d-inline-block custom-control custom-radio">
                                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof" required>
                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="email">Email</label>
                                                <div class="col-md-9">
                                                    <input type="email" name="email" id="email"  class="form-control" placeholder="Email" required>
                                                </div>
                                            </div>                                                
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="telefone">Telefone</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="atividadeProf">Atividade Profissional</label>
                                                <div class="col-md-9">
                                                    <select id="atividadeProf" name="atividadeProf" class="form-control" required>
                                                        <option selected="" disabled="">Selecione a Atividade Profissional</option>
                                                        <option value="Desempregado">Desempregado</option>
                                                        <option value="Empregado CLT">Empregado de carteira Assinada</option>
                                                        <option value="Autonomo">Autonomo</option>
                                                        <option value="Funcionanio Publico">Funcionario Publico</option>
                                                        <option value="Aposentado">Aposesntado</option>   
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                            <input type="radio" name="carteira" value="sim" class="custom-control-input" id="carteirasim" required>
                                                            <label class="custom-control-label" for="carteirasim">Sim</label>
                                                        </div>
                                                        <div class="d-inline-block custom-control custom-radio">
                                                            <input type="radio" name="carteira" value="nao" class="custom-control-input" id="carteiranao" required>
                                                            <label class="custom-control-label" for="carteiranao">Não</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Endereço</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="logradouro">Logradouro</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="logradouro" id="logradouro" class="form-control" placeholder="Logradouro" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="numero">Numero</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="bairro">Bairro</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="bairro" id="bairro" class="form-control" placeholder="Bairro" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="complemento">Complemento</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="complemento" id="complemento" class="form-control" placeholder="Complemento">                                              </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cep">CEP</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="cep" id="cep" class="form-control" placeholder="CEP" maxlength="10" OnKeyPress="formatar('##.###-###', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="uf">Uf</label>
                                                <div class="col-md-9">
                                                    <select id="uf" name="uf" class="form-control" required>
                                                        <option selected="" disabled="">Selecione a UF</option>
                                                        <%
                                                            List<Uf> ufs = daoFactory.getUfDao().listar();
                                                            for (Uf uf : ufs) {
                                                                out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cidade">Cidade</label>
                                                <div class="col-md-9">
                                                    <select id="cidade" name="cidade" class="form-control" required>
                                                    </select>
                                                </div>
                                            </div>        
                                            <h4 class="form-section"><i class="ft-user"></i>Senha</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="senha">Senha</label>
                                                <div class="col-md-9">
                                                    <input type="password" name="senha" id="senha" class="form-control" placeholder="Digite uma senha" onkeyup="javascript:verifica()" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="csenha">Confirmar Senha</label>
                                                <div class="col-md-9">
                                                    <input type="password" name="csenha" id="csenha" class="form-control" placeholder="Repita a senha" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <button type="reset" value="Limpar"  class="btn btn-warning mr-1">
                                                <i class="ft-x"></i> Limpar
                                            </button>
                                            <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
                                                <i class="la la-check-square-o"></i> Enviar
                                            </button>
                                        </div>                                                    
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                            
    </body>
</html>