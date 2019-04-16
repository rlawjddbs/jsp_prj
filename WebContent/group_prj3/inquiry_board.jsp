<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{ margin:0; }
	#wrap{ overflow:hidden; margin:0 auto; }
	header{ height:80px; overflow:hidden; border-bottom:2px solid #ccc; }
	header > #logo{ padding-left:20px; padding-right:20px; height:80px; line-height:80px; text-align:center; font-size:40px; font-weight:bold; float:left;}
	header > nav { float:left;}
	header > nav > ul { overflow:hidden; margin:0; }
	header > nav > ul > li { float:left; list-style:none; padding-left:20px; padding-right:20px; font-size:22px; line-height:80px; font-weight:bold; }
	article{ width:1200px; margin:0 auto; overflow:hidden; min-height:700px; padding:20px 0;}
	article > #board_title{ font-size:30px; float:left; }
	article > #seeMyWriting{ float:right; margin-top:50px; margin-bottom:0;}
	#inquiryBoard{ border-collapse:collapse; width:100%; margin:20px auto; margin-bottom:30px; border-top:2px solid #ccc; border-bottom:2px solid #ccc;}
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
	
	#formControl{ margin-bottom:20px; }
	footer{ font-size:40px; text-align:center; line-height:80px; font-weight:bold; height:80px; border-top:2px solid #ccc }
</style>	
</head>

<body>
	<div id="wrap">
		<header>
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
		</header>
		<section>
			<article>
				<h1 id="board_title">문의하기</h1>
				<h4 id="seeMyWriting">내가 쓴글 보기</h4>
				<table id="inquiryBoard">
					<tr id="titleRow">
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						<th>작성날짜</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>31</td>
						<td>기능 개선 제안</td>
						<td>test</td>
						<td>2019-03-26</td>
						<td>답변 대기</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
					<tr>
						<td>30</td>
						<td>asdfasdf</td>
						<td>testasdfsadf</td>
						<td>2019-03-25</td>
						<td>답변</td>
					</tr>
				</table>	
				<div id="formControl">	
				<select id="searchOption">
					<option>내용</option>
					<option>제목+내용</option>
					<option>회원아이디</option>
				</select><input type="text" placeholder="검색할 내용 입력" id="searchContent" /><input type="button" value="검색" id="searchBtn" />
				<input type="button" value="문의 남기기" id="writeInquiry" />
				</div>
			</article>
		</section>
		<footer>
			Footer 사이트 정보
		</footer>
	</div>
</body>
</html>