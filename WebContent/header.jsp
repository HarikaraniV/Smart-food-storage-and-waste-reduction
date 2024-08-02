<!DOCTYPE HTML>
<html>

<head>
<title>Smart Food Storage and Waste Reduction</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">Smart Food Storage <span class="logo_colour">and Waste Reduction</span></a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					 <%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute( "username");

						if (role.equals("admin")) {
					%>
						<li><a href="viewwharehouses.jsp">View Ware House's</a></li>
					<%
						}
					%>
					<%
						if (role.equals("wharehouse")) {
					%>
						<li><a href="viewblocks.jsp">View Block's</a></li>
						<li><a href="addblock.jsp">Add Block</a></li>
						<li><a href="viewproducts.jsp">View Food</a></li>
						<li><a href="viewexpiredproducts.jsp">View Expired Products</a></li> 
						<li><a href="viewrequests.jsp">View Requests</a></li> 
					<%
						}
					%>
					
					<%
						if (role.equals("user")) {
					%>
						<li><a href="searchproducts.jsp">Search Product's</a></li>
						<li><a href="viewrequests.jsp">View Requests</a></li> 
					<%
						}
					%>
					
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>