package action.play;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Play;
import model.PlayDao;
public class PlayAllAction {
	
	public ActionForward calmain(HttpServletRequest request, HttpServletResponse response) throws org.json.simple.parser.ParseException  {
	 	String id = request.getParameter("id");
	 	PlayDao dao = new PlayDao(); 
	 	List<Play> play = dao.selectList(id);
	 	String result = "";
	 	request.setAttribute("play",play);
	 	request.setAttribute("id",id);

	 	result += "["+"\r";
	 	for(int i=0; i<play.size();i++) {
			result += "{"+"\r";
			result += "title:" + "\'" + play.get(i).getSubject() + "\',"+"\r";
			result += "start:" + "\'" + play.get(i).getDate()+ "\',"+"\r";
			result += "url:" + "\'" + "infoForm.do?no=" +play.get(i).getNo()+ "\',"+"\r";
			if(play.get(i).getCategory().equals("������")) {
				result += "color:" + "\'" + "#F2CE80"+ "\'"+"\r";
			}
			if(play.get(i).getCategory().equals("����")) {
				result += "color:" + "\'" + "#A2BEE0"+ "\'"+"\r";
			}
			if(play.get(i).getCategory().equals("��Ÿ")) {
				result += "color:" + "\'" + "#A5D07A"+ "\'"+"\r";
			}
			result += "},"+"\r";
	 	}
	 	//������ �޸�(,) �� ����
	 			if(result.length() > 0){
	 				result = result.substring(0,result.length()-2);
	 			}	
	 	result += "\r"+"]";
	 	JsonParser jsonParser = new JsonParser();
	 	JsonArray jsonResult = (JsonArray) jsonParser.parse(result);
	 	System.out.println(jsonResult);
	 	request.setAttribute("jsonResult",jsonResult);
		return new ActionForward();
	}
	
	//������� ��
	public ActionForward addForm(HttpServletRequest request, HttpServletResponse response)  {
		return new ActionForward();
	}
	
