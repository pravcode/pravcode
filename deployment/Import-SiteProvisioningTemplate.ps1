
$siteCollectionUrl = "https://5tqkst.sharepoint.com/sites/Demo"

#connect to tenant admin site
Connect-PnPOnline -Url $adminSiteUrl -Interactive

#connect to site collection
Connect-PnPOnline -Url $siteCollectionUrl -Interactive

#change folder path to current file location
Set-Location  $PSScriptRoot

Get-PnPSite

#cmd commented below on purpose to avoid accidental overwriting of the site
#Invoke-PnPSiteTemplate -Schema LATEST  -Out SiteProvisioningTemplate.xml -Force 

