<%@page import="day0326.RssVO"%>
<%@page import="java.util.List"%>
<%@page import="day0326.JtbcRssParsing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style type="text/css">
	body{ margin:0; }
	#wrap{ overflow:hidden; margin:0 auto; margin-top:56px;}
	/* 
	header{ height:80px; overflow:hidden; border-bottom:2px solid #ccc; }
	header > #logo{ padding-left:20px; padding-right:20px; height:80px; line-height:80px; text-align:center; font-size:40px; font-weight:bold; float:left;}
	header > nav { float:left;}
	header > nav > ul { overflow:hidden; margin:0; }
	header > nav > ul > li { float:left; list-style:none; padding-left:20px; padding-right:20px; font-size:22px; line-height:80px; font-weight:bold; }
	 */
	article{ width:1200px; margin:0 auto; overflow:hidden; min-height:700px; padding:20px 0;}
	article > #board_title{ font-size:30px; }
	article > #seeMyWriting{ float:right; margin-top:50px; margin-bottom:0;}
	
	
	
	#contentWrap{ width:100%; margin:20px auto; margin-bottom:30px; }
	#inquiryBoard th{ background-color:#eaeaea; padding-top:15px; padding-bottom:15px; font-size:16px; font-weight:bold; }
	#inquiryBoard td{ border-bottom:1px solid #ccc; padding-top:15px; padding-bottom:15px; font-size:16px; text-align:center; }
	
	#titleRow > th:nth-child(1){ width:80px; }
	#titleRow > th:nth-child(2){ width:480px; }
	#titleRow > th:nth-child(3){ width:80px; }
	#titleRow > th:nth-child(4){ width:80px; }
	#titleRow > th:nth-child(5){ width:80px; }
	
	#searchOption, #searchContent, #searchBtn{ text-align:center; display: table-cell; vertical-align: middle; height:40px; font-size:16px; }
	#searchOption{ width: 120px; }
	#searchContent{ height:34px; }
	#searchBtn{ padding-left:20px; padding-right:20px; }
	
	#writeInquiry{ padding-left:20px; padding-right:20px; height:40px; float:right; background-color:#5e5e5e; color:white; font-weight:bold; border:0; border-radius:5px; font-size:17px; }
	
	#subTitle{ display:block; width:100%; height:40px; padding:0 10px; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; outline:none; font-size:16px; margin-bottom:15px; }
	#content{ display:block; width:100%; height:400px; padding:10px; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; font-size:16px; resize:none; outline:none;}
	
	
	#frm > #fileGroup { margin-top:20px; font-size:0; }
	#frm > #fileGroup * { height:40px; }
	#frm > #fileGroup > label { display:inline-block; width:120px; padding:0 15px; line-height:40px; font-size:16px; font-weight:bold; a}
	#frm > #fileGroup > span{ display:inline-block; width:1000px; float:right; text-align:right; overflow:hidden;}
	#frm > #fileGroup > span > input[type=text]{ width:900px; box-sizing:border-box; display:block; float:left; border-radius:5px;}
	#frm #inputFile{ width:100px; font-size:16px; font-weight:bold; padding:0; float:left; border-radius:5px;background-color:#3498db; color:white; border:none;}	
	
	#frm #btnGroup{ text-align:center; margin-top:20px; }
	#frm #btnGroup .btn{ display:inline-block; width:120px; height:40px; background-color:#343a40; color:white; font-size:16px; font-weight:bold; }
	#frm #btnGroup .btn:first-child{ margin-right:15px; }
	
	
	
	/* footer{ font-size:40px; text-align:center; line-height:80px; font-weight:bold; height:80px; border-top:2px solid #ccc } */
	
	
	
</style>
<script type="text/javascript">
	window.onload = function(){
		var inputFile = document.getElementById("inputFile");
		var fileInput = document.getElementById("fileInput");
		inputFile.addEventListener("click", function(){ fileInput.click(); });
		
	} // onload function
</script>
</head>
<body>
	<div id="wrap">
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
			<article>
				<h1 id="board_title">문의 작성</h1>
				<div id="contentWrap">
					<form name="frm" id="frm">
						<input type="text" placeholder="제목" id="subTitle" />
						<textarea id="content" placeholder="내용을 입력해주세요."></textarea>
						<div id="btnGroup">
							<input class="btn" type="button" value="문의 남기기" />
							<input class="btn" type="button" value="뒤로가기" />
						</div>
					</form>
				</div>
			</article>
		</section>
		<!-- 
		<footer>
			Footer 사이트 정보
		</footer>
		 -->
		 <footer class="page-footer font-small bg-dark">
		 	<c:import url="/common/jsp/footer.jsp"/>
		 </footer>
	</div>
</body>
</html>