$(function(){
	//添加按钮，弹出界面
	$(".vs-product-add-href-cls").bind("click",function(){
		$(".vs-product-show-cls").css("display", "none");
		$(".vs-product-type-oper-cls").css("display", "block");
	});
	
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/product/listProductsInfo.htm" ;
	});
	//显示首页商品
	$(".vs-product-select-firstpro-href-cls").bind("click",function(){
		window.location.href=ctx+"/product/listProductsInfo.htm?isRecommend=true" ;
	});
	
	$("#vs-pro-checkbox-is-recommend").change(function(){
		if($("#vs-pro-checkbox-is-recommend").prop("checked")){
			$("#vs-pro-checkbox-is-recommend").attr("value","true");
		}else{
			$("#vs-pro-checkbox-is-recommend").attr("value","false");
		}
	});
	
	//修改，弹出修改层
	$(".vs-product-edit-href-cls").bind("click",function(){
		var updateurl = ctx+"/product/updateProductAction.htm" ;
		$(".vs-pro-span-type-cls").html("单页面列表-修改");
		$("form[name='product-type-form']").attr("action",updateurl) ;
		$(".vs-product-show-cls").css("display", "none");
		$(".vs-product-type-oper-cls").css("display", "block");
		
		var proId = $(this).parent().parent().children().eq(1).html();
		
		var ue = UE.getEditor('content');
		
		var param = {id: proId} ;
		$.ajax({
			url:ctx+"/product/listProductInfoById.htm",
			type:"post",
			data:param,
			dataType:"json",
			async:true,
			success:function(data){
				//设置编辑器的内容
			    ue.setContent(data.content);
				$(".vs-product-type-oper-cls input[name='id']").val(data.id) ;
				$(".vs-product-type-oper-cls input[name='title']").val(data.title) ;
//				$(".vs-product-type-oper-cls input[name='cateId']").val(data.cateId) ;
				
				//console.log(data.cateList);
				$(data.cateList).each(function() {
					var selObj = $(".vs-product-type-oper-cls select[name='cateId']") ;
					if(this['cateId']==data.cateId){
						selObj.append("<option value='"+this['cateId']+"' selected='selected'>"+this['cateName']+"</option>");
					}else{
						selObj.append("<option value='"+this['cateId']+"'>"+this['cateName']+"</option>");
					}
				});
				
				$(".vs-product-type-oper-cls input[name='price']").val(data.price) ;
				$(".vs-product-type-oper-cls textarea[name='content']").val(ue) ;
				
//				$(".vs-product-type-oper-cls input[name='thumbUrl']").val(data.thumbUrl) ;
				$(".vs-product-type-oper-cls input[name='keywords']").val(data.keywords) ;
				$(".vs-product-type-oper-cls input[name='desc']").val(data.desc) ;
				$(".vs-product-type-oper-cls input[name='vsort']").val(data.vsort) ;
				var isrecomm = data.isRecommend ;
				console.log(isrecomm);
				if(isrecomm==true){
					$(".vs-product-type-oper-cls input[name='isRecommend']").prop("checked",true) ;
					
				}
				//alert($("#content"));
			}
		});
		
	});
	
	//删除
	$(".vs-product-delete-href-cls").bind("click",function(){
		var proId = $(this).parent().parent().children().eq(1).html();
		window.location.href=ctx+"/category/deleteByIdAction.htm?id=" + proId ;
	});
	
	//设置首页商品
	$(".vs-product-select-firstpro-href-cls").bind("click",function(){
		alert(1111);
		if($(this).hasClass("first-page")){
			alert(1);
		}else{
			alert(2) ;
		}
//		window.location.href=ctx+"/product/showPageAction.htm?isRecommend=true" ;
	});
	
})


