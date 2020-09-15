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
			if(play.get(i).getCategory().equals("뮤지컬")) {
				result += "color:" + "\'" + "#F2CE80"+ "\'"+"\r";
			}
			if(play.get(i).getCategory().equals("연극")) {
				result += "color:" + "\'" + "#A2BEE0"+ "\'"+"\r";
			}
			if(play.get(i).getCategory().equals("기타")) {
				result += "color:" + "\'" + "#A5D07A"+ "\'"+"\r";
			}
			result += "},"+"\r";
	 	}
	 	//마지막 콤마(,) 를 빼기
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
	
	//일정등록 폼
	public ActionForward addForm(HttpServletRequest request, HttpServletResponse response)  {
		return new ActionForward();
	}
	
	//일정등록
		public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
			String path = request.getServletContext().getRealPath("/") + "calendar/file/";
			String msg = "일정 등록 실패";
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
					msg = "일정 등록 성공";
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
	
		//일정 수정
		public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws ParseException {
			String path = request.getServletContext().getRealPath("/") + "calendar/file/";
			PlayDao dao = new PlayDao();
			Play p = new Play();
			String msg = "일정 수정 실패";
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
				msg = "일정 수정 성공";
				url = "infoForm.do?no="+p.getNo();
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return new ActionForward(false, "../alert.jsp");
		}
		//일정삭제 폼
		public ActionForward deleteForm(HttpServletRequest request, HttpServletResponse response)  {
			return new ActionForward();
		}
		//일정삭제
		public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
			int no = Integer.parseInt(request.getParameter("no"));
			PlayDao dao = new PlayDao();
			Play play = dao.selectOne(no);
			String msg = "";
			String url = "";
			if(play == null){
				msg = "존재하지 않는 일정입니다.";
				url = "gotoMain.do";
			} else {
					if(dao.delete(no)){ 
						msg = "게시물 삭제 완료";
						url = "gotoMain.do?id="+play.getId();
					} else {
						msg = "게시물 삭제 실패";
						url = "infoForm.do?no="+no;
					}
				}	
				
			request.setAttribute("msg",msg);
			request.setAttribute("url",url);
			return new ActionForward(false, "../alert.jsp");
		}
		
	//상세보기 //review 작성페이지로 이동
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
	 	int no = Integer.parseInt(request.getParameter("no"));
	 	PlayDao dao = new PlayDao();
	 	Play play = dao.selectOne(no);
	 	request.setAttribute("play",play);
		return new ActionForward();
	}
	
	//review 작성페이지로 이동하기 위한 셋팅
	public ActionForward rwriteset(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
	 	PlayDao dao = new PlayDao();
	 	Play play = dao.selectOne(no);
	 	request.setAttribute("play",play);
		return new ActionForward();
	}
	
	//후기 작성페이지 (update)
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
			msg = "후기 등록 성공";
			url = "rinfo.do?no="+p.getNo();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	
	//후기 목록
	public ActionForward rlist(HttpServletRequest request, HttpServletResponse response) {
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch (NumberFormatException e) {
		}

		// 검색 부분
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
	
	
	//오늘의 일정
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
	//월별 관극 횟수
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
	
	//월별 사용 금액
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
	
	//요일별 관극 횟수
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
