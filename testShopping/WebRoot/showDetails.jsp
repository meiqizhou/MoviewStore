<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	GoodsBean gb = (GoodsBean) request.getAttribute("GoodsBean");
	String goodsId = gb.getGoodsId();
	String goodsName = gb.getGoodsName();
	String goodsInfo = gb.getGoodsInfo();
	float goodsPrice = gb.getGoodsPrice();
	int goodsNum = gb.getGoodsNum();
	String publisher = gb.getPublisher();
	String photo = gb.getPhoto();
	String type = gb.getType();	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showDetails.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="myCss/mycss.css">
	<script languege="javascript">
		//javascript <a></a>
		function returnHall() {
			window.open("index.jsp", "_self");
		}
		
		function addGoods(goodsId) {
			window.open("ShoppingCIServlet?type=addGoods&goodsId="+goodsId, "_self");
		}
	</script>
  </head>
  
<body background="imgs/bg.bmp">
<table width="97%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center"><jsp:include flush="true" page="head.jsp"></jsp:include></td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="1" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
          <tr>
            <td width="17%" rowspan="8"><img src="imgs/<%=photo%>" width="202" height="235" alt=""/></td>
            <td width="83%" align="center"><font size="5"><%=goodsName%></font></td>
          </tr>
          <tr>
            <td>Price:USD <%=goodsPrice%></td>
          </tr>
          <tr>
            <td>ISBN:<%=goodsId%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>Type:<%=type%></td>
          </tr>
          <tr>
            <td>Publisher:<%=publisher%></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="123" align="left" valign="top">Description:<%=goodsInfo%></td>
          </tr>
          <tr>
            <td colspan="2"><input type="button" name="buy" onclick="return addGoods(<%=goodsId%>)" value="Buy">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button" id="button" onclick="returnHall();" value="Back to Main Page"></td>
            </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
            </tr>
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
