package com.etc.aquaculture.controller;

import com.etc.aquaculture.common.R;
import com.etc.aquaculture.pojo.PoolArea;
import com.etc.aquaculture.pojo.PoolInfo;
import com.etc.aquaculture.service.PoolService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author yanxq
 * @date 2020/6/8 17:27
 **/
@Controller
public class PoolController {

    @Resource
    PoolService poolService;

    /**
     * 获取所有的池塘信息
     *
     * @return
     */
    @RequestMapping("/listAll")
    public R listAll(){
        return poolService.listAll();
    }

    @RequestMapping(value = "poolInfo.action", method = RequestMethod.GET)
    public String carInto(Model model) {
        List<PoolArea> cs = poolService.listPoolArea();
        PoolArea c = poolService.listPoolInfo(cs.get(0));
        model.addAttribute("cs", cs);
        model.addAttribute("c", c);
        return "poolInfo";
    }

    @RequestMapping(value = "poolInfo.action", method = RequestMethod.POST)
    public String carInto(int id, Model model) {
        List<PoolArea> cs = poolService.listPoolArea();
        PoolArea c = poolService.listPoolInfo(poolService.getPoolArea((long) id));
        model.addAttribute("cs", cs);
        model.addAttribute("c", c);
        return "poolInfo";
    }

    @RequestMapping(value = "/poolAreaList.action")
    public String carport(Model model) {
        List<PoolArea> pList = poolService.listPoolArea();
        model.addAttribute("pList", pList);
        return "poolAreaList";
    }

    @RequestMapping(value = "details.action", method = RequestMethod.GET)
    public String details(int id, Model model) {
        PoolArea cs = poolService.getPoolArea((long) id);
        PoolArea c = poolService.listPoolInfo(cs);
        model.addAttribute("pList", c.getPoolInfoList());
        model.addAttribute("c", c);
        return "poolDetails";
    }

    @RequestMapping(value = "addPoolArea.action", method = RequestMethod.POST)
    @ResponseBody
    public String addPoolArea(PoolArea poolArea) {
        //默认总数为0
        poolArea.setPoolTotal("0");
        poolService.updatePoolArea(poolArea);
        return "OK";
    }

    @RequestMapping(value = "updatePoolArea.action", method = RequestMethod.POST)
    @ResponseBody
    public String updatePoolArea(PoolArea poolArea) {
        poolService.updatePoolArea(poolArea);
        return "OK";
    }

    @RequestMapping(value = "addPoolInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public String addPoolInfo(PoolInfo poolInfo) {
        poolInfo.setPoolCurrentTime(new Date());
        poolService.savePoolInfo(poolInfo);
        return "OK";
    }

    @RequestMapping(value = "updatePoolInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public String updatePoolInfo(PoolInfo poolInfo) {
        poolInfo.setPoolCurrentTime(new Date());
        poolService.savePoolInfo(poolInfo);
        return "OK";
    }

    @RequestMapping(value = "deletePoolInfo.action", method = RequestMethod.POST)
    @ResponseBody
    public String deletePoolInfo(long id, long areaId) {
        poolService.deletePoolInfo(id, areaId);
        return "OK";
    }

}
