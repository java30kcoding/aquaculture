package com.etc.aquaculture.common;

import lombok.Data;

/**
 * 响应实体封装
 *
 * @author yanxq
 * @date 2020/6/8 16:45
 **/
@Data
public class R {

    // 返回代码（0 成功；-1 业务错误；-500 系统错误；）
    private long status;
    // 返回提示信息
    private String statusText;
    // 返回对象
    private Object data;

    public R() {
    }

    public R(int status, String statusText) {
        this.status = status;
        this.statusText = statusText;
    }

    public R(int status, String statusText, Object data) {
        this.status = status;
        this.statusText = statusText;
        this.data = data;
    }

    public static R success(String message, Object data){
        return new R(200, message, data);
    }

    public static R success(Object data){
        return success("操作成功", data);
    }

    public static R success(){
        return success(null);
    }

    public static R fail(String message, Object data){
        return new R(500, message, data);
    }

    public static R fail(String message){
        return fail(message, null);
    }

}
