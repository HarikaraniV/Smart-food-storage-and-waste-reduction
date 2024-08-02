<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.Date"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
</head>
<body>
	<%
		String rid = (String) request.getParameter("rid");
		String price = (String) request.getParameter("price");
	%>

	<h2>Complete Your Payment Here</h2>

	<%
		if (rid != null && price != null) {
	%>

	<div class="row">
		<div class="col-75">
			<div class="container">

				<form action="conform.jsp" name="appform">

					<input type="hidden" name="rid" value="<%=rid%>"> 

					<div class="row">
						<div class="col-50">
							<h3>Billing Address</h3>
							<label for="fname"><i class="fa fa-user"></i> Full Name</label> <input
								type="text" pattern="[a-zA-Z\s]+" id="fname" name="firstname"
								placeholder="John M. Doe" required="required"> <label
								for="email"><i class="fa fa-envelope"></i> Email</label> <input
								type="text" id="email" name="email"
								pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
								placeholder="john@example.com" required="required"> <label
								for="adr"><i class="fa fa-address-card-o"></i> Address</label> <input
								type="text" id="adr" name="address"
								placeholder="542 W. 15th Street" required="required"> <label
								for="city"><i class="fa fa-institution"></i> City</label> <input
								type="text" pattern="[a-zA-Z\s]+" id="city" name="city"
								placeholder="New York" required="required">

							<div class="row">
								<div class="col-50">
									<label for="state">State</label> <input type="text"
										pattern="[a-zA-Z\s]+" id="state" name="state" placeholder="NY"
										required="required">
								</div>
								<div class="col-50">
									<label for="zip">Zip</label> <input type="text" id="zip"
										name="zip" placeholder="521001" required="required">
								</div>
							</div>
						</div>

						<div class="col-50">
							<h3>Payment</h3>
							<label for="fname">Accepted Cards</label>
							<div class="icon-container">
								<i class="fa fa-cc-visa" style="color: navy;"></i> <i
									class="fa fa-cc-amex" style="color: blue;"></i> <i
									class="fa fa-cc-mastercard" style="color: red;"></i> <i
									class="fa fa-cc-discover" style="color: orange;"></i>
							</div>
							<label for="cname">Name on Card</label> <input type="text"
								pattern="[a-zA-Z\s]+" id="cname" name="cardname"
								placeholder="John More Doe" required="required"> <label
								for="ccnum">Credit card number</label> <input type="text"
								id="ccnum" name="cardnumber" pattern="[1-9]{1}[0-9]{15}"
								placeholder="1111222233334444" required="required"> <label
								for="expmonth">Exp Month</label> <input type="number"
								id="expmonth" name="expmonth" min="01" max="12" placeholder="02"
								required="required">
							<div class="row">
								<div class="col-50">
									<label for="expyear">Exp Year</label> <input type="text"
										id="expyear" name="expyear" pattern="^[23]\d{1}$"
										placeholder="20" required="required">
								</div>
								<div class="col-50">
									<label for="cvv">CVV</label> <input type="text" id="cvv"
										name="cvv" pattern="[0-9]{3}" placeholder="352"
										required="required">
								</div>
								<div class="col-50">
									<label for="amount">Amount</label> <input type="text"
										id="amount" name="amount" value="<%=price%>"
										required="required" readonly="readonly">
								</div>
							</div>
						</div>

					</div>
					<input type="submit" value="Pay" class="btn">
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>

</body>
</html>