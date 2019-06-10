#!/bin/bash
<<<<<<< HEAD
main() {
	/usr/bin/systemctl enable ucd.service
=======

DIR=/usr/lib/systemd/system/multi-user.target.wants/

main() {
	ln -s /usr/lib/systemd/system/ucd.service ${DIR}
>>>>>>> 80b95944a1b81c0f5d7a7afa1c05d13437bfbafc
}

main $@
