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
	# ���� ��� ���� ����
	/usr/bin/cp -Rp "$PATH/$SERVICE_NAME" /etc/systemd/system/
	echo
	echo ***********service install $SERVICE_NAME************
	;;

'uninstall')
	# ����
	systemctl stop $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	# ���� �ڵ� ������ ����
	systemctl disable $SERVICE_NAME
	# ���� ��� ���� ���� 
	/usr/bin/rm /etc/systemd/system/$SERVICE_NAME
	# ���� ���� 
	systemctl daemon-reload  
	systemctl reset-failed
	echo ***********service uninstall $SERVICE_NAME************
	;;

'setup')
	# ���񽺸� ��� 
	systemctl daemon-reload
	# �ý����� ���۵� �� �ڵ����� ���۵ǵ��� ��� 
	systemctl enable $SERVICE_NAME
	echo ***********service setup $SERVICE_NAME************
	;;

'start')

	# ���� 
	systemctl start $SERVICE_NAME
	echo ***********service start $SERVICE_NAME************
	echo
	;;

'stop')
	# ����
	systemctl stop $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	;;
'status')
	# ����
	systemctl status $SERVICE_NAME
	echo ***********service stop $SERVICE_NAME************
	;;

*)
	echo "Usage: $0 { install | uninstall | setup | start | stop | status }"
	exit 1
esac
exit 0
