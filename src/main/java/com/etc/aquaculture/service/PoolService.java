package com.etc.aquaculture.service;

import com.etc.aquaculture.common.R;
import com.etc.aquaculture.dao.PoolAreaRepository;
import com.etc.aquaculture.dao.PoolDetailRepository;
import com.etc.aquaculture.dao.PoolInfoRepository;
import com.etc.aquaculture.pojo.PoolArea;
import com.etc.aquaculture.pojo.PoolInfo;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author yuanyl
 * @date 2020/6/8 17:29
 **/
@Service
public class PoolService {


    @Resource
    PoolInfoRepository poolInfoRepository;
    @Resource
    PoolDetailRepository poolDetailRepository;
    @Resource
    PoolAreaRepository poolAreaRepository;

    public R listAll(){
        return R.success(poolInfoRepository.findAll());
    }

    public List<PoolArea> listPoolArea(){
        return poolAreaRepository.findAll();
    }

    public PoolArea getPoolArea(Long id){
        return poolAreaRepository.getOne(id);
    }

    public PoolArea listPoolInfo(PoolArea poolArea){
        poolArea.setPoolInfoList(poolInfoRepository.findByPoolAreaId(poolArea.getId()));
        return poolArea;
    }

    public R listDetailByPoolId(Long id){
        return R.success(poolDetailRepository.findByPoolId(id + ""));
    }

    public Map<String, Object> getPoolCount(){
        Map<String, Object> poolInfo = Maps.newHashMap();
        poolInfo.put("count", poolInfoRepository.count());
        return poolInfo;
    }

}
