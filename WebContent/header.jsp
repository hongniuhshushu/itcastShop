<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<!-- 登录 注册 购物车... -->
<div class="container-fluid">
	<div class="col-md-4">
		<img src="img/logo2.png" />
	</div>
	<div class="col-md-5">
		<img src="img/header.png" />
	</div>
	<div class="col-md-3" style="padding-top: 20px">
		<ol class="list-inline">

			<c:if test="${!empty user}">
				<li>欢迎您</li>
				<li>${user.name}</li>
				<li><a
					href="${pageContext.request.contextPath }/user?method=logout">退出</a></li>
			</c:if>
			<c:if test="${empty user }">
				<li><a href="${pageContext.request .contextPath}/login.jsp">登录</a></li>
				<li><a href="${pageContext.request .contextPath}/register.jsp">注册</a></li>
			</c:if>

			<li><a href="${pageContext.request .contextPath}/cart.jsp">购物车</a></li>
			<li><a href="${pageContext.request .contextPath}/order_list.jsp">我的订单</a></li>
		</ol>
	</div>
</div>

<!-- 导航条 -->
<div class="container-fluid">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath }/default.jsp">首页</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav"    id="categoryUl">
					<!-- 	<li class="active"><a href="product_list.htm">手机数码<span
							class="sr-only">(current)</span></a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li>
					<li><a href="#">电脑办公</a></li> -->
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
		</div>

		<script type="text/javascript">
			var context = "";
			$(function() {

				$
						.post(
								"${pageContext.request.contextPath}/category?method=getAll",
								function(data) {
									for (var i = 0, len = data.length; i < len; i++) {
										context+="<li><a href='${pageContext.request.contextPath}/product?method=productsByCid&cid="+data[i].cid+"'>"+data[i].cname+"</a></li>";
									}
									$("#categoryUl").html(context);
								}, "json")
			})
		</script>

	</nav>
</div>
