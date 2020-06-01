package com.taskit.taskit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskit.taskit.entity.Note;
import com.taskit.taskit.repository.NoteRepository;

@Service
public class NoteServiceImpl implements NoteService {
	
	@Autowired
	private NoteRepository noteRepository;

	@Override
	public Note save(Note note) {
		return noteRepository.save(note);
	}

	@Override
	public void delete(Note note) {
		noteRepository.delete(note);
	}

	@Override
	public List<Note> findAllNotesByUserId(long user_id) {
		return noteRepository.findAllNotesByUserId(user_id);
	}

	@Override
	public Note findById(long id) {
		return noteRepository.findById(id);
	}

	@Override
	public List<Note> findAllUndoneNotes(long user_id) {
		return noteRepository.findAllUndoneNotes(user_id);
	}

	@Override
	public List<Note> findAllDoneNotes(long user_id) {
		return noteRepository.findAllDoneNotes(user_id);
	}

	@Override
	public void deleteById(long id) {
		noteRepository.deleteById(id);
	}

}
