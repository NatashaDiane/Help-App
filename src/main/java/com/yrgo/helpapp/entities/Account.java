package com.yrgo.helpapp.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "account")
public class Account implements java.io.Serializable {

	private Integer accountId;
	private Role role;
	private String username;
	private String password;
	private String fullName;
	private boolean status;
	private String email;
	private Set<Discussion> discussions = new HashSet<Discussion>(0);

	public Account() {
	}

	public Account(Role role, String username, String password, String fullName, boolean status, String email) {
		this.role = role;
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.status = status;
		this.email = email;
	}

	public Account(Role role, String username, String password, String fullName, boolean status, String email,
			Set<Discussion> discussions) {
		this.role = role;
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.status = status;
		this.email = email;
		this.discussions = discussions;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "account_id", unique = true, nullable = false)
	public Integer getAccountId() {
		return this.accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "username", nullable = false, length = 250)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 250)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "full_name", nullable = false)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Column(name = "email", nullable = false, length = 250)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Discussion> getDiscussions() {
		return this.discussions;
	}

	public void setDiscussions(Set<Discussion> discussions) {
		this.discussions = discussions;
	}

}
