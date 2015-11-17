<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="myTags" %>
<html>
	<head>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
		<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css">
		
	</head>
	<body>
		<form action="adicionarContato">
			Nome: <input type="text" name="nome" /><br />
			E-mail: <input	type="text" name="email" /><br />
			Endereço: <input type="text" name="endereco" /><br />
			Data Nascimento: <myTags:campoData id="dataNascimento" /><br />
			 
			 <input type="submit" value="Gravar" />
		</form>
	</body>
</html>