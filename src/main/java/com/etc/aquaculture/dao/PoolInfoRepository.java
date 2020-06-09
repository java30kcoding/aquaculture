package com.etc.aquaculture.dao;

import com.etc.aquaculture.pojo.PoolInfo;
import com.etc.aquaculture.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author yuanyl
 * @date 2020/6/8 16:35
 **/
@Repository
public interface PoolInfoRepository extends JpaRepository<PoolInfo, Long> {

    List<PoolInfo> findByPoolAreaId(Long poolAreaId);

}
