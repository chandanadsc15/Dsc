Configuration CreatingTeam
{param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsGlobalAdmin
    )

    Import-DscResource -ModuleName Microsoft365DSC
         

    node localhost
    {
        TeamsTeam MyTeam2
        {
            DisplayName                       = "Offshore"
            Description                       = "Offshore"
            Visibility                        = "Private"
            MailNickName                      = "Offshore"
            Owner="csasi@dsc15.onmicrosoft.com"

            AllowUserEditMessages             = $false
            AllowUserDeleteMessages           = $false
            AllowOwnerDeleteMessages          = $false
            AllowTeamMentions                 = $false
            AllowChannelMentions              = $false
            allowCreateUpdateChannels         = $false
            AllowDeleteChannels               = $false
            AllowAddRemoveApps                = $false
            AllowCreateUpdateRemoveTabs       = $false
            AllowCreateUpdateRemoveConnectors = $false
            AllowGiphy                        = $True
            GiphyContentRating                = "strict"
            AllowStickersAndMemes             = $True
            AllowCustomMemes                  = $True
            AllowGuestCreateUpdateChannels    = $true
            AllowGuestDeleteChannels          = $true
           GlobalAdminAccount                = $credsGlobalAdmin
            Ensure                            = "Present"
        }
        TeamsChannel MyChannel
        {
            TeamName           = "Offshore"
            DisplayName        = "Cofco1"
            NewDisplayName     = "Cofco1"
            Description        = "Testing"
            Ensure             = "Present"
           
           GlobalAdminAccount = $credsGlobalAdmin
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
}
CreatingTeam -ConfigurationData $cd


