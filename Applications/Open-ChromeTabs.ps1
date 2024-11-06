#Define the path of chrome.exe

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

#Define the URLs for the different tabs

$urls = @(
    "https://github.com"
    "https://medium.com"
    "https://linkedin.com"
)

#Open chrome with the different tabs

Start-Process $chromePath -ArgumentList $urls
