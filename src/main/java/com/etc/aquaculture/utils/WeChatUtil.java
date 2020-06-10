package com.etc.aquaculture.utils;

import lombok.extern.slf4j.Slf4j;
import me.chanjar.weixin.mp.api.WxMpInMemoryConfigStorage;
import me.chanjar.weixin.mp.api.WxMpService;
import me.chanjar.weixin.mp.api.impl.WxMpServiceImpl;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateData;
import me.chanjar.weixin.mp.bean.template.WxMpTemplateMessage;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

/**
 * 微信公众号推送工具类
 *
 * @author yuanyl
 * @date 2020/6/10 17:46
 **/
@Component
@Slf4j
public class WeChatUtil {

    private WeChatUtil(){}

    public void push(String ...value) {
        //1，配置
        WxMpInMemoryConfigStorage wxStorage = new WxMpInMemoryConfigStorage();
        wxStorage.setAppId("wxa4ff82680bbd6ccb");
        wxStorage.setSecret("b59e1b819ee4bdc2e1f576f5dacce54f");
        WxMpService wxMpService = new WxMpServiceImpl();
        wxMpService.setWxMpConfigStorage(wxStorage);

        //2,推送消息
        List<WxMpTemplateData> data = Arrays.asList(new WxMpTemplateData("poolArea", value[0]),
                                                    new WxMpTemplateData("poolInfo", value[1]),
                                                    new WxMpTemplateData("exceptionInfo", value[2]));
        WxMpTemplateMessage templateMessage = WxMpTemplateMessage.builder()
                .toUser("oBzWI6eDMruyxv3NyCFHwAn5Hkas")//要推送的用户openid
//                .toUser("oBzWI6d9Szd_o1YrHyGpHo5lXbAk")
//                .toUser("oBzWI6Wjyfhmwq9d6fh2-30Zcegg")
                .data(data)
                .url("http://localhost:8080/index.jsp")
                .templateId("e0XRRVwN9KVWK-F0kKKCsOHa-6bcSG2aimP5i4hLF0g")//模版id
                .build();
        try {
            wxMpService.getTemplateMsgService().sendTemplateMsg(templateMessage);
        } catch (Exception e) {
            System.out.println("推送失败：" + e.getMessage());
            e.printStackTrace();
        }

    }

}
