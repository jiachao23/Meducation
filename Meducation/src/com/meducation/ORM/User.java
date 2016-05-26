package com.meducation.ORM;

public class User {

	private String login_name;
	private String password;

	public String getLogin_name() {
		return login_name;
	}

	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}

	public User() {
	}

	public User(String name, String password) {
		this.login_name = name;
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
