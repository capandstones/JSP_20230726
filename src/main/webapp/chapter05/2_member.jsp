<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<%request.setCharacterEncoding("UTF-8"); %>
<h1 align="center">회원 가입</h1>
<hr>
<form action="MemberDBJoin.jsp" method="post" accept-charset="utf-8">
   <table border="2" align="center">
      <tr>
         <td>아이디</td>
         <td><input type="text" name="id" size=10 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>패스워드</td>
         <td><input type="password" name="pass1" size=10 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>패스워드확인</td>
         <td><input type="password" name="pass2" size=10 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>이메일</td>
         <td><input type="text" name="email" size=20 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>성별</td>
         <td>
         <input type="radio" name="gender" value="m"> 남
         <input type="radio" name="gender" value="w"> 여 
         </td>
      </tr>
      <tr>
         <td>주소</td>
         <td><input type="text" name="address" size=30 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>전화번호</td>
         <td><input type="text" name="phone" size=20 style="border: none; outline: none;"></td>
      </tr>
      <tr>
         <td>관심분야</td>
         <td>
         <input type="checkbox" name="hobby" value="travel"> 여행
         <input type="checkbox" name="hobby" value="climbing"> 등산
         <input type="checkbox" name="hobby" value="music"> 음악
         <input type="checkbox" name="hobby" value="reading"> 독서
         </td>
      </tr>
      <tr>
         <td>직업</td>
         <td>
            <select name="job">
            <option value="inoccupation">교사</option>
            <option value="employee">회사원</option>
            <option value="professional">전문직</option>
            <option value="student">학생</option>
            </select>
         </td>
      </tr>
      <tr>
         <td>당신의 연령은</td>
         <td>
         <input type="radio" name="age" value="10"> 10대
         <input type="radio" name="age" value="20"> 20대
         <input type="radio" name="age" value="30"> 30대
         <input type="radio" name="age" value="40"> 40대 이상
         </td>
      </tr>
      <tr>
         <td>하고싶은말</td>
         <td>
         <textarea rows="5" cols="40" name="info"></textarea>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="회원가입">
            <input type="reset" value="취소">
         </td>
      </tr>
   </table>
</form>

</body>
</html>