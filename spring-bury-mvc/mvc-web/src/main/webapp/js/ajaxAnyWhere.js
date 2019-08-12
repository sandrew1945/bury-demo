/**
 * 
 * 	ajax请求工具类
 * 
 * 
 * 
 */
var AjaxAnyWhere = function () {
	
	/**
	 *   根据form提交请求，可以支持多表单提交
	 * 	 url		：请求路径
	 *   forms		：表单的id,使用","分割
	 *   showFunc	：成功的回调方法
	 */
	var sendRequestByForms = function(url, forms, sCallback) {
		// 根据form的id
		var fmArray = forms.split(",");
		var fmValues = "";
		for (var i=0 ; i < fmArray.length ; i++)
		{
			fmValues += $('#' + fmArray[i]).serialize()+"&";
		}
		fmValues = fmValues.substring(0,fmValues.length-1);
		// 发送请求
		sendAjaxRequest(url, fmValues, sCallback);
	};
	
	/**
	 *   直接使用data发送请求
	 *   url		：请求地址
	 *   data		：发送的数据
	 * 	 sCallback	：成功的回调方法
	 */
	var sendRequestByData = function(url, data, sCallback) {
		// 发送请求
		sendAjaxRequest(url, data, sCallback);
	};
	
	/**
	 * 	自动生成下拉框使用的异步请求，只有生成下拉框时使用
	 * 	url		：请求地址
	 * 	data		：发送的数据
	 * 	sCallback	：成功的回调方法
	 * 	defaultVal	：默认选中的值
	 * 	container	：装载下拉框的ID
	 * 
	 */
	var sendRequestForSelect = function(url, data, showFunc, id, name ,selectedKey, setAll, _class_, _script_, containerid) {
		$.ajax({
	         type: "POST",
	         url: url,//提交的URL
	         data: data, // 要提交的数据
	         dataType:"json",
	         async: false,
	         success: function (data) {
	        	 SelectUtil.selectBuilder(data, id, name ,selectedKey, setAll, _class_, _script_, containerid, showFunc);
	         },
	         error: function (XMLHttpRequest, textStatus, errorThrown) {
	             alert("Error:" + XMLHttpRequest.responseText);
	         }
	     });
	};
	
	
	/**
	 *   发送Ajax请求的公共方法
	 *   url		：请求路径
	 *   data		：发送数据
	 *   sCallback	：成功回调函数
	 *   fCallback	：失败回调函数
	 */
	var sendAjaxRequest = function(url, data, sCallback, fCallback) {
		$.ajax({
	         type: "POST",
	         url: url,			// 提交的URL
	         data: data, 	// 要提交的表单,必须使用name属性
	         cache: false,		// 是否缓存
	         dataType: 'json',
	         success: function (transport, textStatus)
	         {
	        	 sCallback(transport);
	         },
	         error: function (XMLHttpRequest, textStatus, errorThrown)
	         {
	        	 if(undefined != fCallback)
        		 {
	        		 fCallback(XMLHttpRequest);
        		 }
	        	 else
	        	 {
	        		 bootbox.alert("Error:"+XMLHttpRequest.responseText);
	        	 }

	         }
	     });
	};
	
	/**
	 * 	 处理Ajax返回结果
	 */
	var handleResult = function(ajaxResult, sCallback) {
		if(ajaxResult.result == true)
		{
			sCallback();
		}
		else
		{
			bootbox.alert("操作失败:" + ajaxResult.msg);
		}
	};
	
	return {
		sendRequestByForms : function(url, forms, sCallback) {
			sendRequestByForms(url, forms, sCallback);
		},
		sendRequestByData : function(url, data, sCallback) {
			sendRequestByData(url, data, sCallback);
		},
		handleResult : function(ajaxResult, sCallback) {
			return handleResult(ajaxResult, sCallback);
		},
		sendRequestForSelect : function(url, data, showFunc, id, name ,selectedKey, setAll, _class_, _script_, containerid) {
			sendRequestForSelect(url, data, showFunc, id, name ,selectedKey, setAll, _class_, _script_, containerid);
		}
	};
	
}();

/*
function sendAjaxRequestWithFile(url, callback)
{
	alert(1);
    // 提交表单  
    $(this).ajaxSubmit({
	    	url:url,//后台的处理，也就是form里的action  
	        type:"POST",  
	        dataType:"script", //数据格式，有XML，html，json，默认为文本  
	        success:function(msg){
	    	callback();
    	}
    });  
    // 为了防止普通浏览器进行表单提交和产生页面导航（防止页面刷新？）返回false  
    return false;  
}
*/

