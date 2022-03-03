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
  <form action="page/write" method="post">
    <div class="form-group">
      <table>
        <tr><td>
      <label for="title">제목</label></td>
    
      <td><input type="text" id="title"
       placeholder="제목 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,100}"></td>
      </tr>
    </div>
    <tr><td>
    <div class="form-group">
   <label for="content">내용</label></td>
<td>
   <textarea rows="5" id="content"
    name="content" placeholder="내용 작성"  required="required"></textarea>
 </div></td></tr>
</table>
 <input type="file" name="file" value="file" name="SelectFile" />
<button type="submit">등록</button>
<a href="javascript:history.back()">돌아가기</button>
  </form>




    </div>
  <script>
  </script>
</body>
</html>
