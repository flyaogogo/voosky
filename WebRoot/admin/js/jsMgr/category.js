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
				var gAlias = data.guideAliases ;
				var pval = "" ;
				var navIdStr = data.navId + "" ;
				
				if(navIdStr=='0'){
					pval = "0" ;
				}else{
//					var navIdLen = navIdStr.length ;
//					for(var i = navIdLen ; i < 3 ; i ++ ){
//						navIdStr = "0" + navIdStr ;
//					}
					
					if(gAlias==null||gAlias==''){
						pval = navIdStr + "@-" ;
					}else{
						//gAlias = gAlias.substring(0,gAlias.length-1) ;
						
						pval = navIdStr + "@-" + gAlias ;
					}
				}
				//alert(pval) ;
				$(".vs-category-type-btn-cls select[name='parentId']").val(pval) ;
				//$(".vs-category-type-btn-cls select[name='navId']").val(data.navId) ;
				
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

//页面打开时  加载  树节点
window.onload = function(selectId) {
	
	//var dataList = categoryList ;
	
	/*
	var dataList ;
	var type = $(".vs-category-hidden-input-val").val() ;
	
	var param = {cateStatus: type} ;
	$.ajax({
		async:false,
		data:param,
		type : 'POST',
		dataType : "json",
		url : ctx+"/category/listAllTreeInfoByCate.htm",//请求的action路径   
		error : function() {//请求失败处理函数   
			alert('请求失败');
		},
		success : function(data) { //请求成功后处理函数。
			dataList = data ;
			//console.log(dataList );
		}
	});*/
//	console.log(dataList );
//	console.log(parentId );
	//id,父id,名称,跳转到url
	selectLoadData("selectTree-parent-category-Id",dataList,"p",parentId,"nav") ;
	
	//判断添加或修改中的上级分类是否存在
	if($("#selectTree-parent-category-oper-Id").size()>0){
		selectLoadData("selectTree-parent-category-oper-Id",dataList,"p",parentId,"nav") ;
		//selectLoadData("selectTree-parent-category-oper-Id",dataList,"p",0,"cat") ;
	}
	
}


function changeListObjToJson(productList){
	
//	$.each(productList,function(index,data){ 
//		console.log(index+" "+data); 
//	})
//	for (var key in productList) {
//		console.log(key.cateName );
//	}
	
	for(var i=0;i<productList.length;i++){
	    console.log(productList[i]);//ID为假设的属性
	}
	
}