<%@page import="com.voidmain.pojo.Block"%>
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
		<h1>View Blocks</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Block ID</th>
				<th>Capacity</th>
				<th>Is Having Cold Storage</th>
				<th>Description</th>
				<th>Add Food</th>
				<th>Delete</th>
			</tr>

			<%
				for (Block block : HibernateDAO.getBlocks()) {
			%>

			<tr>
				<td><%=block.getBlockId()%></td>
				<td><%=block.getCatpacity()%></td>
				<td><%=block.getIsHavingColdStorage()%></td>
				<td><%=block.getDescription()%></td>
				<td><a href="addproduct.jsp?blockid=<%=block.getBlockId()%>">Add</a></td>
				<td><a href="viewblocks.jsp?blockid=<%=block.getBlockId()%>">delete</a></td>
			</tr>
			<%
				}
			%>
		</table>
		
		<%
			String blockid = request.getParameter("blockid");
			
			if(blockid!=null)
			{
				if (blockid != null) {
					if (HibernateTemplate.deleteObject(Block.class, blockid) == 1) {
						response.sendRedirect("viewblocks.jsp?status=success");
					} else {
						response.sendRedirect("viewblocks.jsp?status=failed");
					}
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>