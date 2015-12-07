$(function(){
	//添加按钮，弹出界面
	$(".vs-article-add-href-cls").bind("click",function(){
		$(".vs-article-show-cls").css("display", "none");
		$(".vs-article-type-oper-cls").css("display", "block");
	});
	
	//返回自定义导航列表
	$(".returnActionBtn").bind("click",function(){
		window.location.href=ctx+"/article/listArticlesInfo.htm" ;
	});
	//显示首页商品
	$(".vs-article-select-firstpro-href-cls").bind("click",function(){
		window.location.href=ctx+"/article/listArticlesInfo.htm?isRecommend=true" ;
	});
	
	$("#vs-art-checkbox-is-recommend").change(function(){
		if($("#vs-art-checkbox-is-recommend").prop("checked")){
			$("#vs-art-checkbox-is-recommend").attr("value","true");
		}else{
			$("#vs-art-checkbox-is-recommend").attr("value","false");
		}
	});
	
	//修改，弹出修改层
	$(".vs-article-edit-href-cls").bind("click",function(){
		var updateurl = ctx+"/article/updateArtAction.htm" ;
		$(".vs-pro-span-type-cls").html("文章列表-修改");
		$("form[name='article-type-form']").attr("action",updateurl) ;
		$(".vs-article-show-cls").css("display", "none");
		$(".vs-article-type-oper-cls").css("display", "block");
		
		var artId = $(this).parent().parent().children().eq(1).html();
		
		var ue = UE.getEditor('content');
		
		var param = {id: artId} ;
		$.ajax({
			url:ctx+"/article/listArticleInfoById.htm",
			type:"post",
			data:param,
			dataType:"json",
			async:true,
			success:function(data){
				//设置编辑器的内容
			    ue.setContent(data.content);
				$(".vs-article-type-oper-cls input[name='id']").val(data.id) ;
				$(".vs-article-type-oper-cls input[name='title']").val(data.title) ;
				
				//console.log(data.cateList);
				$(data.cateList).each(function() {
					var selObj = $(".vs-article-type-oper-cls select[name='cateId']") ;
					if(this['cateId']==data.cateId){
						selObj.append("<option value='"+this['cateId']+"' selected='selected'>"+this['cateName']+"</option>");
					}else{
						selObj.append("<option value='"+this['cateId']+"'>"+this['cateName']+"</option>");
					}
				});
				
				$(".vs-article-type-oper-cls textarea[name='content']").val(ue.getAllHtml()) ;
				
//				$(".vs-article-type-oper-cls input[name='thumbUrl']").val(data.thumbUrl) ;
				$(".vs-article-type-oper-cls input[name='keywords']").val(data.keywords) ;
				$(".vs-article-type-oper-cls input[name='desc']").val(data.desc) ;
				$(".vs-article-type-oper-cls input[name='vsort']").val(data.vsort) ;
				var isrecomm = data.isRecommend ;
				//console.log(isrecomm);
				if(isrecomm=='true'){
					$(".vs-article-type-oper-cls input[name='isRecommend']").prop("checked",true) ;
					$(".vs-article-type-oper-cls input[name='isRecommend']").attr("value","true");
				}
			}
		});
		
	});
	
	//删除
	$(".vs-article-delete-href-cls").bind("click",function(){
		var artId = $(this).parent().parent().children().eq(1).html();
		window.location.href=ctx+"/article/delArtById.htm?id=" + artId ;
	});
	
	//设置首页商品
	$(".vs-article-update-first-title-href-cls").bind("click",function(){
		var artId = $(this).parent().parent().children().eq(1).html();
		var isrec = false ;
		if($(this).hasClass("first-page")){
			isrec = "false" ;
		}else{
			isrec = "true" ;
		}
		window.location.href=ctx+"/article/setShowPageAction.htm?id=" +artId +"&isRecommend=" + isrec ;
	});
})