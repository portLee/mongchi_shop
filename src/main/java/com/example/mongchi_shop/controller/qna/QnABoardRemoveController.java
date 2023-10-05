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
public class QnABoardRemoveController extends HttpServlet {

    private final QnABoardService qnABoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("/qnaBoard/remove GET");

        try {
            qnABoardService.removeQnABoard(Integer.parseInt(req.getParameter("qno")));
        } catch(Exception e) {
            log.error(e.getMessage());
            throw new ServletException("remove error");
        }

        resp.sendRedirect("/qnaBoard/qnaList?pcode=P1111");
    }
}
