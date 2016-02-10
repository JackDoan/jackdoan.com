// ==UserScript==
// @name         Pucasauce
// @namespace    http://your.homepage/
// @version      0.1
// @description  enter something useful
// @author       Uncle Bourbon
// @match        *pucatrade.com/cards/show/*
// @grant        GM_xmlhttpRequest
// @require      http://code.jquery.com/jquery-latest.js

// ==/UserScript==

// @require     http://courses.ischool.berkeley.edu/i290-4/f09/resources/gm_jq_xhr.js
// @require      http://code.highcharts.com/stock/highstock.js
// @require      http://code.highcharts.com/stock/modules/exporting.js



(function () {
    var scriptElement = document.createElement( "script" );
    scriptElement.type = "text/javascript";
    scriptElement.src = "https://code.highcharts.com/stock/highstock.js";
    document.body.appendChild( scriptElement );
})();

GM_xmlhttpRequest({
    method: "GET",
    url: "https://jackdoan.com/pucatrade/api.php?card="+$(".headerbar > h1").html(),           
    onload: function(response) {
    $(".chart_image").css("background","");
    $(".chart_image").html( response.responseText );
    chartMobile();
  }
})



//$(".headerbar > h1").html() //gives card name
//$(".expansion > span").html() //gives expansion
