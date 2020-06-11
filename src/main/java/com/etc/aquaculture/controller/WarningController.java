package com.etc.aquaculture.controller;

import com.alibaba.fastjson.JSON;
import com.etc.aquaculture.pojo.JsonResult;
import com.etc.aquaculture.pojo.Warning;
import com.etc.aquaculture.service.WarningService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;


/**
 * 预警控制器
 *
 * @author yanxq
 * @date 2020/6/9 21:53
 **/
@Controller
public class WarningController {

    @Resource
    WarningService warningService;

    @RequestMapping(value = "/getWarning.action")
    @ResponseBody
    public JsonResult getWarning(Model model) {
//        model.addAttribute("warning", warningService.getOne());

//        return new JsonResult(new Warnings("ss"));
        return new JsonResult(warningService.getOne());
    }

    @RequestMapping("/updateWarning.action")
    @ResponseBody
    public String updateWarning(Warning warning) {
        warningService.updateWarning(warning);
        return "OK";
    }

    @RequestMapping("/test")
    public void test(){
        warningService.warningByCorn();
    }



    public class PoolInfos implements Serializable {
        private static final long serialVersionUID = 1L;
        private Long id;
        private Long poolAreaId;
        private String poolName;
        private String poolArea;
        private String poolDeep;
        private String poolType;
        private String poolDensity;
        private String poolOxygen;
        private String poolPh;
        private String poolAmmonia;
        private String poolTemperature;
        private Date poolCurrentTime;

        public PoolInfos(){
            id = 2L;
            poolAreaId = 2L;
            poolName = "2";
            poolArea = "2";
            poolDeep = "2";
            poolType = "2";
            poolDensity = "2";
            poolOxygen = "2";
            poolPh = "2";
            poolAmmonia = "2";
            poolTemperature = "2";
            poolCurrentTime = new Date();
        }

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public Long getPoolAreaId() {
            return poolAreaId;
        }

        public void setPoolAreaId(Long poolAreaId) {
            this.poolAreaId = poolAreaId;
        }

        public String getPoolName() {
            return poolName;
        }

        public void setPoolName(String poolName) {
            this.poolName = poolName;
        }

        public String getPoolArea() {
            return poolArea;
        }

        public void setPoolArea(String poolArea) {
            this.poolArea = poolArea;
        }

        public String getPoolDeep() {
            return poolDeep;
        }

        public void setPoolDeep(String poolDeep) {
            this.poolDeep = poolDeep;
        }

        public String getPoolType() {
            return poolType;
        }

        public void setPoolType(String poolType) {
            this.poolType = poolType;
        }

        public String getPoolDensity() {
            return poolDensity;
        }

        public void setPoolDensity(String poolDensity) {
            this.poolDensity = poolDensity;
        }

        public String getPoolOxygen() {
            return poolOxygen;
        }

        public void setPoolOxygen(String poolOxygen) {
            this.poolOxygen = poolOxygen;
        }

        public String getPoolPh() {
            return poolPh;
        }

        public void setPoolPh(String poolPh) {
            this.poolPh = poolPh;
        }

        public String getPoolAmmonia() {
            return poolAmmonia;
        }

        public void setPoolAmmonia(String poolAmmonia) {
            this.poolAmmonia = poolAmmonia;
        }

        public String getPoolTemperature() {
            return poolTemperature;
        }

        public void setPoolTemperature(String poolTemperature) {
            this.poolTemperature = poolTemperature;
        }

        public Date getPoolCurrentTime() {
            return poolCurrentTime;
        }

        public void setPoolCurrentTime(Date poolCurrentTime) {
            this.poolCurrentTime = poolCurrentTime;
        }
    }

    @RequestMapping("/test.action")
    public String test(Model model) {
        List<PoolInfos> poolInfos = new ArrayList<>();
        for (int i = 0 ; i < 5 ;i++){
            poolInfos.add(new PoolInfos());
        }
        model.addAttribute("poolInfos", JSON.toJSONString(poolInfos));
        return "area-stack";
    }

}
