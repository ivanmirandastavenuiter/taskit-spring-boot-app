package com.taskit.taskit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.taskit.taskit.entity.Note;

@Repository
public interface NoteRepository extends JpaRepository<Note, Long> {
	Note findById(long id);
	@Query(value = "SELECT * FROM notes WHERE user_id = :user_id", nativeQuery = true)
	List<Note> findAllNotesByUserId(@Param("user_id")long user_id);
	@Query(value = "SELECT * FROM notes WHERE status = 0 AND user_id = :user_id", nativeQuery = true)
	List<Note> findAllUndoneNotes(@Param("user_id")long user_id);
	@Query(value = "SELECT * FROM notes WHERE status = 1 AND user_id = :user_id", nativeQuery = true)
	List<Note> findAllDoneNotes(@Param("user_id")long user_id);
}
