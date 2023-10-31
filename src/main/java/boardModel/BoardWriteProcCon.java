package boardModel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqProc(request, response);
	}

	protected void reqProc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// insert
		// BoardDTO(bean)
		BoardDTO bean = new BoardDTO();

		bean.setWriter(request.getParameter("writer"));
		bean.setSubject(request.getParameter("subject"));
		bean.setEmail(request.getParameter("email"));
		bean.setPassword(request.getParameter("password"));
		bean.setContent(request.getParameter("content"));

		// 메서드(insertBoard)
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bean);

		// 출력
		RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
		dis.forward(request, response);
	}

}
