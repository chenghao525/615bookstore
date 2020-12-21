$(document).ready(function()
{
	$("#submitBtn").click(function(event)
	{
		var card = $("#card").val();
		var date = $("#date").val();
		var billingAddress = $("#billingAddress").val();
		var cvv = $("#cvv").val();

		if(card == "")
		{
			event.preventDefault();
			$("#paymentMessage").html("Please fill in all payment fields.");
		}
		else if(date == "")
		{
			event.preventDefault();
			$("#paymentMessage").html("Please fill in all payment fields.");
		}
		else if(billingAddress == "")
		{
			event.preventDefault();
			$("#paymentMessage").html("Please fill in all payment fields.");
		}
		else if(cvv == "")
		{
			event.preventDefault();
			$("#paymentMessage").html("Please fill in all payment fields.");
		}
		else
		{
			$("payment").submit();
		}
	});
});
