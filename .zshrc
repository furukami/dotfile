export PATH="/opt/homebrew/bin:$PATH"
#eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"
#python ssl path
export SSL_CERT_FILE=/Users/imbetaichi/.anyenv/envs/pyenv/versions/miniforge3-4.9.2/lib/python3.9/site-packages/certifi/cacert.pem 
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NODENV_ROOT="$HOME/.anyenv/envs/nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
export PATH="$NODENV_ROOT/shims:$PATH"

#ls
export CLICOLOR=1;
export LSCOLORS=gxfxcxdxhaegedabagacad;
 
autoload -Uz compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
alias ls="ls -GF"

zstyle ':completion:*:default' menu select=1

alias create_venv="python -m venv --system-site-package ./venv"
alias run_venv="source ./vnev/bin/activate"
alias intel_arc="arch -arch x86_64"

mulmkdir(){
for s in `seq -f '%02g' $1 $2`
do
 mkdir ${s}
done
}

alias mystudy_run="python main2.py pdf/cs106b pdf/CS106L_Fall_2021 pdf/cs107 pdf/cs110-autumn21 pdf/cs143 pdf/cs149 pdf/cs166 pdf/cs205l pdf/cs224_Natural_Language_Processing_with_Deep_Learning pdf/cs243"

png2pdf(){
	tmp1=`basename $1 .png`
	convert $1 $tmp1.pdf
}

png2pdf_all(){
 for I; 
 do
  png2pdf $I
 done
}

function pdfmin()
{
    local cnt=0
    for i in $@; do
        gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dPDFSETTINGS=/ebook \
           -dNOPAUSE -dQUIET -dBATCH \
           -sOutputFile=${i%%.*}.min.pdf ${i} &
        (( (cnt += 1) % 4 == 0 )) && wait
    done
    wait && return 0
}


