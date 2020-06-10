<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String userImg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=0">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link
            href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="<%=basePath%>js/jquery.validate.min.js"
            type="text/javascript"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath%>css/admin.css" type="text/css">
</head>
<body>

<c:import url="navbarModel.jsp"></c:import>

<!--主体信息开始-->
<!--欢迎语-->
<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <div class="welcome">
                <h2>${USER_LOGIN.name},清渠水产管理系统!</h2>
                <p>${USER_LOGIN.say}</p>
                <p id="system">
						 当前池塘：<span class="redColor">${poolCount.count}个</span>&emsp;&emsp;监测池塘：<span
                        class="greenColor">${poolCount.count}个
                </p>
            </div>
        </div>
    </div>
</div>
<!--功能模块-->
<div class="container two">
    <div class="row">
        <div class="col-md-11 column">

            <div class="col-md-1 column"></div>
            <!--池塘查看-->
            <div class="col-md-3 column" style="background: #f40;"
                 onclick="clickOut()">
                <img src="images/logo-one.png">
                <h2>池塘查看</h2>
                <p>查看池塘信息和环境监测数据</p>
            </div>


            <div class="col-md-1 column"></div>

            <!--池塘录入-->
            <div class="col-md-3 column" style="background: #00B51D"
                 onclick="parkCar()">
                <img src="images/logo-two.png">
                <h2>数据统计</h2>
                <p>水库池塘信息统计汇总</p>
            </div>

            <div class="col-md-1 column"></div>

            <!--池塘查询模块-->
            <form action="<%=basePath%>carInto.action">
                <div class="col-md-3 column" style="background: #30A080"
                     onclick="search()">
                    <img src="images/logo-three.png">
                    <h2>预警设置</h2>
                    <p>设置池塘监测阈值</p>
                </div>
            </form>

        </div>
    </div>
</div>

<!--天气信息展示模块-->
<div class="container three">
    <iframe width="700" scrolling="no" height="70" frameborder="0" allowtransparency="true"
            src="//i.tianqi.com/index.php?c=code&id=2&icon=1&py=xiamen&num=5&site=12"></iframe>
