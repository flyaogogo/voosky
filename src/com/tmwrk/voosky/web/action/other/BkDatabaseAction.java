package com.tmwrk.voosky.web.action.other;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.tmwrk.voosky.database.vo.Backup;
import com.tmwrk.voosky.database.vo.VSTable;
import com.tmwrk.voosky.service.other.BackupServiceMgr;
import com.tmwrk.voosky.web.action.BaseAction;

public class BkDatabaseAction extends BaseAction implements ModelDriven<Backup> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7670442571445203544L;

	@Autowired
	private BackupServiceMgr backupService ;
	
	Backup backup = new Backup() ;
	
	private Backup bk ;
	
	private List<Backup> bkList ;
	
	private List<VSTable> tabList ;

	@Override
	public String execute() throws Exception{
		bkList = backupService.listAllBackups(null) ;
		tabList = backupService.listAllDbTable(null) ;
		
		return SUCCESS ;
	}
	
	public String getBkById() throws Exception{
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("id", backup.getId()) ;
		bk = backupService.getBackupById(param) ;
		return SUCCESS ;
	}
	public String addBackup() throws Exception{
		backupService.addBackup(backup);
		return SUCCESS ;
	}
	public String updateBackup() throws Exception{
		backupService.updateBk(backup);
		return SUCCESS ;
	}
	public String deleteBkById() throws Exception{
		backupService.deleteBkById(backup);
		return SUCCESS ;
	}
	
	@Override
	public Backup getModel() {
		return backup;
	}

	public Backup getBk() {
		return bk;
	}

	public void setBk(Backup bk) {
		this.bk = bk;
	}

	public List<Backup> getBkList() {
		return bkList;
	}

	public void setBkList(List<Backup> bkList) {
		this.bkList = bkList;
	}

	public List<VSTable> getTabList() {
		return tabList;
	}

	public void setTabList(List<VSTable> tabList) {
		this.tabList = tabList;
	}
	
}
