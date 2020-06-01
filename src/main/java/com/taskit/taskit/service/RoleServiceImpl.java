package com.taskit.taskit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskit.taskit.entity.Role;
import com.taskit.taskit.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleRepository roleRepository;
	
	public void setRole(Role role) {
		roleRepository.save(role);
	}

}
