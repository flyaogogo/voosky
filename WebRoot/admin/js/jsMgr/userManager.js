$(function(){
	
	$(".actionBtn").bind("click",function(){
		$(".vs-admin-insert-cls").css("display", "block");
		
		
		
//		$.ajax({
//			url:ctx+"/rdsinstance/listOracleSpecialKeyword.htm",
//			type:"post",
//			dataType:"json",
//			async:true,
//			success:function(data){
//				oraKeyword=data;
//			}
//		});
	});
//	$("#adduserFormId").submit() ;
	
	$(".add-user-btn-cls").bind("click",function(){
		
	});
	
});

function addUserSubmit(){
	var name = $("input[name='userName']").val() ;
	var email = $("input[name='userEmail']").val() ;
	var password = $("input[name='password']").val() ;
	var password_confirm = $("input[name='password_confirm']").val() ;
	
	if(password!=password_confirm){
		alert("please check password!");
		return false ;
	}
//	var param = {userName: name, userEmail:email, pwd:password} ;
//	$.ajax({
//		url:ctx + "/account/addUserAction.html",
//		type:"post",
//		data:param,
//		dataType:"json",
//		async:true,
//		success:function(data){
//			alert(1) ;
//		}
//	});
}