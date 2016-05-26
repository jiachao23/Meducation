var obj = null;
var aLis = null;
var oBar = null;
var iTime = null;
var iSpeed = 0;
var iAcc = 3;
var onOff = 0;
var iPrev = 0;
var iNext = 0;
function goTime()
{
	for(var i = 0; i < aLis.length; i+=1)
	{
		if(aLis[i] === this)
		{
			var iTarget = (aLis[0].offsetHeight + 5) * i;
			iNext = i;
			onOff = iNext - iPrev;
			if(iTime)
			{
				clearInterval(iTime);
			}
			
			if(onOff>=0)
			{
				iTime = setInterval("elasticity("+ iTarget +")",35);
			}
			else
			{
				iTime = setInterval("postpone("+ iTarget +")",35);
			}
			
			iPrev = iNext;
		}
		aLis[i].className="left";
		this.className="active";
	}
}

function elasticity(target)
{
	var top = oBar.offsetTop;
	iSpeed+=iAcc;
	top += iSpeed;
	if(top >= target)
	{
		iSpeed*=-0.7;
		
		if(Math.abs(iSpeed)<=iAcc)
		{
			clearInterval(iTime);
			iTime=null;
		}
		
		top=target;
	}
	oBar.style.top = top + "px";
}

function postpone(target)
{
	if(oBar.offsetTop===target)
	{
		clearInterval(iTime);
		iTime=null;
	}
	else
	{
		iSpeed = (target - oBar.offsetTop)/4;
		oBar.style.top = oBar.offsetTop + iSpeed + "px";
	}
}

window.onload = function(){
	obj = document.getElementById("nav");
	aLis = obj.getElementsByTagName("li");
	oBar = document.getElementById("bar");
	
	for(var i = 0; i < aLis.length; i+=1)
	{
		if(aLis[i].id!="bar" && aLis[i].id!="firstlevel")
		{
			aLis[i].onmouseover = goTime;
		}
	}
};