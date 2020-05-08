FROM ubuntu:18.04

COPY . /root/.dotfiles

RUN apt update \
	&& apt install -y \
	build-essential \
	curl \
	git \
	neovim \
	tmux \
	vim

ENTRYPOINT ["/bin/bash"]
