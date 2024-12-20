<#
.SYNOPSIS   
Create a HTML redirect page with a custom favicon for use as a bookmark in Firefox.

.DESCRIPTION
This script will create a HTML redirect page with a custom favicon. This can be used a bookmark in Firefox.

.PARAMETER name
The name of the bookmark.

.PARAMETER url
The URL to redirect to.

.PARAMETER icon
Path the .ico file to use as the favicon.

.EXAMPLE
New-FF-Favicon -name "Google" -url "https://www.google.com" -icon "C:\favicon.ico"

This will create a file called "Google.html" with a redirect to "https://www.google.com" and a favicon from "C:\favicon.ico".

.LINK
https://www.github.com/dmaccormac


#>

    param(
        [string]$name,
        [string]$url,
        [string]$icon,
        [string]$outfilepath = "${env:USERPROFILE}\Links\${name}.html"
    )

    $html = @"
<!DOCTYPE html>
<html>
<head>
    <title>$name</title>
    <link rel="icon" href="file:///$icon" type="image/x-icon">
    <meta http-equiv="refresh" content="5;url=$url">
</head>
<body>   
    <p>Redirecting to <a href="$url">$url</a>
</body>
</html>
"@
    $html | Out-File -FilePath $outfilepath


