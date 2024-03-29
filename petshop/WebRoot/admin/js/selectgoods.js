	var request = null;
	var tempvar = null;
	var mainInputValue = null;
	var subInputValue = null;
	var tempaddvar = null;//存放添加option时的select id
	
	//当改变父分类时，同时改变子分类，子分类全部从数据库获取,arg为一个select对象
	function changeoption(arg){
		var cid = arg.value;//得到父分类的cid。即option的value值
		//alert(cid);
		createRequest();
		request.onreadystatechange = getcategorycallback;//每改变一次状态调用一次callback方法
		request.open("post", "/petshop/getCCategoryByParent.do?cid=" + cid, true);//处理连接，//将options的HTML代码通过action输出
		request.send(null);
	}
	
	//获取子分类的callback方法
	function getcategorycallback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			if ("false" == text) {
				alert("获取子分类失败，请重试");
			} else {
				//将子分类所有option的HTML代码通过action输出
				document.getElementById("category_sub").innerHTML = text;
			}
		}
	}
	
	function createRequest() {//创建一个request
		try {
			request = new XMLHttpRequest();
		} catch (trymicrosoft) {
			try {
				request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (othermicrosoft) {
				try {
					request = new ActiveObject("Microsoft.XMLHTTP");
				} catch (failed) {//如果都不行，则将request设置为null
					request = null;
				}
			}
		}
		if (request == null) {//如果没有得到request则报一个错误
			alert("您的浏览器不支持Ajax");
		}
	}
	
	//移除某个分类
	function removecategory(arg){
		var di = document.getElementById(arg);
		var cid = di.value;
		//alert(cid);
		if(di.value==""){
			alert("请选择需要删除的选项");
			return;
		}
		createRequest();
		tempvar = arg;
		request.onreadystatechange = removecallback;//每改变一次状态调用一次callback方法
		request.open("post", "/petshop/removeCategory.do?cid=" + cid, true);//处理连接
		request.send(null);
	}
	
	//移除option时的callback
	function removecallback(){
		if (request.readyState == 4) {
			var text = request.responseText;
			if ("true" == text) {//如果移除成功的话，就直接返回true，否则返回具体信息，例如：请先删除对应的所有子分类
				var di = document.getElementById(tempvar);
				di.remove(di.selectedIndex);
				alert("移除成功");
			} else {
				alert(text);//直接由option输出移除的结果
			}
		}
	}
	
	//检查输入分类是否已经存在，若不存在，则将值存入 mainInputValue 或 subInputValue
	function checkinput(arg0,arg1){
		var inputValue = arg0.value;
		var vals = document.getElementById(arg1).getElementsByTagName("option");
		for(i=0;i<vals.length;i++){
			if(inputValue == vals[i].innerHTML){
				alert("该分类已存在");
				arg0.value = "";
				return;
			}
		}
		if(arg1 == "category_main"){
			mainInputValue = arg0.value;
		}
		if(arg1 == "category_sub"){
			subInputValue = arg0.value;
		}
	}
	
	//添加分类，arg为 需要添加的那个select的id
	function addcategory(arg){
		createRequest();
		tempaddvar = arg;
		request.onreadystatechange = addcallback;//每改变一次状态调用一次callback方法
		request.open("post", "/petshop/addCategory.do?cid=" + cid, true);//处理连接
		request.send(null);
	}
	
	//添加分类的callback
	function addcallback(){
		if (request.readyState == 4) {
			var text = request.responseText;//如果添加失败，就直接返回一个false，若添加成功就返回一个新的option的HTML代码
			if ("false" == text) {
				alert("添加失败");
			} else {
				var di = document.getElementById(tempaddvar);
				di.innerHTML += text;
				alert("添加成功");
			}
		}
	}