<%-- 
    Document   : index
    Created on : 16/03/2017, 20:50:10
    Author     : euzebio
--%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="estilo.css">
        <title>JSP Page - Login</title>
    <link href="favicon.png" rel="shortcut icon">
    <link href="apple-touch-icon.png" rel="apple-touch-icon">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet" type="text/css">
    <link href="bower_components/select2/dist/css/select2.min.css" rel="stylesheet">
    <link href="bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="bower_components/dropzone/dist/dropzone.css" rel="stylesheet">
    <link href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="bower_components/perfect-scrollbar/css/perfect-scrollbar.min.css" rel="stylesheet">
    <link href="bower_components/slick-carousel/slick/slick.css" rel="stylesheet">
    <link href="css/main.css?version=4.4.0" rel="stylesheet">
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
    </head>
    <body  class="auth-wrapper">
 <div class="all-wrapper menu-side with-pattern">
      <div class="auth-box-w">
        <div class="logo-w">
          <a href="index.html"><img alt="" src="img/logo-big.png"></a>
        </div>
        <h4 class="auth-header">
          Entre com seu CPF e Senha.
        </h4>
        <center>
        <div class="alert alert-danger" role="alert" style="width: 80%">
        <strong>CPF </strong>incorreto, tente novamente.
      </div>
      </center>
        <form method="POST" action="ServletLogin">
          <div class="form-group">
            <label for="cpf">CPF</label>
            <input name="cpf" class="form-control" placeholder="Seu numero de CPF" type="text" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>
            <div class="pre-icon os-icon os-icon-user-male-circle"></div>
          </div>
          <div class="form-group">
            <label for="senha">Senha</label>
            <input  type="password" name="senha" class="form-control" placeholder="Senha">
            <div class="pre-icon os-icon os-icon-fingerprint"></div>
          </div>
          <div class="buttons-w">
            <button type="submit" value="Entrar" class="btn btn-primary">Entrar</button>
            <div class="form-check-inline">
              <label class="form-check-label"><input class="form-check-input" type="checkbox">Lembrar Senha</label>
             </div>
             <a href="/pnaes/pessoa/cadastrar.jsp"> Cadastrar</a>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>

