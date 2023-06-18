#!/bin/bash
FileBinPath=$( cd "$(dirname "$0")" ; pwd )
FileCfgPath=$( cd "$(dirname "$0")" ; cd .. ; cd CFG ; pwd )

echo -n "Input user(ex : root, kay ..) : " 

read USER

echo -n "Input STT Path (exclude last /usr/local/SelvySTT_Server/BIN) : "

read PATH

COMMAND=SelvySTT_Lvcsr.sh

echo $COMMAND

if  [ "$USER" == "root" ];then 
echo $PATH/$COMMAND start >> /etc/rc.local
else
echo su $USER -c \"$PATH/$COMMAND start\" >> /etc/rc.local
fi

echo
/bin/chmod 755 /etc/rc.d/rc.local
echo
/bin/ls -l /etc/rc.d/rc.local
echo
/bin/cat /etc/rc.local
echo
echo ***********check permission rc.local************
echo
echo -n "Input STT old Path (exclude last /usr/local/SelvySTT_Server/LOG) : "

read OldLogPATH

echo -n "Input STT new Path (exclude last /usr/local/SelvySTT_Server/LOG) : "

read NewLogPATH

/bin/sed -i "s-${OldLogPATH}-${NewLogPATH}-" ${FileCfgPath}/SelvySTT_Lvcsr.cfg
echo
echo
echo -n "Input STT old Path (exclude last /usr/local/SelvySTT_Server) : "

read OldPATH

echo -n "Input STT new Path (exclude last /usr/local/SelvySTT_Server) : "

read NewPATH

/bin/sed -i "s-${OldPATH}-${NewPATH}-" ${FileCfgPath}/SelvySTT_Lvcsr.cfg
echo
echo
/bin/cat ${FileCfgPath}/SelvySTT_Lvcsr.cfg
echo
echo ***********check SelvySTT_Lvcsr.cfg************
echo
