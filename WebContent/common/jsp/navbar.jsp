<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
<style type="text/css">
	.navbar-nav > li > a { padding: 20px 20px; }
</style>
-->
		<nav class="navbar navbar-expand-sm fixed-top navbar-dark bg-dark">
			<a class="navbar-brand" href="#">Propofol</a>
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">문의하기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">이용후기</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown" href="#">포트폴리오</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">내 포트폴리오 관리</a>
						<a class="dropdown-item" href="#">포트폴리오 둘러보기</a>
					</div>
				</li>
			</ul>
			<!-- 로그인 세션에 따라 보여주는 li가 다르게 출력 -->
			<div class="navbar-nav ml-auto">
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="#">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">회원가입</a>
					</li>
				</ul>
			</div>
		</nav>
