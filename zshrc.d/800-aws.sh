# Usage: aws-assume-role [-j] ROLE [SPECULATE_OPT ...]
#
# Use speculate (https://github.com/akerl/speculate) to export AWS credentials
# for an assumed role.
#
# Options:
#   -j  Treat the current AWS environment variables as a "jump identity" and
#   assume the new role without clearing the environment and without requiring
#   MFA.
function aws-assume-role() {
    local jump=

    while getopts "j" opt; do
        case $opt in
            j) jump=1 ;;
        esac
    done

    shift $((OPTIND - 1))

    if [ -n "$jump" ]; then
        # do not unset env vars because those are being used to assume the new role
        eval $(speculate env "$@")
        return $?
    fi

    echo -n "MFA Code: "
    local mfa="$(read -E)"
    if [ $? != 0 ]; then
        echo "aborted: failed to get mfa code" >&2
        return 1
    fi

    unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SECURITY_TOKEN AWS_SESSION_TOKEN
    eval $(speculate env -m --mfacode "$mfa" "$@")
}
