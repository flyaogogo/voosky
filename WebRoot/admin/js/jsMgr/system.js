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
	
	// 提交修改信息
	$(".sys-config-update-cls").bind("click",function(){
		var url = ctx + "/sysconfig/updateSysConfig.htm" ;
		var tabType = $(".items input[name='tabvalue']").val() ;
		
		if ($("#main").css("display")=='block'){
			mainUpdate(url,tabType) ;
		}else if ($("#display").css("display")=='block'){
			displayUpdate(url,tabType) ;
		}else if ($("#defined").css("display")=='block'){
			definedUpdate(url,tabType) ;
		}else if ($("#mail").css("display")=='block'){
			//console.log("this is mail...")
			mailUpdate(url,tabType) ;
		}
	});
	
	//选择文件成功则提交表单
//	$("#upload_file").change(function(){
//		console.log("upload file to server ...  ")
//		if($("#upload_file").val() != '') {
//			alert($("#upload_file").val());
//			$("#submit_form").submit();
//		}
//	});
	
	/*
	$("#upload_file").change(function(){
		
		var fileUrl = ctx + "/sysconfig/updateMarkConfig.htm" ;
		
	    //创建FormData对象
	    var data = new FormData();
	    //为FormData对象添加数据
	    //
	    $.each($('#upload_file')[0].files, function(i, file) {
	        data.append('imageFile', file);
	    });
	    //console.log(data) ;
	    $.ajax({
	        url:fileUrl,
	        type:'POST',
	        data:data,
	        cache: false,
	        contentType: false,    //不可缺
	        processData: false,    //不可缺
	        success:function(data){
	        	var status = data.status ;
	        	if("success"==status){
	        		$(".upload_file_mark_msg_cls img").remove();
	        		var imgDom=document.createElement("img");  // 以 DOM 创建新元素
	        		imgDom.src = "../" + data.fileRealPath ;
	        		imgDom.width = 30 ;
	        		$(".upload_file_mark_msg_cls").append(imgDom);         // 追加新元素
	        	}else{
	        		$(".upload_file_mark_msg_cls p").remove();
	        		var pDom=document.createElement("p");  // 以 DOM 创建新元素
	        		pDom.innerHTML = data.message ;
	        		$(".upload_file_mark_msg_cls").append(pDom);         // 追加新元素
	        	}
	        	
	            //console.log(data.fileRealPath) ;
	            
	        }
	    });
	   
	    
	    
	});
	
	 */
	$("#upload_file").change(function(){
		uploadImage($("#upload_file"),"upload_file_mark_msg_cls","msmark") ;
	});
	$("#upload_file_weixin").change(function(){
		
		uploadImage($("#upload_file_weixin"),"upload_file_weixin_msg_cls","weixin") ;
	});
	
})

/**
 * 
 * @param ids
 * @param uploadcls
 */
function uploadImage(ids,uploadcls,type){
	
	var fileUrl = ctx + "/sysconfig/updateMarkConfig.htm" ;
	
    //创建FormData对象
    var data = new FormData();
    //为FormData对象添加数据
    //
    $.each(ids[0].files, function(i, file) {
//    	$.each($('#upload_file')[0].files, function(i, file) {
        data.append('imageFile', file);
    });
    data.append('status',type) ;
    //console.log(data) ;
    $.ajax({
        url:fileUrl,
        type:'POST',
        data:data,
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        success:function(data){
        	var status = data.status ;
        	if("success"==status){
        		$("."+ uploadcls +" img").remove();
        		var imgDom=document.createElement("img");  // 以 DOM 创建新元素
        		imgDom.src = "../" + data.fileRealPath ;
        		imgDom.width = 30 ;
        		$("."+ uploadcls).append(imgDom);         // 追加新元素
        	}else{
        		$("."+ uploadcls +" p").remove();
        		var pDom=document.createElement("p");  // 以 DOM 创建新元素
        		pDom.innerHTML = data.message ;
        		$("."+ uploadcls).append(pDom);         // 追加新元素
        	}
        	
            //console.log(data.fileRealPath) ;
            
        }
    });
    
}

