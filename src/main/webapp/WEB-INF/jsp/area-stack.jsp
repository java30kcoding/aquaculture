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
<html style="height: 100%">
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
       <meta charset="utf-8">
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/echarts-gl.min.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/ecStat.min.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/dataTool.min.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/china.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/world.js"></script>
       <script type="text/javascript" src="<%=basePath%>js/bmap.min.js"></script>
       <script type="text/javascript">
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
var poolInfos = '${poolInfos}';
if(poolInfos != '') {
    poolInfos = JSON.parse(poolInfos);
}
var seriesList = '${seriesList}';
if(seriesList != '') {
    seriesList = JSON.parse(JSON.stringify(seriesList));
}
var length = poolInfos.length;
option = null;
option = {
    title: {
        // areaname  后台查询一下
        text: '堆叠区域图'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross',
            label: {
                backgroundColor: '#6a7985'
            }
        }
    },
    legend: {
        data: ['邮件', '联盟广告', '视频广告', '直接访问', '搜索引擎']
        <%-- data:${poolNameList}--%>
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis: [
        {
            type: 'category',
            boundaryGap: false,
            // data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
            data: ['周一', '周二', '周三', '周四', '周五']
            <%--data: ${namelist}--%>
        }
    ],
    yAxis: [
        {
            type: 'value'
        }
    ],
    series:  ${seriesList}
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
       </script>
   </body>
</html>