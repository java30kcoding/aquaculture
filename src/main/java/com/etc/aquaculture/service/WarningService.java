package com.etc.aquaculture.service;

import com.etc.aquaculture.dao.WarningRepository;
import com.etc.aquaculture.pojo.Warning;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author yuanyl
 * @date 2020/6/9 21:57
 **/
@Service
public class WarningService {

    @Resource
    WarningRepository warningRepository;

    public Warning getOne(){
        return warningRepository.getOne(1L);
    }

}
