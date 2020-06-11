package com.etc.aquaculture.controller;

import com.alibaba.fastjson.JSON;
import com.etc.aquaculture.pojo.JsonResult;
import com.etc.aquaculture.pojo.Series;
import com.etc.aquaculture.pojo.Warning;
import com.etc.aquaculture.service.WarningService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.text.SimpleDateFormat;
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

//    @RequestMapping("/test")
//    public void test(){
//        warningService.warningByCorn();
//    }



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
        private String poolCurrentTime;
        public PoolInfos(){}
        public PoolInfos(int i){
            id = 2L;
            poolAreaId = 2L;
            poolName = "3";
            poolArea = "4";
            poolDeep = "5";
            poolType = "6";
            poolDensity = "7";
            poolOxygen = "8";
            poolPh = "9";
            poolAmmonia = "10";
            poolTemperature = "11";
            SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS" );
            Date date = new Date();
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(date);
            calendar.add(Calendar.DATE, i);
            date = calendar.getTime();
            poolCurrentTime  = sdf.format(date);

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

        public String getPoolCurrentTime() {
            return poolCurrentTime;
        }

        public void setPoolCurrentTime(String poolCurrentTime) {
            this.poolCurrentTime = poolCurrentTime;
        }
    }

    @RequestMapping("/test.action")
    public String test(Model model) {
        List<PoolInfos> poolInfos = new ArrayList<>();
        for (int i = 0 ; i < 5 ;i++){
            poolInfos.add(new PoolInfos(i));
        }
        model.addAttribute("poolInfos", JSON.toJSONString(poolInfos));
        List<String> poolNameList = new ArrayList<>();
        List<String> timeList = new ArrayList<>();
        List<String> namelist = new ArrayList<>();
        for (int i = 0 ; i < 5 ;i++){
            poolNameList.add(poolInfos.get(i).getPoolName()+i);
            timeList.add(poolInfos.get(i).getPoolCurrentTime()+i);
        }
        namelist.add("第一水库");
        namelist.add("第二水库");
        namelist.add("第三水库");
        model.addAttribute("timeList", timeList);
        model.addAttribute("poolNameList", poolNameList);
        model.addAttribute("namelist", namelist);




        List<Series> seriesList = new ArrayList<>();
        for (int i = 0 ; i  < namelist.size() ; i++){
            Series series = new Series();
            series.setName(namelist.get(i));
            series.setData(poolNameList);
            series.getLabel().getNormal().setPosition("top");
            series.getLabel().getNormal().setShow(true);
            seriesList.add(series);
        }
        model.addAttribute("seriesList", JSON.toJSONString(seriesList));

        return "area-stack";
    }


    @RequestMapping("/changeSelect.action")
    @ResponseBody
    public String changeArea(HttpServletRequest request,Model model){
        String areaId = request.getParameter("areaId");
        /**
         * 查询 巴拉巴拉
         */
        return "OK";

    }

}
