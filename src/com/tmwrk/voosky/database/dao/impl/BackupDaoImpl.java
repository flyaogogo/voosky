package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.Backup;

@Repository("backupDao")
public class BackupDaoImpl extends BaseDao<Backup> {

	@Override
	public Backup add(Backup params) {
		getSqlMapClientTemplate().insert("backup.addBackup",params) ;
		return null;
	}

	@Override
	public Backup update(Backup params) {
		getSqlMapClientTemplate().update("backup.updateBackup", params) ;
		return null;
	}

	@Override
	public Backup findById(Map<String, Object> params) {
		Backup sp = (Backup)getSqlMapClientTemplate().queryForObject("backup.listbackupById", params) ;
		return sp ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Backup> findAll(Map<String, Object> params) {
		List<Backup> buList = (List<Backup>)getSqlMapClientTemplate().queryForList("backup.listAllbackups", params) ;
		return buList ;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> listAllTableBydb(Map<String, Object> params) {
//		List<SystemTable> buList = (List<SystemTable>)getSqlMapClientTemplate().queryForList("backup.listAllTableBydb", params) ;
		List<Map<String, Object>> map = (List<Map<String, Object>>)getSqlMapClientTemplate().queryForList("backup.listAllTableBydb", params) ;
		return map ;
	}

	public boolean deleteBackupById(Backup sp){
		getSqlMapClientTemplate().delete("backup.deleteBackupById", sp) ;
		return true ;
	}
	
	/**
	 * 返回大小为KB
	 * @param params
	 * @return
	 */
	public String countCurrentTableSize(Map<String, Object> params){
		String sizeStr = (String)getSqlMapClientTemplate().queryForObject("backup.countCurrentTableSize", params) ;
		return sizeStr ;
	}
	
}
