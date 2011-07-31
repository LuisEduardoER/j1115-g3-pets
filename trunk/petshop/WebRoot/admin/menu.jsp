<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left.html</title>
<script language=JavaScript> 
function showmenu(strID){ 
    if (strID.style.display=="none"){ 
        strID.style.display = "block"; 
    }else{ 
        strID.style.display = "none"; 
    } 
} 
</script> 

  </head>
  
  <body>
    <table>
    	<tr >
    		<th align="left" style="cursor: pointer;" onclick="javascript:showmenu(lay0)">个人信息管理</th>
    	</tr>  	
    	<tr id="lay0" style="display:block;">
    	<td><a href="modAdminPass.jsp" target="show">修改密码</a></td>
    	</tr>
    	
    	<tr>
    		<th align="left" style="cursor: pointer;" onclick="javascript:showmenu(lay1)">商品管理</th>
    	</tr>
    	<tr id="lay1" style="display:block;">
    		<td>添加商品<br>修改商品<br>删除商品</td>
    	</tr>
   
    	<tr>
    		<th align="left" style="cursor: pointer;" onclick="javascript:showmenu(lay2)">商品分类管理</th>
    	</tr>
    	<tr id="lay2" style="display:block;">
    	<td><a href="../GetParentCategory" target="show">父分类管理</a><br>子分类管理</td>
    	</tr>
  
    	
    	<tr>
    		<th align="left" style="cursor: pointer;" onclick="javascript:showmenu(lay3)">商品订单管理</th>
    	</tr>
    	<tr id="lay3" style="display:block;">
    	<td>修改订单<br>删除订单<br>发货管理<br></td>
    	</tr>

    </table>
  </body>
</html>

