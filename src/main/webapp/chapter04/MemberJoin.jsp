<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberJoin</title>
<style>
        /* 테이블에 대한 스타일 */
table {
    border-collapse: collapse;  /* 테두리선을 한 줄로 합치기 */
}

/* 테이블의 각 셀에 대한 스타일 */
table td, table th {
    border: 1px solid black;  /* 검은색 1px 두께의 테두리 적용 */
}
 </style>
</head>
<body>
   <center>
      <h2>회원가입</h2>
      <form action="MemberJoinProc.jsp" method="post">
         <table width="500" border="1">
            <tr height="40">
               <td width="200" align="center">아이디</td>
               <td width="400" align="center">
               <input type="text" name="id" size="40" palceholder="id를 입력하세요" style="border: none; outline: none;" />
               </td>
            </tr>
            <tr height="40">
               <td width="200" align="center">패스워드</td>
               <td width="400" align="center">
               <input type="password" name="pass" size="40" palceholder="password를 입력하세요" style="border: none; outline: none;"/>
               </td>
            </tr>
            <tr height="40">
               <td width="200" align="center">이메일</td>
               <td width="400" align="center">
               <input type="email" name="email" size="40" style="border: none; outline: none;" />
               </td>
            </tr>
            <tr height="40">
               <td width="200" align="center">전화번호</td>
               <td width="400" align="center">
               <input type="phone" name="tel" size="40" style="border: none; outline: none;"/>
               </td>
            </tr>
            <tr height="40">
               <td width="200" align="center">주소</td>
               <td width="400" align="center">
               <input type="text" name="address" size="40" style="border: none; outline: none;"/>
               </td>
            </tr>
            <tr height="50">
               <td align="center" colspan="2"> 
               <input type="submit" value="회원가입" >
               </td>
            </tr>
         </table>
      </form>
   </center>
</body>
</html>