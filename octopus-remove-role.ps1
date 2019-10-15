$UserEntryMachine = Read-Host -Prompt 'Input your server name'
$UserEntryComponentName = Read-Host -Prompt 'Input your Role name'

$MachineComponentName = "*-$UserEntryMachine-*"

# Get-OctopusMachine -name $MachineComponentName
$MachineList = Get-OctopusMachine -name $MachineComponentName


foreach ($machine in $MachineList){

    $machine.resource.roles.Remove("$UserEntryComponentName") # removing a role
    Update-OctopusResource -Resource $machine.resource
}