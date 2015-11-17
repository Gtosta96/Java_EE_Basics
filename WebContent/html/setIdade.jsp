<html>
	<head>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="/Java_EE_Basics/html/themes/js/my-own-js.js" type="text/javascript"></script>
	</head>
	<body>
		<form id="formIdade" action="getIdade.jsp"> <!-- this action is activated depending which radio checked -->
			Digite sua Idade:
			<input type="text" name="idade" id="idade">
			<br>
			<label for="current"> Mostrar na página atual
				<input type="radio" name="showIn" value="current" id="current"/>
			</label>
			<br>
			<label for="new"> Mostrar em uma nova página
				<input type="radio" name="showIn" value="new" id="new"/>
			</label>
			<br>
			<button type="submit" id="submitIdade">Enviar</button>
		</form>
	</body>
	
	<div id="displayCurrent"></div>
</html>