<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<html>
	<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/html/themes/css/displaytag.css" type="text/css">    
	</head>
	<body>
	<c:import url="/html/layout/header.jsp"/>
	
	<jsp:useBean id="dao" class="content.dao.ContatoDAO"/>
		
        <display:table name="${dao.lista}" id="data" export="true" sort="list" pagesize="5" >
            <display:column property="nome" title="Nome" sortable="true"/>
		
		<!--  Encorajador fazer c:choose, aqui é usado if apenas para demostração -->
			<c:if test="${not empty data.email}"> 
            	<display:column property="email" title="Email" sortable="true"/>
            </c:if>
            <c:if test="${empty data.email}"> 
            	<display:column value="Email não informado" sortable="true"/>
            </c:if>
            <display:column property="endereco" title="Endereco" sortable="true"/>
        </display:table>
	</body>
</html>