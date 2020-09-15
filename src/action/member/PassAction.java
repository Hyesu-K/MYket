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
			request.setAttribute("msg", "������ �´� ��й�ȣ�� ã�� �� �����ϴ�.");
			request.setAttribute("url", "passForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		request.setAttribute("pass", pass.substring(2,pass.length()));
		return new ActionForward();
	}
}