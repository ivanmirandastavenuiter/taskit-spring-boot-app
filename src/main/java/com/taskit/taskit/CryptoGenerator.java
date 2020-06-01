package com.taskit.taskit;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class CryptoGenerator {

	public static void main(String[] args) {

		String password = "bryan";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println(hashedPassword);

	}

}
