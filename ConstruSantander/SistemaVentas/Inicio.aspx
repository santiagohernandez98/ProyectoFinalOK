<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaster.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="SistemaVentas.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link href="css/slider.css" rel="stylesheet" />

	<!-- font awesome--> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	<!--Font oswald-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;300;400&display=swap" rel="stylesheet">

	<!-- Line Icons -->
	<link href="https://cdn.lineicons.com/3.0/lineicons.css" rel="stylesheet">
    		<div class="banner-body">
        <h1 class="text-uppercase">Bienvenidos a  ConstruSantander </h1>
        <p>Los mejores productos y la mejor calidad los encuentras en ConstruSantander </p>
    </div>
	        <div class="title-slider">
			<h2> Productos </h2>
		</div>
		
		<div class="container-slider">

			<div class="slider-principal">
				<input type="radio" name="slider" id="item-1" checked>
				<input type="radio" name="slider" id="item-2" >
				<input type="radio" name="slider" id="item-3" >


				<div class="cards">
					<label class="card" for="item-1" id="selector-1">
						<img src="./img/cabaña2ok.jpeg">
					</label>
					<label class="card" for="item-2" id="selector-2">
						<img src="./img/silla1.jpg">
					</label>
					<label class="card" for="item-3" id="selector-3">
						<img src="./img/cedrorojo.jpg">
					</label>
				</div>
			</div>
		</div>
	<!-- Contenidos  -->
	<div class="container-fluid container-web-page border-bottom bg-white">
    <h3 class="text-center text-uppercase poppins-regular font-weight-bold">Nuestros servicios</h3>
    <br>
    <div class="row">
        <div class="col-12 col-sm-6 col-md-4">
            <p class="text-center"><i class="fas fa-shipping-fast fa-5x"></i></p>
            <h5 class="text-center text-uppercase poppins-regular font-weight-bold">Envíos a domicilio</h5>
            <p class="text-center">Envios a diferentes lugares del pais,Instalaciones incluidas </p>
        </div>
        <div class="col-12 col-sm-6 col-md-4">
            <p class="text-center"><i class="fas fa-boxes fa-5x"></i></p>
            <h5 class="text-center text-uppercase poppins-regular font-weight-bold">Ventas al por mayor</h5>
            <p class="text-center">La empresa mayorista compra directamente grandes cantidades de productos a los fabricantes y luego los vende a los minoristas en una proporción menor, de está manera participa como intermediario generando ingresos por dicha transacción.>
        </div>
        <div class="col-12 col-sm-6 col-md-4">
            <p class="text-center"><i class="fas fa-store-alt fa-5x"></i></p>
            <h5 class="text-center text-uppercase poppins-regular font-weight-bold">Retiro en tienda</h5>
            <p class="text-center">Retirar tu pedido en una de nuestras tiendas habilitadas con prioridad al momento de ingresar a la tienda. Solo debes comprar un equipo, plan o accesorio en  ConstruSantander
        </div>
    </div>
</div>

	<!-- Footer -->
	<footer class="footer">
		<div class="container-footer">
			<div class="box-footer">
				<div class="logo-footer">
					<img src="img/LogoVertical.png" alt="">
				</div>
				<div class="terms">
				<h2>El Rosal,Cundinamarca</h2>
				</div>
			</div>

			<div class="box-footer">
				<h2>Soluciones</h2>
				<a href="#">App Desarrollo</a>
				<a href="#">App Marketing</a>
				<a href="#">IOS Desarrollo</a>
				<a href="#">Android Desarrollo</a>
			</div>

			<div class="box-footer">
				<h2>Compañia</h2>
				<a href="#">Acerca de</a>
				<a href="#">Trabajos</a>
				<a href="#">Procesos</a>
				<a href="#">Servicios</a>
			</div>

			<div class="box-footer">
				<h2>Redes Sociales</h2>
				<a href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
				<a href="#"><i class="fab fa-twitter"></i> Twitter</a>
				<a href="#"><i class="fab fa-whatsapp"></i> Whatsapp</a>
				<a href="#"><i class="fab fa-youtube"></i> Youtube</a>
			</div>
		</div>

		<div class="box-copyright">
			<hr>
			<p> ConstruSantander 2022 </p>
	
		</div>
	</footer>
	
	<noscript>
		<h1>!CUIDADO...!</h1>
		<p>Bienvenido a Mi Pagina</p>
		<p>Esta página trabaja con JavaScript si está desactivada por favor activala.</p>
	</noscript>

</asp:Content>
