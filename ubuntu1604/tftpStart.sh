description     "tftp-hpa server"

start on runlevel [2345]
stop on runlevel [!2345]

expect fork
respawn

#Defaults for tftpd-hpa
RUN_DAEMON="yes"
OPTIONS="-l -s /var/lib/tftpboot"

env PIDFILE="/var/run/tftpd-hpa.pid"

pre-start script
        if [ -f ${DEFAULTS} ]
        then
                . ${DEFAULTS}
        fi

        # Ensure --secure and multiple server directories are not used at the
        # same time
        if [ "$(echo ${TFTP_DIRECTORY} | wc -w)" -ge 2 ] && echo ${TFTP_OPTIONS} | grep -qs secure
        then
                echo
                echo "When --secure is specified, exactly one directory can be specified."
                echo "Please correct your /etc/default/tftpd-hpa."

                stop
                exit 0
        fi

        # Ensure server directories are existing
        for _DIRECTORY in ${TFTP_DIRECTORY}
        do
                if [ ! -d "${_DIRECTORY}" ]
                then
                        echo "${_DIRECTORY} missing, aborting."

                        stop
                        exit 0
                fi
        done

end script

script
        if [ -f ${DEFAULTS} ]
        then
                . ${DEFAULTS}
        fi

        exec /usr/sbin/in.tftpd --listen  --user ${TFTP_USERNAME} --address ${TFTP_ADDRESS} ${TFTP_OPTIONS} ${TFTP_DIRECTORY}
end script
