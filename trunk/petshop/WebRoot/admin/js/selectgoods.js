	var request = null;
	var tempvar = null;
	var mainInputValue = null;
	var subInputValue = null;
	var tempaddvar = null;//������optionʱ��select id
	
	//���ı丸����ʱ��ͬʱ�ı��ӷ��࣬�ӷ���ȫ�������ݿ��ȡ,argΪһ��select����
	function changeoption(arg){
		var cid = arg.value;//�õ��������cid����option��valueֵ
		//alert(cid);
		createRequest();
		request.onreadystatechange = getcategorycallback;//ÿ�ı�һ��״̬����һ��callback����
		request.open("post", "/petshop/getCCategoryByParent.do?cid=" + cid, true);//�������ӣ�//��options��HTML����ͨ��action���
		request.send(null);
	}
	
	//��ȡ�ӷ����callback����
	function getcategorycallback() {
		if (request.readyState == 4) {
			var text = request.responseText;
			if ("false" == text) {
				alert("��ȡ�ӷ���ʧ�ܣ�������");
			} else {
				//���ӷ�������option��HTML����ͨ��action���
				document.getElementById("category_sub").innerHTML = text;
			}
		}
	}
	
	function createRequest() {//����һ��request
		try {
			request = new XMLHttpRequest();
		} catch (trymicrosoft) {
			try {
				request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (othermicrosoft) {
				try {
					request = new ActiveObject("Microsoft.XMLHTTP");
				} catch (failed) {//��������У���request����Ϊnull
					request = null;
				}
			}
		}
		if (request == null) {//���û�еõ�request��һ������
			alert("�����������֧��Ajax");
		}
	}
	
	//�Ƴ�ĳ������
	function removecategory(arg){
		var di = document.getElementById(arg);
		var cid = di.value;
		//alert(cid);
		if(di.value==""){
			alert("��ѡ����Ҫɾ����ѡ��");
			return;
		}
		createRequest();
		tempvar = arg;
		request.onreadystatechange = removecallback;//ÿ�ı�һ��״̬����һ��callback����
		request.open("post", "/petshop/removeCategory.do?cid=" + cid, true);//��������
		request.send(null);
	}
	
	//�Ƴ�optionʱ��callback
	function removecallback(){
		if (request.readyState == 4) {
			var text = request.responseText;
			if ("true" == text) {//����Ƴ��ɹ��Ļ�����ֱ�ӷ���true�����򷵻ؾ�����Ϣ�����磺����ɾ����Ӧ�������ӷ���
				var di = document.getElementById(tempvar);
				di.remove(di.selectedIndex);
				alert("�Ƴ��ɹ�");
			} else {
				alert(text);//ֱ����option����Ƴ��Ľ��
			}
		}
	}
	
	//�����������Ƿ��Ѿ����ڣ��������ڣ���ֵ���� mainInputValue �� subInputValue
	function checkinput(arg0,arg1){
		var inputValue = arg0.value;
		var vals = document.getElementById(arg1).getElementsByTagName("option");
		for(i=0;i<vals.length;i++){
			if(inputValue == vals[i].innerHTML){
				alert("�÷����Ѵ���");
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
	
	//��ӷ��࣬argΪ ��Ҫ��ӵ��Ǹ�select��id
	function addcategory(arg){
		createRequest();
		tempaddvar = arg;
		request.onreadystatechange = addcallback;//ÿ�ı�һ��״̬����һ��callback����
		request.open("post", "/petshop/addCategory.do?cid=" + cid, true);//��������
		request.send(null);
	}
	
	//��ӷ����callback
	function addcallback(){
		if (request.readyState == 4) {
			var text = request.responseText;//������ʧ�ܣ���ֱ�ӷ���һ��false������ӳɹ��ͷ���һ���µ�option��HTML����
			if ("false" == text) {
				alert("���ʧ��");
			} else {
				var di = document.getElementById(tempaddvar);
				di.innerHTML += text;
				alert("��ӳɹ�");
			}
		}
	}