<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

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

<script>

function showBookingForm(roomID,roomPricePerNight) {
	
	  $("#bookingForm").show();
	  
	    $('html,body').animate({
	        scrollTop: $("#bookingForm").offset().top},
	        'fast');
	  
	  $("#roomID").val(roomID);
	  $("#finalPrice").val(roomPricePerNight);
	}
	
function checkEmailPhone() {
	
		if($("#customerEmail").val() != "" && $("#customerPhone").val() == ""){		
			document.getElementById("customerPhone").required = false;
		} else {
			if($("#customerEmail").val() == "" && $("#customerPhone").val() != ""){
				document.getElementById("customerEmail").required = false;
			}
		}
	
	}

function login(){
	window.location.href = "/login";
}

</script>

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
				<form class="d-flex">
					<button class="btn btn-outline-success" type="submit"
						onclick="login()">Login</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="container">

		<div>
			<br> <br>
			<h3 class="text-center">Evvai! Abbiamo delle camere disponibili
				dal <tags:localDate date="${booking.dateStart}" pattern="dd/MM/yyyy"/> al <tags:localDate date="${booking.dateEnd}" pattern="dd/MM/yyyy"/>!</h3>
			<br>
			<c:if test="${roomsAvailable != null}">

				<div class="row">
					<div class="col-12">
						<div class="card-deck d-flex justify-content-center">
							<c:forEach items="${roomsAvailable}" var="room">

								<div class="card" style="width: 18rem;">
									<img src="..." class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">${room.roomName}</h5>
										<p class="card-text">${room.roomDescription}</p>
										<a href="#" class="btn btn-primary"
											onClick="showBookingForm(${room.roomID},${room.roomPricePerNight})">Prenota
											a ${room.roomPricePerNight} Euro/notte</a>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
				</div>



			</c:if>
		</div>
		<div id="bookingForm">

			<h3>Ci siamo quasi! Inserisci i tuoi dati e riserva subito la
				tua camera!</h3>

			<form method="post" action="/prenota">
			

				<spring:bind path="booking.bookingID">
					<input type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>
	
				<spring:bind path="booking.roomID">
					<input id="roomID" type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>
	
				<spring:bind path="booking.externalID">
					<input type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>
	
				<spring:bind path="booking.finalPrice">
					<input id="finalPrice" type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>
				
				<spring:bind path="booking.dateStart">
						<input type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>

				<spring:bind path="booking.dateEnd">
						<input type="hidden" name="${status.expression}" value="${status.value}">
				</spring:bind>
				
							<c:forEach items="${customersListBinding.customersList}"
				var="customer" varStatus="status">

				<h5>Ospite ${status.index+1}</h5>
				
				<div class="row justify-content-md-center">
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerFirstName">
							<label for="${status.expression}">Nome *</label>
							<input required type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>
					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerLastName">
							<label for="${status.expression}">Cognome *</label>
							<input required type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
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
				
					<c:choose>
						<c:when test="${status.index==0}">
						
							<div class="col">				
								<spring:bind path="customersListBinding.customersList[${status.index}].customerPhone">
									<label for="${status.expression}">Telefono *</label>
									<input required type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
								</spring:bind>
							</div>
							<div class="col">				
								<spring:bind path="customersListBinding.customersList[${status.index}].customerEmail">
									<label for="${status.expression}">Email *</label>
									<input required type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
								</spring:bind>
							</div>
							
						</c:when>
						<c:otherwise>
						
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
							
						</c:otherwise>
					</c:choose>	

					<div class="col">				
						<spring:bind path="customersListBinding.customersList[${status.index}].customerCity">
							<label for="${status.expression}">Provenienza </label>
							<input type="text" class="form-control" name="<c:out value="${status.expression}"/>" id="<c:out value="${status.expression}"/>" value="<c:out value="${status.value}"/>" />
						</spring:bind>
					</div>				
				</div>
				<br><br>

			</c:forEach>

				<br>
				<button type="submit" class="btn btn-primary"
					onClick="checkEmailPhone()">Prenota ora!</button>
			</form>

		</div>

	</div>

</body>

</html>