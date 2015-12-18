package com.tmwrk.voosky.web.action.other;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Show;
import com.tmwrk.voosky.service.other.ShowServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class SlideManAction extends BaseAction implements ModelDriven<Show>{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5490981712548450603L;
	
	@Autowired
	private ShowServiceMgr showService ;
	
	Show show = new Show() ;
	
	private Show slide ;
	
	private List<Show> slideList ;
	
	@Override
	public String execute() throws Exception{
//		SmartUpload su = new  SmartUpload();
//		su.service(request,response);
//		//
//		su.getRequest().getParameter("showImg") ;//来获取form中的值了
		slideList = showService.listAllSlidePage(null) ;
		return SUCCESS ;
	}

	public String getSlideById() throws Exception{
		Map<String, Object> params = new HashMap<String, Object>() ;
		params.put("id", show.getId()) ;
		slide = showService.listSlideById(params) ;
		return SUCCESS ;
	}

	public String insertSlide() throws Exception{
		String fileName = show.getShowImg() ;
		String imageFileName = new Date().getTime() + getExtention(fileName);
		InputStream is = request.getInputStream() ;
//        File imageFile = new File(.getRealPath( " /UploadImages " ) + " / " + imageFileName);
//        copy(myFile, imageFile);
		
		showService.addSlide(show);
		return SUCCESS ;
	}
	
	public String updateSlide() throws Exception{
		
        
		showService.updateSlide(show);
		return SUCCESS ;
	}
	
	public String deleteSlideById() throws Exception{
		
		showService.deleteSlideById(show);
		return SUCCESS ;
	}
	
	/**
	 * http://zhidao.baidu.com/link?url=CpybbvI6AKrU20IMogmsXlezqp0FRGE9bnLcyrXAh77JZ4-fCBiw02oQoVOx4rIDMBlXpcFGFxZ3kPB4mqDQxq
	 * @param src
	 * @param dst
	 */
	private static final int BUFFER_SIZE = 16 * 1024 ;
	private static void copy(File src, File dst) {
        try {
           InputStream in = null ;
           OutputStream out = null ;
            try {                
               in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
               out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
                byte [] buffer = new byte [BUFFER_SIZE];
                while (in.read(buffer) > 0 ) {
                   out.write(buffer);
               } 
           } finally {
                if ( null != in) {
                   in.close();
               } 
                if ( null != out) {
                   out.close();
               } 
           } 
       } catch (Exception e) {
           e.printStackTrace();
       } 
   } 
   
    private static String getExtention(String fileName) {
        int pos = fileName.lastIndexOf( "." );
        return fileName.substring(pos);
   } 
    
	private void uploadImage() throws Exception {
		// 1. 创建工厂类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 2. 创建FileUpload对象
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 3. 判断是否是上传表单
		boolean b = upload.isMultipartContent(request);
		if (!b) {
			// 不是文件上传
			request.setAttribute("message", "对不起，不是文件上传表单！");
			request.getRequestDispatcher("/message.jsp").forward(request,
					response);
			return;
		}
		// 是文件上传表单
		// 4. 解析request，获得FileItem项
		List<FileItem> fileitems = upload.parseRequest(request);
		// 5. 遍历集合
		for (FileItem item : fileitems) {
			// 判断是不是普通字段
			if (item.isFormField()) {
				String name = item.getFieldName();
				String value = item.getString();
				// 手工的转换了
				value = new String(value.getBytes("iso-8859-1"), "utf-8");
				System.out.println(name + "=" + value);
			} else {
				// 文件上传字段
				// 获得文件名
				String filename = item.getName();
				System.out.println(filename);
				filename = filename.substring(filename.lastIndexOf("\\") + 1);

				System.out.println(filename);
				// 创建文件
				ServletContext context = request.getSession()
						.getServletContext();
				// ServletContext context = getServletContext();
				String dir = context.getRealPath("WEN-INF/upload");
				File file = new File(dir, filename);
				file.createNewFile();

				// 获得流，读取数据写入文件
				InputStream in = item.getInputStream();
				FileOutputStream fos = new FileOutputStream(file);

				int len;
				byte[] buffer = new byte[1024];
				while ((len = in.read(buffer)) > 0)
					fos.write(buffer, 0, len);
				fos.close();
				in.close();
				item.delete(); // 删除临时文件
			}
		}
	}
	@Override
	public Show getModel() {
		return show;
	}

	public Show getSlide() {
		return slide;
	}

	public void setSlide(Show slide) {
		this.slide = slide;
	}

	public List<Show> getSlideList() {
		return slideList;
	}

	public void setSlideList(List<Show> slideList) {
		this.slideList = slideList;
	}

}
