<html>
    <head>
        <title>My Game Database | Series</title>
    </head>

    <body>
        <#if add??>
            ${add}
        <#elseif entries??>
            <#list 0..entries?size-1 as i>
                <b>${i}: ${entries[i]}</b><br>
            </#list>
        <#elseif remove??>
            ${remove}
        </#if>
        </body>
</html>