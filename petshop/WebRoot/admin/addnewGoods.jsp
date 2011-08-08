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
	<script type="text/javascript">
		function checknumber(){
			var price = document.getElementById("gprice").value;
			if(!Number(price)){
				document.getElementById("gprice").value="";
				document.getElementById("msg").innerHTML="必须是数字";
			}else{
				document.getElementById("msg").innerHTML="";
			}
		}
		function checkInteger(){
		 var gnum = document.getElementById("gnum").value;
		 var num = gnum.match(/^[0-9]+$/);
			if (num==null)
    		{
        		document.getElementById("gnum").value="";
				document.getElementById("msg2").innerHTML="输入的是非整数";
    		}
    		else
    		{
       		 document.getElementById("msg2").innerHTML="";
    		}
		}
		
		function checkall(){
			var optionvalue = document.getElementById("category_main").value;
			var gname = document.getElementById("gname").value;
			 var gnum = document.getElementById("gnum").value;
			 var price = document.getElementById("gprice").value;
			 var picture = document.getElementById("picture").value;
			if(optionvalue==-1){
				alert("请选择分类!")
				return false;
			}
			if(gnum=="" || gname=="" || price=="" ||picture==""){
				alert("至少还有一个未填项");
				return false;
			}
		}
	</script>
  </head>
  
  <body>
  	<html:form action="/addNewGoods" method="post" enctype="multipart/form-data" onsubmit="return checkall()">
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
			<html:text property="gname" styleId="gname" value=""></html:text><font color="red">*</font>
		</td>
   	</tr>
   
   	<tr>
   		<td>价格:</td>
   		<td>
   			<html:text property="gprice" value="" styleId="gprice" onblur="checknumber()"></html:text>元<font color="red">*</font>  <font id="msg" color="red"></font>
   		</td>
   	</tr>
   	<tr>
   		<td>商品数量:</td>
   		<td>
   			<html:text property="gnum" value="" styleId="gnum" onblur="checkInteger()"></html:text> <font color="red">*</font><font id="msg2" color="red"></font>
   		</td>
   	</tr>
   	<tr>
   		<td>商品图片:</td>
   		<td>
   			<html:file property="goodspic" value="" styleId="picture"></html:file><font color="red">仅支持jpg格式,必填项</font>
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
