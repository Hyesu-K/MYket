package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class nickchkAction implements Action  {
	@Override 
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		MemberDao dao = new MemberDao();
		int nickname2 = dao.nickchk(nickname);
		if (nickname2 > 0) {
			request.setAttribute("chk", "x");
		} else {
		request.setAttribute("chk", "o");
		}
		request.setAttribute("nickname", nickname);
		return new ActionForward();
	}
}
