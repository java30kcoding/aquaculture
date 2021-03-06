<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script
            src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=basePath%>css/carInto.css"
          type="text/css">
    <title>寻找池塘</title>
    <style type="text/css">
        .orderParkInfo {
            margin-left: 30px;
        }

        .orderParkInfoDiv {
            background: #dff0d8;
            width: 400px;
            height: 100px;
            margin-left: 100px;
            padding-top: 20px;
            border-radius: 10px;
        }

        span.orderFont {
            color: #f40;
        }
    </style>
</head>
<body>
<!--导航栏开始-->
<c:import url="navbarModel.jsp"></c:import>
<!--主体信息开始-->
<div class="container"style="background-color:white;border: 0">

    <div class="row top" style="background-color:white;border: 0">
        <div class="panel panel-success" style="background-color:white;border: 0">
            <!-- Default panel contents -->
            <div class="panel-heading" style="background-color:white;border: 0">
                <form action="<%=basePath%>poolInfo.action" method="post">
                    <div class="col-md-2 inputdiv">
                        <select class="form-control sel" id="id" name="id">
                            <c:forEach items="${cs}" var="l">
                                <option value="${l.id}">${l.poolCode}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-1 inputdiv">
                        <button type="submit" class="btn btn-success"
                                id="updateUserInfoBtn">搜索
                        </button>
                    </div>
                </form>
                <p>
                    名称：${c.poolCode}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;池塘总数：${c.poolTotal}<br>位置：${c.poolLocation}<br>
                    描述：${c.poolRemark}

                </p>
            </div>
        </div>
    </div>
    <h3 style="color: #68b4df; margin-left: 20px">${c.poolCode}&nbsp;水库</h3>
    <div class="poolall"  style="background-image: url(images/back.jpg);height: 300px">
        <div class="carlocation" style="background-color:rgba(225,225,225,0);border: 0">
            <c:forEach items="${c.poolInfoList}" var="s">
                <!--循环池塘信息-->
                    <div class="poolcss">
                        <img src="images/xiaoyu.png" style="margin-top: 5px;width: 50px;height: 30px">
                        <p>
                                ${s.poolName}<br>${s.poolType}/${s.poolDensity}尾/亩
                        </p>
                    </div>
                    <div class="cardown"></div>
            </c:forEach>
        </div>
    </div>


