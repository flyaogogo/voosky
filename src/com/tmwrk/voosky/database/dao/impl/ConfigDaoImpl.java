package com.tmwrk.voosky.database.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapExecutor;
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
	public void batchUpdate(final List<Config> list){
		try {
			if (list != null) {
				getSqlMapClientTemplate().execute(new SqlMapClientCallback() {
					public Object doInSqlMapClient(SqlMapExecutor executor) throws SQLException {
						executor.startBatch();
						for (int i = 0, n = list.size(); i < n; i++) {
							executor.update("config.update",list.get(i));
						}
						executor.executeBatch();
						return null;
					}
				});
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
