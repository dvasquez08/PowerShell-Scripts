$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$urls = @(
    "https://github.com"
    "https://medium.com"
    "https://linkedin.com"
)

Start-Process $chromePath -ArgumentList $urls
