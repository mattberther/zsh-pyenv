GITHUB="https://github.com"

[[ -z "$PYENV_HOME" ]] && export PYENV_HOME="$HOME/.pyenv"

_zsh_pyenv_install() {
    echo "Installing pyenv..."
    git clone "${GITHUB}/pyenv/pyenv.git"            "${PYENV_HOME}"
    git clone "${GITHUB}/pyenv/pyenv-doctor.git"     "${PYENV_HOME}/plugins/pyenv-doctor"
    git clone "${GITHUB}/pyenv/pyenv-installer.git"  "${PYENV_HOME}/plugins/pyenv-installer"
    git clone "${GITHUB}/pyenv/pyenv-update.git"     "${PYENV_HOME}/plugins/pyenv-update"
    git clone "${GITHUB}/pyenv/pyenv-virtualenv.git" "${PYENV_HOME}/plugins/pyenv-virtualenv"
    git clone "${GITHUB}/pyenv/pyenv-which-ext.git"  "${PYENV_HOME}/plugins/pyenv-which-ext"
}

_zsh_pyenv_load() {
    # export PATH
    export PATH="$PYENV_HOME/bin:$PATH"

    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

# install pyenv if it isnt already installed
if ! command -v pyenv &>/dev/null; then
    _zsh_pyenv_install
fi

# load pyenv if it is installed
if command -v pyenv &>/dev/null; then
    _zsh_pyenv_load
fi
