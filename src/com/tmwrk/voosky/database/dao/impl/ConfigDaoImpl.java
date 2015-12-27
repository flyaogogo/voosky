package com.tmwrk.voosky.database.dao.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Config;

@Repository("configDao")
public class ConfigDaoImpl extends BaseDao<Config> {

	@Override
	public Config add(Config params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Config update(Config params) {
		getSqlMapClientTemplate().update("config.update", params) ;
		return null;
	}

	@Override
	public Config findById(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Config> findAll(Map<String, Object> params) {
		List<Config> cfList = (List<Config>)getSqlMapClientTemplate().queryForList("config.listAllConfig", params) ;
		return cfList ;
	}

	/**
	 * 批量更新系统配置文件
	 * @param cfList
	 */
	public void batchUpdateSysConfig(List<Config> cfList) throws IOException {
		getSqlMapClientTemplate().update("config.batchUpdate", cfList) ;
	}
}
