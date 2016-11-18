package com.tmwrk.voosky.module.util.db;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BackUpMySQL {
	private static final String BASE_PATH_LINUX = "/root/";
	private static final String BASE_PATH_WINDEWS = "E:\\";

	public void backwindows() {

		try {

			String sqlname = BASE_PATH_WINDEWS
					+ "shequ."
					+ new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss")
							.format(new Date()) + ".sql";

			String mysql = "mysqldump --user=root --password=jwl --opt shequ> "
					+ sqlname;

			java.lang.Runtime.getRuntime().exec("cmd /c " + mysql);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public void backlinux() {
		try {

			String sqlname = BASE_PATH_LINUX + "mqney." + new Date().toString()
					+ ".sql";

			String mysql = "mysqldump --user=root --password=123456 --opt mqney> "
					+ sqlname;

			java.lang.Runtime.getRuntime().exec(
					new String[] { "sh", "-c", mysql });

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// new BackUpMySQL().backwindows();
		System.out.println(System.getProperty("os.name"));
	}
}
