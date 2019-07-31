<%@page import="modelo.Inscricao"%>
<%@page import="dao.DaoFactory"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <%@include file="imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">
            <!-- popup -->
            <div class="all-wrapper solid-bg-all">
                <%@include file="sugestoes.jsp" %>
                <div class="layout-w">
                    <%@include file="menu.jsp" %>
                    <div class="content-w">
                        <%@include file="cabecalho.jsp" %>
                        <%                            
                            if (session.getAttribute("nivel").toString().equals("1")) {
                                try {
                                    Inscricao i = (Inscricao) daoFactory.getInscricaoDao().perquisarPorAluno(alunoId).get(0);
                                    out.println("<br/><br/><br/><br/><br/><center><h1>Inscrição Efetuada Com Susseso!</h1></center>");
                                } catch (Exception e) {
                        %>
                        <%@include file="menuAluno.jsp" %>
                        <%                            
                                }
                            } else {
                        %>
                        <%@include file="menuAluno.jsp" %>
                        <%                            
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>