// 常规  系统 配置更新
function mainUpdate(url,tabType){
	var sitename = $("#main input[name='sitename']").val() ;
	var sitetitle = $("#main input[name='sitetitle']").val() ;
	var sitekeywords = $("#main input[name='sitekeywords']").val() ;
	var sitedesc = $("#main input[name='sitedesc']").val() ;
	var msmark = $("#main input[name='msmark']").val() ;
	var siteaddress = $("#main input[name='siteaddress']").val() ;
	var netaddress = $("#main input[name='netaddress']").val() ;
	var mswhetherclose = $("#main input[name='mswhetherclose']:checked").val() ;
	var siteipcrecord = $("#main input[name='siteipcrecord']").val() ;
	var siteconsumerhotline = $("#main input[name='siteconsumerhotline']").val() ;
	var sitefax = $("#main input[name='sitefax']").val() ;
	var siteqqnum = $("#main input[name='siteqqnum']").val() ;
	var sitemail = $("#main input[name='sitemail']").val() ;
	var sitelanguage = $("#main input[name='sitelanguage']").val() ;
	var msurlrewrite = $("#main input[name='msurlrewrite']:checked").val() ;
	var msenablemap = $("#main input[name='msenablemap']:checked").val() ;
	var mscaptcha = $("#main input[name='mscaptcha']:checked").val() ;
	var msmsgforceboard = $("#main input[name='msmsgforceboard']:checked").val() ;
	var mscodecall = $("#main textarea[name='mscodecall']").val() ;

	
	var arrValue = "sitename::" + sitename + ",sitetitle::" + sitetitle 
			+ ",sitekeywords::" + sitekeywords+ ",sitedesc::" + sitedesc
			+ ",msmark::" + msmark + ",siteaddress::" + siteaddress + ",netaddress::" + netaddress 
			+ ",mswhetherclose::" + mswhetherclose + ",siteipcrecord::" + siteipcrecord 
			+ ",siteconsumerhotline::" + siteconsumerhotline + ",sitefax::" + sitefax 
			+ ",siteqqnum::" + siteqqnum + ",sitemail::" + sitemail 
			+ ",sitelanguage::" + sitelanguage + ",msurlrewrite::" + msurlrewrite 
			+ ",msenablemap::" + msenablemap + ",mscaptcha::" + mscaptcha 
			+ ",msmsgforceboard::" + msmsgforceboard + ",mscodecall::" + mscodecall ; 
	var param = {value:arrValue,nameType:tabType} ;
		
	post(url,param) ;
}

//显示设置  系统配置更新
function displayUpdate(url,tabType){
	var disthumbwidth = $("#display input[name='disthumbwidth']").val() ;
	var disthumbheight = $("#display input[name='disthumbheight']").val() ;
	var dispricesdecimal = $("#display input[name='dispricesdecimal']").val() ;
	var disnumberart = $("#display input[name='disnumberart']").val() ;
	var dishownumart = $("#display input[name='dishownumart']").val() ;
	var disnumberpro = $("#display input[name='disnumberpro']").val() ;
	var dishownumpro = $("#display input[name='dishownumpro']").val() ;
	
	
	var arrValue = "disthumbwidth::" + disthumbwidth + ",disthumbheight::" + disthumbheight 
					+ ",dispricesdecimal::" + dispricesdecimal+ ",disnumberart::" + disnumberart
					+ ",dishownumart::" + dishownumart + ",disnumberpro::" + disnumberpro 
					+ ",dishownumpro::" + dishownumpro; 
	var param = {value:arrValue,nameType:tabType} ;
	
	post(url,param) ;
}

//自定义  系统配置更新
function definedUpdate(url,tabType){
	var defartattr = $("#defined input[name='defartattr']").val() ;
	var defproductattr = $("#defined input[name='defproductattr']").val() ;
	var defqqwburl = $("#defined input[name='defqqwburl']").val() ;
	var defsinawburl = $("#defined input[name='defsinawburl']").val() ;
	
	
	var arrValue = "defartattr::" + defartattr + ",defproductattr::" + defproductattr 
					+ ",defqqwburl::" + defqqwburl + ",defsinawburl::" + defsinawburl  ; 
	var param = {value:arrValue,nameType:tabType} ;
	
	post(url,param) ;
	
}

//邮件  系统配置更新
function mailUpdate(url,tabType){
	var mailservice = $("#mail input[name='mailservice']:checked").val() ;
	var mailsmtpservice = $("#mail input[name='mailsmtpservice']").val() ;
	var mailsmtpport = $("#mail input[name='mailsmtpport']").val() ;
	var msslsecprotocol = $("#mail input[name='msslsecprotocol']:checked").val() ;
	var mailoutbox = $("#mail input[name='mailoutbox']").val() ;
	var mailpassword = $("#mail input[name='mailpassword']").val() ;
	

	var arrValue = "mailservice::" + mailservice + ",mailsmtpservice::" + mailsmtpservice 
					+ ",mailsmtpport::" + mailsmtpport+ ",msslsecprotocol::" + msslsecprotocol
					+ ",mailoutbox::" + mailoutbox + ",mailpassword::" + mailpassword ; 
	var param = {value:arrValue,nameType:tabType} ;
	
	post(url,param) ;
}