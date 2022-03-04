<%@ include file="/WEB-INF/view/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
  
  <h1>게시판 메인</h1>
  <div class="board_div">
 
    <h2 class="page-header">Notice</h2>
     
    <div class="search_div">
      <form class="form" id="boardSearchVO" name="boardSearchVO">
      <input type="hidden" id="pageIndex" name="pageIndex" value="${boardSearchVO.pageIndex}"/>
      <input type="hidden" id="pageSize" name="pageSize" value="${boardSearchVO.pageSize}"/>
      <input type="hidden" id="bbs_sno" name="bbs_sno" value="${boardSearchVO.bbs_sno}"/>
      <input type="hidden" id="blt_rsrc_sno" name="blt_rsrc_sno" value="0"/>
       
      
      <div class="row">
        <div class="col-xs-2">
            <!-- <label for="usr_id">글쓴이(ID)</label> -->
        <input type="text" class="form-control" id="usr_id" name="usr_id" value="${boardSearchVO.usr_id}" placeholder="input writer..."/>
        </div>
        <div class="col-xs-4">
            <!-- <label for="title">제목</label> -->
        <input type="text" class="form-control" id="title" name="title" value="${boardSearchVO.title}" placeholder="input title..."/> 
        </div>
    <button type="submit" class="btn btn-default" id="searchBtn">Search</button>
      </div>
      </form>
</div>
   
     
    <h4>total : ${count}</h4>
     
    <div class="table-responsive">
      <table border="1"> <!-- table-hover -->
        <thead>
          <tr>
            <th class="col-xs-1">번호</th>
            <th class="col-xs-6">제목</th>
            <th class="col-xs-2">글쓴이(ID)</th>
            <th class="col-xs-1">조회수</th>
            <th class="col-xs-2">등록일</th>
          </tr>
        </thead>
        <tbody>
         <c:choose>
    <c:when test="${not empty articleList}">
      <c:forEach items="${articleList}" var="vo" varStatus="idx">

        <tr class="${idx.count % 2 == 1 ? 'trOdd' : 'trEven'}">
          <td><c:choose>
              <c:when test="${count > pageSize}"> <!-- ex) count= 11, pageSize=10 -->
                <c:out
                  value="${count - pageSize*(pageIndex-1) - idx.count +1}" /> <!-- 11,10,9,8.......... -->
              </c:when>
              <c:otherwise>
                <c:out value="${count  - idx.count +1}" />
              </c:otherwise>

            </c:choose>
          </td>

          <td>
          <a id="${vo.blt_rsrc_sno}" class="boardView" data-toggle="modal" href="#;" data-target="#modal-testNew" role="button" data-backdrop="static">
          ${vo.bbs_title}</a>
          </td>
          <td><c:out value="${vo.usr_id}"/></td>
          <td><c:out value="${vo.bbs_cnt}"/></td>
          <td><c:out value="${vo.reg_date}"/></td>
        </tr>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <tr>
        <td colspan="7">조회된 자료가 없습니다.</td>
      </tr>
    </c:otherwise>
  </c:choose>
        </tbody>
      </table>
      </div>
      <div class="pull-right"><a href="#" class="btn btn-primary btn-success boardAddBtn"><span class="glyphicon glyphicon-pencil"></span> Write</a></div>
      <!-- Paging : S -->
<c:if test="${count > 0}">
  <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
  <c:set var="startPage" value="${pageGroupSize*(nowPageGroup-1)+1}" />
  <c:set var="endPage" value="${startPage + pageGroupSize-1}" />
   
  <c:if test="${endPage > pageCount}">
    <c:set var="endPage" value="${pageCount}" />
  </c:if>

  <div class="jb-center" >
 
          <ul class="pagination">
           
            <c:if test="${nowPageGroup > 1}">
        <li><a href="#;" onclick='paging_script(${(nowPageGroup-2)*pageGroupSize+1 },${pageSize},"boardSearchVO","/board/notice/boardList");' ><span class="glyphicon glyphicon-chevron-left"></span></a></li>
      </c:if>
       
      <c:if test="${nowPageGroup == 1}">
        <!-- <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li> -->
      </c:if>

      <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li <c:if test="${pageIndex == i}"> class="active" </c:if>><a href="#;" onclick='paging_script(${i},${pageSize},"boardSearchVO","/board/notice/boardList");'>${i}</a></li>
      </c:forEach>
             
             <c:if test="${nowPageGroup < pageGroupCount}">
              
        <li><a href="#;" onclick='paging_script(${nowPageGroup*pageGroupSize+1},${pageSize},"boardSearchVO","/board/notice/boardList");'><span class="glyphicon glyphicon-chevron-right"></span></a></li>
      </c:if>
          </ul>
     </div>
     
</c:if>
<!-- Pageing : E -->
    </div>
  <!-- </div> -->

  <a href="/page/board/page">기능 페이지</a>
  <a href="/page/board/api">API 호출</a>

  <script>
  </script>
</body>
</html>
