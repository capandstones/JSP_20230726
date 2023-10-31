package boardModel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardInfoControl
 */
@WebServlet("/BoardInfoControl.do")
public class BoardInfoControl extends HttpServlet {
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

		// num 번호 받기
		int num = Integer.parseInt(request.getParameter("num"));

		// BoardDAO의 객체를 이용하여 getOneBoard(num)
		BoardDAO bdao = new BoardDAO();
		BoardDTO bean = bdao.getOneBoard(num);

		// 저장
		request.setAttribute("bean", bean);

		// 넘기기
		RequestDispatcher dis = request.getRequestDispatcher("BoardInfo.jsp");
		dis.forward(request, response);
	}

}
