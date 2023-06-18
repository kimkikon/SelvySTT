#!/bin/sh
#
# Copyright(c) 2005 DIOTEK Co.,Ltd.,  All rights reserved.
#
FileBinPath=$( cd "$(dirname "$0")" ; pwd )
FileLibPath=$( cd "$(dirname "$0")" ; cd .. ; cd LIB ; pwd )
FileCfgPath=$( cd "$(dirname "$0")" ; cd .. ; cd CFG ; pwd )

SVR=SelvySTT_Server
ADM=SelvySTT_Admin
MODE="$1"
CMD="$2"
SCORE="$3"

function symbol_del_func()
{
	cd ${FileLibPath}
	rm -rf libboost_date_time.so
	rm -rf libcrypto.so

	rm -rf libcuda.so.1
	rm -rf libcublas.so.11.3
	rm -rf libcublas.so.11
	rm -rf libcublas.so
	rm -rf libcublasLt.so.11.3
	rm -rf libcublasLt.so.11
	rm -rf libcublasLt.so
	rm -rf libcufft.so.10.3
	rm -rf libcufft.so.10	
	rm -rf libcufft.so	
	rm -rf libcudart.so.11.1
	rm -rf libcudart.so.11.0
	rm -rf libcudart.so
	rm -rf libcurand.so.10.2
	rm -rf libcurand.so.10
	rm -rf libcurand.so
	rm -rf libcusolver.so.11.0
	rm -rf libcusolver.so.11
	rm -rf libcusolver.so
	rm -rf libcusparse.so.11.3
	rm -rf libcusparse.so.11
	rm -rf libcusparse.so
  
	rm -rf libfst.so
	rm -rf libfst.so.13
	rm -rf libnvToolsExt.so.1
	rm -rf libnvToolsExt.so
	rm -rf libSelvyEPD.so.1
	rm -rf libSpacingEngine.so.1
	rm -rf libmecab.so.2
	rm -rf libITnDecoder.so.1
	rm -rf libTPEngineE.so.1
	rm -rf libkiwi.so.0
	rm -rf libspeex.so.1
	rm -rf libssl.so
	rm -rf libk5crypto.so.3
	rm -rf libnsl.so.1
	rm -rf libSTTEngine.so.1
	rm -rf libSvCryptoAPI.so.1
	rm -rf libtensorflow_framework.so.1
	rm -rf libtensorflow_cc.so.1
	
	rm -rf libSTTEngineE2E.so.2.0
	rm -rf libSTTEngineE2E.so.2        
	
	rm -rf libtorch.so
	rm -rf libtorch_cpu.so
	rm -rf libgomp-a34b3233.so.1
	rm -rf libc10.so
}

