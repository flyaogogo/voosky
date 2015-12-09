package com.tmwrk.voosky.service.other;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.BackupDaoImpl;
import com.tmwrk.voosky.database.vo.Backup;
import com.tmwrk.voosky.database.vo.SystemTable;

@Service("backupService")
@Transactional
public class BackupServiceMgr {
	@Autowired
	@Qualifier("backupDao")
	private BackupDaoImpl backupDao ;
	
	public List<SystemTable> listAllDbTable(Map<String, Object> param){
		List<SystemTable> tabList = new ArrayList<SystemTable>() ;
		SystemTable systab = null ;
		
		List<Map<String, Object>> mapList = backupDao.listAllTableBydb(param) ;
		for(Map<String, Object> map : mapList){
			systab = new SystemTable() ;
			systab.setTabName(map.get("table_name").toString());
			systab.setType(map.get("engine").toString());
			systab.setTabTows(Long.parseLong(map.get("table_rows").toString()));
			systab.setDataSize(Long.parseLong(map.get("data_length").toString()));
			systab.setIndexLength(Long.parseLong(map.get("index_length").toString()));
			systab.setDataFree(Long.parseLong(map.get("data_free").toString()));
			tabList.add(systab) ;
		}
		return tabList ;
	}
	
	public String countCurrentTableSize(Map<String, Object> params){
		return backupDao.countCurrentTableSize(params) ;
	}
	public List<Backup> listAllBackups(Map<String,Object> param){
		List<Backup> bkList = backupDao.findAll(param) ;
		
		return bkList ;
	}
	
	public Backup getBackupById(Map<String, Object> param){
		Backup bk = backupDao.findById(param) ;
		return bk ;
	}
	
	public void addBackup(Backup bk){
		backupDao.add(bk) ;
	}
	
	public void updateBk(Backup bk){
		backupDao.update(bk) ;
	}
	
	public void deleteBkById(Backup bk){
		
		backupDao.deleteBackupById(bk) ;
	}
}
