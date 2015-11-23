$(function(){
	
	//展示自定义导航界面
	$(".vs-nav-add-btn-cls").bind("click",function(){
//		$(".navList").css("display", "none");
//		$(".items").css("display", "block");
		
		$(".navList").css("display", "none");
		$(".vs-nav-add-idtab-cls").css("display", "block");
	});
	
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/nav/listNavsInfo.html" ;
	});
	
	//主导航
	$(".vs-nav-main-tab").click(function() {
		$(".vs-nav-main-tab").addClass("selected");
		$(".vs-nav-top-tab").removeClass("selected");
		$(".vs-nav-botton-tab").removeClass("selected");
	});
	//顶部
	$(".vs-nav-top-tab").click(function() {
		$(".vs-nav-main-tab").removeClass("selected");
		$(".vs-nav-top-tab").addClass("selected");
		$(".vs-nav-botton-tab").removeClass("selected");
	});
	//底部
	$(".vs-nav-botton-tab").click(function() {
		$(".vs-nav-top-tab").removeClass("selected");
		$(".vs-nav-main-tab").removeClass("selected");
		$(".vs-nav-botton-tab").addClass("selected");
	});
	//添加界面弹出
	$(".vs-nav-add-tab-cls").click(function() {
		$(".navList").css("display", "none");
		$(".vs-nav-add-idtab-cls").css("display", "block");
		
		$("#nav_defined").css("display", "none");
		$("#nav_add").css("display", "block");
		
		$(".vs-nav-add-tab-cls").addClass("selected");
		$(".vs-nav-add-defined-tab-cls").removeClass("selected");
		
		
	});
	//添加自定义界面弹出
	$(".vs-nav-add-defined-tab-cls").click(function() {
		$(".vs-nav-add-tab-cls").removeClass("selected");
		$(".vs-nav-add-defined-tab-cls").addClass("selected");
		
		$(".navList").css("display", "none");
		$(".vs-nav-add-idtab-cls").css("display", "block");
		
		$("#nav_defined").css("display", "block");
		$("#nav_add").css("display", "none");
		
	});
	
})