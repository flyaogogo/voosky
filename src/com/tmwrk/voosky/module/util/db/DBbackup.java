package com.tmwrk.voosky.module.util.db;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tmwrk.voosky.web.action.BaseAction;

public class DBbackup extends BaseAction {

	private String username;
	private String password;
	private String host;
	private String PORT;
	private String dbname;
	private List dataFiles = new ArrayList();
	private File reductionFile;

	public File getReductionFile() {
		return reductionFile;
	}

	public void setReductionFile(File reductionFile) {
		this.reductionFile = reductionFile;
	}

	public List getDataFiles() {
		return dataFiles;
	}

	public void setDataFiles(List dataFiles) {
		this.dataFiles = dataFiles;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getPORT() {
		return PORT;
	}

	public void setPORT(String pORT) {
		PORT = pORT;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDbname() {
		return dbname;
	}

	public void setDbname(String dbname) {
		this.dbname = dbname;
	}

	/**
	 * 删除
	 * */
	public String delete() {
		String fileName = request.getParameter("fileName");
		System.out.println(fileName);
		String backPath = ServletActionContext.getServletContext().getRealPath(
				"/")
				+ "ewssite/back/" + fileName;
		File file = new File(backPath);
		file.delete();
		return "delete";
	}

	/**
	 * 得到备份文件的List集合
	 * 
	 * */
	public String findList() {
		String backPath = ServletActionContext.getServletContext().getRealPath(
				"/")
				+ "ewssite/back/";
		File file = new File(backPath);
		if (!file.exists())
			return "findListData";
		File[] file1 = file.listFiles();
		for (int i = 0; i < file1.length; i++) {
			if (file1[i].getName().equals("ramdit.txt"))
				continue;
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			// 前面的lSysTime是秒数，先乘1000得到毫秒数，再转为java.util.Date类型
			java.util.Date dt = new Date(file1[i].lastModified());
			String sDateTime = sdf.format(dt); // 得到精确到秒的表示：08/31/2006 21:08:00
			DataFile dataFile = new DataFile();
			dataFile.setFileName(file1[i].getName());
			dataFile.setFileDate(sDateTime);
			String path = request.getContextPath();
			String filePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/ewssite/back/" + file1[i].getName();
			dataFile.setFilePath(filePath);
			DecimalFormat df = new DecimalFormat(".## ");
			dataFile.setFileSize(df.format(file1[i].length() / 1024000f));
			dataFiles.add(dataFile);
		}
		return "findListData";
	}

	/**
	 * 配置 Mysql bin目录
	 * */
	public void getConfig() {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
//		BasicDataSource ba = (BasicDataSource) context.getBean("dataSource");
//		setUsername(ba.getUsername());
//		setPassword(ba.getPassword());
//		String url = ba.getUrl();
//		url = url.substring(13, url.length());
//		String[] temp = url.split("/");
//		String[] temp1 = temp[0].split(":");
//		setHost(temp1[0]);
//		setPORT(temp1[1]);
//		for (int i = 0; i < temp[1].length(); i++) {
//			String temp2 = temp[1].charAt(i) + "";
//			if (temp2.equals("?")) {
//				setDbname(temp[1].substring(0, 5));
//			}
//		}
	}

	/**
	 * 备份
	 * */
	public String backup() {
		getConfig();
		// 得到配置文件
		try {
			Runtime rt = Runtime.getRuntime();
			String backPath = ServletActionContext.getServletContext()
					.getRealPath("/")
					+ "ewssite/back/"
					+ System.currentTimeMillis() + ".sql";
			String mysql = "mysqldump -u" + getUsername() + " -p"
					+ getPassword() + " --default-character-set=utf8 -h"
					+ getHost() + " -P" + getPORT() + " " + getDbname() + " >"
					+ "\"" + backPath + "\"";
			Process proc = rt.exec("cmd.exe /c " + mysql);// 设置导出编码为utf8。这里必须是utf8
			// String backExe =
			// ServletActionContext.getServletContext().getRealPath("/")+"bin/mysqldump.exe";
			// String mysql = getDbname()+ " -u" + getUsername()+ " -p" +
			// getPassword() +
			// " --default-character-set=utf8 -h"+getHost()+" -P"+getPORT()+" >"+"\""+backPath+"\"";
			int tag = proc.waitFor();// 等待进程终止
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "backup";
	}

	/**
	 * 还原
	 * */
	public String load() {
		String sqlPath = "";
		if (request.getParameter("selectName") != null)
			sqlPath = request.getParameter("selectName");
		if (reductionFile != null) {
			String name = upload(reductionFile);
			sqlPath = ServletActionContext.getServletContext().getRealPath("/")
					+ "ewssite/back/" + name;
		}
		// System.out.println(sqlPath);
		if (sqlPath.substring(sqlPath.lastIndexOf(".") + 1).equals("sql")) {
			getConfig();
			setHost("127.0.0.1");
			setUsername("root");
			setPassword("root");
			setDbname("test");
			// 得到配置文件
			try {
				Runtime rt = Runtime.getRuntime();
				String createDb = "mysqladmin -u" + getUsername() + " -p"
						+ getPassword() + " create " + getDbname();
				String mysql = "mysql -u" + getUsername() + " -p"
						+ getPassword() + " " + getDbname() + " <" + "\""
						+ sqlPath + "\"";// +"\""+backPath+"\""
				rt.exec("cmd.exe /c " + createDb);
				Process proc = rt.exec("cmd.exe /c " + mysql);
				int tag = proc.waitFor();// 等待进程终止
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "load";
	}

	/**
	 * 把本地的数据库备份文件上传到服务器上 file:从前台获取的file
	 * */
	public String upload(File file) {
		String name = "";
		try {
			DataInputStream in = new DataInputStream(new FileInputStream(file));
			// FileInputStream in = new FileInputStream(file);

			String backPath = ServletActionContext.getServletContext()
					.getRealPath("/") + "ewssite/back/";
			name = System.currentTimeMillis() + ".sql";
			backPath = backPath + name;
			// FileOutputStream out = new FileOutputStream(new File(backPath));
			DataOutputStream out = new DataOutputStream(
					new BufferedOutputStream(new FileOutputStream(backPath)));
			int b = -1;
			while ((b = in.read()) != -1) {
				out.write(b);
			}
			out.close();
			in.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
}
