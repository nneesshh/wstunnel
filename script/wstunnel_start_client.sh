#!/bin/sh

startwork_release()
{
	cd ../bin/
	echo "begin start wstunnel client"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./wstunnel client -L socks5://127.0.0.1:8888 --connection-min-idle 5 --http-upgrade-path-prefix abcdefg41 wss://18.163.12.34:29619 & echo $! > wstunnel-cli.pid
	
	echo "end start wstunnel client"
	cd ../script/
}

stopwork_release()
{
    cd ../bin/
    echo "begin stop wstunnel client"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat wstunnel-cli.pid`
    sleep 2
    echo "end stop wstunnel client"
    cd ../script/

}

startwork_debug()
{
	cd ../bin/Debug/
	echo "begin start wstunnel client"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./wstunnel client -L socks5://127.0.0.1:8888 --connection-min-idle 5 --http-upgrade-path-prefix abcdefg41 wss://18.163.12.34:29619 & echo $! > wstunnel-cli.pid
	
	echo "end start wstunnel client"
	cd ../../script/
}

stopwork_debug()
{
    cd ../bin/Debug/
    echo "begin stop wstunnel client"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat wstunnel-cli.pid`
    sleep 2
    echo "end stop wstunnel client"
    cd ../../script/

}


    case $1 in
        -d)
            stopwork_debug
	        startwork_debug
        ;;
        -r)
            stopwork_release
	        startwork_release
        ;;
        *)
            stopwork_release
            startwork_release
        ;;
   esac
