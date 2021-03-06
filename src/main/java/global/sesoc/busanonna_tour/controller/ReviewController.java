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

import global.sesoc.busanonna_tour.dao.BoardDAO;
import global.sesoc.busanonna_tour.dao.ReviewDAO;
import global.sesoc.busanonna_tour.util.FileService;
import global.sesoc.busanonna_tour.util.PageNavigator;
import global.sesoc.busanonna_tour.vo.Board;
import global.sesoc.busanonna_tour.vo.Reply;
import global.sesoc.busanonna_tour.vo.review.Review;
import global.sesoc.busanonna_tour.vo.tourinfo.Tourinfo;


@Controller
@RequestMapping("review") 
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	//게시판 관련 상수값들
	 final int countPerPage = 10; //페이지당 글 수 
	 final int pagePerGroup = 5;  //페이지 이동 링크를 표시할 페이지 수 
//	 final String uploadPath = "/boardfile"; // 파일 업로드 경로 
	 
	@Autowired
	ReviewDAO dao;
	
	//리뷰 리스트 이동
	@RequestMapping(value = "List", method = RequestMethod.GET)
	public String reviewlist(Model model, HttpSession session
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, @RequestParam(value="page", defaultValue="1") int page){
		
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		//전체 글 개수 
		int total = dao.getTotal(searchText);
		//페이지 계산을 위한 객체 생성 
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<Review> reviewList = dao.reviewList(searchText, navi.getStartRecord(), navi.getCountPerPage());	
		
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		model.addAttribute("total", total);

		return "reviewjsp/reviewList";
	}
	
	//글쓰기 폼으로 이동
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeReview() {
		
		return "reviewjsp/writeReview";
	}
	//글쓰기 기능 처리 
	@RequestMapping(value = "write", method = RequestMethod.POST)
	 public String write(Review review, HttpSession session) {
	    
	    
		//세션에서 아이디 받아오기 
		String loginId = (String) session.getAttribute("loginId");
		review.setUser_id(loginId);
		
			
       
	
		logger.info("저장할 글정보 : {}", review);
		dao.writeReview(review);
		
		return "redirect:List";
		
	}
	
	//글 읽기로 이동
	@RequestMapping(value = "readReview", method = RequestMethod.GET)
	public String readReview(int review_num, Model model, HttpSession session) {
		
		 //글 번호 전달하면 dao에서 조회수 수정하고 해당글 읽어옴
	      Review review = dao.readReview(review_num);
	     //결과가 없으면 글 목록으로 이동 
	      if(review == null) {
	    	  return "redirect:List";
	      }
	      //결과가 있으면 모델에 글 정보 저장하고 JSP로 포워딩
	      model.addAttribute("review", review);
	      
	      //이 글에 달린 댓글 목록도 가져감 
	      ArrayList<Reply> replyList = dao.replyList(review_num);
	      model.addAttribute("replyList", replyList);
	      
	      String loginId = (String) session.getAttribute("loginId");
	      model.addAttribute("loginId", loginId);
	      
		return "reviewjsp/readReview";
		}
	
//	/**
//	 * 파일 다운로드
//	 * @param boardnum 파일이 첨부된 글 번호
//	 */
//	@RequestMapping(value = "download", method = RequestMethod.GET)
//	public String fileDownload(int boardnum, Model model, HttpServletResponse response) {
//		Board board = dao.readBoard(boardnum);
//		
//		//원래의 파일명
//		String originalfile = new String(board.getOriginalfile());
//		try {
//			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		
//		//저장된 파일 경로
//		String fullPath = uploadPath + "/" + board.getSavedfile();
//		
//		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
//		FileInputStream filein = null;
//		ServletOutputStream fileout = null;
//		
//		try {
//			filein = new FileInputStream(fullPath);
//			fileout = response.getOutputStream();
//			
//			//Spring의 파일 관련 유틸 이용하여 출력
//			FileCopyUtils.copy(filein, fileout);
//			
//			filein.close();
//			fileout.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		return null;
//	}
//	
//	
	//본인 글 수정 폼으로 이동
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String edit(int review_num, Model model) {
	 //전달받은 리뷰 번호로 리뷰 정보 검색해서 모델에 저장
		Review review =dao.readReview(review_num);
		if(review == null) {
			return "redirect:List";
		}
		model.addAttribute("review", review);
     //리뷰 수정 폼으로 포워딩
		return "reviewjsp/editReview";
	}
	
	//글 수정 처리
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	 public String edit(Review review, HttpSession session) {
		//전달받은 수정내용에 세션의 로그인아이디를 추가해서 DB 업데이트
		String loginId = (String) session.getAttribute("loginId");
		review.setUser_id(loginId);
		
		//DB에 업데이트(update구문의 where 조건은 글번호와 작성자 아이디)
		logger.info("전달된 값: {}", review);
		dao.updateReview(review);
		
		//리뷰 목록 리다이렉트 
		return "redirect:List";
	
	}
	
	//글 삭제 처리
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int review_num, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인 아이디
		Review review = new Review();
		review.setReview_num(review_num);
		review.setUser_id(loginId);
		
		logger.info("전달된 값: {}", review);
	    dao.deleteReview(review);
	    
		
		return "redirect:List";
	}
	
	//댓글 작성
	@RequestMapping(value = "replyWrite", method = RequestMethod.POST)
	 public String replyWrite(Reply reply, HttpSession session) {
      
	 String loginId = (String) session.getAttribute("loginId");
	 reply.setUser_id(loginId);
	 
	 //dao 전달하여 DB에 리플정보 저장 
	  logger.info("전달된 값: {}", reply);
	  dao.insertReply(reply);
	 
	  return "redirect:readReview?review_num=" + reply.getReview_num(); 
  }
  //리플 삭제
	@RequestMapping(value = "deleteReply", method = RequestMethod.GET)
	public String deleteReply(Reply reply, HttpSession session) {
	 
        String id = (String) session.getAttribute("loginId");
		
		//삭제할 글 번호와 본인 글인지 확인할 로그인아이디
		reply.setUser_id(id);
		logger.info("전달된 값: {}", reply);
		int a = dao.deleteReply(reply);
		if(a == 0) {
			logger.info("삭제 실패");
		}
		
		return "redirect:readReview?review_num=" + reply.getReview_num(); 
	}
	
	//관광지 검색 페이지로 이동
		@RequestMapping(value = "spotSearch", method = RequestMethod.GET)
		public String idcheck() {
			return "reviewjsp/spotSearch";
		}
	
	
	//관광지 검색
	@RequestMapping(value = "spotSearch", method = RequestMethod.POST)
	public String idcheck(String spotName, Model model) {
		logger.info("검색할 관광지 : {}", spotName);
		ArrayList<Tourinfo> tourinfo = dao.getTourinfo(spotName);
		
		model.addAttribute("tourinfo", tourinfo);
		model.addAttribute("spotName",spotName);
		
		
		return "reviewjsp/spotSearch";
	}	
	
	
}