</div>
<c:import url="bottomModel.jsp"></c:import>
<script type="text/javascript">
    function orderInfo(sid) {
        $.ajax({
            async: false,
            url: "${pageContext.request.contextPath}/getOrderInfo.action",
            data: {
                "sid": sid
            },
            type: "POST",
            success: function (data) {
                $("#myModalOrder").modal('show');
                var co = data.co;
                var a = "<p id='orderParkInfo' class='orderParkInfo'>车牌：<span class='orderFont'>" + co.province + "·" + co.carNumber + "</span><br>停车人姓名：<span class='orderFont'>" + co.customerName + "</span>&emsp;&emsp;停车人电话：<span class='orderFont'>" + co.customerPhone + "</span><br>停车时间：<span class='orderFont'>" + data.startTime + "</span></p>";
                $("#orderParkInfo").html(a);
            },
            fail: function (e) {
                alert("fail");
            },
            error: function (e) {
                alert("error");
            }
        })
    }

    function parkCar(sid, cid, uid, name, location, type, price, pricetime) {
        $("#myModalParkCar").modal('show');
        console.log(sid + "  " + cid + "  " + uid);
        $("#carspace_id").val(sid);
        $("#carstation_id").val(cid);
        $("#user_id").val(uid);
        var mycars = new Array("京", "津", "沪", "渝", "冀", "豫", "云", "辽", "黑", "湘", "皖", "鲁", "新", "苏", "浙", "赣", "鄂", "桂", "甘", "晋", "蒙", "陕", "吉", "闽", "贵", "粤", "青", "藏", "川", "宁", "琼", "使", "领");
        for (var i = 0; i < mycars.length; i++) {
            $("#selectId").append("<option value='" + mycars[i] + "'>" + mycars[i] + "</option>");
        }
        var t;
        if (type == 1) {
            t = "小池塘";
        } else {
            t = "大池塘";
        }
        $("#carspaceInfo").html("<p style='color:#f40;margin-left:30px'>池塘名称：" + name + "&nbsp;&nbsp;&nbsp;&nbsp;池塘位置：" + location + "<br>池塘类型：" + t + "&nbsp;&nbsp;&nbsp;&nbsp;池塘价格：" + price + "元/" + pricetime + "小时</p>")
    }

    $.validator.addMethod("checkCarNumber", function (value, element) {
        var mobile = /^(([A-Z](([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领]))$/;
        return this.optional(element) || mobile.test(value);
    }, "请正确填写车牌号码");
    $.validator
        .addMethod(
            "isMobile",
            function (value, element) {
                var length = value.length;
                var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
                return this.optional(element)
                    || (length == 11 && mobile.test(value));
            }, "请正确填写手机号码");
    $(function () {
        $("#parkcarinfo").validate({
            rules: {
                "car_number": {
                    "required": true,
                    "checkCarNumber": true
                },
                "car_phone": {
                    "isMobile": true
                }
            },
            messages: {
                "car_number": {
                    "required": "车牌号不能为空",
                    "checkCarNumber": "请输入正确的车牌号码"
                },
                "car_phone": {
                    "isMobile": "请输入正确的电话号码"
                }
            },
            submitHandler: function (form) {
                if (confirm('确定要提交已编辑的信息吗?')) {
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/addCarorder.action",
                        data: {
                            "sid": $("#carspace_id").val(),
                            "cid": $("#carstation_id").val(),
                            "uid": $("#user_id").val(),
                            "selectId": $("#selectId").val(),
                            "car_number": $("#car_number").val(),
                            "car_name": $("#car_name").val(),
                            "car_phone": $("#car_phone").val()
                        },
                        type: "POST",
                        success: function (data) {
                            if (data == "OK") {
                                alert("停车成功！");
                                window.location.reload();
                            } else {
                                alert("停车失败！")
                            }
                            $("#myModalParkCar").modal('hide');
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
</script>
<div class="modal fade" id="myModalParkCar" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">停车</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="parkcarinfo">
                    <div style="display: none">
                        <input id="carspace_id"/>
                    </div>
                    <div style="display: none">
                        <input id="carstation_id"/>
                    </div>
                    <div style="display: none">
                        <input id="user_id"/>
                    </div>
                    <p id="carspaceInfo"></p>
                    <div class="form-group">
                        <label for="add_name" class="col-sm-3 control-label">车牌号</label>
                        <div class="col-sm-2">
                            <select class="form-control sel" id="selectId" name="selectId">
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="car_number"
                                   placeholder="输入车牌号码" name="car_number"/>
                        </div>
                        <div class="col-sm-2">
                            <span class="OCRcarnumber" onclick="clickCamera()">拍照识别</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="car_name" class="col-sm-3 control-label">停车人姓名</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="car_name"
                                   placeholder="停车人姓名（可以不填）" name="car_name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="car_phone" class="col-sm-3 control-label">停车人电话</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="car_phone"
                                   placeholder="输入停车人电话（可以不填）" name="car_phone"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal" onclick="flush()">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="parkcar">停车</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="myModalOrder" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">车辆信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="parkcarinfo">
                    <p id="carspaceInfo"></p>
                    <div class="form-group">
                        <div class="orderParkInfoDiv">
                            <p id="orderParkInfo"></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!--orc模态框-->
<div class="modal fade" id="myModalOCR" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:700px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">拍照识别</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <video id="video" width="300" height="200" controls></video>
                        </div>
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <canvas id="canvas" width="300" height="200"
                                    style="padding:3px;border:1px dashed #f40;"></canvas>
                        </div>
                    </div>

                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal" onclick="flush()">关闭
                    </button>
                    <button class="col-sm-2 OCRcarnumber" id="capture">拍照</button>
                    <button class="col-sm-2 OCRcarnumber" style="background: #f40" onclick="goGetCarNumber()">识别车牌
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    function flush() {
        window.location.reload();
    }

    function clickCamera() {
        $("#myModalParkCar").modal("hide");
        $("#myModalOCR").modal("show");
    }

    function goGetCarNumber() {
        var img = convertCanvasToImage();
        $.ajax({
            async: false,
            url: "${pageContext.request.contextPath}/OCRNumberPark.action",
            data: {
                "Base64Image": img
            },
            type: "POST",
            success: function (data) {
                if (data == null || data.number == null) {
                    alert("请重新拍照识别！");
                    return;
                }
                $("#myModalOCR").modal("hide");
                $("#myModalParkCar").modal("show");
                $("#car_number").val(data.number);
                var a = "option:contains(" + data.province + ")";
                $("#selectId").find(a).attr("selected", true);
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
<script type="text/javascript" src="<%=basePath%>js/OCRcarNumber.js"></script>
</body>
</html>