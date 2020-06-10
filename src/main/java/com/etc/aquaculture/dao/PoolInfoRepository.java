package com.etc.aquaculture.dao;

import com.etc.aquaculture.pojo.PoolInfo;
import com.etc.aquaculture.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author yuanyl
 * @date 2020/6/8 16:35
 **/
@Repository
public interface PoolInfoRepository extends JpaRepository<PoolInfo, Long> {

    @Query(value = "select * from t_pool_info i where (select count(*) from t_pool_info p where p.pool_name = i.pool_name" +
            " and p.pool_current_time > i.pool_current_time) < 1 and pool_area_id = ?1", nativeQuery = true)
    List<PoolInfo> findByPoolAreaId(Long poolAreaId);

    @Query(value = "select * from t_pool_info i where (select count(*) from t_pool_info p where p.pool_name = i.pool_name" +
            " and p.pool_current_time > i.pool_current_time) < 1", nativeQuery = true)
    List<PoolInfo> listPoolInfo();

    List<PoolInfo> findByPoolName(String poolName);

    @Query(value = "select count(distinct pool_name) from t_pool_info", nativeQuery = true)
    Integer countDistinct();

}
