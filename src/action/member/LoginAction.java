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
		String msg = "���̵� Ȯ���ϼ���";
		String url = "loginForm.me";
		//1. �Ķ���Ͱ� ����
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		//2. DB���� �б�
		Member mem = new MemberDao().selectOne(id);
		//3. ���̵�, ��й�ȣ ����
		if(mem != null){
			if(pass.equals(mem.getPass())){
				request.getSession().setAttribute("login", id);
				msg = mem.getNickname()+"���� �α����߽��ϴ�.";
				url = "main.me?id="+mem.getId();
			} else{
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
