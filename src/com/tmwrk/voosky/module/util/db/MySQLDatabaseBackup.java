package com.tmwrk.voosky.module.util.db;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

/**
 * 
 * 首先，设置mysql的环境变量（在path中添加%MYSQL_HOME%\bin），重启电脑。
 * 
 * http://www.blogjava.net/Supershen/archive/2007/12/07/166017.html
 * 
 * @author Administrator
 *
 */
public class MySQLDatabaseBackup {
	private static String MYSQL_PATH = "C:\\Program Files (x86)\\MySQL\\MySQL Server 5.5\\bin" ;
	
	private static String WIN_MYSQL_COMMAND = "cmd /c " + MYSQL_PATH + ">" ;
	/**
	 * 
	 * 
	 * 
	 * @param hostIP MySQL数据库所在服务器地址IP
	 * @param dbUserName 进入数据库所需要的用户名
	 * @param dbPwd 进入数据库所需要的密码
	 * @param dbName 要导出的数据库名
	 * @param savePath 数据库导出文件保存路径
	 * @param fileName 数据库导出文件文件名
	 */
	public static void backupDB(String hostIP ,String dbUserName,String dbPwd,
			String dbName,String savePath,String fileName) {
		try {
			
			File saveFile = new File(savePath);
			if (!saveFile.exists()) {// 如果目录不存在
				saveFile.mkdirs();// 创建文件夹
			}
			if (!savePath.endsWith(File.separator)) {
				savePath = savePath + File.separator;
			}
			
			savePath = savePath + fileName ;
			
			Runtime rt = Runtime.getRuntime();
			//mysqldump -u用户名 -p密码 -R -c --set-charset=utf8 数据库名
			String cmd = "mysqldump -h " + hostIP + " -u " + dbUserName + " -p" + dbPwd + " -R -c --set-charset=utf8 " + dbName ;
//			cmd = cmd.replace("/", "\\") ;
			Process child = rt.exec(cmd);

			InputStream in = child.getInputStream();

			InputStreamReader xx = new InputStreamReader(in, "utf8");

			String inStr;
			StringBuffer sb = new StringBuffer("");
			String outStr;

			BufferedReader br = new BufferedReader(xx);
			while ((inStr = br.readLine()) != null) {
				sb.append(inStr + "\r\n");
			}
			outStr = sb.toString();

			FileOutputStream fout = new FileOutputStream(savePath);
			OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");
			writer.write(outStr);
			writer.flush();

			in.close();
			xx.close();
			br.close();
			writer.close();
			fout.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static void loadDB(String hostIP, String dbUserName,String dbPwd,String dbName,String fPath) {
		try {
			//String fPath = "备份的文件路径名";
			Runtime rt = Runtime.getRuntime();
			String cmd = "mysql -h " + hostIP + " -u " + dbUserName + " -p" + dbPwd + " " + dbName ;
			Process child = rt.exec(cmd);
			//Process child = rt.exec("mysql -u用户名 -p密码 数据库名");
			OutputStream out = child.getOutputStream();
			String inStr;
			StringBuffer sb = new StringBuffer("");
			String outStr;
			BufferedReader br = new BufferedReader(new InputStreamReader(
					new FileInputStream(fPath), "utf8"));
			while ((inStr = br.readLine()) != null) {
				sb.append(inStr + "\r\n");
			}
			outStr = sb.toString();

			OutputStreamWriter writer = new OutputStreamWriter(out, "utf8");
			writer.write(outStr);
			writer.flush();
//			if (child.waitFor() == 0) {// 0 表示线程正常终止。
//				return ;
//			}
			out.close();
			br.close();
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		String hostIP = "192.168.0.101" ;
		String dbUserName = "root" ;
		String dbPwd = "123456" ;
		String dbName = "voosky" ;
		String savePath = "D:/temp" ;
		String fileName = "voosky-2016-01-21.sql" ;
		
		backupDB(hostIP, dbUserName, dbPwd, dbName, savePath, fileName);
		
		
	}
}
