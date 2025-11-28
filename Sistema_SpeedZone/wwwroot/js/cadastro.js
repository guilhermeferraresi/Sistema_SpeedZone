
    let etapaAtual = 1;
    const totalEtapas = 3;

document.getElementById("cadastro-button-continuar").addEventListener("click", () => {
    if(etapaAtual == 1){
        etapaAtual += 1;
    document.getElementById("parteFormUm").classList.remove("visivel");
    document.getElementById("parteFormUm").classList.add("invisivel");
    document.getElementById("parteFormDois").classList.remove("invisivel");
    document.getElementById("parteFormDois").classList.add("visivel");
    document.getElementById("parteFormTres").classList.remove("visivel");
        document.getElementById("parteFormTres").classList.add("invisivel");
        document.getElementById("cadastro-button-voltar").classList.remove("invisivel");
        document.getElementById("cadastro-button-voltar").classList.add("visivel");

    } else if(etapaAtual == 2){
        etapaAtual += 1;
        document.getElementById("parteFormUm").classList.remove("visivel");
        document.getElementById("parteFormUm").classList.add("invisivel");
        document.getElementById("parteFormDois").classList.remove("visivel");
        document.getElementById("parteFormDois").classList.add("invisivel");
        document.getElementById("parteFormTres").classList.remove("invisivel");
        document.getElementById("parteFormTres").classList.add("visivel");
        document.getElementById("cadastro-button-continuar").classList.remove("visivel");
        document.getElementById("cadastro-button-continuar").classList.add("invisivel");
    }
    
    });

document.getElementById("cadastro-button-voltar").addEventListener("click", () => {
    if (etapaAtual == 2) {
        etapaAtual -= 1;
        document.getElementById("parteFormUm").classList.remove("invisivel");
        document.getElementById("parteFormUm").classList.add("visivel");
        document.getElementById("parteFormDois").classList.remove("visivel");
        document.getElementById("parteFormDois").classList.add("invisivel");
        document.getElementById("parteFormTres").classList.remove("visivel");
        document.getElementById("parteFormTres").classList.add("invisivel");
        document.getElementById("cadastro-button-voltar").classList.remove("visivel");
        document.getElementById("cadastro-button-voltar").classList.add("invisivel");

    } else if (etapaAtual == 3) {
        etapaAtual -= 1;
        document.getElementById("parteFormUm").classList.remove("visivel");
        document.getElementById("parteFormUm").classList.add("invisivel");
        document.getElementById("parteFormDois").classList.remove("invisivel");
        document.getElementById("parteFormDois").classList.add("visivel");
        document.getElementById("parteFormTres").classList.remove("visivel");
        document.getElementById("parteFormTres").classList.add("invisivel");
        document.getElementById("cadastro-button-continuar").classList.remove("invisivel");
        document.getElementById("cadastro-button-continuar").classList.add("visivel");
    }

});


//$(document).ready(function () {
//    $(".cep").mask("00.000-000");
//});

//$(document).ready(function () {
//    function limpa_formulário_cep() {
//        // Limpa valores do formulário de cep.
//        $("#Estado").val("");
//        $("#Cidade").val("");
//        $("#Endereco").val("");
//        $("#Bairro").val("");
//        $("#Complemento").val("");
//    }

//    //Quando o campo cep perde o foco.
//    $("#CEP").blur(function () {

//        //Nova variável "cep" somente com dígitos.
//        var cep = $(this).val().replace(/\D/g, '');

//        //Verifica se campo cep possui valor informado.
//        if (cep != "") {

//            //Expressão regular para validar o CEP.
//            var validacep = /^[0-9]{8}$/;

//            //Valida o formato do CEP.
//            if (validacep.test(cep)) {

//                //Preenche os campos com "..." enquanto consulta webservice.
//                $("#Estado").val("...");
//                $("#Cidade").val("...");
//                $("#Logradouro").val("...");
//                $("#Bairro").val("...");
//                $("#Complemento").val("...");

//                //Consulta o webservice viacep.com.br/
//                $.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?", function (dados) {

//                    if (!("erro" in dados)) {
//                        //Atualiza os campos com os valores da consulta.
//                        $("#Estado").val(dados.uf);
//                        $("#Cidade").val(dados.localidade);
//                        $("#Logradouro").val(dados.logradouro);
//                        $("#Bairro").val(dados.bairro);
//                        $("#Complemento").val(dados.complemento);
//                    } //end if.
//                    else {
//                        //cep é inválido.
//                        limpa_formulário_cep();
//                        alert("Formato de CEP inválido.");
//                    }
//                });
//            } //end if.
//            else {
//                //cep sem valor, limpa formulário.
//                limpa_formulário_cep();
//            }
//        });
//});
