$(function(){
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
		var updateurl = ctx+"/singlepage/updateSPAction.htm" ;
		$(".vs-sp-span-type-cls").html("单页面列表-修改");
		$("form[name='single-page-type-form']").attr("action",updateurl) ;
		$(".spage").css("display", "none");
		$(".vs-sp-add-btn-cls").css("display", "block");
		var pageId = $(this).parent().find("input[name='pageId']").val();
		
//		var ue = UE.getContent();
		var ue = UE.getEditor('content');
		
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
				$(".vs-sp-add-btn-cls select[name='navId']").val(data.navId) ;
				
				$(".vs-sp-add-btn-cls textarea[name='content']").val(ue) ;
				
				$(".vs-sp-add-btn-cls input[name='keywords']").val(data.keywords) ;
				$(".vs-sp-add-btn-cls input[name='desc']").val(data.desc) ;
				//alert($("#content"));
			}
		});
		
	});
	
	
})