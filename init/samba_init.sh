#!/bin/bash
SHARE='/home/share'

p(){
  style=${2:-"1;31"}
  echo -e "\e[${style}m${1}\e[m"
}

# Installation
echo -e '\e[40m'
echo '      📂📂📂                                                                                  '
echo '  📂📂📂📂📂📂                                                                                '
echo '📂📂        📂📂                                            📂                                '
echo '📂📂          📂                                            📂                                '
echo '📂📂          📂                                            📂                                '
echo '  📂📂                  📂📂          📂📂                  📂📂                  📂📂        '
echo '    📂📂📂          📂📂📂📂📂        📂📂  📂    📂        📂📂  📂          📂📂📂📂📂      '
echo '        📂📂📂      📂      📂📂      📂📂📂📂📂📂📂📂      📂📂📂📂📂📂      📂      📂📂    '
echo '          📂📂📂        📂📂📂📂      📂📂    📂📂  📂📂    📂📂      📂📂        📂📂📂📂    '
echo '            📂📂      📂📂📂📂📂      📂📂    📂    📂📂    📂📂      📂📂      📂📂📂📂📂    '
echo '📂            📂    📂📂    📂📂      📂📂    📂    📂📂    📂📂      📂📂    📂📂    📂📂    '
echo '📂📂        📂📂    📂📂    📂📂📂    📂📂    📂    📂📂    📂📂📂  📂📂      📂📂    📂📂📂  '
echo '  📂📂📂📂📂📂📂      📂📂📂📂  📂📂  📂📂    📂    📂📂    📂📂📂📂📂📂        📂📂📂📂  📂📂'
echo '    📂📂📂📂                                                                                  '
echo -e '\e[m'

p 'Install'
sudo apt update
sudo apt install samba

if [ ! -e ${SHARE} ]; then
    p "make dir ${SHARE}"
    sudo mkdir ${SHARE} && sudo chmod 777 ${SHARE}
fi

p 'Add Configrations'

CONFIG="
interfaces = 10.0.2.0/24
bind interfaces only = yes
map to guest = Bad User
# 任意の共有名を指定
[Share]
    # 共有フォルダ指定
    path = ${SHARE}
    # 書き込みOK
    writable = yes
    # ゲストユーザーOK
    guest ok = yes
    # 全てゲストとして扱う
    guest only = yes
    # フルアクセスでファイル作成
    create mode = 0777
    # フルアクセスでフォルダ作成
    directory mode = 0777
"
p "${CONFIG}" '90'
sudo bash -c "cat << EOF >> /etc/samba/smb.conf ${CONFIG}EOF"

sudo systemctl restart smbd