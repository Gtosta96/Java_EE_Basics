<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<body>
	<c:import url="/html/layout/header.jsp"/>
		<table border="1">
		<jsp:useBean id="dao" class="content.dao.ContatoDAO"/>
		 	<c:forEach var="contato" items="${dao.lista}" varStatus="id">
		  		<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }" > 
					<td>${contato.nome}</td>
					<c:choose>
						<c:when test="${not empty contato.email}">
							<td>${contato.email}</td>
						</c:when>
						<c:otherwise>
							<td>Email não informado</td>
						</c:otherwise>
					</c:choose>
					<td>${contato.endereco}</td>
					<td><fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy"/></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>