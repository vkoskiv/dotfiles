# Sessions over SSH don't source .bashrc for some reason
# They do source .bash_profile, so this just DWIM
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
