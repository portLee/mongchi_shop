package com.example.mongchi_shop.controller.qna;

import com.example.mongchi_shop.dto.QnABoardDTO;
import com.example.mongchi_shop.service.QnABoardService;
import lombok.extern.log4j.Log4j2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Log4j2
@WebServlet("/qnaBoard/qnaList")
public class QnABoardListController extends HttpServlet {

    final int ROW_PER_PAGE = 10; // 페이지에 보일 주문 개수
    private final QnABoardService qnaBoardService=QnABoardService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.info("qnaBoard/qnaList(GET)...");

        int currentPage = 1;
        int limit=ROW_PER_PAGE;
        if(req.getParameter("currentPage") != null){
            currentPage = Integer.parseInt(req.getParameter("currentPage"));
        }

        int pno = Integer.parseInt(req.getParameter("pno"));
        log.info(pno);

        try {
            int totalRecord=qnaBoardService.getAllQnAListCount(pno);
            log.info(totalRecord);
            List<QnABoardDTO> qnABoardDTOList=qnaBoardService.getQnABoardByPno(pno, currentPage, limit);
            for(QnABoardDTO dto:qnABoardDTOList) {
                log.info(dto.isSecreted());
            }

            int totalPage;
            if(totalRecord%limit==0) {
                totalPage=totalRecord/limit;
                Math.floor(totalPage);
            }
            else {
                totalPage=totalRecord/limit;
                Math.floor(totalPage);
                totalPage=totalPage+1;
            }

            req.setAttribute("currentPage", currentPage);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("qnABoardDTOList", qnABoardDTOList);

            log.info("qnABoardDTOList: " + qnABoardDTOList);

            req.setAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
            req.getRequestDispatcher("/WEB-INF/qnaBoard/qnaBoardList.jsp").forward(req, resp);
        } catch (Exception e) {
            log.info(e.getMessage());
            throw new ServletException("LIST READ error");
        }
    }
}
