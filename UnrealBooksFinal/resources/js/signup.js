$(document).ready(function()
{
	$("#submitBtn").click(function(event)
	{
		var name = $("#name").val();
		var email = $("#email").val();
		var password = $("#password").val();
		var confirmation = $("#confirmation").val();
		var address = $("#address").val();

		if(password !== confirmation) 
		{
			event.preventDefault();
			$("#message").html("Passwords do not match.");
		}
		else if(name == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all mandatory fields.");

		}
		else if(email == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all mandatory fields.");

		}
		else if(password == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all mandatory fields.");

		}
		else if(confirmation == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all mandatory fields.");

		}
		else if(address == "")
		{
			event.preventDefault();
			$("#message").html("Please fill in all mandatory fields.");

		}
		else
		{
			$("form").submit();
		}
	});
});
