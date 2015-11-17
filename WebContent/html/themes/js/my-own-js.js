$( document ).ready(function() {
	console.log("JS Carregado com Sucesso!\n");

//essas funções não podem ser executadas no console	
	$("#submitIdade").click(function(e){
		var valorRb = $("#formIdade input[name='showIn']:checked").val(); 
		
		if (valorRb == "current"){
			e.preventDefault();
			displayToCurrentPage();
		}
	});
	
	function displayToCurrentPage(){
		//$("#formIdade").removeAttr("action");
		var pOfDisplayCurrentDiv = "#displayCurrent > div > p"; 
		var $idade = $("#idade").val() + ".";
		
		$.get("getIdade.jsp", function(content){
			$("#displayCurrent").html(content);
			$(pOfDisplayCurrentDiv).append($idade);
		});
	};
});

//essas funções podem ser executadas no console
	function displayTestFunction(){
		console.log("funcão sem wrapper");
	};
