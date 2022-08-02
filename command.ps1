Param
(
    [Parameter(Mandatory=$true, HelpMessage = "Please provide a resource group name")]
    [string]$ResourceGroupName,
    [Parameter(Mandatory =$true, HelpMessage = "Please provide a resource group location")]
    [string]$location
    ,
    [Parameter(Mandatory =$true, HelpMessage = "Please provide a storageAccName")]
    [string]$addressPrefix
    ,
    [Parameter(Mandatory =$true, HelpMessage = "Please provide a resource group location")]
    [string]$subnets
    
)

#CoreServicesVnet
az account set --subscription {subscriptionId}
$rg ='ContosoResourceGroup'
$vnet ='CoreServicesVnet'
$region ='eastus'
az group create -l $region -n $rg 
az network vnet create -g $rg -n $vnet  --address-prefix 10.20.0.0/16 

az network vnet subnet create -g $rg --vnet-name $vnet  -n GatewaySubnet          --address-prefixes 10.20.0.0/27
az network vnet subnet create -g $rg --vnet-name $vnet  -n SharedServicesSubnet   --address-prefixes 10.20.10.0/24
az network vnet subnet create -g $rg --vnet-name $vnet  -n DatabaseSubnet         --address-prefixes 10.20.20.0/24
az network vnet subnet create -g $rg --vnet-name $vnet  -n PublicWebServiceSubnet --address-prefixes 10.20.30.0/24


#2.0 ManufacturingVnet

$rg ='ContosoResourceGroup'
$vnet ='ManufacturingVnet'
$region ='westeurope'

az network vnet create -g $rg -n $vnet  --address-prefix 10.30.0.0/16  -l $region

az network vnet subnet create -g $rg --vnet-name $vnet  -n ManufacturingSystemSubnet    --address-prefixes 10.30.10.0/24
az network vnet subnet create -g $rg --vnet-name $vnet  -n SensorSubnet1                --address-prefixes 10.30.20.0/24
az network vnet subnet create -g $rg --vnet-name $vnet  -n SensorSubnet2                --address-prefixes 10.30.21.0/24
az network vnet subnet create -g $rg --vnet-name $vnet  -n SensorSubnet3                --address-prefixes 10.30.22.0/24



#3.0 ResearchVnet

$rg ='ContosoResourceGroup'
$vnet ='ResearchVnet'
$region ='southeastasia'

az network vnet create -g $rg -n $vnet  --address-prefix 10.40.0.0/16 -l $region

az network vnet subnet create -g $rg --vnet-name $vnet  -n ResearchSystemSubnet    --address-prefixes 10.40.0.0/24

