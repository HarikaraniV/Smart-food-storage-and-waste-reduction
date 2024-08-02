<%@page import="com.voidmain.pojo.Wharehouse"%>
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
		<h1>View Ware Houses</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Ware House ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Status</th>
				<th>Activate or Deactivate</th>
				<th>Delete</th>
			</tr>

			<%
				for (Wharehouse wharehouse : HibernateDAO.getWharehouses()) {
			%>

			<tr>
				<td><%=wharehouse.getUserName()%></td>
				<td><%=wharehouse.getName()%></td>
				<td><%=wharehouse.getEmail()%></td>
				<td><%=wharehouse.getMobile()%></td>
				<td><%=wharehouse.getAddress()%></td>
				<td><%=wharehouse.getStatus()%></td>
				<%
					if (wharehouse.getStatus().equals("yes")) {
				%>
				<td><a
					href="viewwharehouses.jsp?wid=<%=wharehouse.getUserName()%>&sta=no">no</a></td>
				<%
					} else if (wharehouse.getStatus().equals("no")) {
				%>
				<td><a
					href="viewwharehouses.jsp?wid=<%=wharehouse.getUserName()%>&sta=yes">yes</a></td>
				<%
					}
				%>
				<td><a
					href="viewwharehouses.jsp?wharehouseid=<%=wharehouse.getUserName()%>">delete</a></td>
			</tr>
			<%
				}
			%>
		</table>

		<%
			String wid = request.getParameter("wid");
			String sta = request.getParameter("sta");

			if (wid != null && sta != null) {
				Wharehouse wharehouse = HibernateDAO.getWharehouseById(wid);
				wharehouse.setStatus(sta);

				if (HibernateTemplate.updateObject(wharehouse) == 1) {
					response.sendRedirect("viewwharehouses.jsp?status=success");
				} else {
					response.sendRedirect("viewwharehouses.jsp?status=failed");
				}
			}

			String wharehouseid = request.getParameter("wharehouseid");

			if (wharehouseid != null) {
				if (wharehouseid != null) {
					if (HibernateTemplate.deleteObject(Wharehouse.class, wharehouseid) == 1) {
						response.sendRedirect("viewwharehouses.jsp?status=success");
					} else {
						response.sendRedirect("viewwharehouses.jsp?status=failed");
					}
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>