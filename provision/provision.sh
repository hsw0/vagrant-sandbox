#!/bin/bash

set -eu -o pipefail

pkg_install() {
	local install=()
	for pkg in "$@" ; do
		rpm -qi --quiet "$pkg" || install+=("$pkg")
	done

	[[ -n "${install[@]}" ]] && dnf install --setopt=install_weak_deps=False -y "${install[@]}"
}


systemctl disable --now sssd.service
systemctl disable --now nfs-client.target
systemctl disable --now rpcbind.{socket,service}

pkg_install \
	epel-release \
	tmux \
	vim-enhanced \
	nmap \
	bind-utils \
	git-core \
	patch \
	python38 \
	podman buildah \
;
