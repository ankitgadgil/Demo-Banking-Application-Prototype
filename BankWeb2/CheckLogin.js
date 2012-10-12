var req;
function authenticate()
{
	var user = document.getElementById("user");
	var pwd = document.getElementById("pwd");
	
	//alert(user.value);	
	//alert(pwd.value);
	
	if(window.XMLHttpRequest)
	{
		req= new XMLHttpRequest();
	}	
	else if (window.ActiveXObject)
	{
		req= new ActiveXObject("Microsoft.XMLHTTP");
	}
	
		
	var url = "CheckLogin.jsp?user=" + user.value+"&pwd="+pwd.value;
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
					document.getElementById('status').value = "Invalid Username or Password ";
				}
			
			else	 
				{
					//alert(user.value);
					window.location = 'http://127.0.0.1:8080/BankWeb2/profile.jsp?user='+user.value;
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
