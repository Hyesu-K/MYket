package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class CheckAction extends UserLoginAction{
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "비밀번호를 확인하세요";
		String url = "checkForm.me";
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		Member mem = new MemberDao().selectOne(id);
		
		if(mem != null){
			if(pass.equals(mem.getPass())){
				request.getSession().setAttribute("login", id);
				msg = "본인 인증 성공 !";
				url = "info.me?id="+id;
			} else{
				msg = "비밀번호가 틀립니다."; 
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
