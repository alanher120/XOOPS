#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

cd /root
whereis wget|grep bin;
if [ $? != 0 ]; then
  yum install -y unzip wget
fi
rm lamp-xoops.zip
wget --no-check-certificate https://github.com/systex-admin/XOOPS/archive/master.zip -O lamp-xoops.zip
if [ -f lamp-xoops.zip ]; then
  unzip -q -o lamp-xoops.zip
  rm lamp-xoops.zip
  cd lamp-xoops-master
  chmod +x *.sh
  echo -e "\n已經取得最新 lamp_xoops 程式腳本!!\n"
else
  echo -e "更新失敗"
fi
