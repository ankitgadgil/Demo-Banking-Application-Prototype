var req;
function payBill()
{
	
	var pwd = document.getElementById("pwd");
	
	var billtype = document.getElementById("bill");

	var billamt = document.getElementById("bill_amt");


	//alert(pwd.value);	
	//alert(billamt.value);
	//alert(billtype.value);
	
	if(window.XMLHttpRequest)
	{
		req= new XMLHttpRequest();
	}	
	else if (window.ActiveXObject)
	{
		req= new ActiveXObject("Microsoft.XMLHTTP");
	}
	
		
	var url = "Payment.jsp?pwd="+pwd.value+"&bill="+billtype.value+"&billamt="+billamt.value;
	
	req.open("get",url,true);
	
	req.onreadystatechange = callback;
	
	req.send(null);
}

function callback()
{
	
	//alert("status =" + req.status);
	
	if(req.readyState == 4)
	{
		if(req.status == 200)
		{
			
			var st = req.responseText;
			
			if(st==0)
				{
					document.getElementById('status').value = "Invalid Password ";
				}
			
			else if(st<=0)
				{
					document.getElementById('status').value = "You have insufficient balance";
					//window.location = 'http://127.0.0.1:8080/project/ref/menu.jsp?user='+user.value;
				}
				else
				{
					document.getElementById('status').value = "Bill Payed. Your availabel balance is INR "+st+"/-";
				}
		}
	 
	}
}
function clear()
{
	var key = document.getElementById("uname");
	key.value = "";
}
function focusIn()
{
	document.getElementById("pass").focus();
}
