//创建TreeSelector对象
function TreeSelector(item,rootid) {
	this._data = new Array();
	this._item = document.getElementById(item);
	this._rootId = rootid ;// 规定根节点-1
}
// 增加一个节点
TreeSelector.prototype.add = function(_id, _pid, _text,_module, _url,_status) {
	this._data[this._data.length] = {
		id : _id,
		pid : _pid,
		text : _text,
		module:_module,
		url : _url,
		status:_status
	};
}
// 创建树
TreeSelector.prototype.createTree = function() {
	var len = this._data.length;
	for ( var i = 0; i < len; i++) {
		if (this._data[i].pid == this._rootId) {
			this.createSubOption(1, this._data[i]);
		}
	}
}
// 创建子节点
TreeSelector.prototype.createSubOption = function(level, current) {
	var blank = "";
	if (level != 1) {
		for (a = 0; a < level; a++) {
			blank += ".";
		}
		blank += "├-";
	}
	if(current.status=="m"){
		this._item.options.add(new Option(blank + current.text, current.id + "@" + current.url));// 添加Option选项    
	}else if(current.status=="p"){
		this._item.options.add(new Option(blank + current.text, current.id));// 添加Option选项  上级分类
	}

	for ( var j = 0; j < this._data.length; j++) {
		if (this._data[j].pid == current.id) {
			this.createSubOption(level + 1, this._data[j]);//寻找子节点
		}

	}

}
/*window.onload = function(selectId) {
	console.log(selectId );
//function changeSelect(){
//	var ts = new TreeSelector(selectId);//select的id
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
		}
	});
	
	//id,父id,名称,跳转到url
	selectLoadData("selectTree-add-module",dataList,"m") ;
	selectLoadData("selectTree-add-parent",dataList,"p") ;
	selectLoadData("selectTree-defined-parent",dataList,"p") ;
	selectLoadData("selectTree-update-module",dataList,"m") ;
	selectLoadData("selectTree-update-parent",dataList,"p") ;
}*/

/**
 * selectId 	: 下拉框 selected  id
 * data 		: 加载的List数据
 * status 		: 状态，一种是value为拼装的信息，一种是value为当前数据ID
 * treeRootId 	: 设置树结点的最初始的父级结点ID
 * catType 		: 区分是导航中的树，还是分类中的树
 */
function selectLoadData(selectId,data,status,treeRootId,catType){
	//console.log("selectId:" + selectId )
	var ts = new TreeSelector(selectId,treeRootId);//select的id  ,
	if(catType=='nav'){
		$(data).each(function() {
			ts.add(this['navId'],this['parentId'], this['navName'],this['module'],this['moduleUrl'],status);
			
		});
	}else if(catType=='cat'){
		$(data).each(function() {
			ts.add(this['cateId'],this['navId'], this['cateName'],this['uniqueName'],this['desc'],status);
		});
	}
	//显示
	ts.createTree();
}

/**
+----------------------------------------------------------
* 无刷新自定义导航名称
+----------------------------------------------------------
*/
function change(id, choose) {
   document.getElementById(id).value = choose.options[choose.selectedIndex].module;
}