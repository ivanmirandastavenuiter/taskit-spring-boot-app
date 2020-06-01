package com.taskit.taskit.service;

import java.util.List;
import java.util.Optional;

import com.taskit.taskit.entity.User;

public interface UserService {
	public List<User> findAll();
	public User save(User user);
	public void delete(User user);
	public Optional<User> findById(Long id);
	public User findByUsername(String username);
}
