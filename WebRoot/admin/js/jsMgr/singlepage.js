$(function(){
	//左导航样式
	$("#vsLeft .vs-spage").addClass("cur");
	
	//展示添加界面
	$(".vs-sp-add-cls").bind("click",function(){
		$(".spage").css("display", "none");
		$(".vs-sp-add-btn-cls").css("display", "block");
		var ue = UE.getEditor('content');
		
	});
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/singlepage/listAllSPInfo.htm" ;
	});
	
	$(".vs-sp-update-cls").bind("click",function(){
		var pageId = $(this).parent().find("input[name='pageId']").val();
		
		$(".vs-sp-span-type-cls").html("单页面列表-修改");
		
		$(".spage").css("display", "none");
		$(".vs-sp-add-btn-cls").css("display", "block");
		var ue = UE.getEditor('content');
		console.log(pageId) ;
		if(typeof(pageId) == "undefined"){
			$(".vs-sp-add-btn-cls input[name='pageName']").val("公司简介") ;
			$(".vs-sp-add-btn-cls input[name='uniqueName']").val("about") ;
		}else{
			//alert(pageId);
			var updateurl = ctx+"/singlepage/updateSPAction.htm" ;
			
			$("form[name='single-page-type-form']").attr("action",updateurl) ;
			
			var param = {pageId: pageId} ;
			$.ajax({
				url:ctx+"/singlepage/listSPInfoById.htm",
				type:"post",
				data:param,
				dataType:"json",
				async:true,
				success:function(data){
					//设置编辑器的内容
				    ue.setContent(data.content);
					$(".vs-sp-add-btn-cls input[name='pageId']").val(data.pageId) ;
					$(".vs-sp-add-btn-cls input[name='pageName']").val(data.pageName) ;
					$(".vs-sp-add-btn-cls input[name='uniqueName']").val(data.uniqueName) ;
	//				$(".vs-sp-add-btn-cls input:radio[name='navType'][value='" + data.vtype + "']").attr('checked', 'checked');
					
					var gAlias = data.guideAliases ;
					var pval = "" ;
					var navIdStr = data.navId ;
					
					if(navIdStr=='0'){
						pval = "0" ;
					}else{
						if(gAlias==null||gAlias==''){
							pval = navIdStr + "@" ;
						}else{
							pval = navIdStr + "@" + gAlias ;
							pval = pval.substring(0,pval.length-1);
						}
					}
					//console.log(pval) ;
					$(".vs-sp-add-btn-cls select[name='parentId']").val(pval) ;
					//$(".vs-sp-add-btn-cls select[name='navId']").val(data.navId) ;
					
					$(".vs-sp-add-btn-cls textarea[name='content']").val(ue) ;
					
					$(".vs-sp-add-btn-cls input[name='keywords']").val(data.keywords) ;
					$(".vs-sp-add-btn-cls input[name='desc']").val(data.desc) ;
					//alert($("#content"));
				}
			});
		}
	});
	
	//删除页面
	$(".vs-sp-delete-cls").bind("click",function(){
		var pageId = $(this).parent().find("input[name='pageId']").val();
		if(typeof(pageId) == "undefined"){
			return ;
		}
		window.location.href=ctx+"/singlepage/deleteSPAction.htm?pageId=" + pageId ;
	});
})


//页面打开时  加载  树节点
window.onload = function(selectId) {

	var dataList ;
	$.ajax({
		async:false,
		type : 'POST',
		dataType : "json",
		url : ctx+"/nav/listAllNavInfo.htm",//请求的action路径   
		error : function() {//请求失败处理函数   
			alert('请求失败');
		},
		success : function(data) { //请求成功后处理函数。
			dataList = data ;
			console.log(dataList );
		}
	});
//	console.log(dataList );
//	console.log(parentId );
	//id,父id,名称,跳转到url
	selectLoadData("selectTree-parent-category-Id",dataList,"p",0,"nav") ;
	
}