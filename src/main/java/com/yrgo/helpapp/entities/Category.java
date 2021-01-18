package com.yrgo.helpapp.entities;


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "category")
public class Category implements java.io.Serializable {

	private Integer categoryId;
	private String name;
	private boolean status;
	private Set<Help> help = new HashSet<Help>(0);

	public Category() {
	}

	public Category(String name, boolean status) {
		this.name = name;
		this.status = status;
	}

	public Category(String name, boolean status, Set<Help> help) {
		this.name = name;
		this.status = status;
		this.help = help;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "category_id", unique = true, nullable = false)
	public Integer getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	public Set<Help> getHelp() {
		return this.help;
	}

	public void setHelp(Set<Help> help) {
		this.help = help;
	}

}
