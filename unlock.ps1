for /f `"tokens=*`" %i in (`'netsh wlan show profiles ^| findstr `"All User Profile`"') do @netsh wlan show profile `%i` key=clear ^| findstr `"Key Content` > keys.txt
