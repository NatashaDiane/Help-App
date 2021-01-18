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
@Table(name = "status")
public class Status implements java.io.Serializable {

	private Integer statusId;
	private String name;
	private boolean display;
	private String color;
	private Set<Help> help = new HashSet<Help>(0);

	public Status() {
	}

	public Status(String name, boolean display, String color) {
		this.name = name;
		this.display = display;
		this.color = color;
	}

	public Status(String name, boolean display, String color, Set<Help> help) {
		this.name = name;
		this.display = display;
		this.color = color;
		this.help = help;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "status_id", unique = true, nullable = false)
	public Integer getStatusId() {
		return this.statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	@Column(name = "name", nullable = false, length = 250)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "display", nullable = false)
	public boolean isDisplay() {
		return this.display;
	}

	public void setDisplay(boolean display) {
		this.display = display;
	}

	@Column(name = "color", nullable = false, length = 250)
	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "status")
	public Set<Help> getHelp() {
		return this.help;
	}

	public void setHelp(Set<Help> help) {
		this.help = help;
	}

}
