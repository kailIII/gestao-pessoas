<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../modulos/header-estrutura.jsp" />

<title>Estagiários</title>
</head>
<body>
	<jsp:include page="../modulos/header-coordenador.jsp" />

	<div class="tab-pane active" id="meus-projetos">
		<c:if test="${empty estagiarios}">
			<div class="alert alert-warning" role="alert">Não há
				Estagiários cadastrados.</div>
		</c:if>
		<c:if test="${not empty estagiarios}">
			<div class="panel panel-default">
				<div class="panel-heading" align="center">
					<h4>Estagiários Cadastrados</h4>
				</div>
				<!-- Table -->
				<table class="table" id="table">
					<thead>
						<tr>
							<th>Nome</th>
							<th>Matricula</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="estagiario" items="${estagiarios}">
							<tr class="linha">
								<td>${estagiario.nomeCompleto}</td>
								<td>${estagiario.matricula}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>

	<jsp:include page="../modulos/footer.jsp" />
</body>
</html>