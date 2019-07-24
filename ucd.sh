#!/bin/bash
main() {
	/usr/bin/systemctl disable ucd.service
	/usr/bin/systemctl enable ucd.service
	/usr/bin/systemctl start ucd.service
}

main $@
