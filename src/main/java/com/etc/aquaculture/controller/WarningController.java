package com.etc.aquaculture.controller;

import com.etc.aquaculture.pojo.JsonResult;
import com.etc.aquaculture.pojo.Warning;
import com.etc.aquaculture.service.WarningService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


/**
 * 预警控制器
 *
 * @author yuanyl
 * @date 2020/6/9 21:53
 **/
@Controller
public class WarningController {

    @Resource
    WarningService warningService;

//    public class Warnings {
//        private String poolOxygenMin;
//        private String poolOxygenMax;
//        private String poolPhMin;
//        private String poolPhMax;
//        private String poolAmmoniaMin;
//        private String poolAmmoniaMax;
//        private String poolTemperatureMin;
//        private String poolTemperatureMax;
//
//        public Warnings(String s){
//            this.poolOxygenMin = "0";
//            this.poolOxygenMax = "1";
//            this.poolPhMin = "2";
//            this.poolPhMax = "3";
//            this.poolAmmoniaMin = "4";
//            this.poolAmmoniaMax = "4";
//            this.poolTemperatureMin = "4";
//            this.poolTemperatureMax = "4";
//        }
//
//        public String getPoolOxygenMin() {
//            return poolOxygenMin;
//        }
//
//        public void setPoolOxygenMin(String poolOxygenMin) {
//            this.poolOxygenMin = poolOxygenMin;
//        }
//
//        public String getPoolOxygenMax() {
//            return poolOxygenMax;
//        }
//
//        public void setPoolOxygenMax(String poolOxygenMax) {
//            this.poolOxygenMax = poolOxygenMax;
//        }
//
//        public String getPoolPhMin() {
//            return poolPhMin;
//        }
//
//        public void setPoolPhMin(String poolPhMin) {
//            this.poolPhMin = poolPhMin;
//        }
//
//        public String getPoolPhMax() {
//            return poolPhMax;
//        }
//
//        public void setPoolPhMax(String poolPhMax) {
//            this.poolPhMax = poolPhMax;
//        }
//
//        public String getPoolAmmoniaMin() {
//            return poolAmmoniaMin;
//        }
//
//        public void setPoolAmmoniaMin(String poolAmmoniaMin) {
//            this.poolAmmoniaMin = poolAmmoniaMin;
//        }
//
//        public String getPoolAmmoniaMax() {
//            return poolAmmoniaMax;
//        }
//
//        public void setPoolAmmoniaMax(String poolAmmoniaMax) {
//            this.poolAmmoniaMax = poolAmmoniaMax;
//        }
//
//        public String getPoolTemperatureMin() {
//            return poolTemperatureMin;
//        }
//
//        public void setPoolTemperatureMin(String poolTemperatureMin) {
//            this.poolTemperatureMin = poolTemperatureMin;
//        }
//
//        public String getPoolTemperatureMax() {
//            return poolTemperatureMax;
//        }
//
//        public void setPoolTemperatureMax(String poolTemperatureMax) {
//            this.poolTemperatureMax = poolTemperatureMax;
//        }
//    }

    @RequestMapping(value = "/getWarning.action")
    @ResponseBody
    public JsonResult getWarning(Model model) {
//        model.addAttribute("warning", warningService.getOne());

//        return new JsonResult(new Warnings("ss"));
        return new JsonResult(warningService.getOne());
    }

}
