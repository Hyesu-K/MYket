package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. �α׾ƿ� ���� : "�α����ϼ���"�޼��� ���. loginForm.me ������ �̵�
	2. �Ϲ� �����
		- id �Ķ���������� login ������ �ٸ� ���
			"���θ� Ż�𰡴� �մϴ�." main.jsp ������ �̵�
	*DeleteAction ó��
	3. �Ϲ� �����
		- id, pass ������ �̿��Ͽ� ��й�ȣ ����
		- ��й�ȣ ����ġ -> "��й�ȣ�� Ʋ��" deleteForm.me ������ �̵�
	    ������ 
	    - id�� admin�� ��� Ż�� �Ұ�. "Ż��Ұ�" list.me ������ �̵�
	4. Ż�� ���� (member db���� delete ó�� �Ϸ�)
		- �Ϲ� ����� : session �α׾ƿ� ����. "���� ����" �޼��� ���. loginForm.me ������ �̵�
		- ������ : "���� ����" �޼��� ���. list.me ������ �̵�
	5. Ż�� ���� (member db���� delete ó�� �� ���� �߻�)
		- �Ϲ� ����� : "Ż�� ����" �޼��� ���. info.me ������ �̵�
		- ������ : "Ż�� ����" �޼��� ���. list.me ������ �̵�
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {

		String msg = null;
		String url = null;
		if(id.equals("admin")){ 
			msg = "�����ڴ� Ż���� �� �����ϴ�.";	
			url = "list.me";
		} else { 
			MemberDao dao = new MemberDao();
			
				if(dao.delete(id) > 0){ 
					if(login.equals("admin")){
						msg = id + " ����ڸ� ���� Ż�� ����";
						url = "list.me";
					} else {
						msg =  id + "���� Ż�� �Ϸ�Ǿ����ϴ�.";
						url = "loginForm.me";
						request.getSession().invalidate(); 
					}
				} else { 
					msg = id + "���� Ż�� �� ���� �߻�";
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