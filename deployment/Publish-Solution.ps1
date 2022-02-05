

$adminSiteUrl = "https://5tqkst-admin.sharepoint.com/"
$siteCollectionUrl = "https://5tqkst.sharepoint.com/sites/Demo"



Connect-PnPOnline -Url $adminSiteUrl -Interactive

$appCatalog = Get-PnPSiteCollectionAppCatalogs | Where-Object {$_.AbsoluteUrl -eq $siteCollectionUrl}

if( -not $appCatalog){
    Write-Host -ForegroundColor Yellow "Provisioning App catalog..." -NoNewline
    Add-PnPSiteCollectionAppCatalog -Site $siteCollectionUrl
    Write-Host -ForegroundColor Yellow "Completed" 
}
else {
    Write-Host -ForegroundColor green "App Catalog Exists"
}
Connect-PnPOnline -Url $siteCollectionUrl -Interactive

Set-Location  $PSScriptRoot

#Get-ChildItem ..\sharepoint\solution\leave-request.sppkg

Get-PnPSite



Add-PnPApp -Path ..\sharepoint\solution\leave-request.sppkg -Scope Site -Publish -Overwrite -Verbose

#Add-PnPSiteCollectionAppCatalog -Site https://5tqkst.sharepoint.com/sites/Lr01