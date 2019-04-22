<html>
	<head>
		<title>My Game Database | Games</title>
	</head>
	
	<body>
	<a href="index.html">Home</a>
	<br>
		<#if add??>
			${add}
		<#elseif entries??>
			<#list 0..entries?size-1 as i>
				<b>${i+1}: ${entries[i]?replace('\n', '<br>')}</b><br><br>
			</#list>
		<#elseif remove??>
			${remove}
		</#if>
	</body>
</html>  