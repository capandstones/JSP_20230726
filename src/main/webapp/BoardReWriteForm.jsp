<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardReWriteForm</title>
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
		<h2>답글 쓰기</h2>
		<form action="BoardReWriteProcCon.do" method="get">
			<table class="table table-striped table-bordered table-hover">
				<tbody>
					<tr height="40">
						<th width="200" align="center" style="text-align: center; vertical-align : middle;">작성자</th>
						<td><input type="text" name="writer" size="30"
							style="background: transparent outline: none;"></td>
					</tr>
					<tr>
						<th width="200" align="center" style="text-align: center; vertical-align : middle;">제목</th>
						<td width="400"><input type="text" name="subject" size="60"
							value="[답변]" style="background: transparent outline: none;">
						</td>
					</tr>
					<tr>
						<th width="200" align="center" style="text-align: center; vertical-align : middle;">이메일</th>
						<td width="400"><input type="text" name="email" size="60"
							style="background: transparent outline: none;"></td>
					</tr>
					<tr>
						<th width="200" align="center" style="text-align: center; vertical-align : middle;">패스워드</th>
						<td width="400"><input type="password" name="password"
							size="60" style="background: transparent outline: none;">
						</td>
					</tr>
					<tr>
						<th width="200" align="center" style="text-align: center; vertical-align : middle;">글내용</th>
						<td width="400"><textarea rows="10" cols="50" name="content"
								style="background: transparent outline: none;">
							</textarea></td>
					</tr>
					<tr height="40">
						<td align="center" colspan="2">
							<input type="hidden" name="ref" value="${ref }"> 
							<input type="hidden" name="re_step" value="${re_step }"> 
							<input type="hidden" name="re_level" value="${re_level }"> 
							<input type="submit" value="답글 작성"> &nbsp; &nbsp; 
							<input type="reset" value="취소"> 
							<input type="button" value="목록보기" onclick="location.href='BoardList.jsp'" >
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>