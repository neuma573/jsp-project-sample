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


            <!-- 게시글 본문영역 -->


            <table style="width: 600px;" border="1">
                <tr>
                    <td>게시글ID</td>
                    <td>
                        <c:out value="${board.boardId}" />
                    </td>
                </tr>
                <tr>
                    <td>작성일</td>
                    <td>
                        <c:out value="${board.boardRegDt}" />
                    </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>
                        <c:out value="${board.boardUser}" />
                    </td>
                </tr>
                <tr>
                    <td>조회수</td>
                    <td>
                        <c:out value="${board.boardView}" />
                    </td>
                <tr>
                    <td>제목</td>
                    <td>
                        <c:out value="${board.boardNm}" />
                    </td>
                </tr>

                <tr>
                    <td>내용</td>
                    <td>
                        <c:out value="${board.boardContent}" />
                    </td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td></td>
                </tr>
               


            </table>
            <button id="modify" onclick="location.href='boardModify?id=${board.boardId}'">수정</button>
            <button id="delete" onclick="location.href='boardDelete?id=${board.boardId}'">삭제</button>

            <a href="/page/board">돌아가기</button></a>
            <hr>
            <!-- 게시글 본문 끝 -->


            <!-- 댓글 리스트 영역 -->
            <c:forEach var="li" items="${list}" varStatus="status">
                <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
                              margin-left: <c:out value=" ${20*li.commentDepth}" />px; display: inline-block">
                    <c:out value="${li.commentUser}" />
                    <c:out value="${li.commentRegDt}" />
                    <a id="delete" href='commentDelete?id=${li.commentId}&bid=${board.boardId}'>삭제</a>
                    <a href="#">수정</a>
                    <a href="#" onclick="fn_replyReply('<c:out value="${li.commentId}" />')">답글</a>
                    <br />
                    <c:out value="${li.commentContent}" />
                    <!-- 대댓글 영역 -->
                    <div id="replyDialog" style="width: 99%; display: none;">
                        <form name="form3" action="board6ReplySave" method="post">
                            <input type="hidden" name="commentUpper" value="<c:out value=" ${board.boardId}" />">
                            <input type="hidden" name="commentId"  value="<c:out value=" ${li.commentId}" />">
                            <input type="hidden" name="commentParent "  value="<c:out value=" ${li.commentParent}" />">
                            <textarea name="rememo" rows="3" cols="60" maxlength="500"></textarea>
                            <a href="#" onclick="fn_replyReplySave()">저장</a>
                            <a href="#" onclick="fn_replyReplyCancel()">취소</a>
                        </form>
                    </div>
                    <!-- 대댓글 영역 끝 -->
                
                
                </div>


                <br />
             </c:forEach>
                

                

                
                

            <!-- 댓글 리스트 끝 -->



            <!-- 댓글 입력 영역 -->
            <div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px;
                     display: inline-block">
                <form action="/page/board/commentPost" method="post">
                    <input TYPE="hidden" NAME="commentUpper" SIZE=10 value='<c:out value="${board.boardId}" />'>
                    <div class="form-group">
                        <table>
                    </div>

                            <textarea class="form-control" rows="5" cols="70" id="commentContent" name="commentContent"
                                placeholder="댓글입력" required="required"></textarea>
            </div>

                <button type="submit">등록</button>



            </form>
            </div>
            <!-- 댓글 입력 영역 끝 -->




            <script>

                function hideDiv(id) {
                    var div = document.getElementById(id);
                    div.style.display = "none";
                    document.body.appendChild(div);
                }

                function fn_replyReply(reno) {
                    var form = document.form3;
                    var reply = document.getElementById("reply" + reno);
                    var replyDia = document.getElementById("replyDialog");
                    replyDia.style.display = "";

                    if (updateReno) {
                        fn_replyUpdateCancel();
                    }

                    form.rememo.value = "";
                    form.reparent.value = reno;
                    reply.appendChild(replyDia);
                    form.rewriter.focus();
                }
                function fn_replyReplyCancel() {
                    hideDiv("replyDialog");
                }

                function fn_replyReplySave() {
                    var form = document.form3;

                    if (form.rewriter.value == "") {
                        alert("작성자를 입력해주세요.");
                        form.rewriter.focus();
                        return;
                    }
                    if (form.rememo.value == "") {
                        alert("글 내용을 입력해주세요.");
                        form.rememo.focus();
                        return;
                    }

                    form.action = "board6ReplySave";
                    form.submit();
                }


            </script>
        </body>

        </html>