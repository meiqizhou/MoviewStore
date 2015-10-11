<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String username = (String) request.getAttribute("username");
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="abc">
  <tbody>
    <tr>
      <td height="10" colspan="3" bgcolor="#FFDDDE"></td>
    </tr>
    <tr>
      <td width="20%" align="center"><img src="imgs/logo2.png" width="141" height="90" alt=""/></td>
      <td width="60%" align="center"><img src="imgs/logo1.png" width="410" height="94" alt=""/></td>
      <td width="20%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
  	<%
  		if(username != null) {
  			System.out.println("userId:" + username);
  			%>
  			<tr>
  			<td align="right">Welcome <%=username%></td>
  			</tr>
  			<%
  		} 
  	%>
    <tr>
      <td align="right"><a href="ShoppingCI2"><img src="imgs/logo3.png" width="26" height="24" alt=""/></a></td>
      <td class="abc"><a href="ShoppingCI2">[My account]</a></td>
    </tr>
    <tr>
      <td align="right"><a href="ShoppingCIServlet?type=back"><img src="imgs/logo4.png" width="25" height="25" alt=""/></a></td>
      <td><a href="ShoppingCIServlet?type=back">[My cart]</a></td>
    </tr>
  </tbody>
</table>
</td>
    </tr>
    <tr>
      <td colspan="3" height="10" bgcolor="#FFDDDE"></td>
    </tr>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody>
          <tr>
            <td width="11%">&nbsp;</td>
            <td width="11%" align="center" class="Navi"><a href="index.jsp">Home</a></td>
            <td width="11%">&nbsp;</td>
            <td width="11%" align="center" class="Navi"><a href="ShowGoodsCIServlet?flag=fenye&type=HongKong Moview">HongKong Moview</a></td>
            <td width="11%">&nbsp;</td>
            <td width="11%" align="center" class="Navi"><a href="ShowGoodsCIServlet?flag=fenye&type=USA Moview">USA Moview</a></td>
            <td width="11%">&nbsp;</td>
            <td width="11%" align="center" class="Navi"><a href="aboutUs.jsp">About us</a></td>
            <td width="11%">&nbsp;</td>
          </tr>
        </tbody>
      </table></td>
    </tr>
  </tbody></table>