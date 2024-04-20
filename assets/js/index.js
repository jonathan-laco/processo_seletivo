$(document).ready(function() {
    //código funcional, mas não seguro
    //exposição da api
    //deveria ser implementado um sistema de autenticação para que essa api não ficasse exposta
    function getResults(searchValue) {
        $.ajax({
            url: "get.php",
            type: "GET",
            dataType: "json",
            data: { search: searchValue }, 
            success: function(response) {
                var results = response.results;
                $("#results tbody").empty();
                if (results.length > 0) {
                    $.each(results, function(index, result) {
                        var row = "<tr><td>" + result.nome + "</td><td>" + result.filhos + "</td></tr>";
                        $("#results tbody").append(row);
                    });
                    if (results.length > 5) {
                        var message = "Existem mais de 5 registros. Refine sua pesquisa.";
                        $("#message").empty().text(message).addClass("error-message");
                    } else {
                        $("#message").empty().removeClass("error-message");
                    }
                } else {
                    var message = "Nenhum registro encontrado.";
                    $("#message").text(message).removeClass("error-message");
                }
            },
            error: function() {
                console.log("Erro ao obter os resultados do servidor.");
            }
        });
    }
    getResults("");

    $("#searchInput").keyup(function() {
        var searchValue = $(this).val();
        getResults(searchValue);
    });
    $("#searchButton").click(function() {
        var searchValue = $("#searchInput").val();
        getResults(searchValue);
    });
});
