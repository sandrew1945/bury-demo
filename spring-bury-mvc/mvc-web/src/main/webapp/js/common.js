/**
 * 
 *    js工具类，主要定义通用的不涉及后台调用的js方法
 * 
 * 
 * 
 * 
 */


var CommonUtil = function () {
	/**
	 * 将选种CheckBox的Value变成String
	 * 
	 * @param name
	 * @return
	 */
	var checkBoxToString = function(name) {
		try
		{
			var param = '';
			var value = '';
			var index = 0;
			var names = document.getElementsByName(name);
			for (var i = 0; i < names.length; i++) {
				if (names[i].checked)
				{
					if (index == 0)
					{
						value += names[i].value;
						index++;
					}
					else
					{
						value += "," + names[i].value;
					}
				}
			}
			param += value;
			return param;
		}
		catch (e)
		{
			alert('Serialize Error');
		}
	};
	
	/**
	 * 生成radio
	 */
	var getRadio = function(value, metaDate, record) {
		return "<div class='radio' style='margin-top:-6px;'><span><input name=\"indexId\"  value="
        + value + " type=\"radio\"></input></span></div>";
	};
	
	/**
	 * 生成radio,将对象转换成字符串保存到radio的value中，需要使用字段时，先将字符串转换成对象(var str =
	 * JSON.parse(jsonStr);)，然后.属性
	 * 
	 * @param value
	 * @param metaDate
	 * @param record
	 * @returns {String}
	 */
	var getJsonStrRadio = function(value, metaDate, record) {
		var jsonStr = JSON.stringify(record.data);
		return '<div class="radio" style="margin-top:-6px;"><span><input name="indexId" type="radio" value='
				+ jsonStr + ' ></input></span></div>';
	};
	
	
	/**
	 * 页面显示条数生成器
	 * 
	 * @param id
	 * @param name
	 * @param _value_
	 * @param _script_
	 * @param _class_
	 * @param container
	 */
	var getPageSizeSelect = function(id, name, _value_, _script_, _class_, container) {
		var str = "";
		str += "<select id='" + id + "' name='" + name + "' class='" + _class_
				+ "' " + _script_ + "'"
				+ "' style='position:relative;left:0px;top:-6px;'>";
		if (_value_ != null && _value_ != '') {
			str += "<option value='10' " + (_value_ == 10 ? 'selected' : '') + ">10</option>";
			str += "<option value='20' " + (_value_ == 20 ? 'selected' : '') + ">20</option>";
			str += "<option value='50' " + (_value_ == 50 ? 'selected' : '') + ">50</option>";
		} else {
			str += "<option value='10'>10</option>";
			str += "<option value='20'>20</option>";
			str += "<option value='50'>50</option>";
		}
		str += "</select>";
		$("#" + container).html(str);
	};
	
	/**
	 * 生成checkBox
	 */
	var getCheckBox = function(value, metaDate, record) {
		return "<div class='checker' style='margin-top:-6px;'><span name='checkSpan'><input name=\"checkBoxIndex\"  value="
		+ value
		+ " type=\"checkbox\" class='liChild'></input></span></div>";
	};
	
	/**
	 * 生成checkBox,将对象转换成字符串保存到checkBox的value中，需要使用字段时，先将字符串转换成对象(var str =
	 * JSON.parse(jsonStr);)，然后.属性
	 * 
	 * @param value
	 * @param metaDate
	 * @param record
	 * @returns {String}
	 */
	var getJsonStrCheckBox = function(value, metaDate, record) {
		var jsonStr = JSON.stringify(record.data);
		return '<div class="checker" style="margin-top:-6px;"><span name="checkSpan" ><input name="checkBoxIndex" type="checkbox" value='
				+ jsonStr + ' class="liChild"></input></span></div>';
	};
	
	/**
	 * 格式化日期
	 */
	var convertDate = function(value) {
		if (value != null && value != '' && value != 'null') {
			return new Date(value).Format("yyyy-MM-dd");
		}
		return '';
	};
	
	/**
	 *  处理空值
	 *  value  待处理的值
	 *  defVal 如果待处理的值为空的默认值返回值
	 */
	var isNull = function(value, defVal) {
		if (value != null && value != "" && value != 'null') {
			return value;
		}
		return defVal;
	};
	
	/**
	 *  根据日期获取周度
	 */
	var getWeek = function(date) {
		var time, week, checkDate = new Date(date);
		checkDate.setDate(checkDate.getDate() + 4 - (checkDate.getDay() || 7));
		time = checkDate.getTime();
		checkDate.setMonth(0);
		checkDate.setDate(1);
		week = Math.floor(Math.round((time - checkDate) / 86400000) / 7) + 1;
		return week;
	};
	
	/**
	 *  根据radio的name获取选择的radio的值,如果不传name默认使用indexId
	 */
	var getRadioVal = function(name) {
		var intHot;
		if(null != name && "undefined" != name)
		{
			intHot = $("input[name='" + name + "']:checked").val();
		}
		else
		{
			intHot = $("input[name='indexId']:checked").val();
		}
		return intHot;
	};
	
	/**
	 *  根据checkbox的name获取选择的checkbox的值,如果不传name默认使用checkBoxIndex
	 *  返回数组
	 */
	var getCheckboxVals = function(name) {
		var intHots = [];
		if(null != name && "undefined" != name)
		{
			$("input[name='" + name + "']:checked").each(function(i){
				intHots[i] = $(this).val();
			});
		}
		else
		{
			$("input[name='checkBoxIndex']:checked").each(function(i){
				intHots[i] = $(this).val();
			});
		}
		return intHots;
	};
	
	/**
	 *  根据JSON时间输出时间字符串
	 */
	var getDateStr = function(date) {
		var date = new Date(date);
		Y = date.getFullYear();
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1);
		D = date.getDate() < 10? '0'+ date.getDate() : date.getDate();
		return Y+"-"+M+"-"+D;
	};
	
	var getDateStrPrint = function(date, containerId) {
		if(null == date || "" == date)
		{
			return "";
		}
		var date = new Date(date);
		Y = date.getFullYear();
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1);
		D = date.getDate() < 10? '0'+ date.getDate() : date.getDate();
		$("#"+containerId).text(Y+"-"+M+"-"+D);
	};
	
	/**
	 *  获取当前时间字符串,并输出到span标签内
	 */
	var getCurDateStr = function(containerId) {
		var date = new Date();
		Y = date.getFullYear();
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1);
		D = date.getDate() < 10? '0'+ date.getDate() : date.getDate();
		$("#"+containerId).text(Y+"-"+M+"-"+D);
	};
	
	
	
	return {
		checkBoxToString : function(name) {
			return checkBoxToString(name);
		},
		getRadio : function(value, metaDate, record) {
			return getRadio(value, metaDate, record);
		},
		getJsonStrRadio : function(value, metaDate, record) {
			return getJsonStrRadio(value, metaDate, record);
		},
		getPageSizeSelect : function(id, name, _value_, _script_, _class_, container) {
			getPageSizeSelect(id, name, _value_, _script_, _class_, container);
		},
		getCheckBox : function(value, metaDate, record) {
			return getCheckBox(value, metaDate, record);
		},
		getJsonStrCheckBox : function(value, metaDate, record) {
			return getJsonStrCheckBox(value, metaDate, record);
		},
		convertDate : function(value) {
			return convertDate(value);
		},
		getWeek : function(date) {
			return getWeek(date);
		},
		isNull : function(value, defVal) {
			return isNull(value, defVal);
		},
		getRadioVal : function(name) {
			return getRadioVal(name);
		},
		getCheckboxVals : function(name) {
			return getCheckboxVals(name);
		},
		getDateStr : function(date) {
			return getDateStr(date);
		},
		getDateStrPrint : function(date, containerId) {
			return getDateStrPrint(date, containerId);
		},
		getCurDateStr : function(containerId) {
			return getCurDateStr(containerId);
		}
	};
}();