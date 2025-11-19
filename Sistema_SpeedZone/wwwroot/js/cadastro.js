
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
