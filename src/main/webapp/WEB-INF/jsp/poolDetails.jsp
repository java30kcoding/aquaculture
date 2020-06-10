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
    <title>水库详情</title>
    <style>
        .col-md-3 {
            border-radius: 25px;
            color: #fff;
            text-align: center;
            padding-bottom: 50px;
        }

        .col-md-3 img {
            margin-top: 30px;
        }

        .two {
            padding-top: 50px;
            padding-bottom: 50px;
            border: 1px solid #d3d3d3;
            border-radius: 30px
        }

        .welcome {
            padding: 10px 50px;
            border-radius: 30px;
            margin-top: 80px;
            color: #37a;
            background: #d3d3d3;
            margin-bottom: 10px;
        }

        .icon {
            height: 15px;
            width: 15 px；
        }

        .icon-text {
            margin-left: 5px;
            font-size: 12px
        }

        .error {
            color: red
        }
    </style>
</head>
<body>
<!--导航栏开始-->
<c:import url="navbarModel.jsp"></c:import>

<!--主体信息开始-->
<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <div class="welcome">
                <h2>"${c.poolCode}"&nbsp;水库池塘管理</h2>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="panel panel-success">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <h4>${c.poolCode}</h4>
                <p>
                    位置：${c.poolLocation}<br> 描述：${c.poolRemark}<br>
                    池塘总数：${c.poolTotal}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br>
                    <button style="background: #00B51D; color: white"
                            data-toggle="modal" data-target="#myModalUpdate">修改水库信息
                    </button>
                    <button style="background: #f40; color: white" data-toggle="modal"
                            data-target="#myModalAddCarspace">添加池塘
                    </button>
                </p>
            </div>
            <!-- Table -->
            <table class="table">
                <tr>
                    <td>#</td>
                    <td>名称</td>
                    <td>面积</td>
                    <td>深度</td>
                    <td>品种</td>
                    <td>密度</td>
                    <td>含氧量</td>
                    <td>氨氮含量</td>
                    <td>ph值</td>
                    <td>温度</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${pList}" var="csp" varStatus="id">
                    <tr>
                        <td>${id.count}</td>
                        <td>${csp.poolName}</td>
                        <td>${csp.poolArea}</td>
                        <td>${csp.poolDeep}米</td>
                        <td>${csp.poolType}</td>
                        <td>${csp.poolDensity}</td>
                        <td>${csp.poolOxygen}</td>
                        <td>${csp.poolAmmonia}</td>
                        <td>${csp.poolPh}</td>
                        <td>${csp.poolTemperature}</td>
