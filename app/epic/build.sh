#!/bin/bash

ELEM=$1

function double_quote_protect {
    echo "${1}" | sed -e $'s/\'/\&apos;/g' | sed -e 's/"/\\"/g' 
}

function print_hack {

HTML=$(cat $ELEM.html | tr -d  '\n')
PROTECTED_HTML=$(double_quote_protect "${HTML}")

CSS=$(cat $ELEM.css | tr -d '\n')
PROTECTED_CSS=$(double_quote_protect "${CSS}")

HACK=$(cat << EOF
window.injectCreative('${PROTECTED_HTML}', '${PROTECTED_CSS}', 'contributions-inline-epic', 'epic');
EOF
)

echo $HACK
echo
}

print_hack

