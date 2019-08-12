<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>欢迎界面</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<link href="<%=path %>/assets/css/pages/blog.css" rel="stylesheet" type="text/css"/>
	<link href="<%=path %>/assets/css/pages/news.css" rel="stylesheet" type="text/css"/>
	<script src="<%=path %>/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="<%=path %>/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
</head>
<!-- BEGIN BODY -->
<body>
<!-- <input type="hidden" id="curPage" value="" /> -->

<div class="row">
	<div class="col-md-12 news-page blog-page">
		<div class="row">
			<div class="col-md-11 blog-tag-data">
				<h3 class="page-title">长春市科技企业数据库 </h3>				
			</div>
			<div class="col-md-1" align="right">
				<img src="<%=path %>/images/fawvwlogo.gif" alt="FAW-VW" class="img-responsive" />
			</div>
		</div>
	</div>
</div>
<!-- margin-top-10 -->
<div class="row">
	<div class="col-md-12">
		<div id="myCarousel" class="carousel image-carousel slide">
			<div class="carousel-inner">
				<div class="active item">
					<img src="<%=path %>/images/audi1.png" class="img-responsive" alt="">
<!-- 					<div class="carousel-caption"> -->
<!-- 						<h4><a href="page_news_item.html">First Thumbnail label</a></h4> -->
<!-- 						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p> -->
<!-- 					</div> -->
				</div>
				<div class="item">
					<img src="<%=path %>/images/audi2.png" class="img-responsive" alt="">
				</div>
				<div class="item">
					<img src="<%=path %>/images/audi3.png" class="img-responsive" alt="">
				</div>
			</div>
			<!-- Carousel nav -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">
			<i class="m-icon-big-swapleft m-icon-white"></i>
			</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">
			<i class="m-icon-big-swapright m-icon-white"></i>
			</a>
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
		</div>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<!-- 左侧 -->
			<div class="col-md-9 blog-tag-data">
				<!-- <h3>系统通知列表</h3> -->
				<!-- 开始 查询列表 -->
				<jsp:include page="${contextPath}/queryPage/orderHidden.html" />
				<jsp:include page="${contextPath}/queryPage/pageDiv.html" />
				<!-- 结束 查询列表 -->
			</div>
			<!-- /左侧 -->
			
			<!-- 右侧 -->
			<div class="col-md-3" align="" style="margin-top: -16px">
				<div class="top-news">
				<a class="btn dark" href="jsp/audi/MaintainCase.doc">
				<span>常用下载</span>
				<em>
				<i class="fa fa-tags"></i>
					维修案例模版
				</em>
				<i class="fa fa-download top-news-icon"></i>
				</a>
				</div>
			</div>
			<!-- /右侧 -->
		</div>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
	var url = "welcomeSearchNotifyMessages.action";
	var title = "系统通知";//设置表格标题
	var tableClass = null;
	var columns = [
		{header: "序号", width:"5%", renderer: getIndex},//设置序号的方式
		{header: "添加时间", width:"15%", dataIndex: 'createDate'},
		{header: "标题", width:"25%", dataIndex: 'title' },
		{header: "附件", width:"25%", dataIndex: 'fileName',renderer:myLink}
	];
	//设置超链接
   	function myLink(value, metaDate, record){
   		var link = value
		if(record.data.fileName != "" && record.data.fileName != null)
			link = "<a href='notifyMessagesFileDownload.action?id="+record.data.id+"' class='btn btn-xs'>"+value+"</a>&nbsp;&nbsp;";
		return link;
   	}
   	$().ready(function() {
		__extQuery__(1);
	});
</script>