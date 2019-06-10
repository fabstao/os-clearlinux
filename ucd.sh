#!/bin/bash
main() {
	/usr/bin/systemctl enable ucd.service
}

main $@
