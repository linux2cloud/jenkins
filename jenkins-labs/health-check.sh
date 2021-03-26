#!/bin/bash
# Health Check of Server
for n in `df -Th | grep xfs | awk '{print $1}'`
do
FSSIZE=`df -m $n | grep -v Filesystem | awk '{print $4}'`
if [ $FSSIZE -le 2000 ];then
echo -e " "
echo "File System $n is in Critical state"
FREESPACE=`df -m $n | grep -v Filesystem | awk '{print $4}'`
echo -e "Availble space is ==> " $FREESPACE M
echo -e " "
else
echo -e " "
echo -e "File System $n is healthy"
echo -e " "
fi
done
echo "***********************************"
echo -e "Uptime of server is \n" `uptime`
echo "***********************************"
MEMAVAILABLE=`free -m | grep Mem | awk '{print $NF}'`
if [ $MEMAVAILABLE -le 2000 ]; then
echo -e " "
echo "Server is in critical state"
echo -e ""
echo "Available Memory on Server ==> " $MEMAVAILABLE
echo "***********************************"
else

echo -e " "
echo -e "Server's Memory is healthy"
fi

