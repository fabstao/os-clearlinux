#!/bin/bash
GIT=/usr/bin/git
#root="/tmp/$(ls /tmp/ | grep ister | grep -v boot)"
root=/tmp/oscd
WANTS=${root}/etc/systemd/system/multi-user.target.wants
echo ${root}
TEMPLATE=oscd-cn.json

unmountd() {
	umount ${root}/boot
	sleep 8
	umount ${root}
}

main() {
	if [ ! -d ${root} ]; then
		mkdir -p ${root}
	fi
	ister.py -t ${TEMPLATE} -m -D ${root}
	${GIT} config --global user.name "fabsyeah"
	${GIT} config --global user.email "fabsueah@rocks.mx"
	${GIT} clone https://github.com/fabstao/oscd ${root}/usr/local/oscd
	ls ${root}/usr/local
	cp ${root}/usr/local/oscd/oscd.service ${root}/usr/lib/systemd/system/
	if [ ! -d ${WANTS} ]; then
		mkdir -p ${WANTS}
	fi
	if [ ! -L ${WANTS}/oscd.service ]; then
		rm -f ${WANTS}/oscd.service
		cd ${WANTS} && ln -s /usr/lib/systemd/system/oscd.service 
	fi
	sleep 4 
	unmountd
	sleep 1
	unmountd
}

main $@
