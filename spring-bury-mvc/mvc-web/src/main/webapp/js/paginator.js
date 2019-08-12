/**
 *
 *   自动生成数据表格工具类
 *   生成分页标签
 *
 *
 */


/**
 *   定义showPages类属性
 */
function showPages(option, ps) {
	this.page = ps.curPage; //当前页数
	this.pageCount = ps.totalPages; //总页数
	this.totalRecords = ps.totalRecords; //总记录数
	this.option = option;
}

/**
 *  生成分页代码
 * @returns {String}
 */
showPages.prototype.createHtml = function() {
	var strHtml = '', prevPage = this.page - 1, nextPage = this.page + 1;
		strHtml += '<span class="count">总条数: ' + this.totalRecords + '</span>';
		strHtml += '<span class="number">';
	
		if (prevPage < 1)
		{
			// strHtml += '<span title="First Page">&#171;</span>';
			// do nothing!
		}
		else
		{
			strHtml += '<span title="First Page"><a href="javascript:' + this.option.pageId + '.toPage(1);">&#171;</a></span>';
		}
		if (this.page < 5 && this.page > 1)
		{
			strHtml += '<span title="Page 1"><a href="javascript:' + this.option.pageId + '.toPage(1);">1</a></span>';
		}
		if (this.page >= 5)
		{
			strHtml += '<span title="Page 1"><a href="javascript:' + this.option.pageId + '.toPage(1);">1..</a></span>';
		}
		if (this.pageCount > this.page + 2)
		{
			var endPage = this.page + 2;
		}
		else
		{
			var endPage = this.pageCount;
		}
		for (var i = this.page - 2; i <= endPage; i++)
		{
			if (i > 0)
			{
			  if (i == this.page)
			  {
				  strHtml += '<span title="Page ' + i + '"><a href="javascript:void(0)" style="color:#FF9900;background:#DDD;">' + i + '</a></span>';
			  }
			  else
			  {
				  if (i != 1 && i != this.pageCount)
				  {
					  strHtml += '<span title="Page ' + i + '"><a href="javascript:' + this.option.pageId + '.toPage(' + i + ');">' + i + '</a></span>';
				  }
			  }
			}
		}
		if(this.page + 3 <= this.pageCount)
		{
		strHtml += '<span title="Page ' + this.pageCount + '"><a href="javascript:' + this.option.pageId + '.toPage(' + this.pageCount + ');">..' + this.pageCount + '</a></span>';
		}
		if(this.page + 3 > this.pageCount && this.page != this.pageCount)
		{
			strHtml += '<span title="Page ' + this.pageCount + '"><a href="javascript:' + this.option.pageId + '.toPage(' + this.pageCount + ');">' + this.pageCount + '</a></span>';
		}
		if (nextPage > this.pageCount)
		{
			//strHtml += '<span title="Next Page">&#8250;</span>';//strHtml += '<span title="Last Page">&#187;</span>';
			// do nothing!
		}
		else
		{
			strHtml += '<span title="Next Page"><a href="javascript:' + this.option.pageId + '.toPage(' + nextPage + ');">下一页</a></span>';
		}	  
		
		if (this.pageCount < 1)
		{
			strHtml += '<input type="text" name="toPage" value="No Pages" class="mini_txt" disabled="disabled" style="margin-left:-10px;">';
			strHtml += '<input type="button" name="go" value="GO" class="mini_btn" disabled="disabled">';
		}
		else
		{
			strHtml += '<input type="text" id="pageInput' + '" value="' + this.page + '" title="Input page" onkeydown="return ' + this.name + '.formatInputPage(event);" onfocus="this.select()" style="margin-left:-15px;width: 20px">&nbsp;';
			strHtml += '<input type="button" name="go" value="Go" class="mini_btn" onclick="' + this.option.pageId + '.toPage(document.getElementById(\'pageInput' + '\').value);">';
		}
		strHtml += '</div>';
	return strHtml;
};

/**
 * 	翻页
 * @param page
 */
showPages.prototype.toPage = function(page) {
    if(page>=1 && page<=this.pageCount)
    {
    	DataGrid.__extQuery__(page, this.option);
    }
    else if(page < 1)
	{
    	DataGrid.__extQuery__(1, this.option);
	}
    else if(page > this.pageCount)
	{
    	DataGrid.__extQuery__(this.pageCount, this.option);
	}
};

/**
 *  限定输入页数格式
 * @param evt
 */
showPages.prototype.formatInputPage = function(evt) { 
	var evt = evt ? evt:(window.event?window.event:null);
	if(evt.keyCode == 13 && $("pageInput").value >= 1 && $("pageInput").value <= this.pageCount)
	{
		DataGrid.__extQuery__($F("pageInput"));	
	}
 };

/**
 * 	输出分页html
 * @param option
 */
showPages.prototype.printHtml = function(option) { 
	$("#"+this.option.pageId).html(this.createHtml());
};