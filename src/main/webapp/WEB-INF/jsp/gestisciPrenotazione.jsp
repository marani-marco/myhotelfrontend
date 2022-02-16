<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head>
<title>MyHotel</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous" />

<style type="text/css">
#bookingForm {
	display: none;
	margin-top: 20px;
}

.card-deck {
	display: inline-flex;
}
</style>

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Hotel Bellavista</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">L'hotel</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Il posto </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container text-center">
		<br> <br>
		<h5>Modifica la tua prenotazione</h5>
		<br>

		<form method="post" action="/prenota">

			<!-- Dati nascosti -->

			<spring:bind path="booking.bookingID">
				<input type="hidden" name="${status.expression}"
					value="${status.value}">
			</spring:bind>

			<spring:bind path="booking.roomID">
				<input type="hidden" name="${status.expression}"
					value="${status.value}">
			</spring:bind>

			<spring:bind path="booking.externalID">
				<input type="hidden" name="${status.expression}"
					value="${status.value}">
			</spring:bind>

			<spring:bind path="booking.finalPrice">
				<input type="hidden" name="${status.expression}"
					value="${status.value}">
			</spring:bind>


			<!-- Dati mostrati all'utente -->

			<div class="row justify-content-md-center">
				<div class="col-md-auto">
					<spring:bind path="booking.dateStart">
						<label for="${status.expression}">Data di arrivo</label> 
						<input type="date" class="form-control" name="${status.expression}" value="${status.value}">
					</spring:bind>
				</div>
				<div class="col-md-auto">
					<spring:bind path="booking.dateEnd">
						<label for="${status.expression}">Data di partenza</label>
						<input type="date" class="form-control" name="${status.expression}" value="${status.value}">
					</spring:bind>
				</div>
			</div>

			<br /> <br />


			<c:forEach items="${customersListBinding.customersList}"
				var="customer" varStatus="status">

				<h5>Ospite ${status.index+1}</h5>
				
				<div class="row justify-content-md-center">
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerFirstName">
							<label for="${status.expression}">Nome </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerLastName">
							<label for="${status.expression}">Cognome </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerBirthDate">
							<label for="${status.expression}">Data di nascita </label>
							<input type="date" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
				</div>
				<br>
				<div class="row justify-content-md-center">
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerPhone">
							<label for="${status.expression}">Telefono </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerEmail">
							<label for="${status.expression}">Email </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerCity">
							<label for="${status.expression}">Provenienza </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>				
				</div>
				<br><br>

			</c:forEach>

			<input type="submit" class="btn btn-success" value="Salva"/>

		</form>

	</div>

</body>

</html>