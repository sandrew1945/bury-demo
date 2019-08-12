/**
 *  将FIXCODE转化成描述
 * @param fixcodeId
 * @return
 */
function getfixCodeDesc(fixcodeId){
	if(fixcodeId!=null && fixcodeId!="")
	{
		var allCode = codeData.data;
		for (var i = 0 ; i < allCode.length; i++)
		{
			if(fixcodeId == allCode[i].fixcodeId)
			{
				return allCode[i].codeDesc;
			}
		}
	}
	else
	{
		return '';
	}
}

/**
 *  将FIXCODE转化成描述
 * @param fixcodeId
 * @return
 */
function getfixCodeDescPrint(fixcodeId,spanId){
	if(fixcodeId!=null && fixcodeId!="")
	{
		var allCode = codeData.data;
		for (var i = 0 ; i < allCode.length; i++)
		{
			if(fixcodeId == allCode[i].fixcodeId)
			{
				 return $("#"+spanId).text(allCode[i].codeDesc);
			}
		}
	}
	else
	{
		return '';
	}
}

/**
 *  将FIXCODE转化成描述
 * @param fixcodeId
 * @return
 */
function getfixCodeDescInputValue(fixcodeId,inputId){
	if(fixcodeId!=null && fixcodeId!="")
	{
		var allCode = codeData.data;
		for (var i = 0 ; i < allCode.length; i++)
		{
			if(fixcodeId == allCode[i].fixcodeId)
			{
				 return $("#"+inputId).val(allCode[i].codeDesc);
			}
		}
	}
	else
	{
		return '';
	}
}

/**
 *  将下载大小进行转换
 * @param size
 * @return
 */
function sizeMethod(size){
	var str="";
	var num=parseFloat(size);
	str=(num/1000.0).toString()+'KB';
	document.write(str);
}

/**
 *  将FIXCODE转化成描述,并显示出来
 * @param fixcodeId
 * @return
 */
function writefixCodeDesc(fixcodeId){
	var str="";
	if(fixcodeId!=null && fixcodeId!="")
	{
		var allCode = codeData.data;
		for (var i = 0 ; i < allCode.length; i++)
		{
			if(fixcodeId == allCode[i].fixcodeId)
			{
				str +=allCode[i].codeDesc;
			}
		}
	}
	document.write(str);
}

/**
 *  生成默认选项
 * @return
 */
function genDefaultOpt()
{
	return "<option selected value=''>-Option-</option>";
}

/**
 * 	生成下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getSelect(id,name,type,selectedKey,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ + ">";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}
/**
 * 	生成disabled下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getDisabelSelectd(id,name,type,selectedKey,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' disabled='disabled' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}

/**
 * 生成多选下拉框 
 */
function getMoreSelect(id,name,type,selectedKey,setAll,_class_,_script_,container){
	var allCode = codeData.data;
	var str = "";
	str += "<select multiple='multiple' size='5' style='width:190px' id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}

/**
 * 	生成自定义值下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param needValue	select框中需要的选项数组
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getDefinedSelect(id,name,type,selectedKey,needValue,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			for(var j=0;j<needValue.length;j++){
				if(allCode[i].codeDesc==needValue[j]){
					str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
				}
			}
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}


/**
 * 	生成下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param maxVal	显示选项中的最大值，如type 2003中有10个fixcode,maxVal设置为5，则只显示1-5
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getSelectByMaxVal(id,name,type,selectedKey,maxVal,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			if(allCode[i].fixcodeId <= maxVal)
			{
				str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
			}
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}

/**
 * 	生成下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param minVal	显示选项中的最小值，如type 2003中有10个fixcode,maxVal设置为5，则只显示5-10
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getSelectByMinVal(id,name,type,selectedKey,minVal,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			if(allCode[i].fixcodeId >= minVal)
			{
				str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
			}
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}

/**
 * 	生成下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param minVal	显示选项中的最小值
 * @param maxVal	显示选项中的最大值，如type 2003中有10个fixcode,minVal设置为5，maxVal设置为8，则只显示5-8
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getSelectByBetweenVal(id,name,type,selectedKey,minVal,maxVal,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			if(allCode[i].fixcodeId >= minVal && allCode[i].fixcodeId <= maxVal)
			{
				str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
			}
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}

/**
 * 	生成CheckBox
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param fixCode_YES_NO	是否默认选中,传入FIXCODE中的是/否
 * @param _class_	样式
 * @param _script_	脚本
 * @param nullFlag	验证规则
 * @return
 */
function getCheckBox(id,name,selected,value,_class_,_script_,nullFlag)
{
	var str = "";
	str += "<input type='checkbox' id='" + id + "' name='" + name +"' value="+ value +" class='"+ _class_ +"' " + _script_ ;
	if(selected == '10041001')
	{
		str += " checked ";
	}
	if(nullFlag!=undefined&&nullFlag==true){
		str += " datatype='0,is_null,200' ";
	}
	str += " > ";
	document.write(str);
}

/**
 * 	生成下拉框innerHTML
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param nullFlag	验证规则
 * @return
 */
function getSelectStr(id,name,type,selectedKey,setAll,_class_,_script_,nullFlag)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	if(nullFlag!=undefined&&nullFlag==true){
		str += " datatype='0,is_null,200' ";
	}
	str += " > ";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	return str;
}

/**
 * 	审核中使用的下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param nullFlag	验证规则
 * @return
 */
function getApproveSelect(id,name,type,selectedKey,defaultOption,_class_,_script_,nullFlag,_arg,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' name='" + name +"' class='"+ _class_ +"' " + _script_ ;
	if(nullFlag!=undefined&&nullFlag==true){
		str += " datatype='0,is_null,200' ";
	}
	str += " > ";
	if(defaultOption!=null){
		str += genReleaseOpt(_arg);
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	
	$("#"+container).html(str);
}
function genReleaseOpt(arg)
{
	return '<option selected value="">'+arg+'</option>';
}

/**
 * 	生成下拉框
 * @param id	下拉框ID
 * @param name	下拉框NAME
 * @param type	显示FIXCODE中的TYPE
 * @param selectedKey	哪个值默认选中
 * @param setAll	是否生成默认选项
 * @param _class_	样式
 * @param _script_	脚本
 * @param container	容器ID
 * @return
 */
function getSelectOnclick(id,name,type,selectedKey,setAll,_class_,_script_,container)
{
	var allCode = codeData.data;
	var str = "";
	str += "<select id='" + id + "' onchange='changeAttribute()' name='" + name +"' class='"+ _class_ +"' " + _script_ + ">";
	if(setAll){
		str += genDefaultOpt();
	}
	for(var i=0;i<allCode.length;i++){
		if(allCode[i].type == type){
			str += "<option " + (allCode[i].fixcodeId == selectedKey ? "selected" : "") + " value='" + allCode[i].fixcodeId + "' title = '"+allCode[i].codeDesc+"' >" + allCode[i].codeDesc + "</option>";
		}
	}
	str += "</select>";
	$("#"+container).html(str);
}
