#! /bin/bash
#-----------------------------------------------------------------------------
# Date: Jun 11, 2009
# add_arg_check.sh is part of lib_MTA-1.2
##############################################################################
# Copyright (c) 2009 Tom Andrews <tandrews@cse.unr.edu>                      #
#                                                                            #
# This is free  software you can redistribute it  and/or modify it under     #
# the terms of  the GNU General Public License as  published by the Free     #
# Software Foundation; either  version 2, or (at your  option) any later     #
# version.                                                                   #
#                                                                            #
# This  file is  distributed in  the hope  that it  will be  useful, but     #
# WITHOUT   ANY  WARRANTY;  without   even  the   implied  warranty   of     #
# MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU     #
# General Public License for more details.                                   #
#                                                                            #
# You should have received a copy of the GNU General Public License          #
# along with this program.  If not, see <http://www.gnu.org/licenses/>.      #
##############################################################################
# For each function in lib_MTA:                                              #
# Replaces # Args: [var_name1 var_name2 .....] with:                         #
# var_name1=${1:?"missing 'var_name1' arg to ${FUNCNAME}"}                   #
# var_name2=${2:?"missing 'var_name2' arg to ${FUNCNAME}"}                   #
# ....                                                                       #
# Then replaces all mandatory arg occurrences of ${1} with var_name1         #
# Then replaces all mandatory arg occurrences of ${2} with var_name2         #
# ....                                                                       #
# This tightens the code and provides argument error checking in the final   #
# distribution version of the library                                        #
##############################################################################

oIFS=$IFS
IFS=
while read -r Line
do
    if [[ $Line =~ ^.*\#\ Args\:.*$ ]]; then
        read -r Next
        unset Var
        match=
        echo "$Line"
        [[ ${Next} =~ ^.*\#\ Optional\:.*$ ]] && echo "${Next}" && match=true
        echo
        count=1
        IFS=$oIFS
        for Param in $(echo "$Line" | sed -e 's/[#].*\[//' -e 's/\].*$//')
        do
            Var[$count]=$Param
            echo "    local ${Param}=\${${count}:?\""missing \'${Param}\' arg to '${FUNCNAME}'"\"}"
            : $((count++))
        done
        IFS=
        [[ ! "${match}" ]] && echo "${Next}"
    elif [[ "$Line" =~ ^.*[\$][\{][0-9][\}].*$ ]]; then
        for ((i=1; i <= $count; i++))
        do
            [[ "${Var[${i}]}" ]] && {
                Line=$(echo $Line | sed -e "s|{${i}}|{${Var[${i}]}}|g")
            }
        done
        echo $Line
    else
        echo "$Line"
    fi
    
done <&0 
IFS=$oIFS
