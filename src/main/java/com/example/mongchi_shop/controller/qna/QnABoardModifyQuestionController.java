package com.example.mongchi_shop.controller.qna;

import com.example.mongchi_shop.dto.QnABoardDTO;
import com.example.mongchi_shop.service.QnABoardService;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j2
@WebServlet("/qnaBoards/modifyQuestion")
public class QnABoardModifyQuestionController extends HttpServlet {

    private final QnABoardService qnABoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int qno=Integer.parseInt(req.getParameter("qno"));
        log.info("QnABoardModifyQuestionController doGet qno : " + qno);
        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("QnABoardModifyQuestionController doGet pno : " + pno);

        try {
            QnABoardDTO qnABoardDTO = qnABoardService.getQnABoardByQno(pno, qno);
            log.info(qnABoardDTO.isSecreted());
            log.info("qnABoardDTO : " + qnABoardDTO);
            req.setAttribute("qnABoardDTO", qnABoardDTO);
            req.setAttribute("pno", pno);
            req.getRequestDispatcher("/WEB-INF/qnaBoard/modify.jsp").forward(req, resp);
        } catch (Exception e) {
            log.error(e.getMessage());
                throw new ServletException("QnABoardService GET error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        QnABoardDTO qnABoardDTO=new QnABoardDTO();
        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");
        log.info("QnABoardModifyQuestionController POST");

        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info("QnABoardModifyQuestionController POST pno: "+pno);

        try {
            log.info("/qnaBoard/modifyQuestion POST 시작");
            BeanUtils.populate(qnABoardDTO, req.getParameterMap());
            log.info(qnABoardDTO);
            qnABoardService.modifyQuestionBoard(qnABoardDTO);
        } catch(Exception e) {
            log.info(e.getMessage());
            throw new ServletException("QnABoardModifyQuestionController POST error");
        }
        resp.sendRedirect("/qnaBoards?pno="+pno);
    }
}
