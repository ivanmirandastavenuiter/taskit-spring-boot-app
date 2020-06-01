package com.taskit.taskit.service;

import java.util.List;

import com.taskit.taskit.entity.Note;

public interface NoteService {
	Note save(Note note);
	void delete(Note note);
	void deleteById(long id);
	List<Note> findAllNotesByUserId(long user_id);
	List<Note> findAllUndoneNotes(long user_id);
	List<Note> findAllDoneNotes(long user_id);
	Note findById(long id);
}
