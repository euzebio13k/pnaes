<div style="margin-left: 20px">
    <%
        if (session.getAttribute("nivel").equals(1) || session.getAttribute("nivel").equals(3)) {
    %>
    <br>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <div class="element-info-with-icon">
                        <div class="element-info-icon">
                            <div class="os-icon os-icon-wallet-loaded"></div>
                        </div>
                        <div class="element-info-text">
                            <h5 class="element-inner-header">
                                PNAES - IFTO - TO
                            </h5>
                            <div class="element-inner-desc">
                                Discharge best employed your phase each the of shine. Be met even.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xl-4">
                <div class="element-box">
                    <h5 class="form-header">
                        INFORMAÇÕES DO ESTUDANTE
                    </h5>
                    <div class="form-desc">Make a paragraph stand out by adding
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <a href="/pnaes/aluno/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">1 Passo</button> </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                OCUPAÇÃO DO ESTUDANTE
                            </h5>
                            <div class="form-desc">Make a paragraph stand out by adding
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <a href="/pnaes/empresa/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">2 Passo</button> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                INFORMAÇÕES DO GRUPO FAMILIAR
                            </h5>
                            <div class="form-desc">Make a paragraph stand out by adding
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <a href="/pnaes/dependente/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">3 Passo</button> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                DESPESAS
                            </h5>
                            <div class="form-desc">Make a paragraph stand out by adding
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <a href="/pnaes/orcamentoMensal/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">4 Passo</button> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                SAÚDE
                            </h5>
                            <div class="form-desc">Make a paragraph stand out by adding
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <a href="/pnaes/fichaMedica/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">5 Passo</button> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="element-box">
                    <h5 class="form-header">
                        ENVIAR DOCUMENTAÇÃO
                    </h5>
                    <div class="form-desc">Make a paragraph stand out by adding
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <a href="/pnaes/documento/upload.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">6 Passo</button> </a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <%
        }
    %>
</div>