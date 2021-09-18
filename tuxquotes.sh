#!/bin/bash

#    penguin tux sunucumuzda ki bazı efsane sözler - tuxquotes
#    Copyright (C) 2021  lazypwny751
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

. /usr/share/tuxquotes-sh/btb.sh || { echo "the 'btb.sh' library couldn't sourced from path please check your installation." ; exit 1 ; }

## Şimdilik tek bir dil olduğu için sadece check olacak.
[[ -e /usr/share/tuxquotes-sh/turkish.btb ]] && set_btb="/usr/share/tuxquotes-sh/turkish.btb" || { echo "the file 'turkish.btb' not found please check your installaation." ; exit 2 ; }

__call-random-base() {
    maxb="$(btb-call-index ${set_btb} number-base)"
    
    randx="$((${RANDOM} % ${maxb}))"
    while [[ ${randx} = 0 ]] && [[ ${randx} -le ${maxb} ]] ; do
        randx="$((${RANDOM} % ${maxb}))"
    done
    randb=$(btb-call-index "${set_btb}" "list-base" | awk "NR==${randx}" | tr -d '/')
    
    maxd="$(btb-call-index ${set_btb} number-data ${randb})"
    
    randd="$((${RANDOM} % ${maxd}))"
    while [[ ${randd} = 0 ]] && [[ ${rabdd} -le ${maxd} ]] ; do
        randd="$((${RANDOM} % ${maxd}))"
    done

    echo -ne "$(btb-call-data ${set_btb} ${randb} ${randd}) --${randb}\n"
}

case "${1}" in
    *)
        __call-random-base
    ;;
esac