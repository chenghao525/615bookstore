$(document).ready(function()
{
	$("#submitBtn").click(function(event)
	{
		var email = $("#email").val();
		var password = $("#password").val();
		var verification = $("#verification").val();

		if(email == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all fields");
		}
		else if(password == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all fields");
		}
		else if(verificaiton == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all fields");
		}
		else
		{
			$("form").submit();
		}
	});
});
