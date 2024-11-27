$wifi = Read-Host "Nome do wifi"
netsh wlan show profile $wifi key=clear | Select-String chave
timeout 5
exit
