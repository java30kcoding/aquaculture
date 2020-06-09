package com.etc.aquaculture.controller;

import com.etc.aquaculture.common.R;
import com.etc.aquaculture.pojo.PoolArea;
import com.etc.aquaculture.service.PoolService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author yuanyl
 * @date 2020/6/8 17:27
 **/
@Controller
public class PoolController {

    @Resource
    PoolService poolService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "hello";
    }

    /**
     * 获取所有的池塘信息
     *
     * @return
     */
    @RequestMapping("/listAll")
    public R listAll(){
        return poolService.listAll();
    }

    /**
     * 获取指定池塘的详细参数
     *
     * @param id
     * @return
     */
    @RequestMapping("/listDetail")
    public R listDetailByPoolId(@RequestParam Long id){
        return poolService.listDetailByPoolId(id);
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
        PoolArea cs = poolService.getPoolArea((long) id);
        PoolArea c = poolService.listPoolInfo(cs);
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

}
