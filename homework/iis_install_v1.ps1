Set-ExecutionPolicy Bypass -Scope Process

Import-Module ServerManager
Import-Module IISAdministration

Install-WindowsFeature -name Web-Server -IncludeManagementTools

Copy-Item "C:\Users\nduser\Desktop\index.html" -Destination "C:\inetpub\wwwroot"

# Create self-signed cert
New-SelfSignedCertificate -DnsName localhost -CertStoreLocation cert:\LocalMachine\My

# Take ID of cert to pass to the binding command
$cert = Get-ChildItem Cert:\LocalMachine\My | where{$_.Subject -eq "CN=localhost"}
$cert.Thumbprint

New-IISSiteBinding -Name "Default Web Site" -BindingInformation "*:443:" -CertificateThumbPrint "$($cert.Thumbprint)" -CertStoreLocation "Cert:\LocalMachine\My" -Protocol https