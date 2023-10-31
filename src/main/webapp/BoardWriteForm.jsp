<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardWriteForm</title>
<!-- BootStrap -->
<link rel="stylesheet"
	href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<style>
div>#paging {
	text-align: center
}

#list {
	text-align: center;
}

#write {
	width: 70%;
	text-align: right;
	padding: 10px;
}

.table {
	text-align: center;
	width: 900px;
	margin-left: auto;
	margin-right: auto;
	background-color: #e6ecff;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.table>thead>tr>th {
	text-align: center;
}
/* 표 인스턴스 */
.table-hover>tbody>tr:hover {
	background-color: #B4C3FF;
}

.table>tbody>tr>td {
	text-align: center;
}

.table>tbody>tr>#title {
	text-align: left;
}

/* 애니메이션 처리 */
.hit {
	animation-name: blink; /*  애니메이션 이름 */
	animation-duration: 1.5s; /*  애니메이션 동작시간 */
	animation-timing-function: ease; /* 시작과 종료시 부드럽게 처리 */
	animation-iteration-count: infinite; /* 무한반복 */
}

애니메니션 지점 설정
@keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
}
</style>
</head>
<body>
<center>
	<div id="container">
		<b>게시글 입력하기</b>
		<p />
		<form action="BoardWriteProcCon.do" method="get">		
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr height="40">
							<th width="150" align="center" style="text-align: center; vertical-align : middle;" >작성자</th>
							<td width="400" align="left">
							<input type="text" name="writer" size="60" style="background: transparent outline: none;"/>
							</td>
						</tr>
						<tr height="40">
							<th width="150" align="center" style="text-align: center;  vertical-align : middle;">제목</th>
							<td width="400" align="left">
							<input type="text" name="subject" size="60" style="background: transparent outline: none;"/>
							</td>
						</tr>
						<tr height="40">
							<th width="150" align="center" style="text-align: center; vertical-align : middle;">이메일</th>
							<td width="400" align="left">
							<input type="text" name="email" size="60" style="background: transparent outline: none;"/>
							</td>
						</tr>
						<tr height="40">
							<th width="150" align="center" style="text-align: center; vertical-align : middle;">비밀번호</th>
							<td width="400" align="left">
							<input type="password" name="password" size="60" style="background: transparent outline: none;"/>
							</td>
						</tr>
						<tr height="50">
							<th width="150" align="center" style="text-align: center; vertical-align : middle;">글내용</th>
							<td width="400" align="left">
							<textarea name="content" rows="10" cols="50"></textarea>
							</td>
						</tr>
						<tr height="50">
							<td colspan="2" align="center">			
							<input type="submit" value="글쓰기">&nbsp;&nbsp;
							<input type="reset" value="다시작성">&nbsp;&nbsp;
							<button type="button" onclick="location.href='BoardListCon.do'">목록보기</button>
							</td>
						</tr>
					</tbody>
				</table>
		</form>
	</div>
	</center>
</body>
</html>

































