$(function(){
	//左导航样式
	$("#vsLeft .vs-system").addClass("cur");
	
	//单击  常规设置
	$(".vs-system-tab-main-cls").bind("click",function(){
		$("#main").css("display", "block");
		$("#display").css("display", "none");
		$("#defined").css("display", "none");
		$("#mail").css("display", "none");
		
		$(".items input[name='tabvalue']").val("main") ;
		
		$(this).addClass("selected");
		$(".idTabs .tab .vs-system-tab-display-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-defined-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-mail-cls").removeClass("selected");
	});
	//单击  显示设置
	$(".vs-system-tab-display-cls").bind("click",function(){
		$("#main").css("display", "none");
		$("#display").css("display", "block");
		$("#defined").css("display", "none");
		$("#mail").css("display", "none");
		
		$(".items input[name='tabvalue']").val("display") ;
		
		$(this).addClass("selected");
		$(".idTabs .tab .vs-system-tab-main-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-defined-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-mail-cls").removeClass("selected");
	});
	//单击  自定义
	$(".vs-system-tab-defined-cls").bind("click",function(){
		$("#main").css("display", "none");
		$("#display").css("display", "none");
		$("#defined").css("display", "block");
		$("#mail").css("display", "none");
		
		$(".items input[name='tabvalue']").val("defined") ;
		
		$(this).addClass("selected");
		$(".idTabs .tab .vs-system-tab-main-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-display-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-mail-cls").removeClass("selected");
		
	});
	//单击  邮件服务器
	$(".vs-system-tab-mail-cls").bind("click",function(){
		$("#main").css("display", "none");
		$("#display").css("display", "none");
		$("#defined").css("display", "none");
		$("#mail").css("display", "block");
		
		$(".items input[name='tabvalue']").val("mail") ;
		
		$(this).addClass("selected");
		$(".idTabs .tab .vs-system-tab-main-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-display-cls").removeClass("selected");
		$(".idTabs .tab .vs-system-tab-defined-cls").removeClass("selected");
		
	});
	
	
})

function defaultLoad(){
	var nameType = "" ;
	
	$.ajax({
		url:ctx+"/sysconfig/listSlideById.htm",
		type:"post",
		data:param,
		dataType:"json",
		async:true,
		success:function(data){
			$(".vs-slide-type-oper-cls input[name='id']").val(data.id) ;
			$(".vs-slide-type-oper-cls input[name='showName']").val(data.showName) ;
//			$(".vs-slide-type-oper-cls input[name='showImg']").val(data.showImg) ;
			$(".vs-slide-type-oper-cls input[name='showLink']").val(data.showLink) ;
			$(".vs-slide-type-oper-cls input[name='vsort']").val(data.vsort) ;
		}
	});
	
}
