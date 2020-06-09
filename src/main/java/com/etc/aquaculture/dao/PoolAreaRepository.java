package com.etc.aquaculture.dao;

import com.etc.aquaculture.pojo.PoolArea;
import com.etc.aquaculture.pojo.PoolInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author yuanyl
 * @date 2020/6/8 16:35
 **/
@Repository
public interface PoolAreaRepository extends JpaRepository<PoolArea, Long> {
}
