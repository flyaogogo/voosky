package com.tmwrk.voosky.web.action.other;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Config;
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
	
	private Config conf ;
	
	private List<Config> confList ;
	
	private String nameType ;
	
	private Map<String,String> mapSysConf ;
	
	@Override
	public String execute() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		if(nameType==null){
			nameType = "main.site." ;
		}
		param.put("name", nameType) ;
		List<Config> confList = configService.listSysConfigByName(param) ;
		mapSysConf = new HashMap<String, String>() ;
		for(Config c : confList){
			mapSysConf.put(c.getName(), c.getValue()) ;
		}
		return SUCCESS ;
	}
	
	public String updateSysConfig() throws Exception{
		
		return SUCCESS ;
	}

	@Override
	public Config getModel() {
		return config;
	}

	public Config getConf() {
		return conf;
	}

	public void setConf(Config conf) {
		this.conf = conf;
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

}
