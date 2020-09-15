package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction  implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
	   String birth = request.getParameter("birth");
	   MemberDao dao = new MemberDao();
	   String id = dao.findid(email,birth); 
	   if(id == null) {
		   request.setAttribute("msg", "정보에 맞는 id를 찾을 수 없습니다.");
		   request.setAttribute("url", "idForm.me");
		   return new ActionForward(false,"../alert.jsp");
	   }
	   request.setAttribute("id", id.substring(0,id.length()-2));
	   return new ActionForward();
	}
}
