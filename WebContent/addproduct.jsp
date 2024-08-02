<%@page import="java.util.Date"%>
<%@include file="header.jsp"%>

<div id="site_content">
	<div id="content">
		<!-- insert the page content here -->
		<%
			String status = request.getParameter("status");

			if (status != null) {
		%>
		<h1><%=status%></h1>
		<%
			} else {
		%>
		<h1>Add Product</h1>
		<%
			}
		%>

		<form action="VoidmainServlet" method="post" name="appform">

			<input type="hidden" name="type" value="com.voidmain.pojo.Product">
			<input type="hidden" name="redirect" value="addproduct.jsp">
			
			<input type="hidden" name="ismailsent" value="no">
			
			<input type="hidden" name="blockid"
				value="<%=request.getParameter("blockid")%>"> <input
				type="hidden" name="wharehouse" value="<%=username%>"> <input
				type="hidden" name="status" value="not sold">

			<div class="form_settings">

				<p>
					<span>Food Name</span><input class="contact" type="text"
						name="name" required="required" />
				</p>
				<p>
					<span>Quality</span><input class="contact" type="text"
						name="quality" required="required" />
				</p>
				<p>
					<span>Storage Temperature</span><input class="contact" type="text"
						name="temparature" required="required" />
				</p>
				<p>
					<span>Quantity</span><input class="contact" type="text"
						name="quantaty" required="required" />
				</p>
				<p>
					<span>Price</span><input class="contact" type="text" name="price"
						required="required" />
				</p>
				<p>
					<span>Former Name</span><input class="contact" type="text"
						name="formername" required="required" />
				</p>
				<p>
					<span>Email</span><input class="contact" type="email" name="email"
						required="required" />
				</p>
				<p>
					<span>Mobile</span><input class="contact" type="text" name="mobile"
						required="required" pattern="[789][0-9]{9}" />
				</p>
				<p>
					<span>Address</span>
					<textarea class="contact" name="address" required="required"></textarea>

				</p>
				<p>
					<span>Assigned Date</span><input class="contact" type="date"
						name="assignedDate" required="required" />
				</p>
				<p>
					<span>Release Date</span><input class="contact" type="date"
						name="releaseDate" required="required" />
				</p>
				<p>
					<span>Expiry Date</span><input class="contact" type="date"
						name="expDate" required="required" />
				</p>
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Add Product"
						onclick="return validate()" />
				</p>
			</div>
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>