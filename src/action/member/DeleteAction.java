package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. 로그아웃 상태 : "로그인하세요"메세지 출력. loginForm.me 페이지 이동
	2. 일반 사용자
		- id 파라미터정보와 login 정보가 다른 경우
			"본인만 탈퇴가능 합니다." main.jsp 페이지 이동
	*DeleteAction 처리
	3. 일반 사용자
		- id, pass 정보를 이용하여 비밀번호 검증
		- 비밀번호 불일치 -> "비밀번호가 틀림" deleteForm.me 페이지 이동
	    관리자 
	    - id가 admin인 경우 탈퇴 불가. "탈퇴불가" list.me 페이지 이동
	4. 탈퇴 성공 (member db에서 delete 처리 완료)
		- 일반 사용자 : session 로그아웃 실행. "삭제 성공" 메세지 출력. loginForm.me 페이지 이동
		- 관리자 : "삭제 성공" 메세지 출력. list.me 페이지 이동
	5. 탈퇴 실패 (member db에서 delete 처리 시 오류 발생)
		- 일반 사용자 : "탈퇴 실패" 메세지 출력. info.me 페이지 이동
		- 관리자 : "탈퇴 실패" 메세지 출력. list.me 페이지 이동
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {

		String msg = null;
		String url = null;
		if(id.equals("admin")){ 
			msg = "관리자는 탈퇴할 수 없습니다.";	
			url = "list.me";
		} else { 
			MemberDao dao = new MemberDao();
			
				if(dao.delete(id) > 0){ 
					if(login.equals("admin")){
						msg = id + " 사용자를 강제 탈퇴 성공";
						url = "list.me";
					} else {
						msg =  id + "님의 탈퇴가 완료되었습니다.";
						url = "loginForm.me";
						request.getSession().invalidate(); 
					}
				} else { 
					msg = id + "님의 탈퇴 시 오류 발생";
					if(login.equals("admin")){ 
						url = "list.me";
					} else { 
						url = "info.me?id="+ id;
					}
				}
			}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}