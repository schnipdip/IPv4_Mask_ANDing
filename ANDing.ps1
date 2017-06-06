#Chris Herzog      _____
#Submasking script _____
#_______________________
#notes: http://windowsitpro.com/powershell-scripting/working-ipv4-addresses-powershell?page=1

write-host "----------------------------------------------
  Cider   TotalIP  UsableIP    Mask           
----------------------------------------------
/8        16777216 16777212 255.0.0.0         
/9        8388608  8388606  255.128.0.0       
/10       4194304  4194302  255.192.0.0       
/11       2097152  2097150  255.224.0.0       
/12       1048576  1048574  255.240.0.0       
/13 	  524288   524286   255.248.0.0       
/14       262144   262142   255.252.0.0       
/15       131072   131070   255.254.0.0       
/16       65536    65534    255.255.0.0       
/17       32768    32766    255.255.128.0     
/18       16384    16382    255.255.192.0     
/19       8192     8190     255.255.224.0     
/20       4096     4094     255.255.240.0     
/21       2048     2046     255.255.248.0     
/22       1024     1022     255.255.252.0     
/23       512      510      255.255.254.0     
/24       256      254      255.255.255.0     
/25       128      126      255.255.255.128   
/26       64       62       255.255.255.192   
/27       32       30       255.255.255.224   
/28       16       14       255.255.255.240   
/29       8        6        255.255.255.248   
/30       4        2        255.255.255.252   " -backgroundcolor "white" -foregroundcolor "black"
""
""
do{
	$readIP1 = Read-Host "Type in IP address (192.168.0.0) "
	$readSub1 = Read-Host "Type In Subnet Mas (255.255.255.0) "
	$ip1 = [IPAddress] $readIP1
	$mask1 = [IPAddress] $readSub1

	#bitwise anding
	$networkID1 = [IPAddress] ($ip1.Address -band $mask1.Address)

	Write-Host "Network ID:" $networkID1.IPAddressToString -backgroundcolor "white" -foregroundcolor "black" 
	
	$readIP2 = Read-Host "Type in IP address (192.168.0.0) "
	$readSub2 = Read-Host "Type In Subnet Mas (255.255.255.0) "
	$ip2 = [IPAddress] $readIP2
	$mask2 = [IPAddress] $readSub2
	
	$networkID2 = [IPAddress] ($ip2.Address -band $mask2.Address)
	
	Write-Host "Network ID:" $networkID2.IPAddressToString -backgroundcolor "white" -foregroundcolor "black" 

	if($networkID1 -eq $networkID2){
		Write-Host "$networkID1 and $networkID2 are in the same network." -backgroundcolor "green" -foregroundcolor "red"
	}
	else{
		Write-Host "$networkID1 and $networkID2 are not in the same network." -backgroundcolor "red" -foregroundcolor "yellow"
	}
$returnTop = Read-Host "Want to make another comparison? y/n"
}while ($returnTop -eq "y")
