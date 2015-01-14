<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- set path to resources foled -->
<spring:url value="/resources/" var="resources" />
<html>
<!--including head -->
<jsp:include page="fragments/staticFiles.jsp" />
<!-- include special css for registration:-->
<style>
.centered {
	text-align: center;
}

.customButton {
	width: 150px;
}

.error {
	color: #FF0000;
}
</style>
<body>
	<div class="wrapper container">
		<!--including bodyHead -->
		<!-- send name of current page-->
		<jsp:include page="fragments/bodyHeader.jsp">
			<jsp:param name="pageName" value="profile" />
		</jsp:include>

		<form:form modelAttribute="userProfile" action="profile.do" method="post" role="form" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.username.caption" />:</label>
				<div class="col-sm-4">
					<label class="control-label">${userProfile.username}</label> <input type="hidden" name="username"
						value="${userProfile.username}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.nickname.caption" />:</label>
				<div class="col-sm-4">
					<form:input path="displayName" class="form-control" name="displayName" />
					<form:errors path="displayName" Class="error" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.email.caption" />:</label>
				<div class="col-sm-4">
					<label class="control-label">${userProfile.email}</label> <input type="hidden" name="email"
						value="${userProfile.email}" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.roles.caption" />:</label>
				<div class="col-sm-4">
					<c:forEach items="${userProfile.roles}" var="role">
						<label class="control-label">${role.role}</label>
						<br>
					</c:forEach>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.department.caption" />:</label>
				<div class="col-sm-4">
					<form:input path="department" class="form-control" name="department" />
					<form:errors path="department" Class="error" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-4 control-label"><spring:message code="profile.info.caption" />:</label>
				<div class="col-sm-4">
					<form:textarea path="info" class="form-control" name="info" />
				</div>
			</div>
			<c:if test="${userUpdated == 'true'}">
				<div class="form-group">
					<label class="col-sm-4 control-label"></label>
					<div class="col-sm-4 centered">
						<label class="control-label centered"><spring:message code="profile.userUpdatedSuccess.caption" /></label>
					</div>
				</div>
			</c:if>
			<c:if test="${passwordChanged == 'true'}">
				<div class="form-group">
					<label class="col-sm-4 control-label"></label>
					<div class="col-sm-4 centered">
						<label class="control-label centered"><spring:message code="profile.changePasswordSuccess.caption" /></label>
					</div>
				</div>
			</c:if>
			<c:if test="${passwordChanged == 'false'}">
				<div class="form-group">
					<label class="col-sm-4 control-label"></label>
					<div class="col-sm-4 centered">
						<label class="control-label error centered"><spring:message code="profile.changePasswordError.caption" /></label>
					</div>
				</div>
			</c:if>
			<div class="form-group">
				<div class="form-actions centered">
					<input type="submit" value="<spring:message code="profile.applyButton.caption" />"
						class="btn btn-primary customButton" /> <input type="button" data-toggle="modal" data-target="#myModal"
						value="<spring:message code="profile.changePasswordButton.caption" />" class="btn btn-primary customButton" />
				</div>
			</div>
		</form:form>

		<!-- Modal -->
		<form action="changePassword.do" method="post" role="form" class="form-horizontal">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h2 class="modal-title" id="myModalLabel">
								<spring:message code="profile.changePassword.caption" />
							</h2>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-4 control-label"><spring:message code="profile.oldPassword.caption" />:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="oldPassword" name="oldPassword" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label"><spring:message code="profile.newPassword.caption" />:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="newPassword" name="newPassword" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label"><spring:message code="profile.confirmPassword.caption" />:</label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" />
								</div>
							</div>
							<div class="modal-footer">
								<input type="submit" value="<spring:message code="profile.changePasswordButton.caption" />"
									class="btn btn-primary customButton" />
								<button type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="profile.cancelButton.caption" />
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="fragments/footer.jsp" />
</body>
</html>