<%@page import="com.voidmain.pojo.Product"%>
<%@page import="java.util.Date"%>
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
		<h1>Send Request</h1>
		<%
			}
		%>

		<%
			String productid = request.getParameter("productid");

			if (productid != null) {

				Product product = HibernateDAO.getProductById(Integer.parseInt(productid));
		%>

		<form action="VoidmainServlet" method="post" name="appform">

			<input type="hidden" name="type" value="com.voidmain.pojo.BuyRequest">
			<input type="hidden" name="redirect" value="sendrequest.jsp">
			<input type="hidden" name="userid" value="<%=username%>"> <input
				type="hidden" value="<%=productid%>" name="pid"> <input
				type="hidden" value="<%=product.getWharehouse()%>" name="wharehouse">
			<input type="hidden" value="<%=new Date().toString()%>" name="rdate">
			<input type="hidden" value="pending" name="status">

			<div class="form_settings">


				<p>
					<span>Description:</span>
					<textarea class="contact" name="description" required="required"></textarea>
				</p>

				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Send Request"
						onclick="return validate()" />
				</p>
			</div>

		</form>

		<%
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>