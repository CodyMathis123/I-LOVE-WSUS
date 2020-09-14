function Resolve-ILWDesiredSSLState {
    param(
        [Parameter(Mandatory = $true)]
        [WSUSComponent]$WSUSComponent,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled')]
        [string]$SSLState
    )
    switch -Regex ($WSUSComponent.ToString()) {
        '^ApiRemoting30$|^ClientWebService$|^DssAuthWebService$|^ServerSyncWebService$|^SimpleAuthWebService$' {
            switch ($SSLState) {
                Enabled {
                    Write-Output 'Ssl'
                }
                Disabled {
                    Write-Output 'None'
                }
            }
        }
        '^Inventory$|^Content$|^ReportingWebService$|^SelfUpdate$' {
            Write-Output 'None'
        }
    }
}