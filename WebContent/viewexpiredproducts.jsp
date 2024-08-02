<%@page import="com.voidmain.service.MailService"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.voidmain.pojo.Product"%>
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
		<h1>View Products</h1>
		<%
			}
		%>

		<table style="width: 100%; border-spacing: 0;">
			<tr>
				<th>Food ID</th>
				<th>Block ID</th>
				<th>Food Name</th>
				<th>Temperature</th>
				<th>Quality</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Former Name</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Address</th>
				<th>Assigned Date</th>
				<th>Release Date</th>
				<th>Expiry Date</th>
				<th>Delete</th>
			</tr>

			<%
				for (Product product : HibernateDAO.getProducts()) {
					
					if(product.getWharehouse().equals(username))
					{
						String[] tokens=product.getExpDate().split("-");
						String idate=tokens[2]+"-"+tokens[1]+"-"+tokens[0];
						
						Date pdate=new SimpleDateFormat("dd-MM-yyyy").parse(idate);
						Date cdate=new Date();
						
						long diffInMillies = Math.abs(pdate.getTime() - cdate.getTime());
					    long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
					    
						if(diff<5)
						{ 
							try
							{
								if(product.getIsmailsent().equals("no"))
								{
									MailService.mailsend("Expiry Reminder","Your Food "+product.getName()+" is going to be expire with in 5 Days",product.getEmail());
									
									product.setIsmailsent("yes");
									HibernateTemplate.updateObject(product);
								}
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
						
			%>
							<tr>
								<td><%=product.getPid()%></td>
								<td><%=product.getBlockid()%></td>
								<td><%=product.getName()%></td>
								<td><%=product.getTemparature()%></td>
								<td><%=product.getQuality()%></td>
								<td><%=product.getQuantaty()%></td>
								<td><%=product.getPrice()%></td>
								<td><%=product.getFormername()%></td>
								<td><%=product.getEmail()%></td>
								<td><%=product.getMobile()%></td>
								<td><%=product.getAddress()%></td>
								<td><%=product.getAssignedDate()%></td>
								<td><%=product.getReleaseDate()%></td>
								<td><%=product.getExpDate()%></td>
								<td><a href="viewproducts.jsp?productid=<%=product.getPid()%>">delete</a></td>
							</tr>
			<%
						}
					}
				}
			%>
		</table>
		
		<%
			String productid = request.getParameter("productid");
			
			if(productid!=null)
			{
				if (productid != null) {
					if (HibernateTemplate.deleteObject(Product.class, productid) == 1) {
						response.sendRedirect("viewproducts.jsp?status=success");
					} else {
						response.sendRedirect("viewproducts.jsp?status=failed");
					}
				}
			}
		%>

	</div>
</div>
<%@include file="footer.jsp"%>