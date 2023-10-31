package boardModel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		String pass = request.getParameter("pass");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		
		if (pass.equals(password)) {

			BoardDAO bdao = new BoardDAO();

			bdao.updateBoard(num, subject, content);

			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		} else {
			// 비밀번호가 틀렸다면 이전 페이지로 이동하고 실행
			request.setAttribute("msg", "0");
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);

		}

	}

}
