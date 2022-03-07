<%@ include file="/WEB-INF/view/jstl.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
  
  <h1>게시판 글 작성하기</h1>
 

  <form action="<c:url value='/page/board/boardModifyRegist'/>" method="post">
    <div class="form-group">
      <table>
        <tr>
            <div><label>글번호</label>
                <input name="boardId" readonly="readonly" value="<c:out value="${board.boardId}" />">
           </div>
           <div><label>작성자</label>
                <input name="boardUser" readonly="readonly" value="<c:out value="${board.boardUser}"/>">
           </div>
           <c:out value="${board.boardId}" />
       
            
            <td>
      <label for="title">제목</label></td>
    
      <td><input type="text" id="boardNm"
       placeholder="제목 입력(4-100)" name="boardNm"
       maxlength="100" required="required"
       pattern=".{4,100}" value="${board.boardNm}"></td>
      </tr>
    </div>
    <tr><td>
    <div class="form-group">
   <label for="content">내용</label></td>
<td>
   <textarea rows="5" id="boardContent"
    name="boardContent" placeholder="내용 작성"  required="required">${board.boardContent}</textarea>
 </div></td></tr>
</table>
 <input type="file" name="file" value="file" name="SelectFile" />
<button type="submit">수정완료</button>
<a href="javascript:history.back()">돌아가기</button>
  </form>




    </div>
  <script>
  </script>
</body>
</html>
