<%@ include file="/WEB-INF/view/jstl.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="widtr=device-widtr, initial-scale=1" />
        </head>

        <body>

            <h1>게시판 게시글 페이지</h1>

            <table style="width: 600px;" border="1">
                <tr>
                    <td>게시글ID</td>
                    <td><c:out value="${board.boardId}" /></td>
                </tr>
                <tr>
                    <td>작성일</td>
                    <td><c:out value="${board.boardRegDt}" /></td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><c:out value="${board.boardUser}" /></td>
                </tr>
                <tr>
                    <td>추천수</td>
                    <td><c:out value="${board.boardLikes}" /></td>
                </tr>
                <tr>
                    <td>조회수</td>
                    <td><c:out value="${board.boardView}" /></td>
               <tr>
                    <td >제목</td>
                    <td ><c:out value="${board.boardNm}" /></td>
                    </tr>
    
                <tr>
                    <td >내용</td>
                    <td ><c:out value="${board.boardContent}" /></td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td></td>
                </tr>



            </table>

            <hr>


            <form action="write.jsp" method="post">
                <div class="form-group">
                  <table>
                    <tr><td>
                  <label for="title">제목</label></td>
                
                  <td><input type="text" class="form-control" id="title"
                   placeholder="제목 입력(4-100)" name="title"
                   maxlength="100" required="required"
                   pattern=".{4,100}"></td>
                  </tr>
                </div>
                <tr><td>
                <div class="form-group">
               <label for="content">내용</label></td>
            <td>
               <textarea class="form-control" rows="5" id="content"
                name="content" placeholder="내용 작성"></textarea>
             </div></td></tr>
            </table>
             <input type="file" name="SelectFile" />
            <button type="submit" class="btn btn-default">등록</button>
            <a href="javascript:history.back()">돌아가기</button></a>
              </form>






            <script>
            </script>
        </body>

        </html>