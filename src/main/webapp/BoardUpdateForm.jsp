<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardUpdateForm</title>
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
<body>
<center>
      <h2> 게시글 수정 하기 </h2>
      <form action="BoardUpdateProcCon.do" method="post">
      <table border="1" width="600" bgcolor="ivory">      
      <tr height="40">
            <td width="150" align="center"> 작성자 </td>
            <td width="150"align="center"> ${bean.writer } </td>
            <td width="150" align="center"> 작성일 </td>
            <td width="300"align="center"> ${bean.reg_date } </td>
      </tr>
      <tr height="40">
            <td width="150" align="center"> 제목 </td>
            <td width="450" colspan="3">&nbsp;<input type="text" name="subject" value="${bean.subject }" size="60" style="border: none; background: transparent"></td>
      </tr>
      
      <tr height="40">
            <td width="150" align="center"> 패스워드 </td>
            <td width="450" colspan="3">&nbsp;<input type="password" name="password" size="60" style="border: none; background: transparent"></td>
      </tr>   
      <tr height="40">
            <td width="150" align="center"> 글 내용 </td>
            <td width="450" colspan="3"> <textarea rows="10" cols="60" name="content" align="left">${bean.content }</textarea></td>
      </tr> 
      <tr height="40">
         <td colspan="4" align="center">
           <input type="hidden" name="num" value="${bean.num }">
            <input type="hidden" name="pass" value="${bean.password }">
           <input type="submit" value="수정하기">&nbsp;&nbsp;
           <input type="reset" value="취소">&nbsp;&nbsp;
           <input type="button" onclick="location.href='BoardListCon.do'" value="전체글보기"></td>
      </tr>
      </table>
      </form>
   </center>
      
</html>