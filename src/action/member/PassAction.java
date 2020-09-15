package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PassAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		MemberDao dao = new MemberDao();
		String pass = dao.findpw(id,email,birth); 
		if (pass == null) {
			request.setAttribute("msg", "정보에 맞는 비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url", "passForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		request.setAttribute("pass", pass.substring(2,pass.length()));
		return new ActionForward();
	}
}