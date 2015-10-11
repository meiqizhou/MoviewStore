<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 String totalPrice = (String) request.getAttribute("totalPrice");
 List<GoodsBean> list = (List<GoodsBean>) request.getAttribute("preCart");
 //get session
 MyCartBO mbo = (MyCartBO) session.getAttribute("myCart");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showMyCart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">
	<script language="javascript">
		function clearCart() {
			window.open("ShoppingCIServlet?type=clear","_self");
		}
	</script>

  </head>
  
  <body background="imgs/bg.bmp">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr>
      <td><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <tr>
      <td>
      <form action="ShoppingCIServlet?type=update" method="post">
      <table align="center" width="70%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td colspan="6" align="center"><img src="imgs/cartnavi-1.gif" width="599" height="49" alt=""/></td>
            </tr>
          <tr>
            <td width="17%" height="36" align="center">Goods Number</td>
            <td width="25%" align="center">Goods Name</td>
            <td width="25%" align="center">Price/per</td>
            <td colspan="3" align="left">Count</td>
          </tr>
          <%
          	for(int i = 0; i < list.size(); i++) {
          		GoodsBean gb = list.get(i);
          		%>
          		<tr>
            	<td width="17%" height="32" align="center"><%=gb.getGoodsId()%></td>
            	<td width="25%" align="center"><%=gb.getGoodsName()%></td>
            	<td width="25%" align="center">USD: <%=gb.getGoodsPrice()%></td>
            	<td width="11%" align="center">
            	<!-- hidden -->
            	<input type="hidden" name="goodsId" value="<%=gb.getGoodsId()%>">
              	<input name="newNum" type="text" size="6" value="<%=mbo.getGoodsNumById(gb.getGoodsId())%>"></td>
           		<td width="11%" align="center"><a href="ShoppingCIServlet?type=deleteGoods&goodsId=<%=gb.getGoodsId()%>">Delete</a></td>
            	<td width="11%" align="center"><a href="ShowGoodsCIServlet?flag=updateGoods&goodsId=<%=gb.getGoodsId()%>">Info</a></td>
          		</tr>
          		<%
          	}
          %>
          <tr>
            <td height="33" colspan="2" align="right"><span class="abc">
              <input type="button" name="deleteAll" value="Clear Cart" onclick="return clearCart();">
            </span>&nbsp;</td>
            <td colspan="4" align="left" class="abc"><span class="abc">
              &nbsp;<input type="submit" name="changeNum" value="Change Num">
            </span></td>
            </tr>
          <tr>
            <td height="22" colspan="6">&nbsp;</td>
            </tr>
          <tr>
            <td height="34" colspan="6">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tbody>
                <tr>
                  <td width="69%" height="27">You have chose goods totally value USD <%=totalPrice%>, click <a href="index.jsp">here</a> continue shopping</td>
                  <td width="31%" align="right"><a href="ShoppingCI2"><img src="imgs/cartnext.gif" width="87" height="19" alt=""/></a></td>
                </tr>
              </tbody>
            </table></td>
            </tr>
        </tbody>
      </table>
      </form>
      </td>
    </tr>
    <tr>
      <td><jsp:include flush="true" page="tail.jsp"></jsp:include></td>
    </tr>
  </tbody>
</table>
  </body>
</html>
