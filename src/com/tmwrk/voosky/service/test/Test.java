package com.tmwrk.voosky.service.test;

import com.tmwrk.voosky.module.util.SystemEnum;

public class Test {

	public static void main(String[] args) {
		
		SystemEnum se = SystemEnum.valueOf("defartattr") ;
		
		System.out.println(se.getId()  +  "   " + se.getName());
	}
}
