package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class UpdateAction extends UserLoginAction{
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass1"));
		mem.setNickname(request.getParameter("nickname"));
		mem.setBirth(request.getParameter("birth"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		


		String msg = "수정 실패";
		String url = "updateForm.me?id="+mem.getId();

		MemberDao dao = new MemberDao();
		int result = dao.update(mem);
		if(result > 0){
			return new ActionForward(true,"info.me?id="+mem.getId());
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	
}
