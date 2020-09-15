package action.reply;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Reply;
import model.ReplyDao;

public class ReplyAllAction {

	// ´ñ±Û ¸ñ·Ï
	public ActionForward replyList(HttpServletRequest request, HttpServletResponse response) {

		ReplyDao dao = new ReplyDao();
		int bno = Integer.parseInt(request.getParameter("bno"));
		int replyCount = dao.replyCount(bno);

		List<Map<String, Integer>> list = dao.replylist(bno);
		request.setAttribute("list", list);
		request.setAttribute("replyCount", replyCount);

		return new ActionForward();
	}
	
	
	// ´ñ±Û ÀÛ¼º
	public ActionForward replyInsert(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		ReplyDao dao = new ReplyDao();
		int bno = Integer.parseInt(request.getParameter("bno"));
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String author = dao.selectNickname(id);
		
		Reply reply = new Reply();
		reply.setId(id);
		reply.setBno(bno);
		reply.setContent(content);
		reply.setAuthor(author);
		
		dao.replyInsert(reply);
		
		return null;
	}
	
	//´ñ±Û »èÁ¦
	public ActionForward replyDelete(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		ReplyDao dao = new ReplyDao();
		int rno = Integer.parseInt(request.getParameter("rno"));
		dao.replyDelete(rno);
		
		return null;
	}
	
}
