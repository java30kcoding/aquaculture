<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>清渠水产养殖系统</title>
</head>

<style>
/*设置滚动条样式*/
::-webkit-scrollbar {
  width: 10px;/*滚动条整体样式*/
}

::-webkit-scrollbar-track {
  background: rgba(255, 255, 255, 0.01);/*设定外层轨道颜色*/
}

::-webkit-scrollbar-thumb {
  background: rgba(142, 203, 242, 1);/*设置滚动的滑块颜色*/
  border-radius: 10px;/*设置滚动的滑块的边弧度*/
}

::-webkit-scrollbar-thumb:hover {
  background: rgba(225,190, 231, 1);/*设置滚动的滑块颜色变化*/
}


body{
margin:0;padding:0;
     background-image:url('images/indexbg.jpg');
     background-position:center center;
     background-repeat:no-repeat;
     background-attachment:fixed;
     background-size:cover;
}
.top{width: 100%;height: 100px;background-color: #a7d8f7;}
#logo{height:120px;position:absolute;left:50px;top:0;}
.notice{width:25%;height:200px;background-color:;margin:20px;margin-top:18px;}
.trumpet{width:16px;position:relative;top:-18px;}
#公告栏{height:430px;position:relative;left:-40px;top:-130px;}
.n1{overflow:scroll;height:125px;position:relative;left:65px;top:-450px;z-index:10;width:210px; }
h2{position:relative;z-index:9;top:-410px;left:10px;}
#rotation{
width:72%;height:200px;border:2px solid black;position:absolute;right:0;top:110px;
background-position:center center;
     background-repeat:no-repeat;
     background-attachment:fixed;
     background-size:cover;
}
#picture{height:100%;width:100%}
.left-news{width:25%;height:350px;background-color:;margin:20px;position:absolute;top:305px;}
.ln{cursor: pointer;}
.ln:hover{color:#bc06ca}
.ln1{border:2px solid lightblue;border-radius:20px;}
.right-news{width:72%;height:350px;background-color:;position:absolute;left:350px;top:+325px;overflow:scroll;}
.cr-if{width:100%;height:100px;background-color:rgba(167,216,247,0.5);position:absolute;top:700px;}
.text1{font-size:20px;position:absolute;right:40px;top:15px;font-weight:600;}
#日历{height:80px;position:absolute;right:220px;top:15px;}
.text2{font-size:25px;position:relative;left:250px;top:20px;width:1000px;border-radius:0 0 4px 4px;}
.t2{color:black;text-decoration:none;padding:10px;}
.t2:hover{background-color:#1488fa;color:rgba(255,255,255,1)}
#cr-if{height:100px;position:relative;left:50px;top:20px;border-radius:20px;top:8px;}
h4{position:relative;left:200px;top:-60px;width:1000px;}


</style>

<script type="text/javascript">
var interval = window.setInterval("rightImg()", 2000);

var imgArr = new Array();

imgArr[0] = "url(images/轮播图1.jpg)";
imgArr[1] = "url(images/轮播图2.jpg)";
imgArr[2] = "url(images/轮播图3.jpg)";

var bout;
var tabArr;
window.onload = function() {
	  bout = document.getElementById("rotation");}
	  
function startInterval() {
    interval = window.setInterval("rightImg()", 2000);
   }

   var index = 0;

   function changeImage() {

    bout.style.backgroundImage = imgArr[index];
   }

    
   function rightImg() {
    index++;
    if(index > 2) {
     index = 0;
    }
    changeImage();
   }

</script>




<body>

<div class="top">
<marquee onmouseout="this.start()" onmouseover="this.stop()" 
bgcolor=white direction="right" scrollamount=6 scrolldelay=50> 欢迎访问清渠水产养殖网站</marquee>


    <div class="logo"><img id="logo" src="images/LOGO.png"></div>
    <div class="trumpet"><img id="trumpet" src="images/trumpet.png"></div>
    <div class="text1">
    <img id="日历" src="images/日历.png">
    <br>
    今天是2020年6月12日<br>
 
    </div>
    <div class="text2" >
    <a  href="#" class="t2" >首页</a>
    <a  href="http://localhost:8088/login" class="t2">登录</a>
    <a  href="#" class="t2">网上市场</a>
    <a href="#" class="t2">清渠小知识</a>
    <a  href="#" class="t2" >关于清渠</a>
    </div>


</div>

<div class="notice">
     <img id="公告栏" src="images/公告栏.png">
     <h2>&emsp;&emsp;&emsp;&emsp;&emsp;公告栏</h2>
     
     <div class="n1"> <h5>&emsp;&emsp;今日，农业和科技局组织市内有关专家对厦门市清渠水产养殖开发有限公司实施的《清渠水产养殖基地建设项目》进行验收，
    专家组通过听取项目单位汇报、实地查看、查阅相关文档、询答、项目资金使用合理规范，严格按照项目书进行，符合验收条件，专家组一致同意通过验收。</h5> 
  <h5>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;2020年6月12日</h5></div>
 
</div>

<!-- 轮播框图 -->
<div id="rotation">
   
</div>

<div class="left-news">
   <div class="ln1"> <h3 class="ln">&emsp;&emsp;·水产养殖也能搭乘智慧农业实现精准高效养殖&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;></h3></div>
   <div class="ln1"> <h3 class="ln">&emsp;&emsp;·就业压力山大，美国想捡中国水产养殖玩剩的？</h3></div> 
    <div class="ln1"><h3 class="ln">&emsp;&emsp;·水产养殖添新军 “匙吻鲟”养出大产业</h3></div> 
   <div class="ln1"> <h3 class="ln">&emsp;&emsp;·“光伏＋水产养殖”新模式，再也不用担心挣来的钱交电费了</h3></div> 
    
</div>

<div class="right-news">

     <h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;水产养殖也能搭乘智慧农业实现精准高效养殖</h3>
<p>&emsp;&emsp;俗话说：“养好一池鱼，先管好一池水”，水质的好坏，关系着水产养殖的成败。决定水质的因素主要为水温、溶氧量、酸碱度等环境因子，而这些指标都是看不见摸不着的东西。
我国水产养殖虽然历史悠久，但是与欧美、以色列等先进的水产养殖国家相比，他们的水产养殖效率是我国的30—100倍，我国的水产养殖对于人的依赖程度很高，
而欧美、日本、以色列等国家广泛采用农业物联网设备开展智能监控养殖，不仅可以节约大量的人力成本，更可以有效地降低风险，提升养殖效率与效益。</p>
<p>&emsp;&emsp;在复杂而又多变的农业面前，没有精准的智能监控，单纯依靠“天命”就像是在赌博。</p>
<p>&emsp;&emsp;2017年6月，高温热浪侵袭山东，枣庄一个养鱼场的鱼自6月1日起陆续暴毙，至6月4日已有3万公斤鱼死亡，养鱼场损失超过40万元。经过调查推断疑因气温太高，以致鱼类缺氧死亡。</p>
<p>&emsp;&emsp;2016年3月，南川区大观镇一池塘在一夜之间几乎全部死亡，损失近2万斤鱼。</p>
<p>&emsp;&emsp;2015年6月，四川广元市一个水库由于洪水污染导致近万斤鱼死亡。</p>
<p>&emsp;&emsp;类似事件每年都在发生。水产养殖依赖于水环境的生态平衡，然而水下的情况靠人工往往难以观察，因此借助智慧农业物联网设备对池塘水质进行智能监控尤为重要。
随着我国智慧农业的快速发展，农田智能化越来越普遍，水产养殖也紧跟步伐，朝着智能化、精细化方向发展。在湖南株洲的一个生态水产合作社，
这里的鱼塘看起来与别的鱼塘并无两样，但是其养殖效率、成鱼存活率却大大高于一般鱼塘，养殖户的工作量也减少很多。当传统的鱼塘遇见了农业物联网，鱼塘就“活了起来”，
一切都变得智能化。众民合作社的养殖户开始采用慧云信息的“水产养殖智能监控系统”，在鱼塘里安装智能监控设备，养殖户们在家中可通过电脑了解鱼塘的情况，
不仅能实时采集鱼塘的水温、溶氧量、酸碱度等关键数据，还能看到实时视频，时刻关注鱼塘变化情况，大大提升了养殖效率。</p>


</div>

<div class="cr-if">
<img id="cr-if" src="images/cr.png">
<h4>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;闽ICP证030173号-1   闽网文【2013】0934-983号     ©2020Qingqu  清渠  |  知道协议 </h4> 

</div>


</body>
</html>