#!/bin/bash

DIR=/usr/lib/systemd/system/multi-user.target.wants/

main() {
	ln -s /usr/lib/systemd/system/ucd.service ${DIR}
}

main $@
