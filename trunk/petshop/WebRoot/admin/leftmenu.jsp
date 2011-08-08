<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp" %>
<link href="<%=request.getContextPath()%>/pages/css/leftmenu.css" rel="stylesheet" type="text/css" />
<style>
<!--
	.sub_category_span a {
		color: #666;
	}
	.sub_category_span a:visited{
		color: #666;
	}
	.sub_category_span a:hover{
		
	}
-->
</style>
<div class="lmenu">
	<div class="lmenu_items" style="font-family: 微软雅黑,黑体; font-weight: 600; color: #CCFFCC">
    	<div class="lmenu_title" style="font-family: 'Comic Sans MS'">MainMenu</div>
        <div class="lmenu_item" >
    		<div class="p_category" ><span class="p_category_sapn">个人信息管理</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
            		<html:link action="/modAdminPassView">修改密码</html:link>
            	</span>
            </div>
        </div>
        
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">商品管理</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/showAllGoods" >增删改商品</html:link>
				</span>
                
            </div>
        </div>
 
 		 <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">商品分类管理</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/getParentCategory" >分类管理</html:link>
				</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">商品订单管理</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<html:link action="/showAllOrder" >订单管理</html:link>
				</span>
                
            </div>
        </div>
    </div>
</div>