<%--                        <c:choose>--%>
<%--                            <c:when test="${csp.s_type eq 1}">--%>
<%--                                <td>小池塘</td>--%>
<%--                            </c:when>--%>
<%--                            <c:when test="${csp.s_type eq 2}">--%>
<%--                                <td>大池塘</td>--%>
<%--                            </c:when>--%>
<%--                        </c:choose>--%>
<%--                        <c:if test="${csp.s_state eq 0}">--%>
<%--                            <td><span style="color: green; font-size: 8px">空闲</span></td>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${csp.s_state eq 1}">--%>
<%--                            <td><span style="color: red; font-size: 8px">有车</span></td>--%>
<%--                        </c:if>--%>
                        <td>
                            <button
                                    onclick="carspaceInfo(${csp.id},${c.id},'${csp.poolName}','${csp.poolArea}','${csp.poolDeep}','${csp.poolType}',
                                            '${csp.poolDensity}','${csp.poolOxygen}','${csp.poolAmmonia}','${csp.poolPh}','${csp.poolTemperature}')"
                                    type="button"
                                    style="background: 37a; height: 25px; width: 40px; border-radius: 5px; background: #4cae4c; color: white; font-size: 8px">
                                修改
                            </button>
                            <button id="deleteCarspace"
                                    onclick="deleteCarspace(${csp.id},${c.id},${c.poolTotal})"
                                    type="button"
                                    style="background: 37a; height: 25px; width: 40px; border-radius: 5px; background: #f40; color: white; font-size: 8px">
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<c:import url="bottomModel.jsp"></c:import>
<script type="text/javascript">
    function carspaceInfo(id,area_id,poolName,poolArea,poolDeep,poolType,poolDensity,poolOxygen,poolAmmonia,poolPh,poolTemperature) {
        $("#poolInfo_id").val(id);
        $("#poolInfo_poolAreaId").val(area_id);
        $("#poolInfo_poolName").val(poolName);
        $("#poolInfo_poolArea").val(poolArea);
        $("#poolInfo_poolDeep").val(poolDeep);
        $("#poolInfo_poolType").val(poolType);
        $("#poolInfo_poolDensity").val(poolDensity);
        $("#poolInfo_poolOxygen").val(poolOxygen);
        $("#poolInfo_poolAmmonia").val(poolAmmonia);
        $("#poolInfo_poolPh").val(poolPh);
        $("#poolInfo_poolTemperature").val(poolTemperature);
        $('#myModalCarspaceUpdate').modal('show');
    }

    function deleteCarspace(sid, cid, ctotal) {
        if (confirm('确定要删除该池塘吗?')) {
            $.ajax({
                async: false,
                url: "${pageContext.request.contextPath}/deletePoolInfo.action",
                type: "POST",
                data: {
                    "id": sid,
                    "areaId": cid,
                    "total": ctotal
                },
                success: function (data) {
                    if (data == "OK") {
                        alert("删除成功！");
                        window.location.reload();
                    } else {
                        alert("删除失败！")
                    }
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

</script>
<!--添加池塘-->
<div class="modal fade" id="myModalAddCarspace" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加池塘</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="add_carspaceInfo">
                    <div style="display: none">
                        <input id="carstation_id" value="${c.id}"/>
                    </div>
                    <div class="form-group">
                        <label for="add_name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_name"
                                   placeholder="输入池塘名称" name="add_name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolArea" class="col-sm-2 control-label">面积</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolArea"
                                   placeholder="输入池塘面积" name="add_poolArea"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolDeep" class="col-sm-2 control-label">深度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolDeep"
                                   placeholder="输入池塘深度" name="add_poolDeep"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolType" class="col-sm-2 control-label">品种</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolType"
                                   placeholder="输入池塘品种" name="add_poolType"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolDensity" class="col-sm-2 control-label">密度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolDensity"
                                   placeholder="输入池塘密度" name="add_poolDensity"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolOxygen" class="col-sm-2 control-label">含氧量</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolOxygen"
                                   placeholder="输入池塘含氧量" name="add_poolOxygen"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolPh" class="col-sm-2 control-label">ph值</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolPh"
                                   placeholder="输入池塘ph值" name="add_poolPh"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolAmmonia" class="col-sm-2 control-label">氨氮含量</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolAmmonia"
                                   placeholder="输入池塘氨氮含量" name="add_poolAmmonia"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolTemperature" class="col-sm-2 control-label">温度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="add_poolTemperature"
                                   placeholder="输入池塘温度" name="add_poolTemperature"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="updatenfoBtn">添加</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--修改池塘-->
<div class="modal fade" id="myModalCarspaceUpdate" tabindex="-1"
     role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改池塘信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="edit_carspaceInfo">
                    <div style="display: none">
                        <input id="carspace_id"/>
                    </div>
                    <div class="form-group" hidden>
                        <label for="add_name" class="col-sm-2 control-label">id</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_id"
                                   placeholder="输入池塘名称" name="poolInfo_id"/>
                        </div>
                    </div>
                    <div class="form-group" hidden>
                        <label for="add_name" class="col-sm-2 control-label">area_id</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolAreaId"
                                   placeholder="输入池塘名称" name="poolInfo_poolAreaId"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolName"
                                   placeholder="输入池塘名称" name="poolInfo_poolName"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolArea" class="col-sm-2 control-label">面积</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolArea"
                                   placeholder="输入池塘面积" name="poolInfo_poolArea"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolDeep" class="col-sm-2 control-label">深度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolDeep"
                                   placeholder="输入池塘深度" name="poolInfo_poolDeep"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolType" class="col-sm-2 control-label">品种</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolType"
                                   placeholder="输入池塘品种" name="poolInfo_poolType"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolDensity" class="col-sm-2 control-label">密度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolDensity"
                                   placeholder="输入池塘密度" name="poolInfo_poolDensity"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolOxygen" class="col-sm-2 control-label">含氧量</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolOxygen"
                                   placeholder="输入池塘含氧量" name="poolInfo_poolOxygen"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolPh" class="col-sm-2 control-label">ph值</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolPh"
                                   placeholder="输入池塘ph值" name="poolInfo_poolPh"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolAmmonia" class="col-sm-2 control-label">氨氮含量</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolAmmonia"
                                   placeholder="输入池塘氨氮含量" name="poolInfo_poolAmmonia"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_poolTemperature" class="col-sm-2 control-label">温度</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="poolInfo_poolTemperature"
                                   placeholder="输入池塘温度" name="poolInfo_poolTemperature"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary" id="updatenfoBtn">修改</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--修改水库-->
<div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改水库信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="edit_carstationInfo">
                    <div style="display: none">
                        <input value="${c.id}" id="edit_id"/>
                    </div>
                    <div class="form-group">
                        <label for="edit_name" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_name"
                                   value="${c.poolCode}" name="name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_location" class="col-sm-2 control-label">位置</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_location"
                                   value="${c.poolLocation}" name="location"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_description" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="edit_description"
                                   value="${c.poolRemark} " name="description"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_total" class="col-sm-2 control-label">池塘总数</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="edit_total"
                                   readonly="readonly" value="${c.poolTotal}" name="edit_total"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary"
                                id="updateUserInfoBtn">修改
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#edit_carstationInfo").validate({
            rules: {
                "name": {
                    "required": true,
                    "rangelength": [2, 12],
                },
                "location": {
                    "required": true,
                },
                "price": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                },
                "time": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                }
            },
            messages: {
                "name": {
                    "required": "水库名称不能为空",
                    "rangelength": "水库名称长度为2-12位",
                },
                "location": {
                    "required": "位置描述不能为空"
                },
                "price": {
                    "required": "价格不能为空",
                    "number": "价格为整数或小数",
                    "min": "最小为0.01"
                },
                "time": {
                    "required": "时间不能为空",
                    "number": "时间为整数或小数",
                    "min": "最小为0.01"
                }
            },
            submitHandler: function (form) {
                if (confirm('确定要提交已编辑的信息吗?')) {
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/updatePoolArea.action",
                        data: {
                            "id": $("#edit_id").val(),
                            "poolCode": $("#edit_name").val(),
                            "poolLocation": $("#edit_location").val(),
                            "poolRemark": $("#edit_description").val(),
                            "poolTotal": $("#edit_total").val()
                        },
                        type: "POST",
                        success: function (data) {
                            if (data == "OK") {
                                alert("修改水库信息成功！");
                                window.location.reload();
                            } else {
                                alert("修改水库信息失败！")
                            }
                            $("#myModalUpdate").modal('hide');
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

    $(function () {
        $("#edit_carspaceInfo").validate({
            rules: {
                "carspace_name": {
                    "required": true,
                    "rangelength": [2, 12],
                },
                "carspace_price": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                },
                "carspace_time": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                }
            },
            messages: {
                "carspace_name": {
                    "required": "池塘名称不能为空",
                    "rangelength": "池塘名称长度为2-12位",
                },
                "carspace_price": {
                    "required": "价格不能为空",
                    "number": "价格为整数或小数",
                    "min": "最小为0.01"
                },
                "carspace_time": {
                    "required": "时间不能为空",
                    "number": "时间为整数或小数",
                    "min": "最小为0.01"
                }
            },
            submitHandler: function (form) {
                if (confirm('确定要提交已编辑的信息吗?')) {
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/updatePoolInfo.action",
                        data: {
                            "id": $("#poolInfo_id").val(),
                            "poolAreaId": $("#poolInfo_poolAreaId").val(),
                            "poolName": $("#poolInfo_poolName").val(),
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
                        success: function (data) {
                            if (data == "OK") {
                                alert("修改池塘信息成功！");
                                window.location.reload();
                            } else {
                                alert("修改池塘信息失败！")
                            }
                            $("#myModalCarspaceUpdate").modal('hide');
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

    $(function () {
        $("#add_carspaceInfo").validate({
            rules: {
                "add_name": {
                    "required": true,
                    "rangelength": [2, 12],
                },
                "add_price": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                },
                "add_time": {
                    "required": true,
                    "number": true,
                    "min": 0.01
                }
            },
            messages: {

            },
            submitHandler: function (form) {
                if (confirm('确定要提交已编辑的信息吗?')) {
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/addPoolInfo.action",
                        data: {
                            "poolAreaId": $("#carstation_id").val(),
                            "poolName": $("#add_name").val(),
                            "poolArea": $("#add_poolArea").val(),
                            "poolDeep": $("#add_poolDeep").val(),
                            "poolType": $("#add_poolType").val(),
                            "poolDensity": $("#add_poolDensity").val(),
                            "poolOxygen": $("#add_poolOxygen").val(),
                            "poolPh": $("#add_poolPh").val(),
                            "poolAmmonia": $("#add_poolAmmonia").val(),
                            "poolTemperature": $("#add_poolTemperature").val()
                        },
                        type: "POST",
                        success: function (data) {
                            if (data == "OK") {
                                alert("添加池塘成功！");
                                window.location.reload();
                            } else {
                                alert("添加池塘失败！")
                            }
                            $("#myModalAddCarspace").modal('hide');
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
</body>
</html>

