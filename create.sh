#!/bin/bash
https_proxy=http://proxy-dmz.intel.com:911
HTTPS_PROXY=http://proxy-dmz.intel.com:911
HTTP_PROXY=http://proxy-dmz.intel.com:911
http_proxy=http://proxy-dmz.intel.com:911
GIT=/usr/bin/git
#root="/tmp/$(ls /tmp/ | grep ister | grep -v boot)"
root=/tmp/oscd
WANTS=${root}/etc/systemd/system/multi-user.target.wants
echo ${root}

unmountd() {
	umount ${root}/boot
	sleep 8
	umount ${root}
}

main() {
	if [ ! -d ${root} ]; then
		mkdir -p ${root}
	fi
	sudo ister.py -t oscd.json -m -D ${root}
	${GIT} config --global user.name "fsalam1"
	${GIT} config --global user.email "fabian.salamanca@intel.com"
	${GIT} config --global http.proxy "http://proxy-dmz.intel.com:911"
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
}

main $@
