
$adminSiteUrl = "https://5tqkst-admin.sharepoint.com/"
$siteCollectionUrl = "https://5tqkst.sharepoint.com/sites/Demo"

#connect to tenant admin site
Connect-PnPOnline -Url $adminSiteUrl -Interactive

$appCatalog = Get-PnPSiteCollectionAppCatalogs | Where-Object {$_.AbsoluteUrl -eq $siteCollectionUrl}

#Check if App catalog exists for current site collection
if( -not $appCatalog){
    Write-Host -ForegroundColor Yellow "Provisioning App catalog..." -NoNewline
    Add-PnPSiteCollectionAppCatalog -Site $siteCollectionUrl
    Write-Host -ForegroundColor Yellow "Completed" 
}
else {
    Write-Host -ForegroundColor green "App Catalog Exists"
}

#connect to site collection
Connect-PnPOnline -Url $siteCollectionUrl -Interactive

#change folder path to current file location
Set-Location  $PSScriptRoot

Get-PnPSite

#upload & deploy SPFX deployment package to site collection's app catalog
Add-PnPApp -Path ..\sharepoint\solution\leave-request.sppkg -Scope Site -Publish -Overwrite -Verbose

