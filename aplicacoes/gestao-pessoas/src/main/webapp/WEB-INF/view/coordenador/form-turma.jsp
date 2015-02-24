<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<jsp:include page="../modulos/header-estrutura.jsp" />
<title>Cadastro de Turma</title>
</head>
<body>
	<jsp:include page="../modulos/header.jsp" />

	<div class="container">
		<div class="novo-projeto" align="left">
			<div class="form" align="center">

			<c:if test="${not empty erro}">
				<div class="alert alert-danger alert-dismissible margin-top" role="alert">
					<button type="button" class="close" data-dismiss="alert">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<c:out value="${erro}"></c:out>
				</div>
			</c:if>


				<h2>Nova Turma</h2>
				<form:form id="adicionarTurmaForm" role="form" commandName="turma" servletRelativeAction="/turma/${periodo.id}/turma" method="POST" cssClass="form-horizontal">
					<form:hidden path="id"/>				
	
					<div class="form-group">
						<div class="form-item">
							<label for="inicioSemana" class="col-sm-2 control-label">Inicio:</label>
							
							<div class="col-sm-3" align="left">
								<form:select path="inicioSemana" id="inicioSemana" cssClass="selectpicker" data-width="100%" required="required">
								    <form:options itemLabel="labelDia"  />
								</form:select>
								
								<div class="error-validation"><form:errors path="inicioSemana"></form:errors></div>
							</div>
						</div>
	
						<div class="form-item">
							<label for="fimSemana" class="col-sm-2 control-label">Final:</label>
							
							<div class="col-sm-3" align="left">
								<form:select path="fimSemana" id="fimSemana" cssClass="selectpicker" data-width="100%" required="required">
								    <form:options itemLabel="labelDia" />
								</form:select>
								
								<div class="error-validation"><form:errors path="fimSemana"></form:errors></div>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="form-item">
							<label for="horaInicio" class="col-sm-2 control-label">Hora Inicial:</label>

							<div class="col-sm-3" align="left">
								<form:input id="horaInicio" type="time" path="horaInicio" cssClass="form-control" placeholder="hh:ss" required="required"/>

								<div class="error-validation"><form:errors path="horaInicio"></form:errors></div>
							</div>
						</div>
	
						<div class="form-item">
							<label for="horaFinal" class="col-sm-2 control-label">Hora Final:</label>
								<div class="col-sm-3" align="left">
									<form:input id="horaFinal" type="time" path="horaFinal" cssClass="form-control" placeholder="hh:ss" required="required"/>
									
									<div class="error-validation"><form:errors path="horaFinal"></form:errors></div>
							</div>
						</div>
					</div>



					<div class="controls">
						<input name="submit" type="submit" class="btn btn-primary" value="Cadastrar" /> 
					</div>

					<c:forEach var="membro" items="${turma.estagiarios}" varStatus="cont">
						<form:hidden path="estagiarios[${cont.index}].id" value="${membro.id}" />
					</c:forEach>

				</form:form>
			</div>
		</div>
	</div>

	<jsp:include page="../modulos/footer.jsp" />
	
	<script type="text/javascript">
	$('#adicionarTurmaForm').validate({
		ignore: ':hidden:not(.selectpicker)',
        rules: {
            
        },
        highlight: function(element) {
            $(element).closest('.form-item').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-item').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent().children().last());
        },
        messages:{
        	horaFinal:{
                required:"Campo obrigatório",
            },
            horaInicio:{
                required:"Campo obrigatório",
            },
            inicioSemana:{
                required:"Campo obrigatório",
            },
        }
    });
	
	</script>
</body>
</html>