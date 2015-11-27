$(function(){
	
	//展示添加用户界面
	$(".vs-admin-add-btn-cls").bind("click",function(){
		$(".show-user-table").css("display", "none");
		$(".vs-admin-insert-cls").css("display", "block");
		
	});
	//返回管理员列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/account/listUserInfo.htm" ;
	});
	//展示修改用户界面
	$(".vs-admin-update-btn-cls").bind("click",function(){
		var userId = $(this).parent().parent().children().eq(0).html();
		var param = {userId: userId} ;
		$.ajax({
			url:ctx + "/account/getUserByIdAction.htm",
			type:"post",
			data:param,
			dataType:"json",
//			async:true,
			success:function(data){
//				alert(data.pwd) ;
				$(".vs-admin-update input[name='userId']").val(data.userId) ;
				$(".vs-admin-update input[name='userName']").val(data.userName) ;
				$(".vs-admin-update input[name='userEmail']").val(data.userEmail) ;
				$(".vs-admin-update input[name='hidden_old_password']").val(data.pwd) ;
			}
		});
		
		
		$(".vs-admin-update").css("display", "block");
		$(".show-user-table").css("display", "none");
	});
	
	//删除用户数据
	$(".vs-admin-removed-btn-cls").bind("click",function(){
		var userId = $(this).parent().parent().children().eq(0).html();
		window.location.href=ctx+"/account/removedUserAction.htm?userId=" + userId;
	});
	
});

/**
 * 添加用户信息验证函数
 * @returns {Boolean}
 */
function addUserSubmit(){
	var name = $("input[name='userName']").val() ;
	var email = $("input[name='userEmail']").val() ;
	var password = $("input[name='password']").val() ;
	var password_confirm = $("input[name='password_confirm']").val() ;
	
	if(password!=password_confirm){
		alert("please check password!");
		return false ;
	}
}

/**
 * 修改用户信息相关验证函数
 * @returns {Boolean}
 */
function updateUserSubmit(){
	var name = $(".vs-admin-update input[name='userName']").val() ;
	var email = $(".vs-admin-update input[name='userEmail']").val() ;
	
	var password_old_db = $(".vs-admin-update input[name='hidden_old_password']").val() ;
	var password_old = $(".vs-admin-update input[name='old_password']").val() ;
	
	var password = $(".vs-admin-update input[name='password']").val() ;
	var password_confirm = $(".vs-admin-update input[name='password_confirm']").val() ;
	
//	alert(password_old_db) ;
	if(password_old_db!=password_old){
		alert("旧密码输入有误，请重新输入！");
		 $(".vs-admin-update input[name='old_password']").val("") ;
		 $(".vs-admin-update input[name='password']").val("") ;
		 $(".vs-admin-update input[name='password_confirm']").val("") ;
		return false ;
	}
	if(password!=password_confirm){
		alert("两次输入的新密码有误!");
		$(".vs-admin-update input[name='password']").val("") ;
		$(".vs-admin-update input[name='password_confirm']").val("") ;
		return false ;
	}
}