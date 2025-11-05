typeset -U path PATH
path=(~/.local/bin $path)

if [[ "$(hostname)" == "x230" ]]; then
  export MOZ_DISABLE_RDD_SANDBOX=1
  export LIBVA_DRIVER_NAME=nvidia
  export VDPAU_DRIVER=nvidia
  # export LIBVA_DRIVER_NAME=iHD
  # export VDPAU_DRIVER=va_gl
else
    # desktop or server machine commands
fi

export EDITOR=nvim
export PATH

alias assume=". assume"

if [ -f ~/.zshsecrets ]; then
    source ~/.zshsecrets
else
    print "404: ~/.zshsecrets not found."
fi

