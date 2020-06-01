package com.taskit.taskit.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long user_id;
	
	@NotEmpty(message = "Username cannot be empty")
	private String username;
	
	@NotEmpty(message = "Password cannot be empty")
	@Size(min = 8, message = "Size must be 8 minimum")
	@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\\$%\\^&\\*])(?=\\S+$)(.{8,})", 
			 message = "Password not matching requirements")
	private String password;
	
	@Transient
	@NotEmpty(message = "Confirmation empty")
	private String confirm;
	
	private boolean enabled = true;

	public boolean isEnabled() {
		return enabled;
	}
	
	public long getId() {
		return this.user_id;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

}
