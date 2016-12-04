package com.tmwrk.voosky.web.action.other;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Config;
import com.tmwrk.voosky.database.vo.UploadFileBase;
import com.tmwrk.voosky.module.util.CalcUtil;
import com.tmwrk.voosky.module.util.SystemEnum;
import com.tmwrk.voosky.service.other.ConfigServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class SystemConfigAction extends BaseAction implements ModelDriven<Config>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1576308249371973249L;
	
	Config config = new Config() ;
	@Autowired
	private ConfigServiceMgr configService ;
	
	private UploadFileBase uplFileBase ;
	
	private List<Config> confList ;
	
	private String nameType ;
	
	private String retStatus ;
	
	private Map<String,String> mapSysConf ;
	
	@Override
	public String execute() throws Exception{
//		Map<String, Object> param = new HashMap<String, Object>() ;
//		if(nameType==null){
//			nameType = "main.site." ;
//		}
//		param.put("name", nameType) ;
		List<Config> confList = configService.listSysConfigByName(null) ;
		mapSysConf = new HashMap<String, String>() ;
		for(Config c : confList){
			mapSysConf.put(c.getName(), c.getValue()) ;
		}
		return SUCCESS ;
	}
	
	public String updateSysConfig() throws Exception{
		String val = config.getValue() ;
		String[] arrs = val.split(",") ;
		Config tmpConf = null ;
		List<Config> sysConfList = new ArrayList<Config>() ;
		for(String sc : arrs){
			String[] item = sc.split("::") ;
			//未设置的值，则不进行保存
			if(item.length!=2){
				continue ;
			}
			String typeKey = item[0] ;
			String typeVal = item[1] ;
			if(SystemEnum.msmark.toString().equals(typeKey)||
					SystemEnum.defweixin.toString().equals(typeKey)){
				continue ;
			}
			SystemEnum sysEnum = SystemEnum.valueOf(typeKey) ;
			tmpConf = new Config() ;
			tmpConf.setId(sysEnum.getId());
			tmpConf.setName(sysEnum.getName());
			tmpConf.setValue(typeVal);
			sysConfList.add(tmpConf) ;
		}
		if(sysConfList.size()>0){
			configService.batchUpdateSysConf(sysConfList);
			retStatus = "ok" ;
		}else{
			retStatus = "fail" ;
		}
			
		return SUCCESS ;
	}

	/**
	 * 单独上传 常规配置  中的  标识  图片
	 * @return
	 * @throws Exception
	 */
	public String updateMarkConfig() throws Exception{
		uplFileBase = CalcUtil.dealUploadInfo(false, config, "sysconf", request);
		if(CalcUtil.FILE_UPDATE_STATUS_ERROR.equals(uplFileBase.getStatus())){
			return SUCCESS ;
		}
		SystemEnum sysEnum = null ;
		if("msmark".equals(config.getStatus())){
			sysEnum = SystemEnum.valueOf(SystemEnum.msmark.toString()) ;
		}else if("weixin".equals(config.getStatus())){
			sysEnum = SystemEnum.valueOf(SystemEnum.defweixin.toString()) ;
		}
		//SystemEnum sysEnum = SystemEnum.valueOf(SystemEnum.msmark.toString()) ;
		Config tmpConf = new Config() ;
		tmpConf.setId(sysEnum.getId());
		tmpConf.setName(sysEnum.getName());
		tmpConf.setValue(uplFileBase.getFileRealPath());
		try {
			configService.updateSysConfig(tmpConf);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS ;
	}
	/**
	 * 上传文件
	 * @param isUpdate
	 * @return
	 *//*
	private String dealUploadInfo(boolean isUpdate){
		String myFileFileName = "image_" + config.getImageFileFileName() ;
		
		String slideFilePathStr = "upload/sysconf/" ;
		
		String imageFilePath = slideFilePathStr + myFileFileName;
		try {
			//正则式过滤非指定格式
			String specifiedFormat = "image/jpeg,image/gif,image/png,image/bmp,image/jpg" ;
			if(!specifiedFormat.contains(config.getImageFileContentType())){
				retStatus = "请上传指定范围内的图片（jpeg,gif,png,bmp,jpg）!" ;
				return ERROR ;
			}
			// 创建文件
			ServletContext context = request.getSession().getServletContext();
			String destPath = context.getRealPath("/") + slideFilePathStr ;
			//System.out.println("Dst File path: " + destPath);
//			System.out.println(imageFile);
			File destFile = new File(destPath, myFileFileName);
			if (destFile.exists()) {
				if(isUpdate){
//					config.setShowImg(imageFilePath.replace("\\", "/"));
					imageFilePath = imageFilePath.replace("\\", "/") ;
					return imageFilePath ;
				}else{
					destFile.delete() ;
				}
				
			}else{
				boolean exiFlag = true ;
				if(!new File(destPath).exists()){
					exiFlag = new File(destPath).mkdirs() ;
				}
				if(!exiFlag){
					retStatus = "创建目录失败！或请手动创建upload/slide目录！" ;
					return ERROR ;
				}
			}
			destFile.createNewFile() ;
			
			FileUtils.copyFile(config.getImageFile(), destFile);
			
			//System.out.println("input database image path:" + imageFilePath);
			//config.setShowImg(imageFilePath.replace("\\", "/"));
			imageFilePath = imageFilePath.replace("\\", "/") ;
			
		} catch (IOException e) {
			e.printStackTrace();
			retStatus = "图片上传失败！" ;
			return ERROR;
		}
		retStatus = "ok" ;
		return imageFilePath ;
	}*/
	
	@Override
	public Config getModel() {
		return config;
	}

	public UploadFileBase getUplFileBase() {
		return uplFileBase;
	}

	public void setUplFileBase(UploadFileBase uplFileBase) {
		this.uplFileBase = uplFileBase;
	}

	public List<Config> getConfList() {
		return confList;
	}

	public void setConfList(List<Config> confList) {
		this.confList = confList;
	}

	public String getNameType() {
		return nameType;
	}

	public void setNameType(String nameType) {
		this.nameType = nameType;
	}

	public Map<String, String> getMapSysConf() {
		return mapSysConf;
	}

	public void setMapSysConf(Map<String, String> mapSysConf) {
		this.mapSysConf = mapSysConf;
	}

	public String getRetStatus() {
		return retStatus;
	}

	public void setRetStatus(String retStatus) {
		this.retStatus = retStatus;
	}

}
