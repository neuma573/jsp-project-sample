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
            <button id="modify" onclick="location.href='boardModify?id=${board.boardId}'">수정</button>
            <button id="delete" onclick="location.href='boardDelete?id=${board.boardId}'">삭제</button> 
            <button id="delete" onclick="location.href='boardDelete?id=${board.boardId}'">추천</button> 
            <a href="javascript:history.back()">돌아가기</button></a>
            <hr>


            <table width="800">
                <tr>
                  <th width="100">번호</th>
                  <th width="100">작성자</th>
                  <th width="100">작성일</th>
                  <th width="300">댓글내용</th>
                  <th width="100">추천수</th>
                </tr>
                <c:forEach items="${list}" var="li" varStatus="status">
                    <tr align="center" height="30">
                        <td>${status.count}</td>    
                        <td>${li.commentUser}</td>
                        <td>${li.commentRegDt}</td>
                        <td>${li.commentContent}</td>
                        <td>${li.commentLikes}</td>
                        <td><button id="delete" onclick="location.href='commentDelete?id=${li.commentId}&bid=${board.boardId}'">삭제</button></td>
                        <td>수정</td>
                      <tr>
                    </c:forEach> <!-- Paging 처리 -->
                    <tr>
                      <td colspan="7" align="center" height="40">
                        <!-- <%-- ${pageCode} --%> -->
                      </td>
                    </tr>
                  </table> 

            </table>




            <form action="/page/board/commentPost" method="post">
                <input TYPE="hidden" NAME="commentUpper" SIZE=10 value='<c:out value="${board.boardId}" />'>
                <div class="form-group">
                  <table>
                    <tr aria-placeholder="3">댓글입력
                  </tr>
                </div>
                <tr><td>
                <div class="form-group">
               <label for="content">내용</label></td>
            <td>
               <textarea class="form-control" rows="5" id="commentContent"
                name="commentContent" placeholder="내용 작성" required="required"></textarea>
             </div></td>

            <td>
            <button type="submit">댓글등록</button></td></tr>

        </table>
              </form>






            <script>
            </script>
        </body>

        </html>