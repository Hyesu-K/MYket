package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;

public class BoardAllAction {

	//회원 정보
	public ActionForward memdetail(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = new MemberDao();
		String id = request.getParameter("id");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}
	
	//게시글 등록
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "board/file/";
		String msg = "게시글 등록 실패";
		String url = "writeForm.do";
		
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board b = new Board();
			b.setId(multi.getParameter("id"));
			b.setCategory1(multi.getParameter("category1"));
			b.setCategory2(multi.getParameter("category2"));
			b.setSubject(multi.getParameter("subject"));
			b.setContent(multi.getParameter("content"));
			b.setAuthor(multi.getParameter("author"));
			b.setDatetime(multi.getParameter("datetime"));
			b.setFile1(multi.getFilesystemName("file1"));

			BoardDao dao = new BoardDao();
			int no = dao.maxno();
			b.setNo(++no);
			
			if (dao.insert(b)) {
				
				msg = "게시글 등록 성공";
				url = "list.do?id="+ b.getId();
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false, "../alert.jsp");
	}

	//목록
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNo = 1; 
		try{
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		} catch(NumberFormatException e){} 
		
		//검색 부분 
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if(column == null || column.trim().equals("")) { 
			column = null;
			find = null;
		}
		if(find == null || find.trim().equals("")) { 
			column = null;
			find = null;
		}
		
		int limit = 10; 
		BoardDao dao = new BoardDao();  
	
		int boardcount = dao.boardCount(column,find);
		
		
		List<Board> list = dao.list(pageNo, limit,column,find);
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNo/10.0 + 0.9)-1) * 10 + 1; 
		int endpage = startpage+9; 
		if(endpage>maxpage) endpage = maxpage; 
		int boardno = boardcount - (pageNo-1) *limit;
		
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list",list);
		request.setAttribute("pageNo",pageNo);
		request.setAttribute("maxpage",maxpage);
		request.setAttribute("startpage",startpage);
		request.setAttribute("endpage",endpage);
		request.setAttribute("boardno",boardno);
		request.setAttribute("today",today);
		return new ActionForward();
	}	

	//상세보기
	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
	 	int no = Integer.parseInt(request.getParameter("no"));
	 	String id = request.getParameter("id");
	 	BoardDao dao = new BoardDao();
	 	Board b = dao.selectOne(no);
	 	if(request.getRequestURI().contains("board/info.do")) {
	 		dao.readcntAdd(no);
	 	}
	 	request.setAttribute("b",b);
	 	request.setAttribute("id",id);
		return new ActionForward();
	}
	//게시글 수정
			public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
			 	String id = request.getParameter("id");
			 	
				Board b = new Board(); 
				BoardDao dao = new BoardDao();
				String path = request.getServletContext().getRealPath("/")+"board/file/";
				MultipartRequest multi;
				try {
					File f = new File(path);
				 	if(!f.exists()) f.mkdirs();
					multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
					b.setCategory2(multi.getParameter("category2"));
					b.setNo(Integer.parseInt(multi.getParameter("no")));
					b.setDatetime(multi.getParameter("datetime"));
				 	b.setSubject(multi.getParameter("subject"));
				 	b.setContent(multi.getParameter("content"));
				 	b.setFile1(multi.getFilesystemName("file1"));
					if(b.getFile1()==null || b.getFile1().equals("")){
						b.setFile1(multi.getParameter("file2"));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}

				String msg = "";
				String url = "";
					if(dao.update(b)){
						request.setAttribute("b",b);
					 	request.setAttribute("id",id);
						msg = "게시물 수정 성공";
						url = "info.do?no="+b.getNo();
					} else{
						msg = "게시물 수정 실패";
						url = "updateForm.do?no="+b.getNo();
					}
				request.setAttribute("msg",msg);
				request.setAttribute("url",url);
				return new ActionForward(false, "../alert.jsp");
			}
			
	//게시글 삭제
		public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
			int no = Integer.parseInt(request.getParameter("no"));
			BoardDao dao = new BoardDao();
			Board board = dao.selectOne(no);
			String msg = "";
			String url = "";
			if(board == null){
				msg = "없는 게시글입니다.";
				url = "list.do";
			} else {
					if(dao.delete(no)){ 
						msg = "게시물 삭제 완료";
						url = "list.do";
					} else {
						msg = "게시물 삭제 실패";
						url = "info.do?no="+no;
					}
				}	
				
			request.setAttribute("msg",msg);
			request.setAttribute("url",url);
			return new ActionForward(false, "../alert.jsp");
		}

		//CKEditor
		public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String path = request.getServletContext().getRealPath("/") + "model2/board/imgfile/";
			File f = new File(path);
		 	if(!f.exists()) f.mkdirs();
			MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
			String fileName = multi.getFilesystemName("upload");
			request.setAttribute("fileName", fileName);
			request.setAttribute("CKEditorFuncNum",request.getParameter("CKEditorFuncNum"));
			return new ActionForward(false, "ckeditor.jsp");
		}
}