package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "아이디를 확인하세요";
		String url = "loginForm.me";
		//1. 파라미터값 저장
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		//2. DB정보 읽기
		Member mem = new MemberDao().selectOne(id);
		//3. 아이디, 비밀번호 검증
		if(mem != null){
			if(pass.equals(mem.getPass())){
				request.getSession().setAttribute("login", id);
				msg = mem.getNickname()+"님이 로그인했습니다.";
				url = "main.me?id="+mem.getId();
			} else{
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
