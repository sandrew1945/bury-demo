/**
 * 	定义系统中根据数据库生成的下拉框
 *  
 *  实例代码
 *  
 *  HTML：
 *  <div id="roleDiv" class="col-md-6"><script type="text/javascript">SelectUtil.getRoleList('roleId', 'roleId', '', true, '', '', 'roleDiv');</script></div>
 *  
 *  JS：
 *  id 			: 下拉框id
 *  name  		：下拉框name
 *  selectedKey	: 默认选中值
 *  setAll		：是否生成默认选项
 *  _class_		：样式
 *  _script_	：脚本
 *  containerid	：父容器id
 *  var getRoleList = function(id, name ,selectedKey, setAll, _class_, _script_, containerid)
 *  {
 *  	AjaxAnyWhere.sendRequestForSelect('select/getRoleList', '', showRoleList, id, name ,selectedKey, setAll, _class_, _script_, containerid);
 *  }
 *  
 *  回调方法
 *  主要用来处理返回的json，循环来拼装option选项
 *  
 *  json 		: 返回的json数据
 *  selectedKey : 默认选中值
 *  var showRoleList = function(json, selectedKey) {
 *		var creatorData = json;
 *		var str = "";
 *		for(var i=0;i<creatorData.length;i++){
 *		if(selectedKey == creatorData[i].roleId)
 *		{
 *			str += "<option  value='" + creatorData[i].roleId + "' selected>" + creatorData[i].roleName + "</option>";
 *		}
 *		else
 *		{
 *			str += "<option  value='" + creatorData[i].roleId + "' >" + creatorData[i].roleName + "</option>";
 *		}
 *		}
 *		str += "</select>";
 *		return str;
 *	};
 */

var SelectUtil = function (){
	/**
	 * 	生成下拉框公共方法，只供框架使用
	 * 
	 * 	json		：接收到的json数据
	 * 	id			：生成下拉框的id
	 * 	name		：生成下拉框的name
	 * 	selectedKey	：默认选中值
	 * 	setAll		：是否生成option
	 * 	_class_		：样式
	 * 	_script_	：脚本
	 * 	containerid	：装载下拉框容器的id
	 * 	callback	：回调方法
	 * 
	 */
	var selectBuilder = function (json, id, name ,selectedKey, setAll, _class_, _script_, containerid, callback){
		var str = "";
		str += "<select id='" + id + "' name='" + name + "'";
		if(null == _class_ || '' == _class_)
		{
			str += " class='form-control'";
		}
		else
		{
			str += " class='" + _class_ + "'";
		}
		if(null != _script_ || '' != _script_)
		{
			str += _script_;
		}
		str += ">";
		if(setAll)
		{
			str += genDefaultOpt();
		}
		str += callback(json, selectedKey);
		$('#' + containerid).html(str);
	};
	
	
	/******************************************************/
	/******************************************************/
	/********自定义的下拉框生成方法写在这个下面**************/
	/******************************************************/
	/******************************************************/
	
	/**
	 * 	生成角色选择下拉框 START
	 */
	var getRoleList = function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
		AjaxAnyWhere.sendRequestForSelect('select/getRoleList', '', showRoleList, id, name ,selectedKey, setAll, _class_, _script_, containerid);
	};
	var showRoleList = function(json, selectedKey) {
		var creatorData = json;
		var str = "";
		for(var i=0;i<creatorData.length;i++)
		{
			if(selectedKey == creatorData[i].roleId)
			{
				str += "<option  value='" + creatorData[i].roleId + "' selected>" + creatorData[i].roleName + "</option>";
			}
			else
			{
				str += "<option  value='" + creatorData[i].roleId + "' >" + creatorData[i].roleName + "</option>";
			}
		}
		str += "</select>";
		return str;
	};
	/**
	 * 	生成角色选择下拉框 END
	 */

	/**
	 * 	生成系统选择下拉框 START
	 */
	var getApplicationList = function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
		AjaxAnyWhere.sendRequestForSelect('select/getApplicationList', '', showApplicationList, id, name ,selectedKey, setAll, _class_, _script_, containerid);
	};
	var showApplicationList = function(json, selectedKey) {
		var creatorData = json;
		var str = "";
		for(var i=0;i<creatorData.length;i++)
		{
			if(selectedKey == creatorData[i].applicationId)
			{
				str += "<option  value='" + creatorData[i].applicationId + "' selected>" + creatorData[i].applicationName + "</option>";
			}
			else
			{
				str += "<option  value='" + creatorData[i].applicationId + "' >" + creatorData[i].applicationName + "</option>";
			}
		}
		str += "</select>";
		return str;
	};
	/**
	 * 	生成系统选择下拉框 END
	 */

	/**
	 * 	生成系统功能选择下拉框 START
	 */
	var getFunctionList = function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
		AjaxAnyWhere.sendRequestForSelect('select/getFunctionList', '', showFunctionList, id, name ,selectedKey, setAll, _class_, _script_, containerid);
	};
	var showFunctionList = function(json, selectedKey) {
		var creatorData = json;
		var str = "";
		for(var i=0;i<creatorData.length;i++)
		{
			if(selectedKey == creatorData[i].functionId)
			{
				str += "<option  value='" + creatorData[i].functionId + "' selected>" + creatorData[i].functionName + "</option>";
			}
			else
			{
				str += "<option  value='" + creatorData[i].functionId + "' >" + creatorData[i].functionName + "</option>";
			}
		}
		str += "</select>";
		return str;
	};
	/**
	 * 	生成系统功能选择下拉框 END
	 */
	
	return {
		selectBuilder : function (json, id, name ,selectedKey, setAll, _class_, _script_, containerid, callback) {
			selectBuilder(json, id, name ,selectedKey, setAll, _class_, _script_, containerid, callback);
		},
		getRoleList : function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
			getRoleList(id, name ,selectedKey, setAll, _class_, _script_, containerid);
		},
		getApplicationList : function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
			getApplicationList(id, name ,selectedKey, setAll, _class_, _script_, containerid);
		},
		getFunctionList : function(id, name ,selectedKey, setAll, _class_, _script_, containerid) {
			getFunctionList(id, name, selectedKey, setAll, _class_, _script_, containerid);
		}
	};
	
}();
