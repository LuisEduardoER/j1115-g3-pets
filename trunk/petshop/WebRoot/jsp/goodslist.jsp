<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ include file="../taglib/common.jsp" %>
<style>
<!--
.goodsdetail{
	font-family: "Courier New","Comic Sans MS",΢���ź�,����;
}
.goodsdetail table{
	border-spacing:3px;
	border-collapse:collapse;
	border-width:4px;
	border-color:#9FBE3F;
	border-style:double;
}
.goodsdetail td{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail tr{
	border:solid 1px #9FBE3F;
	padding:3px;
}
.goodsdetail th{
	border:solid 1px #9FBE3F;
	padding:3px;
	text-align:center;
}
</style>
<hr />
<div class="goodsdetail">
  	<table width="100%">
  		<tr>
  			<th>��Ʒ���</th>
  			<th>��Ʒ����</th>
  			<th>��Ʒ����</th>
  			<th>��Ʒ����</th>
  			<th>��Ʒ���</th>
  		</tr>
    	<logic:present name="elist" scope="request">
    		<logic:iterate id="goods" name="elist">
    			<tr>
    				<td><bean:write name="goods" property="goodsid"/></td>
    				<td><bean:write name="goods" property="goodsCategory"/></td>
    				<td><bean:write name="goods" property="goodsName"/></td>
    				<td><bean:write name="goods" property="goodsPrice"/></td>
    				<td><bean:write name="goods" property="goodsBrief"/></td>
    			</tr>
    		</logic:iterate>
    	</logic:present>
    </table>
</div>
