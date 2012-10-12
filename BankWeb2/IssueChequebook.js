var req;

function issueChequebook()
{

	var pwd = document.getElementById("pwd");
	var no = document.getElementById("cb_no");
	var leaves = document.getElementById("cb_leaves");


	//alert(" pwd="+pwd.value);
	//	alert(" no="+no.value);
	//	alert("leaves="+leaves.value);
	
	if(window.XMLHttpRequest)
	{
		req= new XMLHttpRequest();
	}	
	else if (window.ActiveXObject)
	{
		req= new ActiveXObject("Microsoft.XMLHTTP");
	}
	
		
	var url = "IssueChequebook.jsp?pwd="+pwd.value+"&no="+no.value+"&leaves="+leaves.value;
	req.open("get",url,true);
	req.onreadystatechange = callback;
	req.send(null);
		
		//var url = "IssueChequebook.jsp?no=" + no.value+"&leaves="+leaves.value+"&user="+user.value+"&pwd="+pwd.value;
		
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
			
				else  if(st<13000)
				{
					document.getElementById('status').value = " Sorry, you have insufficient funds to issue a chequebook";
				}
				else 
				{
					document.getElementById('status').value = " Request Received. Checquebook(s) will be issued soon.";
				}
			//document.getElementById('bal').value=st;
		}
	//clear();
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
