package com.etc.aquaculture.dao;

import com.etc.aquaculture.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author yanxq
 * @date 2020/6/8 16:35
 **/
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsernameAndPassword(String userName, String userPassword);
    
}
