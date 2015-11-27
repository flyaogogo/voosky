$(function(){
	$(".login-btn").bind("click",function(){
		var username = $("#login-username-id").val();
		var password = $("#login-pwd-id").val();
		//alert(username);
		var url = ctx + "/account/verifyAccount.htm" ;
		
		var param = {username:username,password:password} ;
		
		post(url,param) ;
	})
	
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

function refresh() {
document.getElementById("authImg").src="authImg?now="+new Date();//使用时间作为参数避免浏览器从缓存取图片
}
