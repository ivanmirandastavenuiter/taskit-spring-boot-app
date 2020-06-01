package com.taskit.taskit.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskit.taskit.entity.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
	
}
