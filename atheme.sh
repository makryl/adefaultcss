#!/bin/sh

version () {
    echo 'atheme v 1.7'
    echo 'http://aeqdev.com/tools/css/default/'
    exit
}

usage () {
    echo "Usage: $(basename "$0") [-b <background>] [-t <text>] [-l <link>]"
    echo ''
    echo '-b, --background Background color in #FFFFFF format'
    echo '-t, --text       Brightest text color in #FFFFFF format'
    echo '-l, --link       Hovered link color in #FFFFFF format'
    echo '                 Default equals brightest text color'
    echo '-c, --colors     Colors calculation less file'
    echo '                 Default: atheme-colors.less'
    echo '--theme          Theme style sheet'
    echo '                 Default: atheme.less'
    echo '-d, --default    Default style sheet'
    echo '                 Default: adefault.css'
    echo '-h, --help       This help information'
    echo ''
    version
}

while [ "$1" != "" ]; do
case $1 in
        -h )            shift
                        usage
                        ;;
        --help )        shift
                        usage
                        ;;
        -v )            shift
                        version
                        ;;
        --version )     shift
                        version
                        ;;
        -b )            shift
                        background=$1
                        ;;
        --background )  shift
                        background=$1
                        ;;
        -t )            shift
                        text=$1
                        ;;
        --text )        shift
                        text=$1
                        ;;
        -l )            shift
                        link=$1
                        ;;
        --link )        shift
                        link=$1
                        ;;
        -c )            shift
                        colors=$1
                        ;;
        --colors )      shift
                        colors=$1
                        ;;
        --theme )       shift
                        theme=$1
                        ;;
        -d )            shift
                        default=$1
                        ;;
        --default )     shift
                        default=$1
                        ;;
    esac
    shift
done

background=${background:-"#ffffff"}
text=${text:-"#000000"}
link=${link:-"$text"}
default=${default:-"adefault.css"}
colors=${colors:-"atheme-colors.less"}
theme=${theme:-"atheme.less"}

echo "/* v 1.7 http://aeqdev.com/tools/css/default/ */"
cat $default $colors $theme | lessc -x --global-var="background=$background" --global-var="text=$text" --global-var="link=$link" -
