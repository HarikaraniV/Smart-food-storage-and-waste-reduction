<%@page import="com.voidmain.pojo.Product"%>
<%@page import="com.voidmain.pojo.BuyRequest"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
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
		<h1>View Requests</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Request ID</th>
				<th>Food ID</th>
				<th>Request From</th>
				<th>Request To</th>
				<th>Date</th>
				<th>Description</th>
				<th>Status</th>
				<%
					if(role.equals("wharehouse"))
					{
				%>
						<th>Status</th>
				<%		
					}
				%>
				<%
					if(role.equals("user"))
					{
				%>
						<th>Payment</th>
				<%		
					}
				%>
				<th>Delete</th>
			</tr>
			
			<%
				for (BuyRequest buyRequest : HibernateDAO.getBuyRequests()) 
				{
					if(buyRequest.getUserid().equals(username) || buyRequest.getWharehouse().equals(username))
					{
						Product product=HibernateDAO.getProductById(buyRequest.getPid());
			%>
					<tr>
						<td><%=buyRequest.getRequestid()%></td>
						<td><%=buyRequest.getPid()%></td>
						<td><%=buyRequest.getUserid()%></td>
						<td><%=buyRequest.getWharehouse()%></td>
						<td><%=buyRequest.getRdate()%></td>
						<td><%=buyRequest.getDescription()%></td>
						<td><%=buyRequest.getStatus()%></td>
						<%
							if(role.equals("wharehouse"))
							{
						%>
								<td><a href="updaterequest.jsp?rid=<%=buyRequest.getRequestid()%>">update request status</a></td>
						<%		
							}
						%>
						
						<%
							if(role.equals("user"))
							{
								if(buyRequest.getStatus().equals("approved"))
								{
						%>
									<td><a href="payment.jsp?rid=<%=buyRequest.getRequestid()%>&price=<%=product.getPrice()%>">pay money</a></td>
						<%		
								}
								else
								{
						%>
									<td>Wait for Payment</td>
						<%		
								}
							}
						%>
						
						<td><a href="viewrequests.jsp?rid=<%=buyRequest.getRequestid()%>">Delete</a></td>
					</tr>		
			<%
					}
				}
			%>
				
		</table>

		<%
			String rid = request.getParameter("rid");

			if (rid != null) {
				
				if (HibernateTemplate.deleteObject(BuyRequest.class, rid) == 1) {
					response.sendRedirect("viewrequests.jsp?status=success");
				} else {
					response.sendRedirect("viewrequests.jsp?status=failed");
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>