<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

#container{
 width: 70%;
 margin: 0 auto;
 padding-top: 5%;
 text-align: center;
}

div>#paging{
text-align: center
}
#list{
text-align: center;
}

#write{
text-align: right;
}
.table {
   text-align: center;
   width: 700px;
   margin-left: auto;
   margin-right: auto;
   

}
.table > tbody>tr>th{
text-align: center;
background-color:#FFC8CD;

}
/* 표 인스턴스 */
.table-hover>tbody>tr>td{
background-color: #FFF0F5;
}
.table-hover>tbody>tr>td:hover{
background-color: #FFB2AF;
}


.table>tbody>tr>#title {
text-align: left;
}

input[type="checkbox"],[type="radio"]{
   width:30px;
}


input[type="submit"],[type="reset"],[type="button"] {
   height: 25px;
   width:80px;
}

input[type="text"],[type="email"],[type="password"]{
   height: 100%;
   width:350px;
}

/* 애니메이션 처리 */
.hit{
animation-name:blink;/*  애니메이션 이름 */
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
 <h2> 게시 글보기 </h2>
 <table class="table table-striped table-bordered table-hover" width="600"  >
  <tbody>
  <tr height="40">
  <th width="120" align="center"> 글번호 </th>
  <td width="180" align="left">${bean.num }</td>
  <th width="120" align="center"> 조회수 </th>
  <td width="180" align="left">${bean.readcount }</td>
  </tr>
  
  <tr height="40">
  <th width="120" align="center"> 작성자 </th>
  <td width="180" align="left">${bean.writer }</td>
  <th width="120" align="center"> 작성일 </th>
  <td width="180" align="left">${bean.reg_date }</td>
  </tr>
  
  <tr height="40" >
  <th width="120" align="center" > 이메일 </th>
  <td width="180" align="left" colspan="3">${bean.email }</td>
  </tr>
  
  <tr height="40">
  <th width="120" align="center"> 제목 </th>
  <td width="180" align="left" colspan="3">${bean.subject }</td>
  </tr>
  
  <tr height="40">
  <th width="120" align="center"> 글내용 </th>
  <td width="180" align="left" colspan="3">${bean.content }</td>
  </tr>
  
  <tr height="40">
  <th align="center" colspan="4">
  <input type="button" value="답글달기" onclick="location.href='BoardReWriteCon.do?num=${bean.num}&ref=${bean.ref }&re_step=${bean.re_step }&re_level=${bean.re_level }'">&nbsp;
  <input type="button" value="글수정" onclick="location.href='BoardUpdateCon.do?num=${bean.num}'">&nbsp;
  <input type="button" value="글삭제" onclick="location.href='BoardDeleteCon.do?num=${bean.num}'">&nbsp;
  <input type="button" value="목록보기"  onclick="location.href='BoardListCon.do'">
  </th>
  </tr>
  </tbody>
  </table>
  </center>
</body>
</html>