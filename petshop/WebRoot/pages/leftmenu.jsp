<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/taglib/common.jsp" %>
<link href="<%=request.getContextPath()%>/pages/css/leftmenu.css" rel="stylesheet" type="text/css" />
<div class="lmenu">
	<div class="lmenu_items">
    	<div class="lmenu_title">Category</div>
    	<logic:present name="categoryMenuList">
    		<logic:iterate id="menu" name="categoryMenuList">
    			<div class="lmenu_item">
	   				<div class="p_category">
	   					<a href="/petshop/listGoods.do?category=${menu.cid }"><span class="p_category_sapn">${menu.pname }</span></a>
	   				</div>
	            	<div class="sub_category">
	            		<logic:iterate id="subcategory" name="menu" property="subcategoryList">
	            			<a href="/petshop/listGoods.do?category=${subcategory.cid }"><span class="sub_category_span">${subcategory.cname }</span></a>
	            		</logic:iterate>
	            	</div>
    			</div>
    		</logic:iterate>
    	</logic:present>
    </div>
</div>
