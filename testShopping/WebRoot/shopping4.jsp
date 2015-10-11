<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 MyCartBO mcb = (MyCartBO) request.getSession().getAttribute("myCart");
 UserBean ub = (UserBean) request.getSession().getAttribute("userInfo");
 List<GoodsBean> list = mcb.showMyCart();
 String total = mcb.calculatePrice(list);
 String orderNum = (String) request.getAttribute("orderNum");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopping4.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">
	

  </head>
  
  <body background="imgs/bg.bmp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <tr>
      <td><table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td colspan="9" align="center"><img src="imgs/cartnavi-4.png" width="778" height="50" alt=""/></td>
          </tr>
          <tr>
            <td height="34" colspan="9" align="center"><span class="abc">Order Information Details</span></td>
          </tr>
          <tr>
            <td width="8%" height="44" align="center"><span class="abc">order number</span></td>
            <td width="9%" align="center"><span class="abc">consignee</span></td>
            <td width="23%" align="center"><span class="abc">address</span></td>
            <td width="8%" align="center"><span class="abc">zipcode</span></td>
            <td width="9%" align="center"><span class="abc">phone</span></td>
            <td width="9%" align="center"><span class="abc">total price</span></td>
            <td width="13%" align="center"><span class="abc">username</span></td>
            <td width="16%" align="center"><span class="abc">email</span></td>
            <td width="5%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td height="44" align="center"><span class="abc"><%=orderNum%></span></td>
            <td align="center"><span class="abc"><%= ub.getTruename()%></span></td>
            <td align="center"><span class="abc"><%=ub.getAddress()%></span></td>
            <td align="center"><span class="abc"><%=ub.getPostcode()%></span></td>
            <td align="center"><span class="abc"><%=ub.getPhone()%></span></td>
            <td align="center"><span class="abc"><%=total%></span></td>
            <td align="center"><span class="abc"><%=ub.getUsername()%></span></td>
            <td align="center"><span class="abc"><%=ub.getEmail()%></span></td>
            <td align="center"><span class="abc"><a href="shopping3.jsp?checkOrderdetails=1">check</a></span></td>
            <%session.setAttribute("preCart", mcb); %>
          </tr>
          <tr>
            <td height="46" colspan="9"><span class="abc">Your order completed, our server will send you a confirm email later.</span></td>
          </tr>
          <% session.removeAttribute("myCart"); %>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
  </body>
</html>
