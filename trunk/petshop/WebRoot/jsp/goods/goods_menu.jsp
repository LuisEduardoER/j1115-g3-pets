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
	<div class="lmenu_items" style="font-family:微软雅黑,黑体; font-weight: 600; color: #CCFFCC">
    	<div class="lmenu_title" style="font-family: 'Comic Sans MS'">MainMenu</div>
        <div class="lmenu_item" >
    		<div class="p_category" >
				<span class="p_category_sapn">
					Dog's Shop
				</span>
			</div>
			<div class="sub_category">
				<span class="sub_category_span">
            		<%
						request.setAttribute("c1", "7");
					%>
					<html:link action="listGoods" paramId="category" paramName="c1">狗</html:link>
            	</span>
            </div>
            <div class="sub_category">
            	<span class="sub_category_span">
            		<%
						request.setAttribute("c2", "8");
					%>
            		<html:link action="listGoods" paramId="category" paramName="c2">狗の用品</html:link>
            	</span>
            </div>
			<div class="sub_category">
            	<span class="sub_category_span">
            		<%
						request.setAttribute("c3", "9");
					%>
            		<html:link action="listGoods" paramId="category" paramName="c3">狗の食品</html:link>
            	</span>
            </div>
			<div class="sub_category">
            	<span class="sub_category_span">
            		<%
						request.setAttribute("c4", "10");
					%>
            		<html:link action="listGoods" paramId="category" paramName="c4">狗の药品</html:link>
            	</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">Cat's	Shop</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<%
						request.setAttribute("c5", "11");
					%>
					<html:link action="listGoods" paramId="category" paramName="c5">猫</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c6", "12");
					%>
					<html:link action="listGoods" paramId="category" paramName="c6">猫の用品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c7", "13");
					%>
					<html:link action="listGoods" paramId="category" paramName="c7">猫の食品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c8", "14");
					%>
					<html:link action="listGoods" paramId="category" paramName="c8">猫の药品</html:link>
				</span>
                
            </div>
        </div>
 
 		 <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">Bird's Shop</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<%
						request.setAttribute("c9", "19");
					%>
					<html:link action="listGoods" paramId="category" paramName="c9">鸟类</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c10", "20");
					%>
					<html:link action="listGoods" paramId="category" paramName="c10">鸟の用品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c11", "21");
					%>
					<html:link action="listGoods" paramId="category" paramName="c11">鸟の食品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c12","22");
					%>
					<html:link action="listGoods" paramId="category" paramName="c12">鸟の药品</html:link>
				</span>
            </div>
        </div>
        
        <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">Fish's Shop</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<%
						request.setAttribute("c13", "23");
					%>
					<html:link action="listGoods" paramId="category" paramName="c13">鱼类</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c14", "24");
					%>
					<html:link action="listGoods" paramId="category" paramName="c14">鱼の用品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c15", "25");
					%>
					<html:link action="listGoods" paramId="category" paramName="c15">鱼の食品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c16", "26");
					%>
						<html:link action="listGoods" paramId="category" paramName="c16">鱼の药品</html:link>
				</span>
                
            </div>
        </div>
        
          <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">Reptile's Shop</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<%
						request.setAttribute("c17", "27");
					%>
					<html:link action="listGoods" paramId="category" paramName="c17">爬行类</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c18", "28");
					%>
					<html:link action="listGoods" paramId="category" paramName="c18">爬行类の用品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c19", "29");
					%>
					<html:link action="listGoods" paramId="category" paramName="c19">爬行类の食品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c20", "30");
					%>
					<html:link action="listGoods" paramId="category" paramName="c20">爬行类の药品</html:link>
				</span>
            </div>
            
                <div class="lmenu_item">
    		<div class="p_category"><span class="p_category_sapn">Small Pet's Shop</span></div>
            <div class="sub_category">
            	<span class="sub_category_span">
					<%
						request.setAttribute("c21", "15");
					%>
					<html:link action="listGoods" paramId="category" paramName="c21">小动物</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c22", "16");
					%>
					<html:link action="listGoods" paramId="category" paramName="c22">小动物の用品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c23", "17");
					%>
					<html:link action="listGoods" paramId="category" paramName="c23">小动物の食品</html:link>
				</span>
				<span class="sub_category_span">
					<%
						request.setAttribute("c24", "18");
					%>
					<html:link action="listGoods" paramId="category" paramName="c24">小动物の药品</html:link>
				</span>
            </div>
        </div>
    </div>
</div>
