param(
  [string]$SiteUrl = "https://theonephos.com",
  [string]$SitemapPath = "sitemap.xml",
  [string]$Key = "7239f4ce5a4c4c7db4acbfd79d7ac268",
  [string]$Endpoint = "https://api.indexnow.org/indexnow",
  [switch]$DryRun
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $SitemapPath)) {
  throw "Sitemap file not found: $SitemapPath"
}

$siteUri = [Uri]$SiteUrl
$hostName = $siteUri.Host
$keyFileName = "$Key.txt"
$keyFilePath = Join-Path (Get-Location) $keyFileName
$keyLocation = "$SiteUrl/$keyFileName"

if (-not (Test-Path -LiteralPath $keyFilePath)) {
  throw "Key file not found in project root: $keyFileName"
}

$keyFileContent = (Get-Content -LiteralPath $keyFilePath -Raw).Trim()
if ($keyFileContent -ne $Key) {
  throw "Key file content does not match -Key value."
}

[xml]$sitemapXml = Get-Content -LiteralPath $SitemapPath -Raw
$urls = @(
  $sitemapXml.urlset.url |
  ForEach-Object { $_.loc } |
  ForEach-Object { "$_".Trim() } |
  Where-Object { $_ -ne "" }
)

if ($urls.Count -eq 0) {
  throw "No URLs found in sitemap: $SitemapPath"
}

$payload = @{
  host = $hostName
  key = $Key
  keyLocation = $keyLocation
  urlList = $urls
}

$json = $payload | ConvertTo-Json -Depth 5 -Compress

Write-Output "IndexNow endpoint: $Endpoint"
Write-Output "Host: $hostName"
Write-Output "URLs: $($urls.Count)"
Write-Output "Key file: $keyFileName"

if ($DryRun) {
  Write-Output "Dry run enabled. No request sent."
  exit 0
}

Invoke-RestMethod -Method Post -Uri $Endpoint -ContentType "application/json; charset=utf-8" -Body $json | Out-Null
Write-Output "IndexNow submission completed."
