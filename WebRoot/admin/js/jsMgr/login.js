$(function(){
	$(".login-btn").bind("click",function(){
		login() ;
	})
	
	$("body").keydown(function(event) {
	    if (event.keyCode == "13") {//keyCode=13是回车键
	    	login();
	    }
	});
//	$.ajax({
//		url:ctx+"/rdsinstance/listOracleSpecialKeyword.htm",
//		type:"post",
//		dataType:"json",
//		async:true,
//		success:function(data){
//			oraKeyword=data;
//		}
//	});
});

/**
 * 登陆操作
 */
function login(){
	var username = $("#login-username-id").val();
	var password = $("#login-pwd-id").val();
	var code = $(".captcha").val();
	var url = ctx + "/account/verifyAccount.htm" ;
	
	var param = {username:username,password:password,code:code} ;
	
	post(url,param) ;
}

/**
 * 模拟Form的Post请求
 * @param URL
 * @param PARAMS
 * @returns {___anonymous793_796}
 */
function post(URL, PARAMS) {
	var temp = document.createElement("form");
	temp.action = URL;
	temp.method = "post";
	temp.style.display = "none";
	for ( var x in PARAMS) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = PARAMS[x];
		temp.appendChild(opt);
	}
	document.body.appendChild(temp);
	temp.submit();
	return temp;
}

//===验证码空验证====
function isCode(obj) {
	if ($(".code").val() == "") {
		$(".code-lv").show();
		$(".code-lv .login-validation-font").html(notNull);
	} else  {
		$(".code-lv").hide();
	}
}

function refresh() {
	document.getElementById("vcode").src=ctx+"/authImg?now="+new Date();//使用时间作为参数避免浏览器从缓存取图片
}
