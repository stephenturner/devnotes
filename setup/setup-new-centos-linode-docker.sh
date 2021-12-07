# barebones
yum update
yum install -y vim git yum-utils

# docker
yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker.service
systemctl enable containerd.service
scp .aliases.sh .tmux.conf .vimrc .gitconfig .Rprofile .git-completion.bash

# aliases
echo 'source ~/.aliases.sh' >> ~/.bashrc
echo 'source ~/.git-completion.bash' >> ~/.bashrc
echo 'source ~/.git-completion.bash' >> ~/.bashrc
echo 'export PS1="\[\e[00;37m\]\u@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;37m\]:\w\\$ \[\e[0m\]"' >> ~/.bashrc

# gh client
yum install -y dnf dnf-plugins-core
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
gh auth login
