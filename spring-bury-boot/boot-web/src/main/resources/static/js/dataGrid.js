/**
 *
 *   自动生成数据表格工具类
 *   可以自动生成带有分页/不分页的数据表格，实现自定义列，自动绑定数据等功能
 *   option格式如下：
 *   var option = 
 * 	 {
 * 	 	 url:"usermanager/userManagerPageQuery",						// 请求的后台地址，必填
 * 	 	 tableClass : null,												// 表格的样式，如果为null则使用默认样式，选填
 * 	 	 formId:"fm",													// 提交的表单id，选填
 * 	 	 gridId:"myGrid",												// 承载表格的div层ID，选填
 * 	 	 blankId:"_page",												// 如果没有查询数据时的空结果集div层ID，选填
 * 	 	 pageId:"myPage",												// 承载分页标签的div层ID，选填
 * 	 	 choiceType:'radio'|'checkbox'|null,							// 设置首列使用radio或checkbox的行点击事件，用来处理radio或checkbox的选择、取消操作，选填
 * 	 	 columns : [													// 定义的列及列与数据的绑定关系，必填
 * 	 		{header: "", width: "10%", dataIndex: "userId",renderer: CommonUtil.getRadio},//设置序号的方式
 *	 		{header: "用户代码", width: "30%", dataIndex: "userCode"},
 *	 		{header: "用户名称", width: "30%", dataIndex: "userName"},
 *	 		{header: "用户状态", width: "30%", dataIndex: "userStatus", renderer: getfixCodeDesc}
 * 	 	]
 * 	 };
 *   
 *
 *
 */
