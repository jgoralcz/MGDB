<html>
	<head>
		<title>My Game Database | Characters</title>
	</head>
	
	<body>

	<nav>
		<a href="/mgdb">Home</a> | <a href="/games">Games</a> | <a href="/series">Series</a> | <a href="/workers">Workers</a> | <a
				href="/characters">Characters</a> | <a href="/companies">Game Companies</a>
	</nav>

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