package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class idchkAction implements Action  {
	@Override 
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		MemberDao dao = new MemberDao();
		int id2 = dao.idchk(id);
		if (id2 > 0) {
			request.setAttribute("chk", "x");
		} else {
		request.setAttribute("chk", "o");
		}
		return new ActionForward();
	}
}