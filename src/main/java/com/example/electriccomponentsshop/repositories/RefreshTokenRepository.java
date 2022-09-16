package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.RefreshToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken,Integer > {
    @Override
    Optional<RefreshToken> findById(Integer integer);

    Optional<RefreshToken> findByToken(String token);
    Optional<RefreshToken> findByAccount_Email(String email);
}
