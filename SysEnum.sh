#!/bin/bash


exec 2> >(grep -v "Permission denied" >&2)
# ANSI color codes
RED="\033[1;31m"
SED_RED="\033[1;31m&\033[0m"
GREEN="\033[1;32m"
SED_GREEN="\033[1;32m&\033[0m"
YELLOW="\033[1;33m"
SED_YELLOW="\033[1;33m&\033[0m"
RED_YELLOW="\033[1;31;103m"
SED_RED_YELLOW="\033[1;31;103m&\033[0m"
BLUE="\033[1;34m"
SED_BLUE="\033[1;34m&\033[0m"
ITALIC_BLUE="\033[1;34m\033[3m"
LIGHT_MAGENTA="\033[1;95m"
SED_LIGHT_MAGENTA="\033[1;95m&\033[0m"
LIGHT_CYAN="\033[1;96m"
SED_LIGHT_CYAN="\033[1;96m&\033[0m"
LG="\033[1;37m"
SED_LG="\033[1;37m&\033[0m"
DG="\033[1;90m"
SED_DG="\033[1;90m&\033[0m"
NC="\033[0m"
UNDERLINED="\033[4m"
ITALIC="\033[3m"


#Banner 

cat << "EOF"


`⢻⣷⣞⡶⣶⣶⣶⣶⡲⣶⣶⣶⣶⣒⠶⠦⠐⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠐⠒⠶⠶⣲⣶⡶⣒⣶⣲⣶⣷⣟⣗⣾⣶⣷⡿
⢸⣻⣿⣿⣯⣿⣿⣿⡽⣿⣽⡏⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠻⣯⣏⣿⢿⡟⡟⣿⣿⣿⣿⡇
⢸⡷⣿⣷⣻⣇⣷⣾⠵⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⣼⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠺⣿⣿⣿⡟⣿⢿⡿⡇
⢸⣿⣏⣿⣇⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣔⣃⢗⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⡿⣹⣿⣻⡇
⢸⣿⣭⠿⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣞⢼⠁⢹⣧⢻⣿⣟⠀⢹⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠷⣾⣟⡇
⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠮⠽⢟⢇⢾⣿⣟⠿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡾⡇
⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡾⢿⢿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣳⡇
⠀⠙⠗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢲⢐⣽⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⢤⡼⢟⣻⣿⣿⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣪⣾⡾⡢⢲⣳⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠚⠲⡶⠓⢿⣓⣿⡿⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡏⣧⣻⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢴⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢆⢛⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢴⡏⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡯⣗⣾⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⢹⡦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⢃⣾⣧⢿⡀⠀⢀⣴⡾⠁⠀⠀⠀⠀⠀⣷⣿⣻⣿⣿⡇⠀⠀⠀⠀⠈⢳⣦⡀⠀⠀⡟⣸⣿⡹⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⣾⢫⣿⣯⠷⣤⢯⣿⠀⠀⠀⠀⠀⠀⠀⡿⠞⢻⣿⣿⡇⠀⠀⠀⠀⠀⠀⣾⡽⣦⡞⣽⣯⡹⣇⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡌⡷⣱⣿⣿⣿⣿⡟⡼⣿⠀⠀⠀⠀⠀⠀⠀⡇⡘⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠟⢷⣹⣿⣿⣿⣿⣎⢿⣳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⢰⣿⣿⣿⣿⣿⡅⢳⡇⠀⠀⠀⠀⠀⠀⠀⡇⡐⢹⣿⣿⡇⠀⠀⠀⠀⠀⠀⠸⡄⣿⣿⣿⣿⣿⣿⡎⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⣿⣿⣿⣿⣿⣿⣧⡸⣧⠀⠀⠀⠀⠀⠀⠀⡇⠰⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⣘⠇⣿⣿⣿⣿⣿⣿⣿⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢇⣿⣿⣿⣿⣿⣿⣿⣖⡙⣧⡀⠀⠀⠀⠀⠀⡇⡁⢺⣿⣿⡇⠀⠀⠀⠀⢀⡴⣊⣼⣿⣿⣿⣿⣿⣿⡿⣸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡼⣿⣿⣿⣿⣿⢿⣿⣷⣎⣿⣳⣤⣀⠀⠀⡇⠐⣸⣿⣿⡇⠀⣀⣤⢖⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⢳⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡾⣟⢭⣛⣶⡃⢌⢸⣿⣿⡧⣙⡭⣲⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡹⣞⡿⣿⣿⣿⣿⣾⠟⣛⠭⣭⡙⡞⣽⡂⠔⢸⣿⣿⣿⢎⢞⣩⠭⣟⡿⣿⣿⣿⣿⣿⡿⣳⣟⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢥⠭⣝⡻⣿⣿⣿⡏⡜⣴⣷⣦⣻⡋⠁⡅⢊⢸⣿⣿⡏⠉⣻⣴⣿⣷⢹⣹⣿⣿⡿⠟⣚⢭⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠓⠒⢩⡗⢫⡝⣧⣧⠙⡏⢠⣯⠙⣶⡅⡌⢸⣿⣿⣿⡟⣭⣦⢸⠋⣼⣼⢻⣥⣶⡝⠚⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣠⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢟⣻⣟⡻⢿⣏⠿⢇⣿⡐⢡⢺⣿⣿⣿⣜⠿⣟⣯⢽⣻⣽⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣄⠀
⢠⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⡝⢿⣯⢸⣀⠣⢸⣿⣿⣿⣹⢿⣫⡶⠋⠁⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⡇
⢸⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡞⣟⣿⢠⠊⢼⣿⣿⣿⢯⣱⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣟⣇
⢸⣯⣿⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢟⣾⠿⡠⡉⢼⣿⣿⣿⣾⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⢿⣿⡿
⢸⣿⣿⢟⡏⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠞⠋⠀⣇⠱⣸⣿⣿⡏⠈⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣟⢿⣯⣧
⢸⢿⡿⣿⣹⣟⣿⣲⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡚⣹⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢔⣺⣟⣷⣷⣿⣿⣷⣿
⢸⣯⢿⣷⣿⣿⣿⣾⣿⡿⣷⠤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⣼⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⡾⡏⣿⣷⡿⣯⣿⢿⣿⣵⡿
⣸⣽⣟⣿⣿⣿⣿⣿⣧⣿⡿⣽⢯⣽⣲⣤⡤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⠶⣟⠿⢟⣻⣿⣽⣿⣯⣿⣿⣿⣟⣻⣷`

