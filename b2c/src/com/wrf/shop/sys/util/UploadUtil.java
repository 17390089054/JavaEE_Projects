package com.wrf.shop.sys.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;

import com.wrf.shop.sys.model.UploadBean;

/**
 @ClassName UploadUtil
 * @Description 上传工具类
 * @Author invincible
 * @Date 2018年2月25日 下午5:03:49
 */
public class UploadUtil { 
	//私有化构造方法  避免生成对象
	private UploadUtil(){}
	/**
	 * @Title: upload   
	 * @Description: TODO(上传主方法)   
	 * @param: @param request
	 * @param: @param uploadPath
	 * @param: @return
	 * @param: @throws IOException      
	 * @return: Map<String,Object>      
	 * @throws
	 */
	public static Map<String,Object> upload(HttpServletRequest request,String uploadPath) throws IOException{
		Map<String,Object> map = new HashMap<String,Object>();
		//判断是否为上传
		boolean flag = ServletFileUpload.isMultipartContent(request);
		if(flag) {
			//----------准备上传的位置开始！-----------
			//定义上传路径
			String path = request.getServletContext().getRealPath("/"+uploadPath);
			//建立连接
			File file  = new File(path);
			//判断路径是否完整
			if(!file.isDirectory()){
				file.mkdirs();
			}
			//----------准备上传的位置结束！-----------
			//----------准备上传的工具！-----------
			//建立磁盘工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			//----------准备上传的工具结束！-----------
			//解析请求
			InputStream is = null;
			OutputStream os = null;
			try {
				//遍历
				List<FileItem> fileItems = upload.parseRequest(request);
				Iterator<FileItem> it = fileItems.iterator();
				while(it.hasNext()) {
					FileItem fileItem = it.next();
					//获取控件标签的信息--控件name
					String fieldname = fileItem.getFieldName();
					is = fileItem.getInputStream();
					//判断是否是普通控件（非上传）
					if(fileItem.isFormField()) {
						String value = Streams.asString(is, "UTF-8");
						map.put(fieldname, value);
					}else {//是上传的文件
						//-----准备新名字开始---—
						//获取原名称
						String name = fileItem.getName();
						if(name!=null && name.trim().length()>0) {
							//后缀
							String ext = FilenameUtils.getExtension(name);
							String newName = UUID.randomUUID()+"."+ext;
							//-----准备新名字结束----
							//----写数据-----
							//构建输出通道
							File outFile = new File(path+"/"+newName);
							os = new FileOutputStream(outFile);
							byte[] b = new byte[1024];
							int len = -1;
							while( (len = is.read(b)) != -1   ) {
								os.write(b, 0, len);
							}
							//文件上传完毕  信息存入map
							map.put(fieldname, uploadPath+"/"+newName);
							map.put(fieldname+"_old", name);
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}finally {
				if(is!=null) {
					is.close();
				}
				if(os!=null) {
					os.close();
				}
			}
		}else {
			System.out.println("上传类型非  enctype");
		}
		return map;
	}
	
	/**
	 * 多文件同name上传方法
	 * @param request 请求
	 * @param uploadPath 存储的位置 参数如：resource/upload
	 * @return 返回包含全部信息的map
	 * @throws IOException
	 */
	public static UploadBean uploadManyFile(HttpServletRequest request,String uploadPath) throws IOException{
		UploadBean uploadBean = new UploadBean();
		//多图片
		List<String> list = new ArrayList<>();
		//存储普通表单信息
		Map<String,Object> map = new HashMap<String,Object>();
		//判断是否为上传
		boolean flag = ServletFileUpload.isMultipartContent(request);
		if(flag) {
			//----------准备上传的位置开始！-----------
			//定义上传路径
			String path = request.getServletContext().getRealPath("/"+uploadPath);
			//建立连接
			File file  = new File(path);
			//判断路径是否完整
			if(!file.isDirectory()){
				file.mkdirs();
			}
			//----------准备上传的位置结束！-----------
			//----------准备上传的工具！-----------
			//建立磁盘工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			//----------准备上传的工具结束！-----------
			//解析请求
			InputStream is = null;
			OutputStream os = null;
			try {
				List<FileItem> fileItems = upload.parseRequest(request);
				//遍历
				Iterator<FileItem> it = fileItems.iterator();
				while(it.hasNext()) {
					FileItem fileItem = it.next();
					//获取控件标签的信息--控件name
					String fieldname = fileItem.getFieldName();
					is = fileItem.getInputStream();
					//判断是否是普通控件（非上传）
					if(fileItem.isFormField()) {//（非上传）
						String value = Streams.asString(is, "UTF-8");
						map.put(fieldname, value);
					}else {//是上传的文件
						//-----准备新名字开始---—
						//获取原名称
						String name = fileItem.getName();
						if(name!=null && name.trim().length()>0) {
							//后缀
							String ext = FilenameUtils.getExtension(name);
							String newName = UUID.randomUUID()+"."+ext;
							//-----准备新名字结束----
							//----写数据-----
							//构建输出通道
							File outFile = new File(path+"/"+newName);
							os = new FileOutputStream(outFile);
							byte[] b = new byte[1024];
							int len = -1;
							while( (len = is.read(b)) != -1   ) {
								os.write(b, 0, len);
							}
							//文件上传完毕  信息存入map
							list.add( uploadPath+"/"+newName);
						}
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}finally {
				if(is!=null) {
					is.close();
				}
				if(os!=null) {
					os.close();
				}
			}
		}else {
			System.out.println("不是上传  enctype");
		}
		uploadBean.setMap(map);
		uploadBean.setList(list);
		return uploadBean;
	}
}
