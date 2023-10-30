<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BoardList</title>
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
   from {color: white;
}

30
%
{
color
:
yellow;
}
to {
   color: red;
   font-weight: bold;
}
}
</style>
</head>
<body>
   <div id="list">
      <b>게시판(전체글:${count })</b>
   </div>

   <div id="write">
      <a href="BoardWriterForm.jsp" style="text-decoration: none">글쓰기</a>
   </div>

   <div>
      <table class="table table-striped table-bordered table-hover">
         <thead>
            <tr height="40">
               <th width="150">번호</th>
               <th width="500">제목</th>
               <th width="150">작성자</th>
               <th width="150">작성일</th>
               <th width="150">조회</th>
            </tr>
         </thead>
         <tbody>
            <c:set var="number" value="${number }" />
            <c:forEach var="bean" items="${v }">
               <tr height="40">
                  <td width="50" align="left">${number }</td>

                  <td width="300" align="left">
                     <c:if test="${bean.re_step >1 }">
                        <c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">
                                  &nbsp;
                           </c:forEach>
                     </c:if> 
                     <a href="BoardInfoControl.do?num=${bean.num }" style='text-decoration: none'> ${bean.subject} </a>
                  </td>
                  <td width="100" align="center">${bean.writer }</td>
                  <td width="150" align="center">${bean.red_date }</td>
                  <td width="180" align="center">${bean.READCOUNT }</td>
               </tr>
               <c:set var="number" value="${number-1 }" />
            </c:forEach>
         </tbody>
      </table>
      <p />
      <!-- 페이징 처리 구현 -->
      <center>
         <c:if test="${count>0 }">
            <!--  전체글 10개 10/10=1 =>1페이지
        전체글 34개 34/10=3+1 => 4페이지 -->
            <c:set var="pageCount"
               value="${count/pageSize+(count%pageSize==0 ? 0 : 1) }" />
            <!-- 시작 페이지 숫자를 지정  -->
            <c:set var="startPage" value="${1 }" />

            <!-- 1~9페이지까지 또는 11 12 13 -->
            <c:if test="${currentPage%10 != 0 }">
               <!-- 연산 결과를 바로 result 변수에 저장 -->
                 <!-- currentPage div 10 : div 연산자는 EL안에서는 정수 나눗셈을 수행하는 연산자 -->
               <c:set var="result" value="${currentPage div 10 }" />
               <c:set var="startPage" value="${result * 10 + 1}" />
            </c:if>

            <!-- 10 20 30 -->
            <%--    <c:if test="${currentPage%10 == 0 }">
      <fmt:parseNumber var="result" value="${currentPage/10 }" integerOnly="true"/>
      <c:set var="startPage" value="${ (result -1)*10+1}"/>
     </c:if>   
      --%>

            <!-- 화면에 보여질 페이지 처리 숫자 -->
            <c:set var="pageBlock" value="${10 }" />
            <!--  첫번째 페이지 기준 : 1+10-1=10 -->
            <c:set var="endPage" value="${startPage+pageBlock-1 }" />

            <c:if test="${endPage>pageCount}">
               <c:set var="endPage" value="${pageCount}" />
            </c:if>

            <!-- 이전페이지 -->
            <c:if test="${startPage>10 }">
               <a href="BoardListCon.do?pageNum=${startPage-10 }"
                  style="text-decoration: none">[이전]</a>
            </c:if>

            <!-- 페이징 처리 -->
            <c:forEach var="i" begin="${startPage }" end="${endPage }">
               <a href="BoardListCon.do?pageNum=${i}"
                  style="text-decoration: none">[${i}]</a>
            </c:forEach>

            <!-- 다음페이지 -->
            <c:if test="${endPage<pageCount }">
               <a href="BoardListCon.do?pageNum=${startPage+10 }"
                  style="text-decoration: none">[다음]</a>
            </c:if>
         </c:if>
      </center>

   </div>

</body>
</html>




















