$(function(){
	//左导航样式
	$("#vsLeft .vs-show").addClass("cur");
	
	//编辑 幻灯片
	$(".vs-slide-edit-oper-cls").bind("click",function(){
		var updateurl = ctx+"/slide/updtSlideAction.htm" ;
		$(".vs-slide-span-type-oper-cls").html("修改幻灯片");
		$("form[name='vs-slide-type-oper-cls']").attr("action",updateurl) ;
		
		var slideId = $(this).parent().find("input[name='slideId']").val();
		
		var param = {id: slideId} ;
		$.ajax({
			url:ctx+"/slide/listSlideById.htm",
			type:"post",
			data:param,
			dataType:"json",
			async:true,
			success:function(data){
				$(".vs-slide-type-oper-cls input[name='id']").val(data.id) ;
				$(".vs-slide-type-oper-cls input[name='showName']").val(data.showName) ;
//				$(".vs-slide-type-oper-cls input[name='showImg']").val(data.showImg) ;
				$(".vs-slide-type-oper-cls input[name='showLink']").val(data.showLink) ;
				$(".vs-slide-type-oper-cls input[name='vsort']").val(data.vsort) ;
			}
		});
		
	});
	
	//删除
	$(".vs-slide-delete-oper-cls").bind("click",function(){
		var slideId = $(this).parent().find("input[name='slideId']").val();
		window.location.href=ctx+"/slide/delSlideAction.htm?id=" + slideId ;
	});
	
	
})