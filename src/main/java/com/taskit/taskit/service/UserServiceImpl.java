package com.taskit.taskit.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.taskit.taskit.entity.User;
import com.taskit.taskit.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	BCryptPasswordEncoder encoder;

	@Autowired
	private UserRepository userRepository;
	
	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public User save(User user) {
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		return userRepository.save(user);
	}

	@Override
	public void delete(User user) {
		userRepository.delete(user);
	}

	@Override
	public Optional<User> findById(Long id) {
		return userRepository.findById(id);
	}
	
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

}
