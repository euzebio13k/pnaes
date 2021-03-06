<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.OrcamentoMensal"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Documentos</title>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menuPdf.jsp" %>
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
                            <div style="width: 95%">
                                <br>
                                <div class="row">
                                    <div class="col-md-6" id="pdf">

                                        <script>
                                            function abrir(ele) {
                                                var elem = document.getElementById('dinamic_iframe');
                                                if (elem !== null) { // remover caso exista
                                                    elem.remove();
                                                }
                                                var iframe = document.createElement('iframe');
                                                iframe.src = ele.href;
                                                iframe.id = 'dinamic_iframe';
                                                iframe.width = "100%";
                                                iframe.height = 1800;
                                                document.getElementById("pdf").appendChild(iframe);
                                                return false;
                                            }
                                        </script>
                                    </div>
                                    <div class="col-md-6">
                                        <%                                            
                                            Empresa empresa = new Empresa();
                                            DaoFactory daoFactory = new DaoFactory();
                                            DataFormat dataFormat = new DataFormat();
                                            Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                                            List<Dependente> deps = daoFactory.getDependenteDao().perquisarPorAluno(inscricao.getAluno().getId());
                                            List<Empresa> empresas = new DaoFactory().getEmpresaDao().perquisarPorAluno(inscricao.getAluno().getId());
                                            OrcamentoMensal orcamentoMensal = new DaoFactory().getOrcamentoMensalDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);
                                            FichaMedica fichaMedica = new DaoFactory().getFichaMedicaDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);
                                            if (empresas.size() != 0) {
                                                empresa = empresas.get(0);
                                            }
                                            Integer alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());
                                            
                                            Edital edital = daoFactory.getEditalDao().listar().get(0);
                                            //System.out.println("/pnaes/"+edital.getNumero()+"/alunos/"+aluno.getCpf()+"/"+aluno.getCpf()+".jpg");
                                        %>
                                        <div class="col-md-3">
                                            <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200">
                                        </div>
                                        <table class="table table-striped table-responsive-md">
                                            <tr>
                                                <th>Nome:</th>
                                                <td><%=inscricao.getAluno().getNome()%></td>
                                            </tr>
                                            <tr>
                                                <th>CPF:</th>
                                                <td><%=inscricao.getAluno().getCpf()%></td>
                                            </tr> 
                                            <tr>
                                                <th>RG</th>
                                                <td><%=inscricao.getAluno().getRg()%></td>
                                            </tr>
                                            <tr>    
                                                <th>UF de Expedição</th>
                                                <td><%=inscricao.getAluno().getUfExpedicao().getNome()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Sexo</th>
                                                <td><%=inscricao.getAluno().getSexo()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Data Nascimento</th>
                                                <td><%=dataFormat.formatarData(inscricao.getAluno().getDtn())%></td>
                                            </tr>
                                            <tr>    
                                                <th>Telefone</th>
                                                <td><%=inscricao.getAluno().getTelefone()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Email</th>
                                                <td><%=inscricao.getAluno().getEmail()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Lougradouro</th>
                                                <td><%=inscricao.getAluno().getEndereco().getLogradouro()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Complemento</th>
                                                <td><%=inscricao.getAluno().getEndereco().getComplemento()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Numero</th>
                                                <td><%=inscricao.getAluno().getEndereco().getNumero()%></td>
                                            </tr>
                                            <tr>
                                                <th>Bairro</th>
                                                <td><%=inscricao.getAluno().getEndereco().getBairro()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Cidade</th>
                                                <td><%=inscricao.getAluno().getEndereco().getCidade().getNome()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Estado</th>
                                                <td><%=inscricao.getAluno().getEndereco().getCidade().getUf().getNome()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Matricula</th>
                                                <td><%=inscricao.getAluno().getMatricula()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Curso</th>
                                                <td><%=inscricao.getAluno().getCurso()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Periodo </th>
                                                <td><%=inscricao.getAluno().getPeriodo()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Já reprovou, qual materia</th>
                                                <td><%=inscricao.getAluno().getDisciplina()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Já foi bolsista, qual a Bolsa</th>
                                                <td><%=inscricao.getBolsaAnterior().getNome()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Qual ano</th>
                                                <td><%=inscricao.getAno()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Qual meio de Transporte</th>
                                                <td><%=inscricao.getAluno().getMeioTransporte()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Nome da empresa que trabalha</th>
                                                <td><%=empresa.getNome()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Telefone da Empresa</th>
                                                <td><%=empresa.getTelefone()%></td>
                                            </tr>
                                            
                                            <tr>    
                                                <th>Despesas da familia</th>
                                                    <%
                                                        Double total = orcamentoMensal.getAgua() + orcamentoMensal.getEnergia()
                                                                + orcamentoMensal.getFarmacia() + orcamentoMensal.getMoradia() + orcamentoMensal.getOutrasDespesas() + orcamentoMensal.getTelefone();
                                                    %>
                                                <td><%=total%></td>
                                            </tr>
                                            <tr>    
                                                <th>Você tem alguma doença crônica,qual?</th>
                                                <td><%=fichaMedica.getDoencaCronica()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Você faz uso de medicamento controlado?</th>
                                                <td><%=fichaMedica.getMedicamento()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Você tem alguma deficiência,qual?</th>
                                                <td><%=fichaMedica.getDeficiencia()%></td>
                                            </tr>
                                            <tr>    
                                                <th>Há pessoa(s) na familia com deficiência,qual?</th>
                                                <td><%=fichaMedica.getDeficienciaDep()%></td>
                                            </tr>
                                        </table>
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Documentos faltantes</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                                                        <div class="form-body">

                                                            <div class="form-group row">
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbrg" id="cbrg" value="" class="custom-control-input">
                                                                            <label class="custom-control-label" for="cbrg">RG</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbcpf" id="cbcpf" value="" class="custom-control-input">
                                                                            <label class="custom-control-label" for="cbcpf">CPF</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbendereco" id="cbendereco" value="" class="custom-control-input">
                                                                            <label class="custom-control-label" for="cbendereco">Comprovante de Endereco</label>
                                                                        </div>                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <label class="col-md-3 label-control" for="resultado">Resultado</label>
                                                                        <div class="col-md-9">
                                                                            <select id="resultado" name="resultado" class="form-control" required>
                                                                                <option selected="" disabled="">Selecione o Resultado</option>
                                                                                <option value="Classificado">Classificado</option>
                                                                                <option value="Classificado com falta de documentos">Classificado com falta de documentos</option>
                                                                                <option value="Eliminado">Eliminado</option>
                                                                            </select>
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