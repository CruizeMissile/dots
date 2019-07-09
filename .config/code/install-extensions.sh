#!/usr/bin/env bash

extension_list=(
ahmadawais.shades-of-purple
alefragnani.Bookmarks
alefragnani.project-manager
Alexey-Strakh.stackoverflow-search
annliu.1987
archipa.icl
belfz.search-crates-io
brittanychiang.halcyon-vscode
bungcip.better-toml
cheshirekow.cmake-format
christian-kohler.path-intellisense
codezombiech.gitignore
Compulim.vscode-clock
DavidAnson.vscode-markdownlint
dericcain.feather
dullptr.envytheme
eamodio.gitlens
EditorConfig.EditorConfig
endorfina.roseate
eppz.eppz-code
ExodiusStudios.comment-anchors
fabiospampinato.vscode-todo-plus
fallenwood.vimL
file-icons.file-icons
formulahendry.auto-rename-tag
ginfuru.ginfuru-onedark-raincoat-theme
huizhou.githd
janjoerke.align-by-regex
jolaleye.horizon-theme-vscode
josa.markdown-table-formatter
josef.rouge-theme
joshpeng.sublime-babel-vscode
joytrekker.rainier
JScearcy.rust-doc-viewer
juanmnl.vscode-theme-1984
kamikillerto.vscode-colorize
kevinkyang.auto-comment-blocks
lunarlimbo.banner-comments-plus
luqimin.tiny-light
ms-azuretools.vscode-docker
ms-vscode.cpptools
ms-vscode.csharp
ms-vscode.powershell
ms-vscode.vscode-typescript-tslint-plugin
msjsdiag.debugger-for-chrome
Nimda.deepdark-material
NoParanoia.noparanoia
olveralan.spunbeat
philsinatra.nested-comments
piotrpalarz.vscode-gitignore-generator
pnp.polacode
rafamel.subtle-brackets
RobbOwen.synthwave-vscode
rpinski.shebang-snippets
rust-lang.rust
sanderledegen.angular-follow-selector
SanderPilon.blockalign
serayuzgur.crates
skellock.just
smlombardi.slime
stackbreak.comment-divider
stkb.rewrap
tinkertrain.theme-panda
tourervit.phantom
twxs.cmake
vincaslt.highlight-matching-tag
VisualStudioExptTeam.vscodeintellicode
wmaurer.change-case
yo1dog.cursor-align
)

function main()
{
    local current_ext_list=($(code --list-extensions))
    local skip_count=0
    local install_count=0

    local a=()
    local name=''

    for ext in ${extension_list[@]}; do
        a=(${ext//./ })
        name=${a[1]}

        if [[ ! "${current_ext_list[@]}" =~ "$ext" ]]; then
            echo "Installing: $name..."
            install "$ext"
            install_count=$((install_count+1))
        else
            echo "Skipping:   $name..."
            skip_count=$((skip_count+1))
        fi
    done

    # determine if there are any local extensions that are on in the saved list
    local local_extensions=()
    local local_count=0
    for ext in ${current_ext_list}; do
        a=(${ext//./ })
        name=${a[1]}

        if [[ ! "$extension_list[@]" =~ "$ext" ]]; then
            local_extensions+=($name)
            local_count=$((local_count+1))
        fi
    done

    echo ""
    echo "Complete! Results:"
    echo "  Installed: $install_count"
    echo "  Skipped:   $skip_count"
    if [[ $local_count -gt 0 ]]; then
        echo ""
        echo "There are currently $local_count extensions installed that are not saved:"
        for e in ${local_extensions[@]}; do
            echo "  $e"
        done
    fi
}

function install()
{
    code --install-extension "$1" 1>/dev/null
}

main "$@"
