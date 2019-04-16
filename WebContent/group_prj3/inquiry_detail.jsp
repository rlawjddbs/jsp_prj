<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 확인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>
	body{ margin:0; }
	section{ width:1200px; overflow:hidden; padding-top:56px; margin:0 auto; box-sizing:border-box; padding-bottom:30px; }
	article{ padding:30px 0 }
	.headerZone{
		overflow:hidden;
	}
	.headerZone > p{ display:inline-block; padding-top:10px; padding-left:20px; }
	.headerZone > h3{ float: left; }
	
	.description > textarea{ width:100%; min-height:300px;}
	#bottomZone{ text-align:center; }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	}); // ready
</script>
</head>
<body>
	<header>
		<!-- 
		<div id="logo">
			사이트 로고
		</div>
		<nav>
			<ul>
				<li>공지사항</li>
				<li>문의하기</li>
				<li>이용후기</li>
				<li>포트폴리오</li>
			</ul>
		</nav>
		 -->
		 <c:import url="/common/jsp/navbar.jsp"/>
	</header>
	<section>
		<article id="inquiry">
			<div class="headerZone">
				<h3 id="inquirySubject">안녕하세요?</h3>
				<p>
					<span id="inquiryNum"># 26번 글</span>
					<span id="inquiryWriter">qwer</span> |
					<span id="wDate">2019.03.21 18:24</span>
				</p>
			</div>
			<div class="description">
				<textarea id="userContents">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem	</textarea>
			</div>
		</article>
		<article id="answer">
			<div class="headerZone">
				<h3 id="answerSubject">답변</h3>
				<p>
					<span id="answerWriter">관리자</span> |
					<span id="rDate">2019.03.21 19:38</span>
				</p>
			</div>
			<div class="description">
				<textarea id="rContents">
					Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem
				</textarea>
			</div>
		</article>
		<div id="bottomZone">
			<input type="button" value="뒤로가기" />
		</div>
	</section>
	<footer class="page-footer font-small bg-dark">
		 	<c:import url="/common/jsp/footer.jsp"/>
		 </footer>
</body>
</html>