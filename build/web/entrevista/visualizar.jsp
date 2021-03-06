<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>

<%@page import="modelo.Aluno"%>
<%@page import="modelo.Entrevista"%>
<%@page import="java.util.List"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.OrcamentoMensal"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Inscricao"%>

<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../estilo.css">
        <title>JSP Page</title>
    </head>
    <body class="site">
          <%
                Empresa empresa = new Empresa();
                DaoFactory daoFactory = new DaoFactory();
                Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                List<Empresa> empresas = new DaoFactory().getEmpresaDao().perquisarPorAluno(inscricao.getAluno().getId());
                OrcamentoMensal orcamentoMensal = new DaoFactory().getOrcamentoMensalDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);
                FichaMedica fichaMedica = new DaoFactory().getFichaMedicaDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);
                if(empresas.size()!= 0){
                    empresa = empresas.get(0);
                }
          
          
          %>
            
        <table>
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
                 <td><%=inscricao.getAluno().getDtn().getTime()%></td>
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
                <th>Numero de Dependente</th>
                <td><%=inscricao.getAluno().getQuantidadeDependente()%></td>
            </tr>
            <tr>    
                <th>Dos Dependentes quantos São Idoso</th>
                <td><%=inscricao.getAluno().getQuantidadeIdoso()%></td>
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
                <th>Renda do aluno</th>
                <td><%=orcamentoMensal.getRenda()%></td>
            </tr>
            <tr>    
                <th>Renda dos familia</th>
                <td><%=orcamentoMensal.getRendaDeps()%></td>
            </tr>
            <tr>    
                <th>Despesas da familia</th>
                <%
                    Double total = orcamentoMensal.getAgua() + orcamentoMensal.getEnergia() +
                    orcamentoMensal.getFarmacia() + orcamentoMensal.getMoradia() + orcamentoMensal.getOutrasDespesas() + orcamentoMensal.getTelefone();
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
                      
         <%@include file="../rodape.jsp"%>  
    </body>
</html>
