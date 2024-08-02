<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.pojo.BuyRequest"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>

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
		<h1>Update Request Status</h1>
		<%
			}
		%>

		<%
			String buyRequestid = request.getParameter("rid");

			if (buyRequestid != null) {

				BuyRequest buyRequest = HibernateDAO.getBuyRequestById(Integer.parseInt(buyRequestid));
		%>

		<form action="updaterequest.jsp" name="appform">

			<input type="hidden" value="<%=buyRequestid%>" name="buyRequestid">

			<div class="form_settings">
				<p>
					<span>Select Status</span> <select name="status"
						required="required">
						<option value="">--select--</option>
						<option value="approved">Approved</option>
						<option value="reject">Reject</option>
					</select>
				</p>

				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="update status"
						onclick="return validate()" />
				</p>
			</div>

		</form>

		<%
			}
		%>

		<%
			String rstatus = request.getParameter("status");
			String brid = request.getParameter("buyRequestid");

			if (rstatus != null && brid != null) {

				System.out.println(brid + ":========");
				BuyRequest buyRequest = HibernateDAO.getBuyRequestById(Integer.parseInt(brid));
				buyRequest.setStatus(rstatus);

				if (HibernateTemplate.updateObject(buyRequest) == 1) {
					response.sendRedirect("updaterequest.jsp?status=success");
				} else {
					response.sendRedirect("updaterequest.jsp?status=failed");
				}
			}
		%>
	</div>
</div>
<%@include file="footer.jsp"%>