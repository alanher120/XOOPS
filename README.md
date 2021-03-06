## 這個專案設計的自動化腳本，幫助你把一部剛安裝好 CentOS 7 作業系統的主機，快速的安裝 LAMP 套件成為網頁伺服器，以及安裝 XOOPS 架站軟體，特色如下：

* 安裝過程簡單，只要複製、貼上和輸入資料
* 提供 PHP 5.6、 7.0、 7.1、 7.2 和 7.3 五種版本供你選擇安裝
* 禁止 root 直接使用 sshd 服務遠端登入主機，提升系統安全
* 每天早上自動更新系統
* 每天早上自動校時

---

## 操作步驟：
### 1. 下載自動化腳本：
#### 使用 Putty 軟體遠端登入伺服器，切換成 root 最高權限，複製以下指令貼到 Putty 視窗內
#### 這個步驟只是下載自動化腳本到你的伺服器，資料夾位置 /root/lamp-xoops-master，對伺服器沒有影響，可以重複執行

    cd /root
    yum install -y unzip wget
    wget --no-check-certificate https://github.com/systex-admin/XOOPS/archive/master.zip -O lamp-xoops.zip
    unzip -o lamp-xoops.zip
    rm -f lamp-xoops.zip
    cd lamp-xoops-master/
    chmod +x *.sh

### 2. 安裝 LAMP 套件成為網頁伺服器
#### 這個步驟只適合還沒安裝Apache+MySQL+PHP，因此這個步驟最多只要執行一次

    ./lamp.sh

### 3. 安裝 XOOPS 架站軟體
#### 這個步驟引導你安裝 XOOPS ，一台伺服器可以安裝多個 XOOPS 網站

    ./xoops.sh

---
## 其他腳本介紹
#### 使用以下腳本前先切換到腳本目錄

    cd /root/lamp-xoops-master

### A. 切換 PHP 版本

    ./change_php.sh

---
### B. 重新下載自動化腳本，作用與前面步驟1相同

    ./update.sh
---
### C. 檢查XOOPS網站運行的版本並且更新
#### 更新XOOPS核心到2.5.10或以上，[模組]站長工具箱到2.81或以上，[模組]tadtools到3.26或以上和BootStrap4升級補丁，這些是近期最重要的更新

    ./upgrade_xoops.sh

#### 或是直接指定你的網站路徑當作參數，例如: /var/www/html/XOOPS
    ./upgrade_xoops.sh /var/www/html/XOOPS

---
### D. 顯示您現有的XOOPS網站的各項參數，方便移機用

    ./show_xoops_var.sh

#### 或是直接指定你的網站路徑當作參數，例如: /var/www/html/XOOPS
    ./show_xoops_var.sh /var/www/html/XOOPS

---
### E. 打包您現有的XOOPS網站的程式、資料庫，做為備份整個網站或是傳輸到遠端新伺服器上

    ./dump_xoops_var.sh

---
### F. 還原上一步驟的XOOPS網站的程式、資料庫
#### 指定打包好的檔案的資料夾路徑

    ./restore_xoops.sh 資料夾路徑
