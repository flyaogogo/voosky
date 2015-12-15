//创建TreeSelector对象
function TreeSelector(item) {
	this._data = new Array();
	this._item = document.getElementById(item);
	this._rootId = 0;// 规定根节点-1
}
// 增加一个节点
TreeSelector.prototype.add = function(_id, _pid, _text,_module, _url) {
	this._data[this._data.length] = {
		id : _id,
		pid : _pid,
		text : _text,
		module:_module,
		url : _url
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

	this._item.options.add(new Option(blank + current.text, current.id));// 添加Option选项

	for ( var j = 0; j < this._data.length; j++) {
		if (this._data[j].pid == current.id) {
			this.createSubOption(level + 1, this._data[j]);//寻找子节点
		}

	}

}
window.onload = function(selectId) {
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
	selectLoadData("selectTree-add-module",dataList) ;
	selectLoadData("selectTree-add-parent",dataList) ;
	selectLoadData("selectTree-defined-parent",dataList) ;
	selectLoadData("selectTree-update-module",dataList) ;
	selectLoadData("selectTree-update-parent",dataList) ;
}

function selectLoadData(selectId,data){
	var ts = new TreeSelector(selectId);//select的id
	$(data).each(function() {
		ts.add(this['navId'],this['parentId'], this['navName'],this['module'],this['moduleUrl']);
	});
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