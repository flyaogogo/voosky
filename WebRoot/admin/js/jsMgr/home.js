$(function(){
	//左导航样式
	$("#vsLeft .vs-home").addClass("cur");
	
	//跳转到单页面相应的修改界面
	$(".vs-sp-update-cls").bind("click",function(){
		var pageId = $(this).parent().find("input[name='pageId']").val();
		console.log(pageId) ;
		window.location.href=ctx+"/singlepage/listAllSPInfo.htm" ;
	});
})