$targetUser = "" 
$sessionInfo = qwinsta | Select-String -Pattern $targetUser 
if ($sessionInfo) { 
    # Parse the session information to extract the session ID 
    $sessionID = ($sessionInfo -split "\s+")[2] 
    # Log off the session by using the session ID 
    Write-Host "Session for $targetUser found with ID $sessionID. Logging off..." 
    logoff $sessionID 
    Write-Host "$targetUser has been logged off." 

}
else { 
    Write-Host "No active RDP session found for user: $targetUser" 
} 