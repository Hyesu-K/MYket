package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

public class JoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass1"));
		mem.setNickname(request.getParameter("nickname"));
		mem.setBirth(request.getParameter("birth"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
		
		String msg = "회원가입실패";
		String url = "joinForm.me";
		MemberDao dao = new MemberDao(); 
		int result = dao.insert(mem);
		if(result>0){
			msg = mem.getNickname()+"님 회원 가입 완료";
			url = "loginForm.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
