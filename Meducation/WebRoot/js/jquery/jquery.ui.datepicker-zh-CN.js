jQuery(function($){  
    $.datepicker.regional['zh-CN'] = {  
    		showButtonPanel:true,//是否显示按钮面板  
            dateFormat: 'yy-mm-dd',//日期格式  
            clearText:'清除',//清除日期的按钮名称  
            closeText:'关闭',//关闭选择框的按钮名称  
            yearSuffix: '年', //年的后缀 
            currentText: '今天', 
            showMonthAfterYear:true,//是否把月放在年的后面  
            monthNames: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],  
            dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],  
            dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],  
            dayNamesMin: ['日','一','二','三','四','五','六']
    };  
    $.datepicker.setDefaults($.datepicker.regional['zh-CN']);  
});  