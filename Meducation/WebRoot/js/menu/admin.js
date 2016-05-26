var status = 1;

function switchSysBar(){
	var switchPoint=document.getElementById("switchPoint");
	var frmTitle=document.getElementById("leftColumn");
	var bodyColumn=document.getElementById("bodyColumn");
     if (1 == window.status){
		  window.status = 0;
		  //alert(switchPoint);

          switchPoint.style.backgroundImage = 'url(img/TableIcon/left.gif)';
          frmTitle.style.display="none";
          bodyColumn.style.width="99%";
     }
     else{
		  window.status = 1;
          switchPoint.style.backgroundImage = 'url(img/TableIcon/right.gif)'; 
          frmTitle.style.display="";
          bodyColumn.style.width="84%";
     }
}


