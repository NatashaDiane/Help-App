package com.yrgo.helpapp.entities;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "help")
public class Help implements java.io.Serializable {

	private Integer helpId;
	private Category category;
	private Status status;
	private String title;
	private String description;
	private Date createdDate;
	private Set<Discussion> discussions = new HashSet<Discussion>(0);

	public Help() {
	}

	public Help(Category category, Status status, String title, String description, Date createdDate) {
		this.category = category;
		this.status = status;
		this.title = title;
		this.description = description;
		this.createdDate = createdDate;
	}

	public Help(Category category, Status status, String title, String description, Date createdDate,
			Set<Discussion> discussions) {
		this.category = category;
		this.status = status;
		this.title = title;
		this.description = description;
		this.createdDate = createdDate;
		this.discussions = discussions;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "help_id", unique = true, nullable = false)
	public Integer getHelpId() {
		return this.helpId;
	}

	public void setHelpId(Integer helpId) {
		this.helpId = helpId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "status_id", nullable = false)
	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Column(name = "title", nullable = false, length = 250)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "description", nullable = false, length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "created_date", nullable = false, length = 10)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "help")
	public Set<Discussion> getDiscussions() {
		return this.discussions;
	}

	public void setDiscussions(Set<Discussion> discussions) {
		this.discussions = discussions;
	}

}
