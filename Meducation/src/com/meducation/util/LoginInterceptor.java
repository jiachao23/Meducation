package com.meducation.util;

import java.util.Map;

import com.meducation.action.login;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation invocation) throws Exception {

		System.out.println("只允许登录与注册页面且.action的能通过地址栏直接访问");
		// 只允许登录与注册页面且.action的能通过地址栏直接访问
		if (login.class == invocation.getAction().getClass()) {
			return invocation.invoke();

		}
		// 获取Session对象
		Map map = invocation.getInvocationContext().getSession();
		// 获取Login.action类中存在Session中属性值
		String username = (String) map.get("identifyNum");
		// 如果Session中为空，则跳转到登录页面
		if (null == username) {
			return "login";
		}
		return invocation.invoke();
	}
}