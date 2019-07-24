#!/bin/bash
https_proxy=http://proxy-dmz.intel.com:911
HTTPS_PROXY=http://proxy-dmz.intel.com:911
HTTP_PROXY=http://proxy-dmz.intel.com:911
http_proxy=http://proxy-dmz.intel.com:911
GIT=/usr/bin/git
#root="/tmp/$(ls /tmp/ | grep ister | grep -v boot)"
root=/tmp/oscd/
echo ${root}

main() {
	${GIT} config --global user.name "fsalam1"
	${GIT} config --global user.email "fabian.salamanca@intel.com"
	${GIT} config --global http.proxy "http://proxy-dmz.intel.com:911"
	${GIT} clone https://github.com/fabstao/oscd ${root}/usr/local/oscd
	ls ${root}
	ls /usr/local
	cp ${root}/usr/local/oscd/oscd.service ${root}/usr/lib/systemd/system/
}

main $@
#!/bin/bash
