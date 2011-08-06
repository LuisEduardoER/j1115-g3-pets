<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../taglib/common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加新商品</title>
	
	<script src="/petshop/admin/js/selectgoods.js"></script>
	<style type="text/css">
		*{
		font-family: "Courier New","Comic Sans MS",微软雅黑,黑体;
		}
	</style>
  </head>
  
  <body>
  	<html:form action="/addNewGoods" method="post" enctype="multipart/form-data">
  	<div>
    <div class="selectdiv">
    	<h4>父分类</h4>
            <logic:present name="pcategorymap">
            <html:select  property="cid"  styleId="category_main" onchange="changeoption(this)">
            	<option value="-1">--选择--</option>
            	<logic:iterate id="kv" name="pcategorymap" >
            		<option value="${kv.key}" id="test" >${kv.value}</option>
            	</logic:iterate>
            </html:select>
            </logic:present>
          
    </div>
    <div class="selectdiv">
    	<h4>子分类</h4>
        <select id="category_sub" size="1" name="sub">
        </select>
    </div>
</div>
  	
   	<table>
   	<tr>
   		<td>商品名称</td>
   		<td>
			<html:text property="gname" value=""></html:text>
		</td>
   	</tr>
   
   	<tr>
   		<td>价格:</td>
   		<td>
   			<html:text property="gprice" value=""></html:text>元  
   		</td>
   	</tr>
   	<tr>
   		<td>商品数量:</td>
   		<td>
   			<html:text property="gnum" value=""></html:text>
   		</td>
   	</tr>
   	<tr>
   		<td>商品图片:</td>
   		<td>
   			<html:file property="goodspic" value="" ></html:file><font color="red">仅支持jpg格式</font>
   			<font color="green" >${error}</font>
   		</td>
   	</tr>
   		<tr>
   		<td>商品简介:</td>
   		<td>
   			<html:textarea property="gbrief" rows="8" cols="50" value=""></html:textarea>
   		</td>
   	</tr>
   	<tr>
   		<td colspan=2 align="center">
   		<html:submit value="添加"></html:submit>
		<html:reset value="重写"></html:reset>
   		</td>  		
   	</tr>
   </table>
   </html:form>
  </body>
</html>
