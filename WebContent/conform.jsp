<%@page import="com.voidmain.pojo.BuyRequest"%>
<%@page import="com.voidmain.pojo.Product"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%
	String rid = request.getParameter("rid");

	if (rid != null ) {
		
		BuyRequest buyRequest= HibernateDAO.getBuyRequestById(Integer.parseInt(rid));
		buyRequest.setStatus("sold");
		
		Product product = HibernateDAO.getProductById(buyRequest.getPid());
		product.setStatus("sold");
		
		
		if(HibernateTemplate.updateObject(product)==1 && HibernateTemplate.updateObject(buyRequest)==1)
		{
			response.sendRedirect("viewrequests.jsp?status=success");
		}
		else
		{
			response.sendRedirect("viewrequests.jsp?status=failed");
		}
	}

	else {
		response.sendRedirect("viewrequests.jsp?status=failed");
	}
%>