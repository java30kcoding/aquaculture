package com.etc.aquaculture.dao;

import com.etc.aquaculture.pojo.User;
import com.etc.aquaculture.pojo.Warning;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author yanxq
 * @date 2020/6/8 16:35
 **/
@Repository
public interface WarningRepository extends JpaRepository<Warning, Long> {
}
