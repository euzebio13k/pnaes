<%@page import="modelo.Categoria"%>
<%@page import="util.DataFormat"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Inscricao"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Horario</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Marcar Entrevista</h4>
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
                                                        <div class="col-md-12">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Bolsa</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pesquisa" class="form-control">
                                                                                <option value="">Selecione a Bolsa</option>
                                                                                <%                                                                                    
                                                                                    DataFormat dataFormat = new DataFormat();
                                                                                    List<Bolsa> bolsas = daoFactory.getBolsaDao().listar();
                                                                                    for (Bolsa b : bolsas) {
                                                                                        out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pCat">Pesquisa por Categoria</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pCat" class="form-control">
                                                                                <option value="">Selecione a Categoria</option>
                                                                                <%
                                                                                    List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                                    for (Categoria c : categorias) {
                                                                                        out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                <i class="fa fa-check-square-o"></i>Buscar
                                                                            </button>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <div style="margin: 25px 50px 75px 100px;">
                                                                                <button class="btn btn-primary" onclick="generate()">
                                                                                    <i class="fa fa-check-square-o"></i>Gerar PDF
                                                                                </button>
                                                                            </div>
                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </form>                                                            
                                                        </div>
                                                    </div>
                                                    <form method="POST" action="../ServletEntrevista?opcao=cadastrar" class="form-horizontal">
                                                        <table class="table table-striped table-responsive-md">
                                                            
                                                            <tr>
                                                                <th>Data</th>
                                                                <th><input class="form-control" name="dataEntrevista" type="date" value=""></th>
                                                                <th>Local</th>
                                                                <th><input class="form-control" name="local" type="text" value=""></th>
                                                            </tr>
                                                            <tr>
                                                                <th>Inscrição</th>
                                                                <th>Aluno</th>
                                                                <th>Curso</th>
                                                                <th>Horario</th>
                                                                <th>Marcar</th>
                                                            </tr>
                                                            <%                                                            
                                                                List<Inscricao> inscricoes = daoFactory.getInscricaoDao().listar();
                                                                int k = 0;
                                                                
                                                                for (Inscricao i : inscricoes) {
                                                                    System.out.println("i = "+i.getId());
                                                                    if (i.getStatusEntrevista().getStatus().equals("Pendente")) {
                                                            %>
                                                            <tr>
                                                                <td><input name="i_id<%=k%>" type="hidden" value="<%=i.getId()%>"><%=i.getId()%></td>
                                                                <td><%=i.getAluno().getNome()%></td>
                                                                <td><%=i.getAluno().getCurso().getNome()%></td>
                                                                <td><input class="form-control" name="horario" type="text" maxlength="5" OnKeyPress="formatar('##:##', this)"></td>
                                                                <td><input class="btn btn-primary" name="marcar<%=k%>" type="submit" value="Marcar"/>
                                                                    <input type="hidden" name="k<%=k%>" value="<%=k%>"></td>                                             
                                                            </tr>
                                                            <%
                                                                    }
                                                                    k++;
                                                                }
                                                            %>
                                                        </table>
                                                        <input type="hidden" name="total" value="<%=k%>">
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