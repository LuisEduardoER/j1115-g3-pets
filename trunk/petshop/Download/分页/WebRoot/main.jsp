<%@ page language="java" import="java.util.*,com.java.dao.*"
	pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>My JSP 'main.jsp' starting page</title>

		<style type="text/css">
td {
	padding: 5px;
	text-align: center;
}
</style>
	</head>
	<script type="text/javascript">
  	function delemp(){
  		var b = false;
  		var chks = document.delForm.empnos;
  		for(i=0;i<chks.length;i++){
  			if(chks[i].checked){
  				b = true;
  			}
  		}
  		if(b){
  			if(confirm("确定要删除吗?")){
  				return true;
  			}else{
  				return false;
  			}
  			
  		}else{
  			alert("请选择要删除的选项.")
  			return false;
  		}
  	}
  	
  	function pageto(){
  		var np = document.all("nowPage").value;
  		if(!isNaN(np)){
  			if(np.length>0){
  			location.href="EmpListServlet?nowPage="+np;
  			}
  		}else{
  			document.all("nowPage").value="";
  			alert("请输入合法的数字!");
  		}
  		
  	}
  	
  </script>
	<body>
		<div>
			<form action="DelEmpServlet" name="delForm" method="post"
				onsubmit="return delemp()">
				<table border="1" width="80%" style="border-collapse: collapse;">
					<tr>
						<th> 
							p选择 
						</th>
						<th>
							员工姓名
						</th>
						<th>
							编号
						</th>
						<th>
							岗位
						</th>
						<th>
							主管
						</th>
						<th>
							入职时间
						</th>
						<th>
							工资
						</th>
						<th>
							奖金
						</th>
						<th>
							部门
						</th>
						<th>
							操作
						</th>
					</tr>
					<%
    		Object obj = request.getAttribute("elist");
    		if(obj!=null){
    			List<Emp> list = (List)obj;
    	
    			for(Emp emp : list){
    				pageContext.setAttribute("emp",emp);
		%>
					<tr>
						<td>
							<input type='checkbox' name='empnos' value='${emp.empno }'>
						</td>
						<td>
							${emp.ename }
						</td>
						<td>
							${emp.empno }
						</td>
						<td>
							${emp.job }
						</td>
						<td>
							${emp.mgr }
						</td>
						<td>
							${emp.hiredate }
						</td>
						<td>
							${emp.sal }
						</td>
						<td>
							${emp.comm }
						</td>
						<td>
							${emp.deptno }
						</td>
						<td>
							<a href="FindEmpServlet?empno=${emp.empno }">修改</a>
						</td>
					</tr>

					<%		
    			}
    		}
    	 %>
	<tr>
		<td colspan="10">
			<a href="EmpListServlet">首页</a>
			<a href="EmpListServlet?nowPage=${page-1 }">上一页</a> 
			<a href="EmpListServlet?nowPage=${page+1 }">下一页</a> 
			<a href="EmpListServlet?nowPage=${endPage }">尾页</a>
			<input type="text" id="nowPage" size="3" /><input type="button" value="GO" onclick="pageto()">   
			
		 </td>
	</tr>
				</table>
				<input type="submit" value="删除" />
				<input type="button" value="新增" onclick="" />
			</form>
		</div>
	</body>
</html>
