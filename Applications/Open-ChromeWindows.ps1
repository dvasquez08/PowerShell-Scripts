#Define the path of chrome.exe

$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"

#Define the URLs of each tab for each Chrome window

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

#Open each Chrome window, each with its own series of tabs

$arguments1 = @("--new-window") + $window1Urls
Start-Process $chromePath -ArgumentList $arguments1

$arguments2 = @("--new-window") + $window2Urls
Start-Process $chromePath -ArgumentList $arguments2

$arguments3 = @("--new-window") + $window3Urls
Start-Process $chromePath -ArgumentList $arguments3