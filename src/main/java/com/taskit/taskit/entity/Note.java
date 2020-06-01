package com.taskit.taskit.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "notes")
public class Note implements Comparable<Note> {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@NotEmpty(message = "You must assign a title")
	private String title;
	
	@NotEmpty(message = "You must type some content")
	@Column(columnDefinition = "TEXT")
	private String text;
	
	private boolean status = false;
	
	private Timestamp note_date = new Timestamp(System.currentTimeMillis());
	
	private long user_id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	public Timestamp getNote_date() {
		return note_date;
	}

	public void setNote_date(Timestamp note_date) {
		this.note_date = note_date;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	
	@Override 
	public int compareTo(Note currentNote) {
		return this.note_date.compareTo(currentNote.note_date);
	}
	


}
