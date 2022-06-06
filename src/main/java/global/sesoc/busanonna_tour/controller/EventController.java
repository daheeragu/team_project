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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.busanonna_tour.dao.EventDAO;
import global.sesoc.busanonna_tour.util.FileService;
import global.sesoc.busanonna_tour.util.PageNavigator;
import global.sesoc.busanonna_tour.vo.Event;
import global.sesoc.busanonna_tour.vo.Event_pic;

@Controller
@RequestMapping("event") 
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	final int countPerPage = 8; //페이지당 글 수 
	final int pagePerGroup = 5;  //페이지 이동 링크를 표시할 페이지 수 
	final String uploadPath = "/eventfile"; // 파일 업로드 경로 
	
	@Autowired
	EventDAO dao; 

	// 이벤트 목록 이동
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, @RequestParam(value="page", defaultValue="1") int page
			, HttpSession session) {
        
		 
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		//전체 이벤트 갯수
		int total = dao.getTotal(searchText);
		//페이지 계산을 위한 객체 생성 
	    PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
	    //검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Event> eventList = dao.listEvent(searchText, navi.getStartRecord(), navi.getCountPerPage());
	   
		//카드 이미지 하나 불러오기
		ArrayList<Event_pic> picList = dao.selectFile();
	
		System.out.println(picList);
	
		
		
		model.addAttribute("eventList", eventList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		model.addAttribute("picList", picList);
	
		

		return "eventjsp/listAll";
	}

	// 이벤트 등록 폼으로 이동
	@RequestMapping(value = "write", method = RequestMethod.GET)
		public String write(Model model, HttpSession session) {
			
		//세션으로 관리자 아이디 받기
		//String admin_id = "hong";
		
		String loginAdmin = (String) session.getAttribute("loginAdmin"); 
		Event event = new Event();
		event.setAdmin_id(loginAdmin);
		
		
		model.addAttribute("admin_id", loginAdmin);
		   
			return "eventjsp/writeForm";
		}

	// 이벤트 등록 처리
	@RequestMapping(value = "write", method = RequestMethod.POST)
		 public String write(Event event, HttpSession session, ArrayList<MultipartFile> upload) {
		
		//시퀀스 다음 번호를 읽어오는 기능 
		int num = dao.getNextNum();
		//String admin_id = "hong";
		String loginAdmin = (String) session.getAttribute("loginAdmin"); 
		
	    event.setEvent_num(num);
	    event.setAdmin_id(loginAdmin);
	    
	    dao.writeEvent(event);
	    
	    for(MultipartFile file: upload) {
	    	Event_pic pic = new Event_pic();
	    	pic.setEvent_num(num);
	     
	    	//멀티파트 파일의 오리지널 파일 이름을 이벤트 픽 객체에 대입
	    	pic.setSavedfile(file.getOriginalFilename());
	    	String savedfile = FileService.saveFile(file, uploadPath);
	    	pic.setSavedfile(savedfile);
	    	
	    	dao.insertFile(pic);
	    	
	    }
		
		return "redirect:list";
	}
	
	//업로드 파일 이미지 다운로드 
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDownload(int eventpic_num, Model model, HttpServletResponse response) {
		
		Event_pic pic = dao.readFile(eventpic_num);
		
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
	
	//이벤트 읽기
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(int event_num, Model model, HttpSession session) {
		
       //이벤트 글 번호 전달하면 읽어오기 
		Event event = dao.readEvent(event_num);
		
		//관리자 아이디로 설정
		//String admin_id = "hong";
		String loginAdmin = (String) session.getAttribute("loginAdmin");
		event.setAdmin_id(loginAdmin);
		
		//결과 없으면 글 목록으로 이동
				if(event == null) {
					 return "redirect:list";
				}

	
	  //결과 있으면 모델에 저장
		model.addAttribute("event", event);
	
		
		return "eventjsp/readForm";
	}
	
	//이벤트 수정 폼
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(int event_num, Model model, HttpSession session) {
		
		Event event = dao.readEvent(event_num);
		if(event == null) {
			return "redirect:list";
		}
		ArrayList<Event_pic> picList = dao.fileList(event_num);
		
		//관리자 아이디 임시로 세팅
		//String admin_id = "hong";
		String loginAdmin = (String) session.getAttribute("loginAdmin");
		event.setAdmin_id(loginAdmin);
		
		model.addAttribute("event", event);
		model.addAttribute("picList", picList);
		
		return "eventjsp/editForm";
	}
	//이벤트 수정 처리
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	 public String edit(Event event, ArrayList<MultipartFile> upload, HttpSession session) {
		
	   //관리자 아이디 받아오기 
	   //String admin_id = "hong";
		String loginAdmin = (String) session.getAttribute("loginAdmin");
		event.setAdmin_id(loginAdmin);
		
	   //이벤트 내용 수정
		dao.updateEvent(event);
		
		// 이미지 파일은 새로 추가
		for (MultipartFile file : upload) {
			Event_pic pic = new Event_pic();
			pic.setEvent_num(event.getEvent_num());

			// 멀티파트 파일의 오리지널 파일 이름을 이벤트 픽 객체에 대입
			pic.setSavedfile(file.getOriginalFilename());
			String savedfile = FileService.saveFile(file, uploadPath);
			pic.setSavedfile(savedfile);

			dao.insertFile(pic);

		    }
	
		
		return "redirect:read?event_num=" + event.getEvent_num();
	}
	 //수정 폼에 개별적으로 파일 삭제
	@ResponseBody
	@RequestMapping (value="deleteFile", method=RequestMethod.POST)
	public int deleteFile(int eventpic_num) {
     
		logger.info("전달된 번호 : {}", eventpic_num);
		
		int result = dao.deleteFile(eventpic_num);
        
		
		return result;
		 
	}
	
	//이벤트 삭제 
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int event_num, HttpSession session) {
		
		//아이디 임시 세팅
		//String admin_id = "hong";
		String loginAdmin = (String) session.getAttribute("loginAdmin");
		
		//삭제할 이벤트 번호와 관리자 아이디 확인
		Event event = new Event();
		event.setAdmin_id(loginAdmin);
		event.setEvent_num(event_num);
		
		dao.deleteEvent(event);
		
		return "redirect:list";
	}
	
	
}
