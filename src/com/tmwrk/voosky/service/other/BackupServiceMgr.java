package com.tmwrk.voosky.service.other;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.BackupDaoImpl;
import com.tmwrk.voosky.database.vo.Backup;
import com.tmwrk.voosky.database.vo.VSTable;

@Service("backupService")
@Transactional
public class BackupServiceMgr {
	@Autowired
	@Qualifier("backupDao")
	private BackupDaoImpl backupDao ;
	
	public List<VSTable> listAllDbTable(Map<String, Object> param){
		List<VSTable> tabList = backupDao.listAllTableBydb(param) ;
		return tabList ;
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
