package com.tmwrk.voosky.service.other;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.AuditDaoImpl;
import com.tmwrk.voosky.database.vo.Audit;

@Service("auditService")
@Transactional
public class AuditServiceMgr {
	@Autowired
	@Qualifier("auditDao")
	private AuditDaoImpl auditDao ;
	
	/**
	 * 列出所有的日志信息，
	 * 
	 * 可分页：start,end
	 * 
	 * 可查找相关的信息   keywords
	 * 
	 * @param param
	 * @return
	 */
	public List<Audit> listAllLogs(HashMap<String, Object> param){
		List<Audit> auditList = auditDao.findAll(param) ;
		
		return auditList ;
	}
	
	public void addLog(Audit log){
		
		auditDao.add(log) ;
	}
	
	public void deleteLogById(Audit log){
		auditDao.deleteArticleById(log) ;
	}
}
