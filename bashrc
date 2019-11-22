# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

export TERM=linux

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias git-reset='git reset'
# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

###### USER DEFINED #####
#export CVSROOT=:ext:cplus@172.17.10.227:/var/lib/cvs
export CVSROOT=/var/lib/cvs
alias ls='ls --color -F'
alias q='quilt'
alias cflow='cflow --tree'
PS1='\[\033[01;32m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '

function gs()
{
  C=`echo $1 | awk -F ":" '{print "vi " $1 " +" $2}'`
  eval $C
}

function g()
{
#  grep --color=auto -rn "$1" *  2>/dev/null | grep -v "tags:" 
  grep --color=auto -rn "$1" *  2>/dev/null
}

function gf()
{
  grep -rn "$1" *  2>/dev/null | grep -v "tags:" | grep -v "Binary" | awk -F ":" '{print $1}' | uniq
}

export LANG=C

# Alias
alias di='meld'
function gdi()
{
GIT_EXTERNAL_DIFF=git-meld git diff $*
}

function mm()
{
meld p7/$1 OCTEON-SDK/$1 
}

function cc()
{
cp p7/$1 OCTEON-SDK/$1 
}

function vv()
{
  vi OCTEON-SDK/$1
}

alias mgdb='mips64-octeon-linux-gnu-gdb'
alias pgdb='/opt/WindRiver_PNELE2/gnu/4.1-wrlinux-2.0/x86-linux2/bin/powerpc-wrs-linux-gnu-gdb'
alias qvi='quilt edit'
alias q='quilt'

# Cavium SDK Development Environment Setting

#CAVIUM_SDK_VER=3.0.0-482
#CAVIUM_SDK_VER=2.1.0-sp
CAVIUM_SDK_VER=2.1.0-442
#CAVIUM_SDK_VER=1.8.1
#CAVIUM_SDK_VER=2.3.0
#CAVIUM_SDK_VER=1.9.0-ipforward

#cd /home/cplus/$CAVIUM_SDK_VER/usr/local/Cavium_Networks/OCTEON-SDK
#source env-setup OCTEON_CN56XX
#source env-setup OCTEON_CN68XX_PASS1_1
#source env-setup OCTEON_CN68XX_PASS2_0
#cd -

function jc()
{
  cd /home/cplus/$CAVIUM_SDK_VER/usr/local/Cavium_Networks/OCTEON-SDK/
}

function jb()
{
  cd /home/cplus/$CAVIUM_SDK_VER/usr/local/Cavium_Networks/OCTEON-SDK/bootloader/u-boot
}

function jl()
{
  cd /home/cplus/$CAVIUM_SDK_VER/usr/local/Cavium_Networks/OCTEON-SDK/linux/kernel_2.6/linux
}


function j7()
{
  cd /home/cplus/projects/atca-7410/xlp-sdk-0.8.1
}

function jcc()
{
  cd /projects/cn56xx_sdk-2.0.0
}

function jwl()
{
  cd /home/cplus/WindRiver/octeon_prj/build/linux-2.6.21-standard
}

function jab() 
{
  cd /home/cplus/projects/atca-7410/xlp-sdk-2.0.0-alpha/sdk-base/firmware/u-boot
}
function wredo()
{
  if [ x$1 == x ]; then
    P=cn56xx_sdk 
  else
    P=$1 
  fi 
  echo $P
  rm -f build/.stamp/$P.* && rm -rf build/$P-*
  make -C build $P
# ls -ltr build/.stamp/$P.* | awk -F "." '{print $3}' | xargs -n 1 make -C build $P
}

function wx()
{
  cd /opt/wr_user_layers/wr_linux_boc-a_ad_nsp
}

function ww()
{
  cd /opt/wr_user_layers/bcn-octeon-wr-4
}

function wlmp()
{
  cd /home/cplus/projects/bcn-lmp-wr-2.0
}


function w2()
{
  cd /home/cplus/projects/wrlinux2_bcn_n9_bsp/templates/board/ncp20000/linux
}

