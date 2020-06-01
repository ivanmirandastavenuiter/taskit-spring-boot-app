package com.taskit.taskit.controller;

import java.util.Collections;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.taskit.taskit.entity.Note;
import com.taskit.taskit.entity.User;
import com.taskit.taskit.service.NoteService;
import com.taskit.taskit.service.UserService;

@Controller
@RequestMapping("/note")
public class NoteController {
	
	private static Logger logger = Logger.getLogger(com.taskit.taskit.utils.TaskitAppLogger.class.getName());
	
	@Autowired
	private NoteService noteService;
	
	@Autowired 
	private UserService userService;
	
	@GetMapping("/overview")
	public String getOverviewSection(ModelMap model, HttpServletRequest request) {
		
		logger.info("Requesting create page on get. Retrieving notes for current user.");
		
		User user = userService.findByUsername(request.getUserPrincipal().getName());
		List<Note> userNotes = noteService.findAllNotesByUserId(user.getId());
		
		model.addAttribute("view", "overview");
		model.addAttribute("notes", userNotes);
		return "note";
	}
	
	@GetMapping("/create")
	public String getCreateSection(@ModelAttribute("note")Note note, ModelMap model) {
		model.addAttribute("view", "create");
		return "note";
	}
	
	@PostMapping("/create")
	public String saveNote(@Valid @ModelAttribute("note")Note note,
							BindingResult result,
							ModelMap model,
							RedirectAttributes redirectAttributes,
							HttpServletRequest request) {
		
		logger.info("Creating the note. Processing.");
		
		if (result.hasErrors()) {
			logger.info("Detecting errors. Retrieving to previous page.");
			model.addAttribute("view", "create");
			return "note";
		}
		
		User user = userService.findByUsername(request.getUserPrincipal().getName());
		note.setUser_id((user.getId()));
		noteService.save(note);
		
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/note/create";
	}
	
	@GetMapping("/done")
	public String getDoneSection(ModelMap model, 
								HttpServletRequest request) {
		
		logger.info("Requesting done notes. Providing.");
		
		User user = userService.findByUsername(request.getUserPrincipal().getName());
		List<Note> userNotes = noteService.findAllDoneNotes(user.getId());
		
		model.addAttribute("notes", userNotes);
		model.addAttribute("view", "done");
		return "note";
	}
	
	@GetMapping("/undone")
	public String getUndoneSection(ModelMap model, HttpServletRequest request) {
		
		logger.info("Requesting done notes. Providing.");
		
		User user = userService.findByUsername(request.getUserPrincipal().getName());
		List<Note> userNotes = noteService.findAllUndoneNotes(user.getId());
		
		model.addAttribute("notes", userNotes);
		model.addAttribute("view", "undone");
		return "note";
	}
	
	@GetMapping("/sorted")
	public String getSortedSection(ModelMap model, 
								   @RequestParam(required = false)String order, 
								   HttpServletRequest request) {
		
		logger.info("Requesting sorted notes. Providing.");
		
		User user = userService.findByUsername(request.getUserPrincipal().getName());
		List<Note> userNotes = noteService.findAllNotesByUserId(user.getId());
		Collections.reverse(userNotes);
		
		if (order != null && order.equals("olders")) {
			logger.info("Olders requested. Reversing");
			Collections.reverse(userNotes);
		} 
		
		model.addAttribute("list", userNotes);
		model.addAttribute("view", "sorted");
		return "note";
		
	}
	
	@PostMapping("/toggle/{id}")
	public String toogleStatus(ModelMap model, 
							   RedirectAttributes redirectAttributes, 
							   @PathVariable long id,
							   HttpServletRequest request) {
		
		logger.info("Toggling note satus for current user. Retrieving result");
		Note note = noteService.findById(id);
		note.setStatus(!note.isStatus());
		String view = note.isStatus() ? "done" : "undone";
		noteService.save(note);
		
		redirectAttributes.addFlashAttribute("toggled", true);
		return "redirect:/note/" + view;
	}
	
	@PostMapping("/delete/{id}")
	public String deleteNote(ModelMap model, 
							 RedirectAttributes redirectAttributes,
							 @PathVariable long id) {
		
		logger.info("Deleting note for current user. Retrieving result");
		Note note = noteService.findById(id);
		String view = note.isStatus() ? "done" : "undone";
		noteService.deleteById(id);
		
		redirectAttributes.addFlashAttribute("delete", true);
		return "redirect:/note/" + view;
	}
	
	

}