EOF

###########################################
#-------------)BASIC SYS INFO(------------#
###########################################

echo -e "${BLUE}[+] Current user:${NC} ${YELLOW}$(whoami)${NC}"
echo -e "${BLUE}[+] User ID:${NC} ${YELLOW}$(id)${NC}"
echo -e "${BLUE}[+] Hostname:${NC} ${YELLOW}$(hostname)${NC}"
echo -e "${BLUE}[+] Uptime:${NC} ${YELLOW}$(uptime -p)${NC}"
echo -e "${BLUE}[+] Kernel:${NC} ${YELLOW}$(uname -r)${NC}"
echo -e "${BLUE}[+] Kernel version:${NC} ${YELLOW}$(uname -v)${NC}"
echo -e "${BLUE}[+] Architecture:${NC} ${YELLOW}$(uname -m)${NC}"
echo -e "${BLUE}[+] OS Release:${NC} ${YELLOW}$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '\"')${NC}"
echo -e "${BLUE}[+] CPU:${NC} ${YELLOW}$(lscpu | grep 'Model name' | sed 's/Model name:[ \t]*//')${NC}"
echo -e "${BLUE}[+] Total CPU(s):${NC} ${YELLOW}$(lscpu | grep '^CPU(s):' | awk '{print $2}')${NC}"
echo -e "${BLUE}[+] Memory:${NC} ${YELLOW}$(free -h | grep Mem | awk '{print $2 " total, " $3 " used, " $4 " free"}')${NC}"
echo -e "${BLUE}[+] Disk usage:${NC} ${YELLOW}$(df -h --total | grep total | awk '{print $2 " total, " $3 " used, " $4 " free"}')${NC}"
echo -e "${BLUE}[+] IP address(es):${NC} ${YELLOW}$(hostname -I)${NC}"
echo -e "${BLUE}[+] Default gateway:${NC} ${YELLOW}$(ip route | grep default | awk '{print $3}')${NC}"
echo -e "${BLUE}[+] Shell:${NC} ${YELLOW}$SHELL${NC}"
echo -e "${BLUE}[+] Terminal:${NC} ${YELLOW}$TERM${NC}"
echo -e "${BLUE}[+] Home directory:${NC} ${YELLOW}$HOME${NC}"
echo -e "${BLUE}[+] PATH:${NC} ${YELLOW}$PATH${NC}"

echo -e "\n${UNDERLINE}${DG}${ITALIC}Usefull resources:${NC}"


resources () {
  printf """
/-------------------------------------------------\\
| Hacktricks: ${ITALIC_BLUE}${UNDERLINE}https://book.hacktricks.wiki/${NC}       |
|-------------------------------------------------|
| GTFOBins: ${ITALIC_BLUE}${UNDERLINE}https://gtfobins.github.io/${NC}           |
|-------------------------------------------------|
| ExploitDB: ${ITALIC_BLUE}${UNDERLINE}https://www.exploit-db.com/${NC}          |
\-------------------------------------------------/
"""
}
resources