	//�������
		public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
			String path = request.getServletContext().getRealPath("/") + "calendar/file/";
			String msg = "���� ��� ����";
			String url = "addForm.do";
			try {
				File f = new File(path);
				if (!f.exists())
					f.mkdirs();
				MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
				Play p = new Play();
				p.setId(multi.getParameter("id"));
				p.setSubject(multi.getParameter("subject"));
				p.setCategory(multi.getParameter("category"));
				p.setPrice(Integer.parseInt(multi.getParameter("price")));
				p.setTime(multi.getParameter("time"));
				p.setCast(multi.getParameter("cast"));
				p.setDate(multi.getParameter("date"));		 
				p.setPlace(multi.getParameter("place"));
				p.setMemo(multi.getParameter("memo"));

				PlayDao dao = new PlayDao();
				int no = dao.maxno();
				p.setNo(++no);
				
				if (dao.insert(p)) {
					msg = "���� ��� ����";
					url = "gotoMain.do";
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
	
		public ActionForward add(HttpServletRequest request, HttpServletResponse response)  {
			return new ActionForward();
		}
		
		public ActionForward gotoMain(HttpServletRequest request, HttpServletResponse response)  {
			return new ActionForward();
		}
	
		//���� ����
		public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws ParseException {
			String path = request.getServletContext().getRealPath("/") + "calendar/file/";
			PlayDao dao = new PlayDao();
			Play p = new Play();
			String msg = "���� ���� ����";
			String url = "updateForm.do?no="+p.getNo();
			try {
				File f = new File(path);
				if (!f.exists())
					f.mkdirs();
				MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
				p.setNo(Integer.parseInt(multi.getParameter("no")));
				p.setId(multi.getParameter("id"));
				p.setDate(multi.getParameter("date"));
				p.setSubject(multi.getParameter("subject"));
				p.setCategory(multi.getParameter("category"));
				p.setPrice(Integer.parseInt(multi.getParameter("price")));
				p.setTime(multi.getParameter("time"));
				p.setCast(multi.getParameter("cast"));
				p.setDate(multi.getParameter("date"));		 
				p.setPlace(multi.getParameter("place"));
				p.setMemo(multi.getParameter("memo"));
				p.setFile1(multi.getFilesystemName("file1"));
			} catch (IOException e) {
				e.printStackTrace();
			}
			if (dao.update(p)) {
				request.setAttribute("p",p);
				msg = "���� ���� ����";
				url = "infoForm.do?no="+p.getNo();
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		//�������� ��
		public ActionForward deleteForm(HttpServletRequest request, HttpServletResponse response)  {
			return new ActionForward();
		}
		//��������
		public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
			int no = Integer.parseInt(request.getParameter("no"));
			PlayDao dao = new PlayDao();
			Play play = dao.selectOne(no);
			String msg = "";
			String url = "";
			if(play == null){
				msg = "�������� �ʴ� �����Դϴ�.";
				url = "gotoMain.do";
			} else {
					if(dao.delete(no)){ 
						msg = "�Խù� ���� �Ϸ�";
						url = "gotoMain.do?id="+play.getId();
					} else {
						msg = "�Խù� ���� ����";
						url = "infoForm.do?no="+no;
					}
				}	
				
			request.setAttribute("msg",msg);
			request.setAttribute("url",url);
			return new ActionForward(false, "../alert.jsp");
		}
		
	//�󼼺��� //review �ۼ��������� �̵�
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
	 	int no = Integer.parseInt(request.getParameter("no"));
	 	PlayDao dao = new PlayDao();
	 	Play play = dao.selectOne(no);
	 	request.setAttribute("play",play);
		return new ActionForward();
	}
	
	//review �ۼ��������� �̵��ϱ� ���� ����
	public ActionForward rwriteset(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
	 	PlayDao dao = new PlayDao();
	 	Play play = dao.selectOne(no);
	 	request.setAttribute("play",play);
		return new ActionForward();
	}
	
	//�ı� �ۼ������� (update)
	public ActionForward rwrite(HttpServletRequest request, HttpServletResponse response) throws ParseException {
		String path = request.getServletContext().getRealPath("/") + "calendar/file/";
		PlayDao dao = new PlayDao();
		Play p = new Play();
		String msg = "";
		String url = "";
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			p.setNo(Integer.parseInt(multi.getParameter("no")));
			p.setSubject(multi.getParameter("subject"));			
			p.setReview(multi.getParameter("review"));
			p.setFile1(multi.getFilesystemName("file1"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (dao.rupdate(p)) {
			request.setAttribute("p",p);
			msg = "�ı� ��� ����";
			url = "rinfo.do?no="+p.getNo();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	//�ı� ���
	public ActionForward rlist(HttpServletRequest request, HttpServletResponse response) {
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch (NumberFormatException e) {
		}

		// �˻� �κ�
		String find = request.getParameter("find");
		String category = request.getParameter("category");
		if (category == null || category.trim().equals("")) {
			category = null;
		}
		if (find == null || find.trim().equals("")) {
			find = null;
		}

		int limit = 10;
		PlayDao dao = new PlayDao();
		
		int playcount = dao.playCount(category,find);

		List<Play> list = dao.list(pageNo, limit, category, find);
		int maxpage = (int) ((double) playcount / limit + 0.95);
		int startpage = ((int) (pageNo / 10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage) endpage = maxpage;
		int playno = playcount - (pageNo - 1) * limit;

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("playcount", playcount);
		request.setAttribute("list", list);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("playno", playno);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	
	
	//������ ����
	public ActionForward today(HttpServletRequest request, HttpServletResponse response) {
	 	Date date = new Date();
	 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	 	var today = format.format(date);
//	 	String id = request.getParameter("id");
	 	PlayDao dao = new PlayDao(); 
//	 	List<Play> todaytodo = dao.selecttodo(id,today);
	 	List<Play> play = dao.selecttodo(today);
	 	request.setAttribute("play",play);
		return new ActionForward();
	}
	
	
	
	/////////////chart/////////////
	//���� ���� Ƚ��
	public ActionForward chart1(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		PlayDao dao = new PlayDao();
		List<Map<String,Integer>> list = dao.chart1(id);
		System.out.println(list);
		
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map<String,Integer> m : list) {
			for(Map.Entry<String, Integer> me : m.entrySet()) {
				if(me.getKey().equals("date"))
					json.append("{\"date\":\""+me.getValue() +"\",");
				if(me.getKey().equals("cnt"))
					json.append("\"cnt\":"+me.getValue() +"}");
			}
			i++;
			if(i<list.size()) json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	//���� ��� �ݾ�
	public ActionForward chart2(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		PlayDao dao = new PlayDao();
		List<Map<String,Integer>> list = dao.chart2(id);
	
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map<String,Integer> m : list) {
			for(Map.Entry<String, Integer> me : m.entrySet()) {
				if(me.getKey().equals("date"))
					json.append("{\"date\":\""+me.getValue() +"\",");
				if(me.getKey().equals("price"))
					json.append("\"price\":"+me.getValue() +"}");
			}
			i++;
			if(i<list.size()) json.append(",");
		}
		json.append("]");
		request.setAttribute("json", json.toString().trim());
		return new ActionForward();
	}
	
	//���Ϻ� ���� Ƚ��
		public ActionForward chart3(HttpServletRequest request, HttpServletResponse response) {
			String id = request.getParameter("id");
			PlayDao dao = new PlayDao();
			List<Map<String,Integer>> list = dao.chart3(id);
			StringBuilder json = new StringBuilder("[");
			int i = 0;
			for(Map<String,Integer> m : list) {
				for(Map.Entry<String, Integer> me : m.entrySet()) {
					if(me.getKey().equals("date"))
						json.append("{\"date\":\""+me.getValue() +"\",");
					if(me.getKey().equals("cnt"))
						json.append("\"cnt\":"+me.getValue() +"}");
				}
				i++;
				if(i<list.size()) json.append(",");
			}
			json.append("]");
			request.setAttribute("json", json.toString().trim());
			return new ActionForward();
		}
}