function symbol_func()
{
	cd ${FileLibPath}
	if [ ! -f ./libcublas.so.11.3 ]; then
  		ln -s libcublas.so.11.3.0.106 		libcublas.so.11.3
	fi
	
	if [ ! -f ./libcublas.so.11 ]; then
		ln -s libcublas.so.11.3 		libcublas.so.11
	fi
		
	if [ ! -f ./libcublas.so ]; then
		ln -s libcublas.so.11.3 		libcublas.so
	fi
	
	if [ ! -f ./libcublasLt.so.11.3 ]; then
  		ln -s libcublasLt.so.11.3.0.106 	libcublasLt.so.11.3
	fi
	
	if [ ! -f ./libcublasLt.so.11 ]; then
		ln -s libcublasLt.so.11.3 		libcublasLt.so.11
	fi
		
	if [ ! -f ./libcublasLt.so ]; then
		ln -s libcublasLt.so.11.3 		libcublasLt.so
	fi	
	
	if [ ! -f ./libcufft.so.10.3 ]; then		
		ln -s libcufft.so.10.3.0.105 		libcufft.so.10.3
	fi

	if [ ! -f ./libcufft.so.10 ]; then		
		ln -s libcufft.so.10.3 			libcufft.so.10
	fi

	if [ ! -f ./libcufft.so ]; then		
		ln -s libcufft.so.10.3 			libcufft.so
	fi	
	
	if [ ! -f ./libcudart.so.11.1 ]; then
		ln -s libcudart.so.11.1.74 		libcudart.so.11.1
	fi

	if [ ! -f ./libcudart.so.11.0 ]; then
		ln -s libcudart.so.11.1 		libcudart.so.11.0
	fi	
		
	if [ ! -f ./libcudart.so ]; then
		ln -s libcudart.so.11.1 		libcudart.so
	fi	
	
	if [ ! -f ./libcurand.so.10.2 ]; then
		ln -s libcurand.so.10.2.2.105 		libcurand.so.10.2
	fi	

	if [ ! -f ./libcurand.so.10 ]; then
		ln -s libcurand.so.10.2 		libcurand.so.10
	fi	
	
	if [ ! -f ./libcurand.so ]; then
		ln -s libcurand.so.10.2 		libcurand.so
	fi	
	
	if [ ! -f ./libcusolver.so.11.0 ]; then
		ln -s libcusolver.so.11.0.1.105 	libcusolver.so.11.0
	fi	

	if [ ! -f ./libcusolver.so.11 ]; then
		ln -s libcusolver.so.11.0 		libcusolver.so.11
	fi
	
	if [ ! -f ./libcusolver.so ]; then
		ln -s libcusolver.so.11.0 		libcusolver.so
	fi		
	
	if [ ! -f ./libcusparse.so.11.3 ]; then
		ln -s libcusparse.so.11.3.0.10 		libcusparse.so.11.3
	fi

	if [ ! -f ./libcusparse.so.11 ]; then
		ln -s libcusparse.so.11.3 		libcusparse.so.11
	fi
		
	if [ ! -f ./libcusparse.so ]; then
		ln -s libcusparse.so.11.3 		libcusparse.so
	fi

	if [ ! -f ./libnvToolsExt.so.1 ]; then
		ln -s libnvToolsExt.so.1.0.0 		libnvToolsExt.so.1
	fi
	
	if [ ! -f ./libnvToolsExt.so ]; then
		ln -s libnvToolsExt.so.1 		libnvToolsExt.so
	fi

	if [ ! -f ./libfst.so.13 ]; then
		ln -s libfst.so.13.0.0 			libfst.so.13
	fi
	
	if [ ! -f ./libfst.so ]; then
		ln -s libfst.so.13 			libfst.so
	fi

	if [ ! -f ./libSelvyEPD.so.1 ]; then
		ln -s libSelvyEPD.so.1.0.6 		libSelvyEPD.so.1
	fi
	
	if [ ! -f ./libSpacingEngine.so.1 ]; then
		ln -s libSpacingEngine.so.1.1.0 	libSpacingEngine.so.1
	fi
	
	if [ ! -f ./libmecab.so.2 ]; then
		ln -s libmecab.so.2.0.0 		libmecab.so.2
	fi	
	
	if [ ! -f ./libITnDecoder.so.1 ]; then
		ln -s libITnDecoder.so.1.0.0 		libITnDecoder.so.1
	fi

	if [ ! -f ./libspeex.so.1 ]; then		
		ln -s libspeex.so.1.5.1 		libspeex.so.1
	fi
	
	if [ ! -f ./libSvCryptoAPI.so.1 ]; then
		ln -s libSvCryptoAPI.so.1.0.0 		libSvCryptoAPI.so.1
	fi

	if [ ! -f ./libtensorflow_framework.so.1 ]; then
		ln -s libtensorflow_framework.so.1.15.2 libtensorflow_framework.so.1
	fi
	
	if [ ! -f ./libtensorflow_cc.so.1 ]; then
		ln -s libtensorflow_cc.so.1.15.2 	libtensorflow_cc.so.1
	fi
	
	if [ ! -f ./libcrypto.so ]; then
		ln -s libcrypto.so.1.1 			libcrypto.so
	fi
	
	if [ ! -f ./libssl.so ]; then
		ln -s libssl.so.1.1 			libssl.so
	fi
	
	if [ ! -f ./libk5crypto.so.3 ]; then
		ln -s libk5crypto.so.3.1 		libk5crypto.so.3
	fi

	if [ ! -f ./libnsl.so.1 ]; then
		ln -s libnsl-2.17.so 			libnsl.so.1
	fi
	
	if [ ! -f ./libboost_date_time.so ]; then
		ln -s libboost_date_time.so.1.55.0 	libboost_date_time.so
	fi
	
       	if [ ! -f ./libTPEngineE.so.1 ]; then
		ln -s libTPEngineE.so.1.0.0 	libTPEngineE.so.1
	fi

	if [ ! -f ./libkiwi.so.0 ]; then
		ln -s libkiwi.so.0.14.1 	libkiwi.so.0
	fi
    
	if [ ! -f ./libSTTEngineE2E.so.2 ]; then
		ln -s libSTTEngineE2E.so.2.0		libSTTEngineE2E.so.2
	fi
		     
	if [ ! -f ./libSTTEngineE2E.so.2.0 ]; then
		ln -s libSTTEngineE2E.so.2.0.0		libSTTEngineE2E.so.2.0
	fi

	if [ ! -f ./libtorch.so ]; then
		ln -s libtorch.so.1.10.1 	libtorch.so
	fi	
	
	if [ ! -f ./libtorch_cpu.so ]; then
		ln -s libtorch_cpu.so.1.10.1 	libtorch_cpu.so
	fi

	if [ ! -f ./libgomp-a34b3233.so.1 ]; then
		ln -s libgomp-a34b3233.so.1.10.1 	libgomp-a34b3233.so.1
	fi
	
	if [ ! -f ./libc10.so ]; then
		ln -s libc10.so.1.10.1 	libc10.so
	fi	
}