echo -e "${GREEN}${UNDERLINED}\n[ Find SUID/SGID and Sensitive Files ]${NC}"
find / -user root -perm /4000 2>/dev/null
find / -perm -4000 -type f 2>/dev/null
find / -perm -2000 -type f 2>/dev/null
find / -perm -u=s -type f 2>/dev/null
find / -type f -name '*.txt' 2>/dev/null
find / -user root -perm -4000 -exec ls -ldb {} \; > /tmp/suid
echo -e "${GREEN}${UNDERLINED}[+] SUID files listed in /tmp/suid${NC}"
getcap -r / 2>/dev/null

echo -e "\n${YELLOW}[ System Information (OS & Kernel Version) ]${NC}"
cat /etc/issue 2>/dev/null
cat /etc/*-release 2>/dev/null
cat /etc/lsb-release 2>/dev/null
cat /etc/redhat-release 2>/dev/null
cat /proc/version 2>/dev/null
uname -a
uname -mrs
rpm -q kernel 2>/dev/null
dmesg | grep Linux 2>/dev/null
ls /boot | grep vmlinuz 2>/dev/null
hostnamectl 2>/dev/null

echo -e "\n${GREEN}${UNDERLINED}[ Environment Variables & Shell Configuration }${NC}"
cat /etc/profile 2>/dev/null
cat /etc/bashrc 2>/dev/null
cat ~/.bash_profile 2>/dev/null
cat ~/.bashrc 2>/dev/null
cat ~/.bash_logout 2>/dev/null
env
set

echo -e "\n${GREEN}${UNDERLINED}[ Service Configuration Files and Permissions ]${NC}"
cat /etc/syslog.conf 2>/dev/null
cat /etc/chttp.conf 2>/dev/null
cat /etc/lighttpd.conf 2>/dev/null
cat /etc/cups/cupsd.conf 2>/dev/null
cat /etc/inetd.conf 2>/dev/null
cat /etc/apache2/apache2.conf 2>/dev/null
cat /etc/my.cnf 2>/dev/null
cat /etc/httpd/conf/httpd.conf 2>/dev/null
cat /opt/lampp/etc/httpd.conf 2>/dev/null
ls -alR /etc/ | awk '$1 ~ /^.*r.*/' 2>/dev/null
ls -al /etc/init.d/ 2>/dev/null
ls -al /etc/systemd/system/ 2>/dev/null
systemctl list-unit-files --type=service 2>/dev/null

echo -e "\n${GREEN}${UNDERLINED}[ Cron Jobs and Scheduled Tasks ]${NC}"
crontab -l 2>/dev/null
ls -alh /var/spool/cron 2>/dev/null
ls -al /etc/ | grep cron 2>/dev/null
ls -al /etc/cron* 2>/dev/null
cat /etc/cron* 2>/dev/null
cat /etc/at.allow 2>/dev/null
cat /etc/at.deny 2>/dev/null
cat /etc/cron.allow 2>/dev/null
cat /etc/cron.deny 2>/dev/null
cat /etc/crontab 2>/dev/null
cat /etc/anacrontab 2>/dev/null
cat /var/spool/cron/crontabs/root 2>/dev/null
systemctl list-timers 2>/dev/null

echo -e "\n${GREEN}${UNDERLINED}[ Network Connections, Open Ports, and Services ]${NC}"
lsof -i 2>/dev/null
lsof -i :80 2>/dev/null
grep 80 /etc/services 2>/dev/null
netstat -antup 2>/dev/null
netstat -antpx 2>/dev/null
netstat -tulpn 2>/dev/null
ss -tuln 2>/dev/null
chkconfig --list 2>/dev/null
chkconfig --list | grep 3:on 2>/dev/null
systemctl list-units --type=service --state=running 2>/dev/null
last 2>/dev/null
lastlog 2>/dev/null
who

echo -e "\n${GREEN}${UNDERLINED}[ Additional Useful Commands ]${NC}"

echo -e "${BLUE}--> Users & Groups <--${NC}"
cat /etc/passwd 2>/dev/null
cat /etc/group 2>/dev/null
id
groups

echo -e "${BLUE}--> Scheduled tasks with at <--${NC}"
atq 2>/dev/null

echo -e "${BLUE}--> Processes & Permissions <--${NC}"
ps aux --sort=-%mem | head -20
ps aux --sort=-%cpu | head -20

echo -e "${BLUE}--> File Permissions & World Writable Files <--${NC}"
find / -writable -type d 2>/dev/null
find / -perm -o+w -type f 2>/dev/null

echo -e "${BLUE}--> Check sudo permissions <--${NC}"
sudo -l 2>/dev/null

echo -e "${BLUE}--> Mounted file systems and mount options <--${NC}"
mount
cat /etc/fstab 2>/dev/null

echo -e "${BLUE}--> Firewall rules <--${NC}"
iptables -L -n -v 2>/dev/null
firewall-cmd --list-all 2>/dev/null
ufw status verbose 2>/dev/null



echo "[+] SUID binaries:"
find / -perm -4000 -type f 2>/dev/null