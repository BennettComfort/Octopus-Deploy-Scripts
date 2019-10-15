$DVenv = "DV"
$PPenv = "PP"
$PRenv = "PR"

$UserEntryMachine = Read-Host -Prompt 'Input your server name'
$Userenv = Read-Host -Prompt 'Input your env name'
$UserEntryComponentName = Read-Host -Prompt 'Input your Octopus Role name'

$envDVW = $Userenv + 'W-' + "$UserEntryMachine-*"
$envDVE = $Userenv + 'E-' + "$UserEntryMachine-*"

$envDVW
$envDVE



$MachineList = Get-OctopusMachine -name $envDVW
$MachineList += Get-OctopusMachine -name $envDVE

$MachineList


foreach ($machine in $MachineList){

    $machine.resource.roles.Remove("$UserEntryComponentName") # removing a role
    Update-OctopusResource -Resource $machine.resource
}