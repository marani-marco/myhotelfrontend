<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

					<button class="btn btn-outline-success" onclick="login()">Login</button>

			</div>
		</div>
	</nav>

	<div class="container">

		<div>
			<br> <br>
			<h3 class="text-center">Ottimo
				${mainCustomer.customerFirstName}! La tua prenotazione è stata
				salvata! !</h3>
			<h4 class="text-center">Non vediamo l'ora di ospitarti!</h4>
			<br>
			<h3>Ecco per te un riepilogo della prenotazione:</h3>
			<br> <strong>Data arrivo: </strong>
			<tags:localDate date="${booking.dateStart}" pattern="dd/MM/YYYY" />
			<br> <strong>Data partenza:</strong>
			<tags:localDate date="${booking.dateEnd}" pattern="dd/MM/YYYY" />
			<br>
			<%-- 			<strong>Prenotazione a nome di: </strong>${mainCustomer.} --%>

		</div>

	</div>

</body>

</html>