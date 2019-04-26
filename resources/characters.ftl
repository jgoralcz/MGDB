<html>
	<head>
		<title>My Game Database | Characters</title>
	</head>
	
	<body>

	<h1>My Game Database</h1>
	<h2>The best SER322 Project BY FAR</h2>

	<nav>
		<a href="/mgdb">Home</a> | <a href="/mgdb/games">Games</a> | <a href="/mgdb/series">Series</a> | <a href="/mgdb/workers">Workers</a> | <a
				href="/mgdb/characters">Characters</a> | <a href="/mgdb/companies">Game Companies</a>
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