<%@ page language="java" import="java.util.*,com.lby.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	GoodsBeanBo gbb = new GoodsBeanBo();
	List<GoodsBean> list = gbb.getGoodsByPage(7, 1);
%>
<table width="95%" border="0" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr>
      <td height="50"><img src="imgs/logo5.png" width="300" height="70" alt=""/></td>
    </tr>
    <tr>
      <td height="300"><a href=ShowGoodsCIServlet?flag=showdetail&goodsId=5><img src="imgs/05.jpg" width="300" height="300" alt=""/></a></td>
    </tr>
    <tr>
      <td height="10" bgcolor="#FFDDDE"></td>
    </tr>
    <tr>
      <td height="50"><img src="imgs/logo6.png" width="300" height="50" alt=""/></td>
    </tr>
    <tr>
      <td height="300"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td width="11%" height="37" align="center">Rate</td>
            <td width="58%" height="37" align="center">Goods Name</td>
            <td width="31%" height="37" align="center">Sold number</td>
          </tr>
          <%
          	for(int i = 0; i < list.size(); i++) {
          		GoodsBean gb = list.get(i);
  
          		%>
          			<tr>
            		<td height="37" align="center"><%=i + 1%></td>
            		<td height="37" align="center"><table cellspacing="0" cellpadding="0">
              		<tr>
                	<td><a href="ShowGoodsCIServlet?flag=showdetail&goodsId=<%=gb.getGoodsId()%>"><%=gb.getGoodsName()%></a></td>
              		</tr>
            		</table></td>
            		<td height="37" align="center"><%=gb.getClickNum()%></td>
          			</tr>
          		<%
          	}
           %>
        </tbody>
      </table></td>
    </tr>
  </tbody>
</table>