package global.sesoc.busanonna_tour.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.busanonna_tour.dao.NoticeDAO;
import global.sesoc.busanonna_tour.util.FileService;
import global.sesoc.busanonna_tour.util.PageNavigator;
import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Notice;
import global.sesoc.busanonna_tour.vo.Notice_pic;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	//공지사항 관련 상수값들
	final int countPerPage = 10; //페이지당 글 수 
	final int pagePerGroup = 5;  //페이지 이동 링크를 표시할 페이지 수 
	final String uploadPath = "/noticefile"; // 파일 업로드 경로 

	@Autowired
	NoticeDAO dao;
	
	//공지사항 목록으로 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model
			, @RequestParam(value="searchText", defaultValue="") String searchText
	        , @RequestParam(value="page", defaultValue="1") int page) { 	
		
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		//전체 글 개수
		int total = dao.getTotal(searchText);
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 갈 수를 전달하여 목록 읽기
		ArrayList<Notice> noticeList = dao.listNotice(searchText, navi.getStartRecord(), navi.getCountPerPage());
		
		//페이지 정보 객체와 공지사항 목록, 검색어를 모델에 저장
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "noticejsp/allList";
	}
	
	//공지사항 읽기 이동
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int notice_num, Model model) {
		
     //글 번호 전달하면 읽어오기
		Notice notice = dao.readNotice(notice_num);
		//결과 없으면 글 목록으로 이동
		if(notice == null) {
			 return "redirect:list";
		}
     //파일로 업로드된 이미지 불러오기 
		ArrayList<Notice_pic> picList = dao.fileList(notice_num);
		
		//결과 있으면 모델에 저장
		model.addAttribute("notice", notice);
		model.addAttribute("picList", picList);
		
		return "noticejsp/readForm";
	}
	
	//공지사항 글쓰기 폼
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		
		 return "noticejsp/writeForm";
	}
	
	//공지사항 쓰기 기능 처리 
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(Notice notice, HttpSession session, ArrayList<MultipartFile> upload) {
		
		//세션에서 관리자 아이디 받아서 노티스 객체에 추가
		
	    //다오에 만든 시퀀스 다음 번호를 읽어오는 기능 호출 
		int num = dao.getNextNum();
	    String admin_id = "hong";
		
	    //위의 num을 noitce.set에 추가
		notice.setNotice_num(num);
		
		//임시로 admin_id 'hong'으로 설정
		notice.setAdmin_id(admin_id);
		
		//notice 객체 DB 저장
		dao.writeNotice(notice);
		
		for(MultipartFile file: upload) {
		//노티스픽 객체 생성한 뒤, 노티스 번호 대입 	
		  Notice_pic pic = new Notice_pic();
		  pic.setNotice_num(num);
		
		//멀티파트파일의 오리지널 파일이름을 노티스 픽 객체에 대입
	      pic.setSavedfile(file.getOriginalFilename()); 
	    //83행에서 만든 노티스픽객체.setSavedfile(savedfile);
		  String savedfile = FileService.saveFile(file, uploadPath);
		  pic.setSavedfile(savedfile);
		  
		 //dao로 보내서 테이블에 저장
		  dao.insertFile(pic);
		  
		}
	    
 
	    return "redirect:list";
	}
	
   //업로드 이미지 다운로드 (notice_num 이미지 파일이 첨부된 글 번호) 
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDownload(int noticepic_num, Model model, HttpServletResponse response) {
		
		Notice_pic pic = dao.readFile(noticepic_num);
		
		//파일명
		   String savedfile = new String(pic.getSavedfile());
		   
			try {
				response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(savedfile, "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			//저장된 파일 경로
			String fullPath = uploadPath + "/" + pic.getSavedfile();
			 	 	
			//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
			FileInputStream filein = null;
			ServletOutputStream fileout = null;
			
			try {
				filein = new FileInputStream(fullPath);
				fileout = response.getOutputStream();
				
				//Spring의 파일 관련 유틸 이용하여 출력
				FileCopyUtils.copy(filein, fileout);
				
				filein.close();
				fileout.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		
			
		}
		
	 //공지사항 수정 폼
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(int notice_num, Model model) {
	 //전달받은 글 번호로 글 정보 검색해서 모델에 저장
		Notice notice = dao.readNotice(notice_num);
		if(notice == null) {
			return "redirect:list";
		}
		
		model.addAttribute("notice", notice);
		
		return "noticejsp/editForm";
		
	}
	//공지사항 수정 처리
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	 public String edit(Notice notice, HttpSession session, ArrayList<MultipartFile> upload) {
		//세션의 관리자 아이디를 추가해서 DB 업데이트(임시로 지정)
		String admin_id = "hong";
		notice.setAdmin_id(admin_id);
		
		logger.info("전달된 값:{}", notice);
		
		
		//Notice_pic을 수정 
		for(MultipartFile file : upload) {
			Notice_pic pic = new Notice_pic();
			pic.setNotice_num(notice.getNotice_num());
			
		    dao.updateFile(pic.getNotice_num());	 
			
		    //멀티파트파일의 오리지널 파일이름을 노티스 픽 객체에 대입
		    pic.setSavedfile(file.getOriginalFilename()); 
		   
			String savedfile = FileService.saveFile(file, uploadPath);
		     pic.setSavedfile(savedfile);
			  	  
		}
		
		  dao.updateNotice(notice);
		
		
		
		return "redirect:read?notice_num=" + notice.getNotice_num();
		
		
	}
	
	//공지사항 글 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int notice_num, HttpSession session) {
		
		//세션에서 아이디 받아오기 
		String admin_id = "hong";
		//삭제할 공지사항 번호와 관리자 아이디 확인
		Notice notice = new Notice(); 
		notice.setAdmin_id(admin_id);
		notice.setNotice_num(notice_num);
		
		logger.info("전달된 값: {}", notice);
		int result = dao.deleteNotice(notice);
		
		return "redirect:list";
	}
	
}
