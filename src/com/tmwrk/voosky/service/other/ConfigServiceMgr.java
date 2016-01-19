package com.tmwrk.voosky.service.other;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.ConfigDaoImpl;
import com.tmwrk.voosky.database.vo.Config;

@Service("configService")
@Transactional
public class ConfigServiceMgr {
	@Autowired
	@Qualifier("configDao")
	private ConfigDaoImpl configDao ;
	
	public List<Config> listSysConfigByName(Map<String, Object> param){
		List<Config> confList = configDao.findAll(param) ;
		
		return confList ;
	}
	
	public void batchUpdateSysConf(List<Config> confList) throws IOException {
		configDao.batchUpdate(confList);
	}
	
	public void updateSysConfig(Config conf){
		configDao.update(conf) ;
	}
}
