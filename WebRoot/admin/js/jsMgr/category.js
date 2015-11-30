$(function(){
	//添加按钮，弹出界面
	$(".vs-category-add-btn-cls").bind("click",function(){
		$(".vs-category-show-cls").css("display", "none");
		$(".vs-category-type-btn-cls").css("display", "block");
	});
	
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		var type = $(".vs-category-hidden-input-val").val() ;
		window.location.href=ctx+"/category/listCategorysInfo.htm?cateStatus=" + type ;
	});
	
	//修改弹出界面
	$(".vs-category-update-btn-cls").bind("click",function(){
		var updateurl = ctx+"/category/updateCategory.htm" ;
		$(".vs-category-title-name-cls").html("修改");
		$("form[name='category-type-form']").attr("action",updateurl) ;
		
		
		$(".vs-category-show-cls").css("display", "none");
		$(".vs-category-type-btn-cls").css("display", "block");
		
		var cateId = $(this).parent().parent().children().find("input[name='cateId']").val();
		//alert(cateId);
		var param = {cateId: cateId} ;
		$.ajax({
			url:ctx+"/category/listCategoryInfoById.htm",
			type:"post",
			data:param,
			dataType:"json",
			async:true,
			success:function(data){
				$(".vs-category-type-btn-cls input[name='cateId']").val(data.cateId) ;
				$(".vs-category-type-btn-cls input[name='cateName']").val(data.cateName) ;
				$(".vs-category-type-btn-cls input[name='uniqueName']").val(data.uniqueName) ;
				$(".vs-category-type-btn-cls select[name='navId']").val(data.navId) ;
				$(".vs-category-type-btn-cls input[name='keywords']").val(data.keywords) ;
				$(".vs-category-type-btn-cls textarea[name='desc']").val(data.desc) ;
				$(".vs-category-type-btn-cls input[name='vsort']").val(data.vsort) ;
				
			}
		});
		
	});
	
	//删除
	$(".vs-category-delete-btn-cls").bind("click",function(){
		var cateId = $(this).parent().parent().children().find("input[name='cateId']").val();
		var type = $(".vs-category-hidden-input-val").val() ;
		window.location.href=ctx+"/category/deleteByIdAction.htm?cateId=" + cateId + "&cateStatus=" + type ;
	});
	
	
})