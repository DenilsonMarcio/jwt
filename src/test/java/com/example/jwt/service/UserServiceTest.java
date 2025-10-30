package com.example.jwt.service;

import com.example.jwt.dto.UserRegisterDTO;
import com.example.jwt.model.User;
import com.example.jwt.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.dao.DataIntegrityViolationException;
import org.junit.jupiter.api.extension.ExtendWith;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class UserServiceTest {
    @Mock
    private UserRepository userRepository;
    @Mock
    private PasswordEncoder passwordEncoder;
    @InjectMocks
    private UserService userService;

    @Test
    void testRegisterSuccess() {
        UserRegisterDTO dto = new UserRegisterDTO();
        dto.setUsername("user1");
        dto.setPassword("password");
        dto.setEmail("user1@email.com");
        when(userRepository.existsByUsername("user1")).thenReturn(false);
        when(userRepository.existsByEmail("user1@email.com")).thenReturn(false);
        when(passwordEncoder.encode("password")).thenReturn("encoded");
        when(userRepository.save(any(User.class))).thenAnswer(i -> i.getArgument(0));
        User user = userService.register(dto);
        assertEquals("user1", user.getUsername());
        assertEquals("encoded", user.getPassword());
        assertEquals("user1@email.com", user.getEmail());
    }

    @Test
    void testRegisterDuplicate() {
        UserRegisterDTO dto = new UserRegisterDTO();
        dto.setUsername("user1");
        dto.setPassword("password");
        dto.setEmail("user1@email.com");
        when(userRepository.existsByUsername("user1")).thenReturn(true);
        assertThrows(DataIntegrityViolationException.class, () -> userService.register(dto));
    }
}

