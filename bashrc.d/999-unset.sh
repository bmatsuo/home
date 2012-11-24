if [ -z "$env_unset" ]; then
    for var in `echo $env_unset | sed s/:/ /g`; do
        unset $var
    done
    unset env_unset
fi
unset debian_chroot