var DataGrid = function () {
	/**
	 *  生成表格使用的参数，可以覆盖该参数，如果不覆盖，使用默认定义
	 */
	var defOption = 
 	{
 		 url:"",
 		 tableClass : null,
 		 formId:"fm",
 		 gridId:"myGrid",
 		 blankId:"_page",
 		 pageId:"myPage",
 		 //useRadio:null
 		 choiceType:null
 	};
	var ps;
	
	/**
	 *   分页查询表格
	 */
	var __extQuery__ = function(page, option) {
		option = $.extend(defOption, option);
		addMask();
		var url=option.url;
		makeNomalFormCall(url+(url.lastIndexOf("?") == -1?"?":"&")+"curPage="+page,callBack,option);
		$("#curPage").attr("value",page);
	};
	
	/**
	 *   全部查询表格
	 */
	var __extQueryAll__ = function(option) {
		option = $.extend(defOption, option);
		addMask();
		var url=option.url;
		makeNomalFormCallAll(url, callBackAll, option);
	};
	
	/**
	 * 	Ajax请求数据，并进行处理(分页数据表格)
	 *  showFunc 处理成功的回调方法
	 */
	var makeNomalFormCall = function(url,showFunc,option) {
		$.ajax({
			type : "POST",
			url : url,
			cache: false,
			data : $($("#" + option.formId)).serialize(),
			dataType: 'json',
			async: false,
		    error: function(XMLHttpRequest, textStatus, errorThrown)
		    {
	    		removeMask();
				bootbox.alert('Error:' + XMLHttpRequest.responseText);
			},
			success : function(transport, textStatus)
			{
				removeMask();
				if(transport.Exception == undefined || transport.Exception.type == "2")
				{
					showFunc(transport, option);
				}
				else
				{
					doError(transport);
				}
			}
		});
	};
	
	/**
	 *  Ajax请求数据，并进行处理(全部数据表格)
	 * @param url
	 * @param showFunc 处理成功的回调方法
	 * @param option
	 */
	var makeNomalFormCallAll = function(url, showFunc, option) {
		$.ajax({
			type : "POST",
			url : url,
			cache: false,
			async: false,
			data : $($("#" + option.formId)).serialize(),
			dataType: 'json',
		    error: function(XMLHttpRequest, textStatus, errorThrown)
		    {
	    		removeMask();
	    		bootbox.alert('Error:'+XMLHttpRequest.responseText);
			},
			success : function (transport, textStatus)
			{
				removeMask();
				if(transport.Exception==undefined||transport.Exception.type=="2")
				{
					showFunc(transport, option);
				}
				else
				{
					doError(transport);
				}
			}
		});
	};
	
	//Ajax返回调用函数 设置字段、列名属性参数
	var callBack = function(json, option) { 
		ps = json;
		//生成数据集
		if(ps.records != '')
		{
			$("#" + option.blankId).hide();
			$("#" + option.gridId).show();
			createGrid(option.tableClass,option.title,option.columns, document.getElementById(option.gridId),ps,option.choiceType);
			//分页
			var pageName = option.pageId;
			window[pageName] = new showPages(option, ps);
			window[pageName].printHtml();
		}
		else
		{
			$("#" + option.blankId).show();
			$("#" + option.pageId).html("");
			removeGird(option.gridId);
			$("#" + option.gridId).hide();
		}
	};
	
	var callBackAll = function(json, option) {
		var ps = json;
		//设置对应数据
//		if(Object.keys(json).length>0){
//			ps = json[Object.keys(json)[0]];
//		}
		//生成数据集
		if(ps.records != '')
		{
			$("#"+option.blankId).hide();
			$("#"+option.gridId).show();
			createGridAll(option.tableClass,option.title,option.columns, document.getElementById(option.gridId),ps,option.choiceType);
		}
		else
		{
			$("#"+option.blankId).show();
			$("#"+option.pageId).html("");
			removeGird(option.gridId);
			$('#'+option.gridId).hide();
		}
	};
	
	/**
	 *  拼装表格
	 */
	var createGrid = function(tableClass, title, columns, cnt, ps, choiceType) {
		this.tableClass = tableClass;
		//this.title = title;
		this.columns = columns;
		this.container = cnt;
		this.table;
		this.curRow;
		this.curCell;
		this.curColums;
		this.jsonData = ps.records;
		this.remoteSort = true;
		this.curPage = ps.curPage;
		this.pageSize = ps.pageSize;
		this.choiceType = choiceType;
		
		var CurGrid = this;
		
//		this.load = function()
//		{
//			
//		};
		//grid重画模块
		if($('myTable') != null)
		{
			removeGird(this.container);
		}
		var tbStr = [], dataIndexArr = [], rendererArr = [], cellCnt=[],index, noWrap, colMask;
		tbStr.push("<table id='myTable'");
		// 如果指定了表格的样式，使用指定的样式，否则使用默认样式
		if(this.tableClass !=null)
		{
			tbStr.push(" class='"+this.tableClass+"'>");
		}
		else
		{
			tbStr.push(" class='table table-bordered table-condensed table-striped table-advance table-hover'>");
		}
		tbStr.push("<thead>");

		for(var o = 0; o < this.columns.length; o++)
		{// 处理排序，暂时未用到
			if(this.columns[o].orderCol != undefined)
			{
				if($("orderCol").value == this.columns[o].orderCol||$("orderCol").value.split("-")[0]== this.columns[o].orderCol)
				{
					if($("order").value == '-1')
					{
						colMask = "descMask";						
					}
					else if($("order").value == '1')
					{
						colMask = "ascMask";
					}
				}else{
					colMask = "sortMask";
				}
			}
			else
			{
				colMask = "noSort";
			}
			// 如果定义列宽，那么使用定义值，否则自动宽度
			if(this.columns[o].width == undefined)
			{
				tbStr.push("<th style='text-align:center;'>"+ this.columns[o].header+"</th>");
			}
			else
			{			
				tbStr.push("<th width="+ this.columns[o].width +" style='text-align:center;'>"+ this.columns[o].header+"</th>");
			}				
			dataIndexArr.push(this.columns[o].dataIndex);//记录dataIndex				
			rendererArr.push(this.columns[o].renderer);  //记录renderer
		}
		tbStr.push("</thead>");
		for(var i=0; i< this.jsonData.length;i++)
		{
			//判断使用的选择方式
			if(choiceType == 'radio')
			{
				// radio
				tbStr.push("<tr class='odd gradeX' onclick='javascript:DataGrid.selectTheRrRadio(this)' ondblclick='javascript:DataGrid.checkYouSee(this)'>");
			}
			else if(choiceType == 'checkbox')
			{
				// checkbox
				tbStr.push("<tr class='odd gradeX' onclick='javascript:DataGrid.selectTheCheckBox(this)'>");
			}
			else
			{
				// 无
				tbStr.push("<tr class='odd gradeX' >");
			}
			// 数据绑定
			for(var j=0;j<dataIndexArr.length;j++)
			{	
				cellCnt = this.jsonData[i][dataIndexArr[j]];//根据dataIndex显示后台数据
				if(cellCnt == null || cellCnt == undefined)
				{
					cellCnt ='';
				}
				if(typeof(rendererArr[j])=='function')
				{
					//列名有renderer属性
					var __data__ = {};
					__data__.data = this.jsonData[i];
					cellCnt = this.columns[j].renderer(cellCnt,{},__data__);//显示renderer函数，传值
				}
				if(this.columns[j].style == undefined)
				{
					styleV = '';
				}
				else
				{
					styleV = this.columns[j].style;
				}
				tbStr.push("<td style='vertical-align: middle;'>" + cellCnt + "</td>");
			}				
			tbStr.push("</tr>");
		}
		tbStr.push("</table>");
		this.container.innerHTML = tbStr.join("");
		this.table = this.container.firstChild;
		/** 设置单元格  **/
		for(var r=1; r<this.table.rows.length;r++)
		{
			if(dataIndexArr[0] == undefined || rendererArr[0] == "function getIndex(){}")
			{
				//序号判断
				if(this.curPage == 1)
				{
					//计算序号
					index = r;
				}
				else
				{
					index = parseInt(this.curPage-1)*this.pageSize + r;
				}
				this.table.rows[r].cells[0].innerHTML = index; 
				this.table.rows[r].cells[0].style.textAlign = 'center';//序号单元格居中			
			}
			
			this.table.rows[r].onmouseover = function(){ this.style.backgroundColor = createGrid.hoverColor; };
			this.table.rows[r].onmouseout = function() { 
				if(CurGrid.curRow!=this) this.style.backgroundColor = createGrid.backColor; 
				else this.style.backgroundColor = createGrid.clickColor;
			};
			for(var c=0;c<this.table.rows[r].cells.length;c++)
			{
				this.table.rows[r].cells[c].onclick = function()
				{
					if(CurGrid.curRow) CurGrid.curRow.style.backgroundColor = createGrid.backColor;
					CurGrid.curRow = this.parentNode;
					this.parentNode.style.backgroundColor = createGrid.clickColor;
				}

			}
		}
		for(var g=0; g<this.table.rows[0].cells.length;g++)
		{
			this.table.rows[0].cells[0].style.textAlign = 'center';	//序号列居中
			if(this.columns[g].orderCol != undefined)
			{
				this.table.rows[0].cells[g].onclick = function()
				{
					var _order = 1;
					if(!$("queryBtn").disabled)
					{
						//亮
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "ascMask")
						{
							_order = '-1';
						}								
					}
					else
					{
						if($("orderCol").value != this.cellIndex)
						{
							return false;
						}
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "ascMask")
						{
							_order = '1';
						}
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "descMask")
						{
							_order = '-1';
						}
					}
					// 排序，暂时未实现
					CurGrid.sort(this.cellIndex, CurGrid.columns[this.cellIndex].orderCol,_order,CurGrid.columns[this.cellIndex].orderType);	
				};
			}
		}
		/*
		this.sort = function(n, orderCol,order,orderType)
		{
			//排序 n-列 type-升降序
			if(typeof(this.remoteSort) == 'undefined' || this.remoteSort == false)
			{
				//当前页排序			
				this.jsonData = this.jsonData.sort(function(x,y)
				{
					if(x[n]>y[n])
					{
						return type;
					}
					else if(x[n]<y[n])
					{
						return -type;
					}
					else
					{
						return 0;
					}
				});
			}
			else
			{
				//远程排序
				if($('myTable') != null)
				{
					removeGird(this.container);
				}
				myRemoteSort(orderCol,order,orderType);
			}
			this.load();
		};
		*/
	};
	
	var createGridAll = function(tableClass, title, columns, cnt, ps, choiceType) {
		this.tableClass = tableClass;
		//this.title = title;
		this.columns = columns;
		this.container = cnt;
		this.table;
		this.curRow;
		this.curCell;
		this.curColums;
		this.jsonData = ps;
		this.remoteSort = true;
		this.choiceType = choiceType;
		var CurGrid = this;

		
		if($('myTable') != null)
		{
			removeGird(this.container);
		}
		var tbStr = [], dataIndexArr = [], rendererArr = [], cellCnt=[], index, noWrap, colMask;

		tbStr.push("<table id='myTable'");
		if(this.tableClass !=null)
		{
			tbStr.push(" class='"+this.tableClass+"'>");
		}
		else
		{
			tbStr.push(" class='table table-bordered table-condensed table-striped table-advance table-hover'>");
		}
		tbStr.push("<thead>");
		for(var o=0; o< this.columns.length; o++)
		{
			if(this.columns[o].orderCol != undefined)
			{
				if($("orderCol").value == this.columns[o].orderCol||$("orderCol").value.split("-")[0]== this.columns[o].orderCol)
				{
					if($("order").value == '-1')
					{
						colMask = "descMask";						
					}
					else if($("order").value == '1')
					{
						colMask = "ascMask";
					}
				}
				else
				{
					colMask = "sortMask";
				}
			}
			else
			{
				colMask = "noSort";
			}
			if(this.columns[o].width == undefined)
			{
				tbStr.push("<th style='text-align:center;'>"+ this.columns[o].header+"</th>");
			}
			else
			{			
				tbStr.push("<th width="+ this.columns[o].width +" style='text-align:center;'>"+ this.columns[o].header+"</th>");
			}				
			dataIndexArr.push(this.columns[o].dataIndex);//记录dataIndex				
			rendererArr.push(this.columns[o].renderer);  //记录renderer
		}
		tbStr.push("</thead>");
		//判断使用的选择方式
		for(var i=0; i< this.jsonData.length;i++)
		{
			//判断使用的选择方式
			if(choiceType == 'radio')
			{
				// radio
				tbStr.push("<tr class='odd gradeX' onclick='javascript:DataGrid.selectTheRrRadio(this)' ondblclick='javascript:DataGrid.checkYouSee(this)'>");
			}
			else if(choiceType == 'checkbox')
			{
				// checkbox
				tbStr.push("<tr class='odd gradeX' onclick='javascript:DataGrid.selectTheCheckBox(this)'>");
			}
			else
			{
				// 无
				tbStr.push("<tr class='odd gradeX' >");
			}
			// 数据绑定
			for(var j=0;j<dataIndexArr.length;j++)
			{	
				cellCnt = this.jsonData[i][dataIndexArr[j]];//根据dataIndex显示后台数据
				if(cellCnt == null || cellCnt == undefined)
				{
					cellCnt ='';
				}
				if(typeof(rendererArr[j])=='function')
				{
					//列名有renderer属性
					var __data__ = {};
					__data__.data = this.jsonData[i];
					cellCnt = this.columns[j].renderer(cellCnt,{},__data__);//显示renderer函数，传值		
				}
				if(this.columns[j].style == undefined)
				{
					styleV = '';
				}
				else
				{
					styleV = this.columns[j].style;
				}
				tbStr.push("<td style='vertical-align: middle;'>" + cellCnt + "</td>");
			}				
			tbStr.push("</tr>");
		}
		tbStr.push("</table>");
		this.container.innerHTML = tbStr.join("");
		this.table = this.container.firstChild;
		/** 设置单元格  **/
		for(var r=1;r < this.table.rows.length;r++)
		{
			if(dataIndexArr[0] == undefined || rendererArr[0] == "function getIndex(){}")
			{
				//序号判断
				this.table.rows[r].cells[0].innerHTML = r;
				this.table.rows[r].cells[0].style.textAlign = 'center';//序号单元格居中			
			}
			
			this.table.rows[r].onmouseover = function()
			{
				this.style.backgroundColor = createGrid.hoverColor;
			};
			this.table.rows[r].onmouseout = function()
			{ 
				if(CurGrid.curRow!=this) this.style.backgroundColor = createGrid.backColor; 
				else this.style.backgroundColor = createGrid.clickColor;
			};

			for(var c=0;c<this.table.rows[r].cells.length;c++)
			{
				this.table.rows[r].cells[c].onclick = function()
				{
					if(CurGrid.curRow) CurGrid.curRow.style.backgroundColor = createGrid.backColor;
					CurGrid.curRow = this.parentNode;
					this.parentNode.style.backgroundColor = createGrid.clickColor;
				};
			}
		}

		for(var g=0; g<this.table.rows[0].cells.length;g++)
		{
			this.table.rows[0].cells[0].style.textAlign = 'center';//序号列居中
			if(this.columns[g].orderCol != undefined)
			{
				this.table.rows[0].cells[g].onclick = function()
				{
					var _order = 1;
					if(!$("queryBtn").disabled)
					{
						//亮
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "ascMask")
						{
							_order = '-1';
						}								
					}
					else
					{
						if($("orderCol").value != this.cellIndex){return false;}
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "ascMask")
						{
							_order = '1';
						}
						if(CurGrid.table.rows[0].cells[this.cellIndex].className == "descMask")
						{
							_order = '-1';
						}
					}
					// 排序，暂时未实现
					CurGrid.sort(this.cellIndex, CurGrid.columns[this.cellIndex].orderCol,_order,CurGrid.columns[this.cellIndex].orderType);	
				};
			}
		}
	};
	
	/**
	 *  点击按钮后添加遮盖
	 */
	var addMask = function () {
		$('.btn').addClass("disabled");
		var pageContent = $('#data-body');
		Metronic.blockUI(pageContent);
	};

	/**
	 *  加载完毕后去除遮盖
	 */
	var removeMask = function() {
		$('.btn').removeClass("disabled");
		var pageContent = $('#data-body');
		Metronic.unblockUI();
	};
	
	/**
	 *  处理错误信息
	 */
	var doError = function(json) {
		var exception = json.Exception;
		bootbox.alert(exception);
		/*
		var errorCode = json.Exception.errCode;
		if(errorCode!=undefined){
			exception=errorCode;
		}
		var message = json.Exception.message;
		if(message!=undefined){
			if(exception==null){
				exception=message;
			}else{
				exception+="："+message;
			}
		}
		*/
	};
	
	/**
	 *  删除grid
	 */
	var removeGird = function(id) {
		$(id).innerHTML = '';
	};
	
	var checkYouSee = function(ck) {
		$(".myTdYel").css({ 'background-color':'' });
		$(".myTdYel").removeClass("myTdYel");
		 var c  = ck.cells[0].childNodes[0].childNodes[0];
		 var x = c.className;
		 if(x == "" || x == null)
		 {
			 $(".myVail").removeClass("checked");
			 $(".myVail").removeClass();
			 c.className='checked myVail';
			 c.childNodes[0].checked=true;
			 
			 $(ck).find("td").addClass("myTdYel");
			 $(ck).find("td").css({ 'background-color':'#F9F900' });
		 }
		 else
		 {
			 $(c).removeClass();
			 c.childNodes[0].checked=false;
		 }
	};
	
	/**
	 *  点击radio事件
	 */
	var selectTheRrRadio = function(ck) {
		$(".myTdYel").css({ 'background-color':'' });
		$(".myTdYel").removeClass("myTdYel");
		var c  = ck.cells[0].childNodes[0].childNodes[0];
		var x = c.className;
		if(x==""||x==null)
		{
			$(".myVail").removeClass("checked");
			$(".myVail").removeClass();
			c.className='checked myVail';
			c.childNodes[0].checked=true;
			$(ck).find("td").addClass("myTdYel");
			$(ck).find("td").css({ 'background-color':'#F9F900' });
		}
		else
		{
			$(c).removeClass();
			c.childNodes[0].checked=false;
		}
	};
	
	/**
	 * 点击checkBox事件
	 * @param ck
	 */
	var selectTheCheckBox = function(ck) {
		 var c  = ck.cells[0].childNodes[0].childNodes[0]; 
		 var x = c.className;					   
		 if(x==""||x==null)
		 {					  
			 c.className='checked';				   
			 c.childNodes[0].checked=true;	
			 $(ck).find("td").addClass("myTdYel");
			 $(ck).find("td").css({ 'background-color':'#F9F900' });
		 }
		 else
		 {	
			 $(ck).find("td").css({ 'background-color':'' });
			 $(ck).find("td").removeClass("myTdYel");
			 $(c).removeClass();				   
			 c.childNodes[0].checked=false;		  
		 }
	};
	
	/**
	 *  远程排序接口,暂未使用
	 */
	var myRemoteSort = function(orderCol,order,orderType) {
		//排序类型 0:不排 -1:降序 1:升序
		if(orderType!=undefined&&orderType!="")
		{
			$("orderCol").value = orderCol+"-"+orderType;
		}
		else
		{
			$("orderCol").value = orderCol;
		}
		$("order").value = order;

		if(!$("queryBtn").disabled)
		{
			//亮
			__extQuery__(1);
		}
		//alert("当前列="+col+" | "+"排序类型="+order +" | "+ "此为排序接口，远程请求在此写！");
	};
	
	var getIndex = function(){};
	
	
	return {
		__extQuery__ : function(page, option) {
			__extQuery__(page, option);
		},
		__extQueryAll__ : function(option) {
			__extQueryAll__(option);
		},
		selectTheCheckBox : function(ck) {
			selectTheCheckBox(ck);
		},
		selectTheRrRadio : function(ck) {
			selectTheRrRadio(ck);
		},
		checkYouSee : function(ck) {
			checkYouSee(ck);
		},
		getIndex : function() {
			getIndex();
		},
		addMask : function() {
			addMask();
		},
		removeMask : function() {
			removeMask();
		}
	};
}();