function symbol_cpu_func()
{
	cd ${FileLibPath}
	if [ ! -f ./libcuda.so.1 ]; then
		ln -s libcuda.so 			libcuda.so.1
	fi
}

function set_core_options() 
{
	case "${CMD}" in
	'cpu')	
		symbol_cpu_func
		;;

	'gpu')	
		;;
		
	*)
		echo "Usage : $0 { setup } { cpu | gpu }"
		exit 1
	esac		
}

case "${MODE}" in
'setup')
	symbol_del_func
	symbol_func
	set_core_options
	[[ $? -eq 0 ]] && echo "Success : ${MODE^}-Symbolic link created successfully."
	;;

'service_start')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	ulimit -n 16384
	
	cd ${FileBinPath}
	${FileBinPath}/${SVR} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	;;
	
'start')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	ulimit -n 16384
			
	cd ${FileBinPath}
	${FileBinPath}/${SVR} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	${FileBinPath}/${ADM} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	;;	

'admin_start')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	ulimit -n 16384
			
	cd ${FileBinPath}
	${FileBinPath}/${ADM} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	;;
	
'debug_start')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	ulimit -n 16384
			
	cd ${FileBinPath}
	${FileBinPath}/${SVR} -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	;;	

'stop')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	
	cd ${FileBinPath}
	${FileBinPath}/SelvySTT_Stop -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
		
	while true
	do
		sleep 3
		PROCESS=`pidof -x ${SVR} '{print $2}'`
		ADMPROCESS=`pidof -x ${ADM} '{print $3}'`
			
		if [ -z "$PROCESS" ] && [ -z "$ADMPROCESS" ]
		then
			echo "not running."
			break
		else
			echo "stopping."
		fi
	done
	;;

'restart')
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$FileLibPath
	ulimit -n 16384
	
	cd ${FileBinPath}
	${FileBinPath}/SelvySTT_Stop -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
		
	while true
	do
		sleep 3
		PROCESS=`pidof -x ${SVR} '{print $2}'`
			
		if [ -z "$PROCESS" ] && [ -z "$ADMPROCESS" ]
		then
			echo "not running."
			break
		else
			echo "stopping."
		fi
	done
	cd ${FileBinPath}
	${FileBinPath}/${SVR} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	${FileBinPath}/${ADM} -d -f ${FileCfgPath}/SelvySTT_Lvcsr.cfg
	;;

'status')
	DATE=`date +%Y%m%d-%H%M%S`	

	SVRCnt=`ps -ef|grep ${SVR}|grep -v grep|grep -v vi|wc -l`
	#PROCESS=`ps -ef|grep SelvySTT_Server|grep -v grep|grep -v vi|awk '{print $2}'`
	#PROCESS=`ps -eaf|grep SelvySTT_Server|grep -v grep|grep -v vi|awk '{print $2}'`
	PROCESS=`pidof -x ${SVR} '{print $2}'`

	if [ $SVRCnt -gt 0 ]
	then
   		echo "$DATE : SelvySTT SVR (PID: $PROCESS) is running."
	else
   		echo "$DATE : SelvySTT SVR is not running."
	fi
	
	ADMCnt=`ps -ef|grep ${ADM}|grep -v grep|grep -v vi|wc -l`
	#PROCESS=`ps -ef|grep SelvySTT_Server|grep -v grep|grep -v vi|awk '{print $2}'`
	#PROCESS=`ps -eaf|grep SelvySTT_Server|grep -v grep|grep -v vi|awk '{print $2}'`
	PROCESS=`pidof -x ${ADM} '{print $2}'`

	if [ $ADMCnt -gt 0 ]
	then
   		echo "$DATE : SelvySTT ADM (PID: $PROCESS) is running."
	else
   		echo "$DATE : SelvySTT ADM is not running."
	fi	
	;;

*)
	echo "Usage: $0 { service_start | start | admin_start | debug_start | stop | restart | status }"
	exit 1
	;;
esac
exit 0
