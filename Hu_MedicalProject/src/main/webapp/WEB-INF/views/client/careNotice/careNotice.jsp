<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/client/common/header.jsp" />

<style>
nav>a:first-child {
	color: black;
	font-size: 30px;
}

nav>ul:first-child {
	padding-left: 200px;
}

ul>li>a {
	color: black;
}

ul>li {
	padding-right: 30px;
}

.navbar-nav li ul {
	display: none;
	/* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
	list-style: none;
}

.navbar-nav li:hover ul {
	display: block;
	/* 마우스 커서 올리면 서브메뉴 보이게 하기 */
	color: grey;
}

.navbar-nav li ul a {
	text-decoration: none;
}

div#section-container {
	position: relative;
	top: 100px;
}

/* 테이블 스타일 */
div.container {
	position: relative;
	top: 50px;
}

/* 돌보미 등록하기 버튼 */
button#careEnroll-btn {
	position: relative;
	/* left: 1115px; */
	top: 50px;
}

/* 검색 컨테이너 */
div#search-container {
	position: relative;
	top: 100px;
}

/* 검색버튼 */
input#searchBtn {
	height: 40px;
	width: 70px;
	border: solid 1px rgb(147, 147, 194);
	background: white;
	border-radius: 5px;
	font-size: 15px;
	color: rgb(121, 121, 79);
	position: relative;
	bottom: 1px;
	left: 10px;
}

input#searchBtn:hover {
	background: rgb(251, 251, 249);
	outline: none;
}

/* 페이지바 */
div#pageBar a {
	text-decoration: none;
	color: rgb(95, 93, 93);
}

#pageBar {
	margin: 40px 0 40px 0;
	text-align: center;

}

#pageBar>a, #pageBar>span {
	width: 40px;
	height: 40px;
	text-align: center;
	line-height: 40px;
	border: 1px solid #eee;
	color: #999;
	background-color: #fff;
	margin: 0 2px;
	font-size: 13px;
	font-family: "YoonGothicPro760";
	display: inline-block;
	vertical-align: top;
}

footer {
	position: relative;
	top: 200px;
}
</style>



<section>

	<div id="section-container">
   		<div class="container-fluid">
			 <div class="row">					
					
				    <div class="col-sm-5 col-sm-12" style="text-align:center; margin-top: 50px; font-size: 30px;"> 
					돌보미 찾기 게시판</div>
						
					<div class="col-sm-5 col-sm-12" style="text-align:center; margin-top: 50px; font-size: 20px;">
						"혼자서 병원에 가기 힘드시다면 돌보미 찾기 서비스를 이용해보세요"
					</div>
	
			</div>
		</div>
	</div>

		<div class="container-fluid" >
			 <div class="row">
			 	<div class="col-sm-9"></div>
			 		<div  class="col-sm-3" style="float:right; margin-top: 50px;">
						<!-- 돌보미 등록하기 버튼은 요양보호사만 보이기 -->
						<button type="button" class="btn btn-secondary" id="careEnroll-btn"
						onclick="location.replace('${path}/care/careEnroll');">돌보미등록하기</button>
					</div>
			</div>
		</div>
		
		<div class="container-fluid" >
		 <div class="row">
		  <div class="col-sm-1"></div>
		  
			 <div class="col-sm-10" style="margin-top: 100px;">
				
				<table class="table table-hover" style="border-top-color: black;">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
	
					<tbody>
						<c:forEach items="${list }" var="c">
							<tr>
								<td><c:out value="${c.careNo }" /></td>
								<td><a href="${path }/care/careView?no=${c.careNo}"> 
								<c:out value="${c.careTitle }" />
								</a></td>
											
								<td><c:out value="${c.careWriter }" /></td>
	
								<td><fmt:formatDate value="${c.careDate }" type="date" pattern="yyyy/MM/dd"/></td>
	
								<td><c:out value="${c.careReadCount }" /></td>
	
							</tr>
						</c:forEach>
	
					</tbody>
				</table>
				
				</div>
				 <div class="col-sm-1"></div>
			</div>		
		</div>


	<div class="container-fluid" >
		<div class="row">
			 <div class="col-sm-12" style="text-align:center; margin-top: 50px; font-size: 20px;">
				<div style="text-align: center; font-size: 20px;" id="search-container">
				 <form action="${path }/care/search.do" method="post">
		            <select name="searchContent" id="searchContent" style="background-color:white; height:35px;">
		              <option value=""  disabled selected>선택</option>
		              <option value="careTitle"  <c:if test="${param.searchContent eq 'careTitle' }">selected</c:if>>글제목</option>
		              <option value="careWriter"  <c:if test="${param.searchContent eq 'careWriter' }">selected</c:if>>작성자</option>
		            </select>
		            <input type="text" id="keyword" name="keyword" placeholder="검색어를 입력해주세요" size="20" value="${param.keyword }" required autocomplete="off">
		            <input type="submit" id="searchBtn" class="search_btn" value="검색"/>
		           </form>		
				</div>
			</div>
		</div>
	</div>	
		
		
<div class="container-fluid" >
		<div class="row">
		 <div class="col-sm-3"></div>
			 <div class="col-sm-6" id="pageBar" style="margin-top: 150px;">
				${pageBar }
			 </div>
		 <div class="col-sm-3"></div>
	</div>
</div>



</section>

<script>

    new WOW().init();
  </script>

<jsp:include page="/WEB-INF/views/client/common/footer.jsp" />
