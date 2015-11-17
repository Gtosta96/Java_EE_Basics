<html>
<%-- comentario jsp --%>
<!-- what it does? -->
<%String msg = "HELLO FUCKING WORLD!"; %>
	<body>
		<div>
			Metodo1: <% out.println(msg); %><br>
			Metodo2: <%= msg %><br>
		</div>
		<% System.out.println("Tudo foi executado!"); %>
	</body>
</html>