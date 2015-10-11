<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 MyCartBO mbo = (MyCartBO) session.getAttribute("myCart");
 List<GoodsBean> list = new ArrayList<GoodsBean>();
 String total = "0.0";
 if(mbo != null) {
 	list = mbo.showMyCart();
 	total = mbo.calculatePrice(list);
 }
 
 UserBean ub= (UserBean) session.getAttribute("userInfo");
 String checkOrderdetails = request.getParameter("checkOrderdetails");
 if(checkOrderdetails != null) {
 	mbo= (MyCartBO) session.getAttribute("preCart");
 	list = mbo.showMyCart();
 	total = mbo.calculatePrice(list);
 }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shopping3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">
	<script language="javascript">
		function returnCart() {
			window.open("ShoppingCIServlet?type=relogin","_self");
		}
	</script>
	

  </head>
  <body background="imgs/bg.bmp">
  <table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td align="center"><img src="imgs/cartnavi-3.gif" width="599" height="49" alt=""/></td>
          </tr>
          <form action="SignupCIServlet?update=1">
          <tr align="center">
            <td width="996">
            <table width="42%" height="210" border="1" cellpadding="0" cellspacing="0">
              <tbody>
                <tr>
                  <td colspan="2" align="center"><span class="abc">User Information</span></td>
                  </tr>
                <tr align="right">
                    <td width="43%" align="right"><span class="abc">username:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="username" type="text" value="<%=ub.getUsername()%>" size="33" readonly>
                  </span></td>
                </tr>
                <tr>
                  <td width="43%" align="right"><span class="abc"><font color="red">*</font>truename:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="truename" type="text" value="<%=ub.getTruename()%>" size="33">
                  </span></td>
                </tr>
                <tr>
                  <td width="43%" align="right"><span class="abc"><font color="red">*</font>address:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="address" type="text" value="<%=ub.getAddress()%>" size="33">
                  </span></td>
                </tr>
                <tr>
                  <td width="43%" align="right"><span class="abc"><font color="red">*</font>phone:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="phone" type="text" value="<%=ub.getPhone()%>" size="33">
                  </span></td>
                </tr>
                <tr>
                  <td width="43%" align="right"><span class="abc"><font color="red">*</font>email:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="email" type="text" value="<%=ub.getEmail()%>" size="33">
                  </span></td>
                </tr>
                <tr>
                  <td width="43%" align="right"><span class="abc"><font color="red">*</font>zipcode:&nbsp;</span></td>
                  <td width="57%" align="left"><span class="abc">&nbsp;
                    <input name="zipcode" type="text" value="<%=ub.getPostcode()%>" size="33">
                  </span></td>
                </tr>
                <%
                  	if(checkOrderdetails==null) {
                  		%>
                  		<tr>
                  		<td width="43%" align="right"><span class="abc">
                    	<input type="button" name="submit" value="complete order">&nbsp;</span></td>
                  		<td width="57%" align="left"><span class="abc">&nbsp;
                    	<input type="submit" name="update" value="change info">
                  		</span></td>
                		</tr>                  		
                  		<%
                  	}
                  	else {
                  		%>
                  		<tr>
                  		<td width="43%" align="right"><span class="abc">
                    	<input type="submit" name="submit" disabled value="complete order">&nbsp;</span></td>
                  		<td width="57%" align="left"><span class="abc">&nbsp;
                    	<input type="button" name="updata" disabled value="change info">
                  		</span></td>
                		</tr>                  		
                  		<%
                  	}
                %>
              </tbody>
            </table></td>
          </tr></form>
          
          <tr>
            <td height="23" align="center"><table width="42%" height="125" border="1" cellpadding="0" cellspacing="0">
              <tbody>
                <tr>
                  <td colspan="4" align="center">My Cart</td>
                </tr>
                <tr>
                  <td width="22%" align="center">Goods Number</td>
                  <td width="45%" align="center">Goods Name</td>
                  <td width="17%" align="center">Price/per</td>
                  <td width="16%" align="center">Count</td>
                </tr>
                <%
                	for(int i = 0; i < list.size(); i++) {
                		GoodsBean gb = list.get(i);
                		%>
                		<tr>
                  		<td align="center"><%=gb.getGoodsId()%></td>
                  		<td align="center"><%=gb.getGoodsName()%></td>
                  		<td align="center"><%=gb.getGoodsPrice()%></td>
                  		<td align="center"><%=mbo.getGoodsNumById(gb.getGoodsId())%></td>
                		</tr>
                		<%
                	}
                 %>
                <tr>
                  <td colspan="4" align="left">You have chose goods totally value USD <%=total%></td>
                </tr>
                <tr>
                  <td colspan="4" align="center"><input type="button" name="changeCart" value="change cart" onclick="return returnCart();"></td>
                </tr>
              </tbody>
            </table></td>
          </tr>
          <tr>
            <td align="right"><a href="ShoppingCI2?type=relogin"><img src="imgs/cartpre.gif" width="87" height="19" alt=""/></a>&nbsp;
            <%
            	if(checkOrderdetails==null) {
            		%><a href="OrderCIServlet"><img src="imgs/cartnext.gif" width="87" height="19" alt=""/></a><%
            	}
            	else {
            		%><img src="imgs/cartnext.gif" width="87" height="19" alt=""/><%
            		session.removeAttribute("preCart");
            	}
             %>
            </td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td align="center"><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
</body>
</html>