</div>
<!--公告信息展示模块-->
<%--<div class="container" style="text-align: center">--%>
<%--    <h4 style="border-radius: 10px;background: #71b3f7;color:white">公告</h4>--%>
<%--</div>--%>
<%--<c:forEach items="${ml}" var="m" varStatus="id">--%>
<%--    <c:if test="${id.count mod 2 == 0}">--%>
<%--        <div class="container four" style="margin-bottom: 30px;">--%>
<%--            <div style="text-align: center;">--%>
<%--                <h4 class="message-title" style="font-weight: bold;">${m.title}<span--%>
<%--                        class="timeAndName">&emsp;&emsp;${m.user.name}&emsp;&emsp;</span><span--%>
<%--                        class="timeAndName"><fmt:formatDate value="${m.creatTime}" pattern="yyyy-MM-dd HH-mm"/></span>--%>
<%--                </h4>--%>
<%--            </div>--%>
<%--                ${m.content}--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--    <c:if test="${id.count mod 2 != 0}">--%>
<%--        <div class="container five">--%>
<%--            <div style="text-align: center;">--%>
<%--                <h4 class="message-title" style="font-weight: bold;">${m.title}<span--%>
<%--                        class="timeAndName">&emsp;&emsp;${m.user.name}&emsp;&emsp;</span><span--%>
<%--                        class="timeAndName"><fmt:formatDate value="${m.creatTime}" pattern="yyyy-MM-dd HH-mm"/></span>--%>
<%--                </h4>--%>
<%--            </div>--%>
<%--                ${m.content}--%>
<%--        </div>--%>
<%--    </c:if>--%>
<%--</c:forEach>--%>
<c:import url="bottomModel.jsp"></c:import>
<script type="text/javascript">

    function search() {
        $.ajax({
            async: false,
            url: "<%=basePath%>getWarning.action",
            data: {
                "id": $("#id").val(),
                "poolOxygenMin": $("#pool_oxygen_min").val(),
                "poolOxygenMax": $("#pool_osearchInfoxygen_max").val(),
                "poolArea": $("#poolInfo_poolArea").val(),
                "poolDeep": $("#poolInfo_poolDeep").val(),
                "poolType": $("#poolInfo_poolType").val(),
                "poolDensity": $("#poolInfo_poolDensity").val(),
                "poolOxygen": $("#poolInfo_poolOxygen").val(),
                "poolPh": $("#poolInfo_poolPh").val(),
                "poolAmmonia": $("#poolInfo_poolAmmonia").val(),
                "poolTemperature": $("#poolInfo_poolTemperature").val()
            },
            type: "POST",
            success: function (data,model) {
                if (data.state == "1") {
                    $("#pool_oxygen_min").val(data.data.poolOxygenMin);
                    $("#pool_oxygen_max").val(data.data.poolOxygenMax);
                    $("#pool_ph_min").val(data.data.poolPhMin);
                    $("#pool_ph_max").val(data.data.poolPhMax);
                    $("#pool_ammonia_min").val(data.data.poolAmmoniaMin);
                    $("#pool_ammonia_max").val(data.data.poolAmmoniaMax);
                    $("#pool_temperature_min").val(data.data.poolTemperatureMin);
                    $("#pool_temperature_max").val(data.data.poolTemperatureMax);
                    // alert("修改池塘信息成功！");
                    // window.location.reload();
                } else {
                    // alert("修改池塘信息失败！")
                }
                // $("#myModalCarspaceUpdate").modal('hide');
            },
            fail: function (e) {
                alert("fail");
            },
            error: function (e) {
                alert("error");
            }
        })
        $("#myModalSearch").modal('show');
    }

    $(function () {
        $("#poolWarningInfo").validate({
            submitHandler: function (form) {
                if (confirm('确定要提交已编辑的信息吗?')) {
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/updateWarning.action",
                        data: {
                            "poolOxygenMin": $("#pool_oxygen_min").val(),
                            "poolOxygenMax": $("#pool_oxygen_max").val(),
                            "poolPhMin": $("#pool_ph_min").val(),
                            "poolPhMax": $("#pool_ph_max").val(),
                            "poolAmmoniaMin": $("#pool_ammonia_min").val(),
                            "poolAmmoniaMax": $("#pool_ammonia_max").val(),
                            "poolTemperatureMin": $("#pool_temperature_min").val(),
                            "poolTemperatureMax": $("#pool_temperature_max").val(),
                        },
                        type: "POST",
                        success: function (data) {
                            if (data == "OK") {
                                alert("修改预警阈值成功！");
                            } else {
                                alert("修改预警阈值失败！")
                            }
                            $("#poolWarningInfo").modal('hide');
                        },
                        fail: function (e) {
                            alert("fail");
                        },
                        error: function (e) {
                            alert("error");
                        }
                    })
                }
            }
        })
    })

    function parkCar() {
        $("#myModalCarOut").modal('show');
        var mycars = new Array("京", "津", "沪", "渝", "冀", "豫", "云", "辽", "黑",
            "湘", "皖", "鲁", "新", "苏", "浙", "赣", "鄂", "桂", "甘", "晋", "蒙",
            "陕", "吉", "闽", "贵", "粤", "青", "藏", "川", "宁", "琼", "使", "领");
        for (var i = 0; i < mycars.length; i++) {
            $("#selectId").append(
                "<option value='" + mycars[i] + "'>" + mycars[i]
                + "</option>");
        }
    }

    $.validator
        .addMethod(
            "checkCarNumber",
            function (value, element) {
                var mobile = /^(([A-Z](([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领]))$/;
                return this.optional(element) || mobile.test(value);
            }, "请正确填写车牌号码");
    $(function () {
        $("#searchInfo")
            .validate(
                {
                    rules: {
                        "car_numtwo": {
                            "required": true,
                            "checkCarNumber": true
                        }
                    },
                    messages: {
                        "car_numtwo": {
                            "required": "车牌号不能为空",
                            "checkCarNumber": "请输入正确的车牌号码"
                        }
                    },
                    submitHandler: function (form) {
                        $.ajax({
                            async: false,
                            url: "${pageContext.request.contextPath}/searchcarnumber.action",
                            data: {
                                "carNumber": $("#car_numtwo").val(),
                                "selectId": $("#selectIdtwo").val()
                            },
                            type: "POST",
                            success: function (data) {
                                var co = data.co;
                                if (co == null) {
                                    $("#orderInfo").html("<p style='color:red'>没有搜索到车辆信息</p>");
                                    return;
                                }
                                if (co.state == 1) {
                                    $("#orderInfo").html("<p style='color:red'>没有搜索到车辆信息</p>");
                                    return;
                                }
                                var cs = data.cs;
                                var la = "<p>车牌号："
                                    + co.province
                                    + "·"
                                    + co.carNumber
                                    + "<br>"
                                    + "停车人姓名："
                                    + co.customerName
                                    + "&emsp;&emsp;停车人电话："
                                    + co.customerPhone
                                    + "<br>"
                                    + "目前在："
                                    + cs.carstation.c_name
                                    + "水库&emsp;"
                                    + cs.s_name + "池塘"
                                    + "</p>";
                                $("#orderInfo").html(la);
                            },
                            fail: function (e) {
                                alert("请求失败");
                            },
                            error: function (e) {
                                alert("error");
                            }
                        })
                    }
                })
    })
    $(function () {
        $("#costInfo")
            .validate(
                {
                    rules: {
                        "car_num": {
                            "required": true,
                            "checkCarNumber": true
                        }
                    },
                    messages: {
                        "car_num": {
                            "required": "车牌号不能为空",
                            "checkCarNumber": "请输入正确的车牌号码"
                        }
                    },
                    submitHandler: function (form) {
                        $
                            .ajax({
                                async: false,
                                url: "${pageContext.request.contextPath}/selectCarorder.action",
                                data: {
                                    "selectId": $("#selectId")
                                        .val(),
                                    "car_num": $("#car_num")
                                        .val()
                                },
                                type: "POST",
                                success: function (data) {
                                    if (data.co != null) {
                                        console.log(data.user);
                                        var co = data.co;
                                        var c = data.carspace;
                                        var u = data.user;
                                        var type;
                                        if (c.s_type == 1) {
                                            type = "小池塘";
                                        } else {
                                            type = "大池塘";
                                        }
                                        var la = "<div id='oid' style='display:none;'>"
                                            + co.id
                                            + "</div>"
                                            + "<strong>车牌号：</strong><em>"
                                            + co.province
                                            + "·"
                                            + co.carNumber
                                            + "</em><br>"
                                            + "<strong>水库：</strong><em>"
                                            + c.carstation.c_name
                                            + "</em>&emsp;&emsp;&emsp;<strong>池塘：</strong><em>"
                                            + c.s_name
                                            + "</em><br>"
                                            + "<strong>池塘类型:</strong><em>"
                                            + type
                                            + "</em><br>"
                                            + "<strong>入库时间:</strong><em>"
                                            + data.startTime
                                            + "</em>&emsp;&emsp;&emsp;<strong>出库时间:</strong><em>"
                                            + data.endTime
                                            + "</em><br>"
                                            + "<strong>价格：</strong><em>"
                                            + c.s_price
                                            + "元/"
                                            + c.s_pricetime
                                            + "小时</em>&emsp;&emsp;&emsp;<strong>停车时间：</strong><em>"
                                            + data.time
                                            + "小时</em><br>"
                                            + "<strong>操作人:</strong><em>"
                                            + u.name
                                            + "</em>&emsp;&emsp;&emsp;<strong>工号：</strong><em>"
                                            + u.code
                                            + "</em><br>"
                                            + "<strong>总计:</strong><strong style='color:red'>￥"
                                            + data.cost
                                            + "元</strong><br><br>"
                                            + "<span onclick='account(+"
                                            + co.id
                                            + ","
                                            + c.s_id
                                            + ","
                                            + data.time
                                            + ","
                                            + data.oneEndTime
                                            + ","
                                            + data.cost
                                            + ")' class='endBtn'>结算</span>"
                                        $("#carCost").html(la);
                                        alert("计算费用成功！");
                                    } else {
                                        alert("没有查找到该车牌号！");
                                    }
                                },
                                fail: function (e) {
                                    alert("没有查找到该车牌号！");
                                },
                                error: function (e) {
                                    alert("error！");
                                }
                            })
                    }

                })
    })

    function account(oid, sid, time, endTime, cost) {
        $.ajax({
            async: false,
            url: "${pageContext.request.contextPath}/endCarorder.action",
            data: {
                "oid": oid,
                "sid": sid,
                "time": time,
                "endTime": endTime,
                "cost": cost
            },
            type: "POST",
            success: function (data) {
                if (data == "OK") {
                    alert("结算成功！");
                    $("#myModalCarOut").modal('hide');
                } else {
                    alert("结算失败！");
                }
            },
            fail: function (e) {
                alert("error");
            },
            error: function (e) {
                alert("error");
            }
        })

    }
</script>
<!--计算停车费用模态框-->
<div class="modal fade" id="myModalCarOut" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">计算停车费用</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="costInfo">
                    <p id="carspaceInfo"></p>
                    <div class="form-group">
                        <label for="car_num" class="col-sm-3 control-label">车牌号</label>
                        <div class="col-sm-2">
                            <select class="form-control sel" id="selectId" name="selectId">
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="car_num"
                                   placeholder="输入车牌号码" name="car_num"/>
                        </div>
                        <div class="col-sm-2">
                            <span class="OCRcarnumber" onclick="clickCamera()">拍照识别</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="panel panel-success"
                             style="width: 450px; margin-left: 80px">
                            <div class="panel-heading">
                                <p id="carCost" style="line-height: 25px">
                                    <strong>车牌号：</strong><em>&emsp;&emsp;</em><br>
                                    <strong>水库：</strong><em>&emsp;&emsp;</em>&emsp;&emsp;&emsp;<strong>池塘：</strong><em>&emsp;&emsp;</em><br>
                                    <strong>池塘类型:</strong><em>&emsp;&emsp;</em><br> <strong>入库时间:</strong><em>&emsp;&emsp;</em>&emsp;&emsp;&emsp;<strong>出库时间:</strong><em>&emsp;&emsp;</em><br>
                                    <strong>价格：</strong><em>&emsp;&emsp;</em>&emsp;&emsp;&emsp;<strong>停车时间：</strong><em>&emsp;&emsp;</em><br>
                                    <strong>操作人:</strong><em>&emsp;&emsp;</em>&emsp;&emsp;&emsp;<strong>工号：</strong><em>&emsp;&emsp;</em><br>
                                    <strong>总计:</strong><strong style="color: red">&emsp;&emsp;</strong><br>
                                    <br> <span class="endBtn">结算</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal" onclick="flush()">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="parkcar">计算费用</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--搜索模态框-->
<div class="modal fade" id="myModalSearch" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form class="form-horizontal" id="poolWarningInfo">
                    <div class="form-group">
                        <label for="car_num" class="col-sm-3 control-label">池塘含氧量区间</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_oxygen_min"
                                    placeholder="最小含氧量" name="pool_oxygen_min"/>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_oxygen_max"
                                    placeholder="最大含氧量" name="pool_oxygen_max"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="car_num" class="col-sm-3 control-label">池塘ph值区间</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_ph_min"
                                   placeholder="最小ph值" name="pool_ph_min"/>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_ph_max"
                                   placeholder="最大ph值" name="pool_ph_max"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="car_num" class="col-sm-3 control-label">池塘含氨氮量区间</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_ammonia_min"
                                   placeholder="最小含氨氮量" name="pool_ammonia_min"/>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_ammonia_max"
                                   placeholder="最大含氨氮量" name="pool_ammonia_max"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="car_num" class="col-sm-3 control-label">池塘温度区间</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_temperature_min"
                                   placeholder="最低温度" name="pool_temperature_min"/>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="pool_temperature_max"
                                   placeholder="最高温度" name="pool_temperature_max"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="add">保存</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    function flush() {
        window.location.reload();
    }

    function clickOut() {
        window.location.href = "<%=basePath%>poolInfo.action";
    }

    function clickCamera() {
        $("#myModalCarOut").modal("hide");
        $("#myModalOCR").modal("show");
    }

</script>
<script type="text/javascript" src="<%=basePath%>js/OCRcarNumber.js"></script>
</body>
</html>

