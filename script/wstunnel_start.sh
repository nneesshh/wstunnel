#!/bin/sh

startwork_release()
{
	cd ../bin/
	echo "begin start wstunnel"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./wstunnel server --restrict-http-upgrade-path-prefix abcdefg41 wss://0.0.0.0:29619 & echo $! > wstunnel.pid
	
	echo "end start wstunnel"
	cd ../script/
}

stopwork_release()
{
    cd ../bin/
    echo "begin stop wstunnel"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat wstunnel.pid`
    sleep 2
    echo "end stop wstunnel"
    cd ../script/

}

startwork_debug()
{
	cd ../bin/Debug/
	echo "begin start wstunnel"

  	#export LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH"
	#export LD_PRELOAD="libjemalloc.so.2"

	nohup ./wstunnel server --restrict-http-upgrade-path-prefix abcdefg41 wss://0.0.0.0:29619 & echo $! > wstunnel.pid
	
	echo "end start wstunnel"
	cd ../../script/
}

stopwork_debug()
{
    cd ../bin/Debug/
    echo "begin stop wstunnel"
    #pkill server;
    #kill -9 $(sed -n 1p server.pid);
    kill -9 `cat wstunnel.pid`
    sleep 2
    echo "end stop wstunnel"
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
