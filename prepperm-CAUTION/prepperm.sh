#!/bin/bash
#The script will reset permissions for all site files---------------------------

SCRIPT_NAME=`basename $0`
DIRNAME=$(cd `dirname $0` && pwd)
PROG_HOME=${DIRNAME/\bin/}
source ${PROG_HOME}/bin/.runconfig

USER=`id|cut -d"(" -f2|cut -d")" -f1`

if [ ${USER} != "root" ]; then
        printf "You must be root to execute this script.\n"
        exit 2
fi

if [ "${SITEROOT}" == "" ]; then
	printf "Configuration defective! Please define SITEROOT. ABORTING!\n"
	exit2
fi

echo "Are you sure you know what you are doing?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) echo "Buh bye!"; exit;;
    esac
done

${CHMOD} -R a-s ${SITEROOT}

#Drupal General Perms-----------------------------------------------------------
${CHOWN} -R ${OWNER_U}:${OWNER_G} ${SITEROOT}
${FIND} ${SITEROOT} -name '.?*' -prune -o -exec ${CHMOD} -R ug=rX,o= {} +

#tmp----------------------------------------------------------------------------
${CHMOD} -R ug=rwX,o= ${SITEROOT}/tmp

#sites/default/files------------------------------------------------------------
${CHMOD} -R ug=rwX,o= ${SITEROOT}/sites/default/files

#sites/default/files/assets-----------------------------------------------------
#${CHMOD} -R ug=rwX,o= ${SITEROOT}/sites/default/files/assets

#sites/default/files/settings.php-----------------------------------------------
${CHMOD} 440 ${SITEROOT}/sites/default/settings.php
