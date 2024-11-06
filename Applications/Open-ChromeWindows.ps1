$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$window1Urls = @(
    "https://github.com"
    "https://medium.com"
    "https://linkedin.com"
)

$window2Urls = @(
    "https://gmail.com"
    "https://google.com"
)

$window3Urls = @(
    "https://stackoverflow.com"
    "https://youtube.com"
)

$arguments1 = @("--new-window") + $window1Urls
Start-Process $chromePath -ArgumentList $arguments1

$arguments2 = @("--new-window") + $window2Urls
Start-Process $chromePath -ArgumentList $arguments2

$arguments3 = @("--new-window") + $window3Urls
Start-Process $chromePath -ArgumentList $arguments3