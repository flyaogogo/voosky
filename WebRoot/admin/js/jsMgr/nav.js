$(function(){
	//左导航样式
	$("#vsLeft .vs-nav").addClass("cur");
	
	//展示自定义导航界面
	$(".vs-nav-add-btn-cls").bind("click",function(){
//		$(".navList").css("display", "none");
//		$(".items").css("display", "block");
		
		$(".navList").css("display", "none");
		$(".vs-nav-add-idtab-cls").css("display", "block");
	});
	
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/nav/listNavsInfo.htm?navType=middle" ;
	});
	
	//主导航
	$(".vs-nav-main-tab").click(function() {
		window.location.href=ctx+"/nav/listNavsInfo.htm?navType=middle" ;
		
//		$(".vs-nav-main-tab").addClass("selected");
//		$(".vs-nav-top-tab").removeClass("selected");
//		$(".vs-nav-bottom-tab").removeClass("selected");
		
				
	});
	//顶部
	$(".vs-nav-top-tab").click(function() {
		window.location.href=ctx+"/nav/listNavsInfo.htm?navType=top" ;
		
//		$(".vs-nav-main-tab").removeClass("selected");
//		$(".vs-nav-top-tab").addClass("selected");
//		$(".vs-nav-bottom-tab").removeClass("selected");
	});
	//底部
	$(".vs-nav-bottom-tab").click(function() {
		window.location.href=ctx+"/nav/listNavsInfo.htm?navType=bottom" ;
		
//		$(".vs-nav-top-tab").removeClass("selected");
//		$(".vs-nav-main-tab").removeClass("selected");
//		$(".vs-nav-bottom-tab").addClass("selected");
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
	//修改弹出
	$(".vs-nav-update-href").click(function() {
		$(".navList").css("display", "none");
		$(".vs-nav-update-data").css("display", "block");
		
		var navId = $(this).parent().parent().children().find("input[name='navId']").val();
		
		var param = {navId: navId} ;
		$.ajax({
			url:ctx+"/nav/listNavInfoById.htm",
			type:"post",
			data:param,
			dataType:"json",
			async:true,
			success:function(data){
				$(".vs-nav-update-data input[name='navId']").val(data.navId) ;
				$(".vs-nav-update-data select[name='navMenu']").val(data.module) ;
				$(".vs-nav-update-data input[name='navName']").val(data.navName) ;
				$(".vs-nav-update-data input:radio[name='navType'][value='" + data.vtype + "']").attr('checked', 'checked');
				$(".vs-nav-update-data select[name='parentId']").val(data.parentId) ;
				$(".vs-nav-update-data input[name='sort']").val(data.vsort) ;
				
			}
		});
		
	});
	//删除操作
	$(".vs-nav-delete-href").click(function() {
//		$(".navList").css("display", "none");
//		$(".vs-nav-add-idtab-cls").css("display", "block");
		
		var navId = $(this).parent().parent().children().find("input[name='navId']").val();
//		alert(navId);
		window.location.href=ctx+"/nav/deleteNavByIdAction.htm?navId=" + navId ;
	});
})


function getNavAjaxFun(vtype){
	var param = {navType: vtype} ;
	$.ajax({
		url:ctx+"/nav/listNavsInfo.htm",
		type:"post",
		data:param,
		dataType:"json",
		async:true,
		success:function(data){
			var json = data.navList ;
//			alert(data.pwd) ;
//			<tr>
//		       <td><input type="hidden" name="navId" value="<s:property value="#nav.navId"/>"/><s:property value="#nav.navName"/></td>
//		       <td><s:property value="#nav.moduleUrl"/></td>
//		       <td align="center"><s:property value="#nav.vsort"/></td>
//		       <td align="center"><a href="javascript:void(0)">编辑 | 删除</a><a href="javascript:void(0)"></a></td>
//		    </tr>
			
			$.each($.parseJSON(json), function() {
		        alert(this.id + " " + this.type);
		    });
			
			$(".vs-nav-show-tbl")
			
			
		}
	});
}