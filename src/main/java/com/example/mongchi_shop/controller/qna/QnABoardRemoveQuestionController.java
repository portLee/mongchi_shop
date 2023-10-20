package com.example.mongchi_shop.controller.qna;

import com.example.mongchi_shop.service.QnABoardService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@WebServlet("/qnaBoard/remove")
public class QnABoardRemoveQuestionController extends HttpServlet {

    private final QnABoardService qnABoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/qnaBoard/remove GET");
        int qno = Integer.parseInt(req.getParameter("qno"));
        log.info("qno="+qno);
        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("pno="+pno);

        try {
            qnABoardService.removeQnABoard(qno);
        } catch(Exception e) {
            log.error(e.getMessage());
            throw new ServletException("remove error");
        }

        resp.sendRedirect("/qnaBoards?pno="+pno);
    }
}
