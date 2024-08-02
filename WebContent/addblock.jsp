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
		<h1>Add Block</h1>
		<%
			}
		%>

		<form action="VoidmainServlet" method="post" name="appform">

			<input type="hidden" name="type" value="com.voidmain.pojo.Block">
			<input type="hidden" name="redirect" value="addblock.jsp"> <input
				type="hidden" name="wharehouse" value="<%=username%>">

			<div class="form_settings">

				<p>
					<span>Capacity</span><input class="contact" type="text"
						name="catpacity" required="required" />
				</p>
				<p>
					<span>Is Having Cold Storage</span><input class="contact"
						type="text" name="isHavingColdStorage" required="required" />
				</p>
				<p>
					<span>Description</span>
					<textarea class="contact" name="description" required="required"></textarea>

				</p>
				<p style="padding-top: 15px">
					<span>&nbsp;</span><input class="submit" type="submit"
						name="contact_submitted" value="Add Block"
						onclick="return validate()" />
				</p>
			</div>
		</form>
	</div>
</div>
<%@include file="footer.jsp"%>