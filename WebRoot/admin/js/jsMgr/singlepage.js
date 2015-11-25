$(function(){
	//展示添加界面
	$(".vs-sp-add-cls").bind("click",function(){
		$(".spage").css("display", "none");
		$(".vs-sp-add-btn-cls").css("display", "block");
	});
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/singlepage/listAllSPInfo.html" ;
	});
	
	$(".vs-sp-update-cls").bind("click",function(){
		$(".spage").css("display", "none");
		$(".vs-sp-add-btn-cls").css("display", "block");
		var pageId = $(this).parent().find("input[name='pageId']").val();
//		alert(pageId);
	});
	
	
})