Param(
  [string]$filePath
  )

$ips = get-content $filePath
$credential = Get-Credential
$date = get-date


Write-Output "[+] -- Starting Windows Information Collector"
Write-Output "[+] -- Script start: $date"
Write-Output ""

Foreach ($ip in $ips){
    $ipaddr = Get-WmiObject win32_networkadapterconfiguration -Credential $credential -Computer $ip | where { $_.ipaddress -like "1*" } | select -ExpandProperty ipaddress | select -First 1
    $system = Get-WmiObject -Class Win32_ComputerSystem -Credential $credential -Computer $ip
        $domain = $system.Domain
        $manufacturer = $system.Manufacturer
        $model = $system.Model
        $name = $system.Name
    $hotfix = get-hotfix -Credential $credential -Computer $ip |sort-object -property InstalledOn |select-object -last 1 |select InstalledOn -expandproperty InstalledOn
    $processor = get-wmiobject -class win32_processor -Credential $credential -Computer $ip |select Name -ExpandProperty Name
    $os = Get-WmiObject Win32_OperatingSystem -Credential $credential -Computer $ip
        $arch = $os.OSArchitecture
        $ver = $os.Caption
        $sp = $os.ServicePackMajorVersion

    Write-Output "[+] --- $ipaddr"
    Write-Output ""
    Write-Output "OS Ver      : $ver"
    write-output "Arch        : $arch"
    write-output "SP          : $sp"
    write-output "CPU         : $processor"
    write-output "IP-Address  : $ip"
    write-output "Domain      : $domain"
    write-output "Model       : $model"
    write-output "Name        : $name.$domain"
    write-output "Last Update : $hotfix"
    Write-Output ""
}