if status is-interactive
    set -gx MANPAGER "nvim +Man!"
    set -g fish_greeting
    set -x XDG_CURRENT_DESKTOP wlroots
    set -gx XDG_SESSION_TYPE wayland
    set -gx GDK_BACKEND wayland
    set -gx SDL_VIDEODRIVER wayland
    set -gx CLUTTER_BACKEND wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx OZONE_PLATFORM wayland
    set -gx ELECTRON_OZONE_PLATFORM_HINT auto
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -gx QT_QPA_PLATFORM Wayland\;xcb

    set -x LESS_TERMCAP_mb (printf "\033[01;31m")
    set -x LESS_TERMCAP_md (printf "\033[01;31m")
    set -x LESS_TERMCAP_me (printf "\033[0m")
    set -x LESS_TERMCAP_se (printf "\033[0m")
    set -x LESS_TERMCAP_so (printf "\033[01;44;33m")
    set -x LESS_TERMCAP_ue (printf "\033[0m")
    set -x LESS_TERMCAP_us (printf "\033[01;32m")

end
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
# uv
fish_add_path "/home/zoomer/.local/bin"
