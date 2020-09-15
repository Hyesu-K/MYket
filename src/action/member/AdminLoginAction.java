package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class AdminLoginAction implements Action{
	protected String login;
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login = (String)request.getSession().getAttribute("login");
		if(login==null) {
			request.setAttribute("msg", "로그인이 필요합니다");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(!login.equals("admin")) {
			request.setAttribute("msg", "관리자만 가능합니다");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
}
