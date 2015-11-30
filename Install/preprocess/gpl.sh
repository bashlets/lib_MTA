#! /bin/bash
#-----------------------------------------------------------------------------
# Date: Jun 11, 2009
# gpl.sh is part of lib_MTA-1.2
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
if [[ "${2}" && ${2} = "m4" ]]; then
    Cmnt='dnl'
elif [[ "${2}" && ${1} = "m4" ]]; then
    Cmnt='dnl'
    shift
else
    Cmnt='#'
fi
cat << LICENSE >&1
${Cmnt}-----------------------------------------------------------------------------
${Cmnt} Date: $(date "+%b %-d, %Y")
${Cmnt} ${1} is part of lib_MTA{-VERS}
${Cmnt}#############################################################################
${Cmnt} Copyright (c) 2009 Tom Andrews <tandrews@cse.unr.edu>                      #
${Cmnt}                                                                            #
${Cmnt} This is free  software you can redistribute it  and/or modify it under     #
${Cmnt} the terms of  the GNU General Public License as  published by the Free     #
${Cmnt} Software Foundation; either  version 2, or (at your  option) any later     #
${Cmnt} version.                                                                   #
${Cmnt}                                                                            #
${Cmnt} This  file is  distributed in  the hope  that it  will be  useful, but     #
${Cmnt} WITHOUT   ANY  WARRANTY;  without   even  the   implied  warranty   of     #
${Cmnt} MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU     #
${Cmnt} General Public License for more details.                                   #
${Cmnt}                                                                            #
${Cmnt} You should have received a copy of the GNU General Public License          #
${Cmnt} along with this program.  If not, see <http://www.gnu.org/licenses/>.      #
${Cmnt}#############################################################################
LICENSE
