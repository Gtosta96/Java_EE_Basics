<%@page import="java.text.SimpleDateFormat"%>
<html>
	<body>
		<%@ page
			import="java.util.*, content.dao.*,
							content.entidade.*"%>
	
		<table>
	
			<%
				ContatoDAO dao = new ContatoDAO();
				List<Contato> contatos = dao.getLista();
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				
				for (Contato contato : contatos) {
				
			%>
			<tr>
				<td><%=contato.getNome()%></td>
				<td><%=contato.getEmail()%></td>
				<td><%=contato.getEndereco()%></td>
				<td><%=contato.getDataNascimento().getTime()%></td>
			</tr>
			<%
				}
			%>
		</table>
	</body>
</html>