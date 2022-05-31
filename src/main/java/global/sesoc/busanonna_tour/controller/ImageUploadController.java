package global.sesoc.busanonna_tour.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;

@Controller
public class ImageUploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	
	@RequestMapping(value = "event/imageUpload.do")
	@ResponseBody
	public void eventImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {

	  response.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  String fileName=upload.getOriginalFilename();
	  

	    Date date = new Date();
	    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
	    fileName = imsi.format(date)+"_"+fileName;
	    byte[] bytes = upload.getBytes();
		  
	
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/image/ckImage";
	    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));
	
	    outStr.write(bytes);
	    
	    //String callback=request.getParameter("CKEditorFuncNum");
	    PrintWriter out=response.getWriter();
	    String fileUrl=request.getContextPath()+"/resources/image/ckImage"+fileName;
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
	    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    out.flush();
	    outStr.close();
		}
	
	@RequestMapping(value = "tourinfo/imageUpload.do")
	@ResponseBody
	public void tourinfoImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		
	  response.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  String fileName=upload.getOriginalFilename();
	  

	    Date date = new Date();
	    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
	    fileName = imsi.format(date)+"_"+fileName;
	    byte[] bytes = upload.getBytes();
		  
	
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/image/ckImage";
	    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));
	
	    outStr.write(bytes);
	    
	    //String callback=request.getParameter("CKEditorFuncNum");
	    PrintWriter out=response.getWriter();
	    String fileUrl=request.getContextPath()+"/resources/image/ckImage"+fileName;
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
	    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    out.flush();
	    outStr.close();
		}
	
	@RequestMapping(value = "notice/imageUpload.do")
	@ResponseBody
	public void noticeImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {

	  response.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  String fileName=upload.getOriginalFilename();
	  

	    Date date = new Date();
	    SimpleDateFormat imsi = new SimpleDateFormat("yyMMddHHmmssZ");
	    fileName = imsi.format(date)+"_"+fileName;
	    byte[] bytes = upload.getBytes();
		  
	
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/resources/image/ckImage";
	    OutputStream outStr = new FileOutputStream(new File(uploadPath + fileName));
	
	    outStr.write(bytes);
	    
	    //String callback=request.getParameter("CKEditorFuncNum");
	    PrintWriter out=response.getWriter();
	    String fileUrl=request.getContextPath()+"/resources/image/ckImage"+fileName;
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
	    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    out.flush();
	    outStr.close();
		}
	
	/*
	@ResponseBody
	@RequestMapping(value = "imageUpload.do")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/image/ckImage"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath));
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            String fileUrl = req.getContextPath() + "/resources/image/ckImage/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}

			
		}
		
	}
	}
	
	*/
	
	/*
	//방법1 - https://dlgkstjq623.tistory.com/288
	
	// 이미지 업로드
    // product_edit페이지에서 맵핑되는 메소드
    @RequestMapping("tourinfo/imageUpload.do")
 
    // 이미지를 저장하고, 불러오고, 업로드하기위해 매개변수를 선언
    public void imageUpload(HttpServletRequest request, 
    		HttpServletResponse response, 
    		@RequestParam MultipartFile upload)
    //MultipartFile 타입은 ckedit에서 upload란 이름으로 저장하게 된다
            throws Exception {
 
        // 한글깨짐을 방지하기위해 문자셋 설정
        response.setCharacterEncoding("utf-8");
 
        // 마찬가지로 파라미터로 전달되는 response 객체의 한글 설정
        response.setContentType("text/html; charset=utf-8");
 
        // 업로드한 파일 이름
        String fileName = upload.getOriginalFilename();
 
        // 파일을 바이트 배열로 변환
        byte[] bytes = upload.getBytes();
 
        // 이미지를 업로드할 디렉토리(배포 디렉토리로 설정)
        String uploadPath = "C:\\Java\\workspace\\busanonna_tour\\src\\main\\webapp\\resources\\image\\ckImage";
	
        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
        
        // 서버로 업로드
        // write메소드의 매개값으로 파일의 총 바이트를 매개값으로 준다.
        // 지정된 바이트를 출력 스트립에 쓴다 (출력하기 위해서)
        out.write(bytes);
 
        // 클라이언트에 결과 표시
        String callback = request.getParameter("CKEditorFuncNum");
 
        // 서버=>클라이언트로 텍스트 전송(자바스크립트 실행)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = "/busanonna_tour/src/main/webapp/resources/image/ckImage/" + fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','이미지가 업로드되었습니다.')" + "</script>");
        printWriter.flush();
    }
        */
        
	
	//또다른 방법
        /*
	@Value("${image.upload.path}")
	private String uploadPath;

	@Value("${resource.handler}")
	private String resourceHandler;
	    
	    
	@PostMapping("/admin/post/imageUpload")
	    public void postImage(MultipartFile upload, HttpServletResponse res, HttpServletRequest req){

	        OutputStream out = null;
	        PrintWriter printWriter = null;

	        res.setCharacterEncoding("utf-8");
	        res.setContentType("text/html;charset=utf-8");

	        try{

	            UUID uuid = UUID.randomUUID();
	            String extension = FilenameUtils.getExtension(upload.getOriginalFilename());

	            byte[] bytes = upload.getBytes();

	            // 실제 이미지 저장 경로
	            String imgUploadPath = uploadPath + File.separator + uuid + "." + extension;

	            // 이미지 저장
	            out = new FileOutputStream(imgUploadPath);
	            out.write(bytes);
	            out.flush();

	            // ckEditor 로 전송
	            printWriter = res.getWriter();
	            String callback = req.getParameter("CKEditorFuncNum");
	            String fileUrl = "/admin/post/image/" + uuid + "." + extension;

	            printWriter.println("<script type='text/javascript'>"
	                    + "window.parent.CKEDITOR.tools.callFunction("
	                    + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	                    +"</script>");

	            printWriter.flush();

	        } catch (IOException e) {
	            e.printStackTrace();
	        }finally {
	            try {
	                if(out != null) { out.close(); }
	                if(printWriter != null) { printWriter.close(); }
	            } catch(IOException e) { e.printStackTrace(); }
	        }
	    }
	*/
	
	
	//방법 3
     
	/**
     * @param multiFile
     * @param request
     * @return
     * @throws Exception
     */
        
        /*
    @RequestMapping(value="/info/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = "C:/Java/workspace/busanonna_tour/src/main/webapp/resources/image/ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;
    }
     */
    
    /**
     * cKeditor 서버로 전송된 이미지 뿌려주기
     * @param uid
     * @param fileName
     * @param request
     * @return
     * @throws ServletException
     * @throws IOException
     */
    
   /*
    @RequestMapping(value="/mine/ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException{
        
        //서버에 저장된 이미지 경로
        String path = "C:/Java/workspace/busanonna_tour/src/main/webapp/resources/image/ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
                logger.info(e.getMessage());
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
    */
    
    
}