function w3()
{
  cd /home/cplus/projects/wrlinux3_bcn_n9_bsp
}

function cs3()
{
  rm -rf /home/cplus/projects/wr3/*
}

function s3()
{
  cd /home/cplus/projects/wr3
}


function s2()
{
  cd /home/cplus/projects/wr2-bcn/build
}

function s2l()
{
  cd /home/cplus/projects/wr2-bcn/build/linux-2.6.21-standard
}

function wr()
{
  cd /opt/wr_user_layers/wr_linux_boc-a_ad_nsp/templates/board/boc-a_ad_nsp/
}

function wh()
{
  cd /opt/wr_user_layers/wr_linux_bcn_n9_bsp/templates/board/ncp20000
}

function wp()
{
  cd /opt/WindRiver_PNELE2/wrlinux-2.0/wrlinux/packages
}

function wrpm()
{
  cd /opt/WindRiver_PNELE2/wrlinux-2.0/wrlinux/RPMS_backup/glibc_std/mips64_n32_octeon 
}

function s()
{
  cd /home/cplus/projects/wr-sm
}

function ss()
{
  cd /home/cplus/projects/build-oct-4.1-small
}

function sl()
{
cd /home/cplus/projects/wr2-bcn/build/linux-2.6.21-standard
}

function sb()
{
cd /home/cplus/projects/wr2-bcn/build/u-boot-1.3.4
}

function csd()
{
  rm -rf /home/cplus/projects/wr-std/*
}

function ssd()
{
  ../sd-sp2.sh
}

function ms()
{
  make build-all
}

function m()
{
make kernel;make strip;cp kernel_2.6/linux/vmlinux.64 /tftpboot/vmlinux.64-1.8
}

function i()
{
indent -kr -i 4 -nut -l 128 $1
}

function cfb()
{
make clobber
make octeon_bcnoc_a_failsafe_config
make
}

function crb()
{
make clobber
make octeon_bcnoc_a_ram_config
make
}

function cb()
{
make clobber 
make octeon_bcnoc_a_config 
make 
}

#function cb()
#{
#make clobber 
#make octeon_nac38_config 
#make 
#}

function wr_strip()
{
mips64-octeon-linux-gnu-strip linux-2.6.21-standard/vmlinux 
cp linux-2.6.21-standard/vmlinux /tftpboot/vmlinux.wr
}

function wr_ipmi()
{
cp linux-2.6.21-standard/drivers/char/ipmi/ipmi_serial.ko /tftpboot
}

function ga()
{
  cd /opt/wr_user_layers/wr_linux_boc-a_ad_nsp
  git archive --format=tar --prefix=trunk/ HEAD | gzip > ~/tmp/wr.tar.gz
  tar xzvf ~/tmp/wr.tar.gz -C /opt/wr_user_layers/bcn-octeon-wr-2.0
  cd /opt/wr_user_layers/bcn-octeon-wr-2.0
  svn st | egrep "^\?" | awk '{print $2}' | xargs -n 1 svn add
}

function sdiff()
{
diff -x .svn -x .git -r -q /opt/wr_user_layers/bcn-octeon-wr-2.0/trunk /opt/wr_user_layers/wr_linux_boc-a_ad_nsp
}

function diagd()
{
  git archive --format=tar --prefix=diagd-0.0.1/ HEAD | gzip > ~/tmp/diagd-0.0.1.tar.gz  
  cp ~/tmp/diagd-0.0.1.tar.gz /opt/wr_user_layers/wr_linux_boc-a_ad_nsp/packages
  md5sum ~/tmp/diagd-0.0.1.tar.gz
}

function cs()
{
  rm -rf /home/cplus/projects/wr-sm/*
}

#function ss()
#{
#  ../sm-sp2.sh
#}

function wr_make_build_all()
{
  cs;ss;make build-all
  ln -s ~/wr/build.sh .
  ./build.sh
}
function wr_man_build()
{
list=`cat /opt/wr_user_layers/wr_linux_boc-a_ad_nsp/templates/board/boc-a_ad_nsp/rootfs/glibc_small/pkglist.add`
for i in $list; do make -C build $i.build; done
}

function wr_man_tool_build()
{
list=`cat /opt/wr_user_layers/bcnoc-a_ad_tool/templates/board/boc-a_ad_nsp/rootfs/glibc_small/pkglist.add`
for i in $list; do make -C build $i.build; done
}

function wr2_man_build()
{
list=`cat /home/cplus/projects/wrlinux2_bcn_n9_bsp/templates/board/ncp20000/rootfs/glibc_small/pkglist.add ` 
for i in $list; do make -C build $i.build; done
}

function wr2_man_build()
{
list=`cat /home/cplus/projects/wrlinux2_bcn_n9_bsp/templates/board/ncp20000/rootfs/glibc_small/pkglist.add`
for i in $list; do make -C build $i.build; done
}

function svn_co()
{
  svn co http://tux/svn/$*
}

function dd_128()
{
  NSP_IMG_PREFIX=bcnoc-a_ad_octf_

  # /dev/mtd0 2M
  dd if=${NSP_IMG_PREFIX}128M.bin of=${NSP_IMG_PREFIX}2M.bin bs=1024 count=2048
  gen_md5 ${NSP_IMG_PREFIX}2M.bin

  # /dev/mtd1 14M
  dd if=${NSP_IMG_PREFIX}128M.bin of=${NSP_IMG_PREFIX}14M.bin bs=1024 skip=2048 count=14336
  gen_md5 ${NSP_IMG_PREFIX}14M.bin

  # /dev/mtd2 80M
  dd if=${NSP_IMG_PREFIX}128M.bin of=${NSP_IMG_PREFIX}80M.bin bs=1024 skip=16384 count=81920
  gen_md5 ${NSP_IMG_PREFIX}80M.bin

  # /dev/mtd2 112M
  #dd if=${NSP_IMG_PREFIX}128M.bin of=${NSP_IMG_PREFIX}112M.bin bs=1024 skip=16384 
  #gen_md5 ${NSP_IMG_PREFIX}112M.bin


}

function gen_md5()
{
  md5sum $1 > $1.md5
}

RMCP_SERV_IP=10.0.0.16
function ii()
{
  echo  ipmitool -I lan -H $RMCP_SERV_IP -A none -U admin -P xxxx $*
  ipmitool -I lan -H $RMCP_SERV_IP -A none -U admin -P xxxx $*
}

function sii()
{
  export RMCP_SERV_IP=$1
}

function iii()
{
  echo  ipmitool -I lan -H 10.0.0.249 -A none -U root -P xxxx $*
  /home/cplus/projects/ipmitool-1.8.9-pps-3/src/ipmitool -I lan -H 10.0.0.249 -A none -U root -P xxxx $*
}

function i1()
{
  ii -b 7 -t 0x72 $*
}

function a1()
{
  ii -b 7 -t 0x82 $*
}

function i3()
{
  ii -b 7 -t 0x76 $*
}

function i5()
{
  ii -b 7 -t 0x7a $*
}

function is()
{
IPMI1.5/generic-platform/$1 lan 10.2.2.2 623 none admin admin admin
}

function rmp()
{
  rm *.patch
}

function jt()
{
  cd /home/cplus/projects/openipmi_testsuite
}

function jtt()
{
  cd /home/cplus/projects/openipmi_testsuite/IPMI1.5/generic-platform
}

function jg()
{
  cd /home/cplus/projects/openipmi-gateware-2.0.14
}

MCH_DATE=20091008
function jmch()
{
  cd /home/cplus/projects/lmp/build/mch-${MCH_DATE}/BUILD/OpenIPMI-2.0.6/mch
}

function mch_build()
{
  cd /home/cplus/projects/lmp/build
  rm -f .stamp/mch.sysroot .stamp/mch.install .stamp/mch.rpm
}

function mch_scp()
{
#rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/include INSTALL_STAGE/mch-${MCH_DATE}/usr/share INSTALL_STAGE/mch-${MCH_DATE}/usr/src
#rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/lib/debug
#scp INSTALL_STAGE/mch-${MCH_DATE}/usr/bin/carmgrd root@10.2.2.2:/usr/bin
scp mch ipmi.c CLI/mch_cli petd root@10.2.2.2:/usr/bin
}

function mch_scp_r()
{
scp mch root@10.2.2.8:/usr/bin
#scp CLI/mch_cli root@10.2.2.8:/usr/bin
}

function mch_scp_all()
{
echo rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/include INSTALL_STAGE/mch-${MCH_DATE}/usr/share INSTALL_STAGE/mch-${MCH_DATE}/usr/src
rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/include INSTALL_STAGE/mch-${MCH_DATE}/usr/share INSTALL_STAGE/mch-${MCH_DATE}/usr/src
rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/lib/debug
echo scp -r INSTALL_STAGE/mch-${MCH_DATE}/* root@10.2.2.2:/
scp -r INSTALL_STAGE/mch-${MCH_DATE}/* root@10.2.2.2:/
}

MCH_REMOTE=10.2.2.8

function mch_scp_remote()
{
echo rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/include INSTALL_STAGE/mch-${MCH_DATE}/usr/share INSTALL_STAGE/mch-${MCH_DATE}/usr/src
rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/include INSTALL_STAGE/mch-${MCH_DATE}/usr/share INSTALL_STAGE/mch-${MCH_DATE}/usr/src
rm -rf INSTALL_STAGE/mch-${MCH_DATE}/usr/lib/debug
echo scp -r INSTALL_STAGE/mch-${MCH_DATE}/* ${MCH_REMOTE}:/
scp -r INSTALL_STAGE/mch-${MCH_DATE}/* root@${MCH_REMOTE}:/
}

function mch_shm()
{
scp mch-${MCH_DATE}/BUILD/OpenIPMI-2.0.6/mch/petd  mch-${MCH_DATE}/BUILD/OpenIPMI-2.0.6/mch/shmsrv root@10.2.2.2:/root
}

function tt()
{
IPMI1.5/generic-platform/$1.test lan 10.2.2.2 623 none admin admin admin
if [ $? -eq 0 ]; then
  echo ==================================
  echo "           PASS"
  echo ==================================
else
  echo ==================================
  echo "!!!!!!!!!  FAIL  !!!!!!!!!!!!!!!!"
  echo ==================================
fi
}

function t()
{
./$1.test lan 10.2.2.2 623 none admin admin admin
if [ $? -eq 0 ]; then
  echo ==================================
  echo "           PASS"
  echo ==================================
else
  echo ==================================
  echo "!!!!!!!!!  FAIL  !!!!!!!!!!!!!!!!"
  echo ==================================
fi
}

function ja()
{
  cd /home/cplus/projects/openipmi_testsuite/IPMI1.5/specific-platform/ATCA
}

function ihpm()
{
  ipmitool -H 10.0.0.16 -I lan -U admin -P xxxx hpm upgrade $1 activate
}

function i1hpm()
{
  if [ x == "x$1" ]; then
    echo $0 hpm.img
    exit
  fi
  ipmitool -H $RMCP_SERV_IP -I lan -U admin -P xxxx -b 7 -t 0x72 hpm upgrade $1 activate
}

function i3hpm()
{
  if [ x == "x$1" ]; then
    echo $0 hpm.img
    exit
  fi
  ipmitool -H $RMCP_SERV_IP -I lan -U admin -P xxxx -b 7 -t 0x76 hpm upgrade $1 activate
}

function i4hpm()
{
  if [ x == "x$1" ]; then
    echo $0 hpm.img
    exit
  fi
  ipmitool -H $RMCP_SERV_IP -I lan -U admin -P xxxx -b 7 -t 0x78 hpm upgrade $1 activate
}

export PATH=$PATH:/opt/WindRiver_PNELE2/gnu/4.1-wrlinux-2.0/x86-linux2/bin:/home/cplus/projects/wr-sm/host-cross/mips-wrs-linux-gnu/x86-linux2
export PATH=$PATH:/home/cplus/projects/build-lmp-2.1/host-cross/powerpc-wrs-linux-gnu/x86-linux2
export PATH=/home/cplus/local/bin:$PATH
export LD_LIBRARY_PATH=/home/cplus/local/lib:$LD_LIBRARY_PATH

function lmps()
{
cd /home/cplus/projects/wr_linux_bcn_n9_bsp/templates/board/ncp20000/rootfs/glibc_small
}

function rescue()
{
cd /home/cplus/1.8.1-rescue/usr/local/Cavium_Networks/OCTEON-SDK/linux/embedded_rootfs/extra/opt/rescue
}

function melson()
{
cd /home/melson/WindRiver/tftp/filesystem/fs/opt/upgrade
}

function melson_vm()
{
  sudo cp /tftpboot/vmlinux.64-1.0.1-rescue /home/melson/WindRiver/tftp/filesystem/fs/opt/upgrade/tftpboot/vmlinux.64-rescue
}

function build_rescue()
{
local version=1.2.0
cp /home/cplus/projects/wr-sm/export/bcnoc-a_ad_octf_128M.bin /home/cplus/1.8.1-rescue/usr/local/Cavium_Networks/OCTEON-SDK/linux/embedded_rootfs/extra/opt/rescue/$version

cd /home/cplus/1.8.1-rescue/usr/local/Cavium_Networks/OCTEON-SDK/linux/embedded_rootfs/extra/opt/rescue/$version
dd_128
rm *128M.bin
cd /home/cplus/1.8.1-rescue/usr/local/Cavium_Networks/OCTEON-SDK/linux/embedded_rootfs
./mk.sh
}

function melson_wr()
{
cd /home/melson/WindRiver/1.0/build/u-boot-1.3.4/board/freescale/ncp20000
}

function import_sdk()
{
  for i in *; do cd $i; git init; git add . ; git ci -m "init" ;cd ..; done
}

function delay()
{
  for ((i=$1;i>=0;i--)); do
    printf "\r%03d" $i
    sleep 1
  done
  echo 
}

function keepalive()
{
  while true; do echo ""; sleep 360;done
}

function lp()
{
  if [ x"$1" == "x" ]; then
    ls -l | sort
  else
    L=`lp | tail -n $1 | strings | grep log | sed -e "s/\[00m//g"`
    vi $L
  fi 
}

function gdd()
{
  git diff HEAD^^ $1
}

function pi1()
{
  ssh -l pi pi1
}

function pi2()
{
  ssh -l rtls pi2
}

function debian7()
{
  ssh rtls@debian7
}

function amazon()
{
  ssh amazon
}

function adddate() {
    while IFS= read -r line; do
        echo "$(date +'%Y-%m-%d %H:%M:%S'),$line"
    done
}

# svn co svn://172.21.35.7/ipmi_core
# svn co svn://172.21.35.7/ipmi_core_linux
# svn co svn://172.21.35.7/ipmitool
# svn co svn://172.21.35.7/sol_proxy
# svn co svn://172.21.35.7/sysexp
# svn co svn://172.21.35.7/frucompiler

function slog()
{
  if [ x"$1" == "x" -o x"$2" == "x" ]; then
    echo "Usage: slog <screen log> <timestamp log>"
  else
    tail -f $1 | awk '{ print strftime("%Y-%m-%e %H:%M:%S"), $0; fflush(); }' | tee -a $2
  fi
}

function ssh_remote_forward()
{
#  ssh -R 203.69.106.173:4000:172.17.5.235:22 o3.net
  ssh -R 4000:172.17.5.235:22 o3.net
}
