cd ..\bin
start "wstunnel-cli" wstunnel client -L socks5://127.0.0.1:8888 --connection-min-idle 5 --http-upgrade-path-prefix abcdefg41 wss://18.163.12.34:29619
	
cd ..\script