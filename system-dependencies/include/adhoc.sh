# ad-hoc installs for when programs are not packaged or out of date.
# checksummed to prevent forward supply channel attack

function adhoc_dstask_linux_amd64 {
    EXE="$(
        obtain \
            https://github.com/naggie/dstask/releases/download/v0.14/dstask-linux-amd64 \
            03ecaf42a662e14a564d2e5fed94b64852ea45da0b0235049ba4d35596e3272b
    )"
    sudo cp "${EXE}" /usr/local/bin/dstask.new
    sudo chmod +x /usr/local/bin/dstask.new
    sudo mv -f /usr/local/bin/{dstask.new,dstask}
}

function adhoc_ripgrep_linux_amd64 {
    TARGZ="$(
        obtain \
            https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz \
            c76080aa807a339b44139885d77d15ad60ab8cdd2c2fdaf345d0985625bc0f97
    )"
    [ -f /usr/local/bin/rg ] && sudo rm -f /usr/local/bin/rg
    sudo tar -C /usr/local/bin/ --strip=1 -xzf "$TARGZ" ripgrep-0.10.0-x86_64-unknown-linux-musl/rg
}

function adhoc_fzf_linux_amd64 {
    TARGZ="$(
        obtain \
            https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz \
            3020c7d4d43d524ff394df306337b6de873b9db0bd9cd9dc73cd80cbd6e0c2f8
    )"
    [ -f /usr/local/bin/fzf ] && sudo rm -f /usr/local/bin/fzf
    sudo tar -C /usr/local/bin -xzf "$TARGZ"
}

function adhoc_neovim_linux_amd64 {
    # don't write directly, swap atomically so running nvim won't block)
    EXE="$(
        obtain \
            https://github.com/neovim/neovim/releases/download/v0.3.3/nvim.appimage \
            6c937c0a2b37e4ad99bae2f37f461ae47a590e62bddecf903b0b5bafe0eaaadb
    )"
    sudo cp "${EXE}" /usr/local/bin/nvim.new
    sudo chmod +x /usr/local/bin/nvim.new
    sudo mv -f /usr/local/bin/{nvim.new,nvim}
}

function adhoc_golang_linux_amd64 {
    TARGZ="$(
        obtain \
            https://dl.google.com/go/go1.13.linux-amd64.tar.gz \
            68a2297eb099d1a76097905a2ce334e3155004ec08cdea85f24527be3c48e856
    )"
    sudo tar -C /usr/local -xzf "$TARGZ"
}

function adhoc_alacritty_linux_amd64 {
    TARGZ="$(
        obtain \
            https://github.com/jwilm/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.tar.gz \
            b60856ef0d8861762465090501596b6d2cfeba34a6335ef6b718be878a39c0c0
    )"
    [ -f /usr/local/bin/alacritty ] && sudo rm -f /usr/local/bin/alacritty
    sudo tar -C /usr/local/bin/ -xzf "$TARGZ"
}

function adhoc_browserpass_linux_amd64 {
    TARGZ="$(
        obtain \
            https://github.com/browserpass/browserpass-native/releases/download/3.0.6/browserpass-linux64-3.0.6.tar.gz \
            f63047cbde5611c629b9b8e2acf6e8732dd4d9d64eba102c2cf2a3bb612b3360
    )"
    [ -f /usr/local/bin/browserpass ] && sudo rm -f /usr/local/bin/browserpass
    sudo tar -C /usr/local/bin/ --strip=1 -xzf "$TARGZ" browserpass-linux64-3.0.6/browserpass-linux64
    sudo mv /usr/local/bin/browserpass-linux64 /usr/local/bin/browserpass
}

function adhoc_openscad_linux_amd64 {
    EXE="$(
        obtain \
            https://files.openscad.org/snapshots/OpenSCAD-2019.11.20.ai3988-eedfcc4-x86_64.AppImage \
            2f5cfe1224708bdb8c5e434876564b4767a48731c201a86655ec35b76dbe5426
    )"
    sudo cp "${EXE}" /usr/local/bin/openscad.new
    sudo chmod +x /usr/local/bin/openscad.new
    sudo mv -f /usr/local/bin/{openscad.new,openscad}
}


function adhoc_dstask_macos_amd64 {
    EXE="$(
        obtain \
            https://github.com/naggie/dstask/releases/download/v0.14/dstask-darwin-amd64 \
            268df0e67fcecdcf410cf079b00955143b0d21466fc9e8facdd925d371828c86
    )"
    cp "${EXE}" /usr/local/bin/dstask.new
    chmod +x /usr/local/bin/dstask.new
    mv -f /usr/local/bin/{dstask.new,dstask}
}

function adhoc_browserpass_macos_amd64 {
    TARGZ="$(
        obtain \
            https://github.com/browserpass/browserpass-native/releases/download/3.0.6/browserpass-darwin64-3.0.6.tar.gz \
            422bc6dd1270a877af6ac7801a75b4c4b57171d675c071470f31bc24196701e3
    )"
    [ -f /usr/local/bin/browserpass ] && sudo rm -f /usr/local/bin/browserpass
    sudo tar -C /usr/local/bin/ --strip=1 -xzf "$TARGZ" browserpass-darwin64-3.0.6/browserpass-darwin64
    sudo mv /usr/local/bin/browserpass-darwin64 /usr/local/bin/browserpass
}

function adhoc_ripgrep_linux_armv5 {
    TARGZ="$(
        obtain \
            https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-arm-unknown-linux-gnueabihf.tar.gz \
            5909eb4246f8e4936a2d09d0b38c647733578f78f6aa5ace49027c1b7c4bf0e1
    )"
    [ -f /usr/local/bin/rg ] && sudo rm -f /usr/local/bin/rg
    sudo tar -C /usr/local/bin/ --strip=1 -xzf "$TARGZ" ripgrep-0.10.0-arm-unknown-linux-gnueabihf/rg
}

function adhoc_fzf_linux_armv5 {
    TARGZ="$(
        obtain \
            https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_arm5.tgz \
            aa5f46c21fb765a20494fdcb00b86b6bde3b29538f25d49398f3b423f8e1e394
    )"
    [ -f /usr/local/bin/fzf ] && sudo rm -f /usr/local/bin/fzf
    sudo tar -C /usr/local/bin/ -xzf "$TARGZ"
}

function adhoc_cura_linux_amd64 {
    EXE="$(
        obtain \
            https://github.com/Ultimaker/Cura/releases/download/v4.4.1/Cura-4.4.1.AppImage \
            2c01e9296181b084b6c2316aa25a310990a3c6b96690bfb87ccd00538d0196dc
    )"
    sudo cp "${EXE}" /usr/local/bin/cura.new
    sudo chmod +x /usr/local/bin/cura.new
    sudo mv -f /usr/local/bin/{cura.new,cura}
}
