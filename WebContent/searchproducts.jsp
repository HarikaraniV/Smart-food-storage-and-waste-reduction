<%@page import="com.voidmain.pojo.Product"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
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
		<h1>Send Request</h1>
		<%
		}
	%>

		<form action="searchproducts.jsp">

			<div class="form_settings">

				<p>
					<span>Search Food :</span><input class="contact" type="text"
						name="keyword" required="required" />
				</p>
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="search" />
				</p>
			</div>

		</form>

		<br />
		<br />

		<%
		String keyword=request.getParameter("keyword");
	
		if(keyword!=null)
		{
	%>
		<table style="width: 100%; border-spacing: 0;">

			<tr>
				<th>Ware House</th>
				<th>Food Name</th>
				<th>Quality</th>
				<th>Quantity</th>
				<th>Former Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Storage Date</th>
				<th>Release Date</th>
				<th>Expiry Date</th>
				<th>Send Request</th>
			</tr>

			<%
					for (Product product : HibernateDAO.getProducts()) {
						
						if(product.getName().contains(keyword) && product.getStatus().equals("not sold"))
						{
				%>
			<tr>
				<td><%=product.getWharehouse()%></td>
				<td><%=product.getName()%></td>
				<td><%=product.getQuality()%></td>
				<td><%=product.getQuantaty()%></td>
				<td><%=product.getFormername()%></td>
				<td><%=product.getEmail()%></td>
				<td><%=product.getMobile()%></td>
				<td><%=product.getAddress()%></td>
				<td><%=product.getAssignedDate()%></td>
				<td><%=product.getReleaseDate()%></td>
				<td><%=product.getExpDate()%></td>
				<td><a href="sendrequest.jsp?productid=<%=product.getPid()%>">send
						request</a></td>
			</tr>
			<%
						}
					}
				%>
		</table>
		<%		
		}
	%>

	</div>
</div>
<%@include file="footer.jsp"%>