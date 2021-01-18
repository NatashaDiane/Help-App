package com.yrgo.helpapp.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "discussion")
public class Discussion implements java.io.Serializable {

	private Integer discussionId;
	private Account account;
	private Help help;
	private String content;
	private Date createdDate;

	public Discussion() {
	}

	public Discussion(Account account, Help help, String content, Date createdDate) {
		this.account = account;
		this.help = help;
		this.content = content;
		this.createdDate = createdDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "discussion_id", unique = true, nullable = false)
	public Integer getDiscussionId() {
		return this.discussionId;
	}

	public void setDiscussionId(Integer discussionId) {
		this.discussionId = discussionId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "help_id", nullable = false)
	public Help getHelp() {
		return this.help;
	}

	public void setHelp(Help help) {
		this.help = help;
	}

	@Column(name = "content", nullable = false, length = 65535)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created_date", nullable = false, length = 10)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}
