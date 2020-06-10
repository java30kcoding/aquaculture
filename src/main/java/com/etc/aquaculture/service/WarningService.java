package com.etc.aquaculture.service;

import com.etc.aquaculture.dao.PoolAreaRepository;
import com.etc.aquaculture.dao.PoolInfoRepository;
import com.etc.aquaculture.dao.WarningRepository;
import com.etc.aquaculture.pojo.PoolInfo;
import com.etc.aquaculture.pojo.Warning;
import com.etc.aquaculture.utils.WeChatUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author yanxq
 * @date 2020/6/9 21:57
 **/
@Service
public class WarningService {

    @Resource
    WarningRepository warningRepository;
    @Resource
    PoolInfoRepository poolInfoRepository;
    @Resource
    PoolAreaRepository poolAreaRepository;
    @Resource
    WeChatUtil weChatUtil;

    public Warning getOne(){
        return warningRepository.getOne(1L);
    }

    public Warning updateWarning(Warning warning){
        warning.setId(1L);
        return warningRepository.save(warning);
    }

//    @Scheduled(cron = "0/5 * * * * ?")
    public void warningByCorn(){
        //1. 获取所有最新的池塘数
        List<PoolInfo> poolInfos = poolInfoRepository.listPoolInfo();
        //2. 将所有池塘数据与预警指标相比，超出阈值的进行报警
        Warning warning = warningRepository.getOne(1L);
        for (PoolInfo poolInfo : poolInfos) {
            String poolArea = poolAreaRepository.getOne(poolInfo.getPoolAreaId()).getPoolCode();
            String poolName = poolInfo.getPoolName();
            StringBuilder warnMsg = new StringBuilder();
            String poolOxygen = poolInfo.getPoolOxygen();
            String poolPh = poolInfo.getPoolPh();
            String poolAmmonia = poolInfo.getPoolAmmonia();
            String poolTemperature = poolInfo.getPoolTemperature();
            if (Double.parseDouble(poolOxygen) <= Double.parseDouble(warning.getPoolOxygenMin())
                    || Double.parseDouble(poolOxygen) >= Double.parseDouble(warning.getPoolOxygenMax())) {
                warnMsg.append("含氧量异常！当前值是: ");
                warnMsg.append(poolOxygen);
                warnMsg.append("mg/L，不在合格范围: ");
                warnMsg.append(warning.getPoolOxygenMin());
                warnMsg.append("~");
                warnMsg.append(warning.getPoolOxygenMax());
                warnMsg.append("内!\n");
            }
            if (Double.parseDouble(poolPh) <= Double.parseDouble(warning.getPoolPhMin())
                    || Double.parseDouble(poolPh) >= Double.parseDouble(warning.getPoolPhMax())) {
                warnMsg.append("ph值量异常！当前值是: ");
                warnMsg.append(poolOxygen);
                warnMsg.append("，不在合格范围: ");
                warnMsg.append(warning.getPoolPhMin());
                warnMsg.append("~");
                warnMsg.append(warning.getPoolPhMax());
                warnMsg.append("内!\n");
            }
            if (Double.parseDouble(poolAmmonia) <= Double.parseDouble(warning.getPoolAmmoniaMin())
                    || Double.parseDouble(poolAmmonia) >= Double.parseDouble(warning.getPoolAmmoniaMax())) {
                warnMsg.append("氨氮含量异常！当前值是: ");
                warnMsg.append(poolOxygen);
                warnMsg.append("ppm，不在合格范围: ");
                warnMsg.append(warning.getPoolAmmoniaMin());
                warnMsg.append("~");
                warnMsg.append(warning.getPoolAmmoniaMax());
                warnMsg.append("内!\n");
            }
            if (Double.parseDouble(poolTemperature) <= Double.parseDouble(warning.getPoolTemperatureMin())
                    || Double.parseDouble(poolTemperature) >= Double.parseDouble(warning.getPoolTemperatureMax())) {
                warnMsg.append("温度异常！当前值是: ");
                warnMsg.append(poolOxygen);
                warnMsg.append("℃，不在合格范围: ");
                warnMsg.append(warning.getPoolTemperatureMin());
                warnMsg.append("~");
                warnMsg.append(warning.getPoolTemperatureMax());
                warnMsg.append("内!\n");
            }
            weChatUtil.push(poolArea, poolName, warnMsg.toString());
        }
    }


}
