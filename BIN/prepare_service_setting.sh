#!/bin/bash
FileBinPath=$( cd "$(dirname "$0")" ; pwd )
FileCfgPath=$( cd "$(dirname "$0")" ; cd .. ; cd CFG ; pwd )
COMMAND=SelvySTT_Lvcsr.sh

echo -n "Input service name(ex : SelvySTT.service ..) : " 
read SERVICE_NAME

case "$1" in
'install')
	echo "[Unit]" > $SERVICE_NAME
	echo "Description=Selvy STT Server" >> $SERVICE_NAME
	echo "After=network.target syslog.target" >> $SERVICE_NAME
	echo "" >> $SERVICE_NAME
	echo "[Service]" >> $SERVICE_NAME
	echo "Type=forking" >> $SERVICE_NAME

	echo -n "Input user(ex : root, kay ..) : "
	read USER

	echo -n "Input group(ex : root, kay ..) : "
	read GROUP

	echo "User=$USER" >> $SERVICE_NAME
	echo "Group=$GROUP" >> $SERVICE_NAME
	echo "" >> $SERVICE_NAME

	echo -n "Input STT Path (exclude last /usr/local/SelvySTT_Server/BIN) : "
	read PATH

	echo ExecStart=$PATH/$COMMAND service_start >> $SERVICE_NAME
	echo ExecStop=$PATH/$COMMAND stop >> $SERVICE_NAME
	echo WorkingDirectory=$PATH >> $SERVICE_NAME
	echo Restart=on-failure >> $SERVICE_NAME
	echo "" >> $SERVICE_NAME
	echo "[Install]" >> $SERVICE_NAME
	echo "WantedBy=multi-user.target" >> $SERVICE_NAME
	# 서비스 등록 파일 복사
	/usr/bin/cp -Rp "$PATH/$SERVICE_NAME" /etc/systemd/system/
	echo
	echo ***********service install $SERVICE_NAME************
	;;

'uninstall')
	# 정지
	systemctl stop $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	# 서비스 자동 실행을 제거
	systemctl disable $SERVICE_NAME
	# 서비스 등록 파일 삭제 
	/usr/bin/rm /etc/systemd/system/$SERVICE_NAME
	# 서비스 제거 
	systemctl daemon-reload  
	systemctl reset-failed
	echo ***********service uninstall $SERVICE_NAME************
	;;

'setup')
	# 서비스를 등록 
	systemctl daemon-reload
	# 시스템이 시작될 때 자동으로 시작되도록 등록 
	systemctl enable $SERVICE_NAME
	echo ***********service setup $SERVICE_NAME************
	;;

'start')

	# 실행 
	systemctl start $SERVICE_NAME
	echo ***********service start $SERVICE_NAME************
	echo
	;;

'stop')
	# 정지
	systemctl stop $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	;;
'status')
	# 상태
	systemctl status $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	;;

*)
	echo "Usage: $0 { install | uninstall | setup | start | stop | status }"
	exit 1
esac
exit 0
