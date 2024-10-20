netsh wlan show profile | Select-String "All User Profile" | ForEach-Object { 
    $profile = $_.ToString().Split(":")[1].Trim(); 
    Write-Host "Verificando perfil: $profile" # Adicionando saída para depuração
    $key = netsh wlan show profile name="$profile" key=clear | Select-String "Key Content" 
    if ($key) { 
        $password = $key.ToString().Split(":")[1].Trim(); 
        "$profile : $password" | Out-File -FilePath "keys.txt" -Encoding utf8 -Append # Usar -Append para não sobrescrever
        Write-Host "Chave encontrada para $profile : $password" # Adicionando saída para depuração
    } else {
        Write-Host "Nenhuma chave encontrada para $profile" # Adicionando saída para depuração
    }
}
