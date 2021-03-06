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
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','???????????? ????????????????????????.')"+"</script>");
	    out.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    
	    out.flush();
	    outStr.close();
		}
	@RequestMapping(value = "review/imageUpload.do")
	@ResponseBody
	public void reviewImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		
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
		
		//out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','???????????? ????????????????????????.')"+"</script>");
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
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','???????????? ????????????????????????.')"+"</script>");
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
	
	    //out.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','???????????? ????????????????????????.')"+"</script>");
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
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/image/ckImage"); //????????????
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
			            String fileUrl = req.getContextPath() + "/resources/image/ckImage/" +fileName2 +fileName; //url??????
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
	//??????1 - https://dlgkstjq623.tistory.com/288
	
	// ????????? ?????????
    // product_edit??????????????? ???????????? ?????????
    @RequestMapping("tourinfo/imageUpload.do")
 
    // ???????????? ????????????, ????????????, ????????????????????? ??????????????? ??????
    public void imageUpload(HttpServletRequest request, 
    		HttpServletResponse response, 
    		@RequestParam MultipartFile upload)
    //MultipartFile ????????? ckedit?????? upload??? ???????????? ???????????? ??????
            throws Exception {
 
        // ??????????????? ?????????????????? ????????? ??????
        response.setCharacterEncoding("utf-8");
 
        // ??????????????? ??????????????? ???????????? response ????????? ?????? ??????
        response.setContentType("text/html; charset=utf-8");
 
        // ???????????? ?????? ??????
        String fileName = upload.getOriginalFilename();
 
        // ????????? ????????? ????????? ??????
        byte[] bytes = upload.getBytes();
 
        // ???????????? ???????????? ????????????(?????? ??????????????? ??????)
        String uploadPath = "C:\\Java\\workspace\\busanonna_tour\\src\\main\\webapp\\resources\\image\\ckImage";
	
        OutputStream out = new FileOutputStream(new File(uploadPath + fileName));
        
        // ????????? ?????????
        // write???????????? ??????????????? ????????? ??? ???????????? ??????????????? ??????.
        // ????????? ???????????? ?????? ???????????? ?????? (???????????? ?????????)
        out.write(bytes);
 
        // ?????????????????? ?????? ??????
        String callback = request.getParameter("CKEditorFuncNum");
 
        // ??????=>?????????????????? ????????? ??????(?????????????????? ??????)
        PrintWriter printWriter = response.getWriter();
        String fileUrl = "/busanonna_tour/src/main/webapp/resources/image/ckImage/" + fileName;
        printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + fileUrl
                + "','???????????? ????????????????????????.')" + "</script>");
        printWriter.flush();
    }
        */
        
	
	//????????? ??????
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

	            // ?????? ????????? ?????? ??????
	            String imgUploadPath = uploadPath + File.separator + uuid + "." + extension;

	            // ????????? ??????
	            out = new FileOutputStream(imgUploadPath);
	            out.write(bytes);
	            out.flush();

	            // ckEditor ??? ??????
	            printWriter = res.getWriter();
	            String callback = req.getParameter("CKEditorFuncNum");
	            String fileUrl = "/admin/post/image/" + uuid + "." + extension;

	            printWriter.println("<script type='text/javascript'>"
	                    + "window.parent.CKEDITOR.tools.callFunction("
	                    + callback+",'"+ fileUrl+"','???????????? ????????????????????????.')"
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
	
	
	//?????? 3
     
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
        // ?????? ?????? ??????
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //?????????
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //?????? ?????? ????????????
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //????????? ?????? ??????
            String path = "C:/Java/workspace/busanonna_tour/src/main/webapp/resources/image/ckImage/";// fileDir??? ?????? ????????? ?????? ????????? ?????? ??????????????? ??????.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //?????? ???????????? ??????
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // ?????? ??????
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram??? ????????? ???????????? ???????????? ?????????
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // ????????????
            
        // ???????????? ????????? ??????
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
     * cKeditor ????????? ????????? ????????? ????????????
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
        
        //????????? ????????? ????????? ??????
        String path = "C:/Java/workspace/busanonna_tour/src/main/webapp/resources/image/ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.
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
