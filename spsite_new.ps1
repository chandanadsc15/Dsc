Configuration SharePoint
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsGlobalAdmin
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        SPOSite DemoSite
        {
            Url                                         = "https://dsc15.sharepoint.com/sites/test3"
            StorageMaximumLevel                         = 26214400
            LocaleId                                    = 1033
            Template                                    = "STS#3"
            GlobalAdminAccount                          = $credsGlobalAdmin
            Owner                                       = "csasi@dsc15.onmicrosoft.com"
            Title                                       = "TestSite"
            TimeZoneId                                  = 13
            Ensure                                      = "Present"
            StorageWarningLevel                         = 25574400
            SharingCapability                           = "Disabled"
            CommentsOnSitePagesDisabled                 = $false
            DisableAppViews                             = "NotDisabled"
            DisableCompanyWideSharingLinks              = "NotDisabled"
            DisableFlows                                = $false
            DefaultSharingLinkType                      = "None"
            DefaultLinkPermission                       = "None"
        }
    }
}
$cd = @{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            PSDscAllowDomainUser = $true
            PSDscAllowPlainTextPassword = $true
        }
    )

NonNodeData = @(
        @{
            # API Token for the Teams SDN Provider for Meeting Broadcast
            SdnApiToken = "**********"

        }
    )
}
SharePoint  -ConfigurationData $cd
