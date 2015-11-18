$(function(){
	$(".login-btn").bind("click",function(){
		var username = $("#login-username-id").val();
		var password = $("#login-pwd-id").val();
		alert(username);
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