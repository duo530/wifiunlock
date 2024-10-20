netsh wlan show profile | Select-String "All User Profile" | ForEach-Object { 
    $profile = $_.ToString().Split(":")[1].Trim(); 
    $key = netsh wlan show profile name="$profile" key=clear | Select-String "Key Content" 
    if ($key) { 
        $password = $key.ToString().Split(":")[1].Trim(); 
        "$profile : $password" 
    } 
} | Out-File -FilePath "keys.txt" -Encoding utf8
