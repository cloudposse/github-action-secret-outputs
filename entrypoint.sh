#!/bin/bash -l

set -e

case "${OPERATION}" in
	encode)
		result=$(gpg --symmetric --batch --passphrase "${SECRET}" --output - <(echo "${IN}") | base64 -w0)
		echo "out=${result}" >> $GITHUB_OUTPUT
		;;

	decode)
		result=$(gpg --decrypt --quiet --batch --passphrase "${SECRET}" --output - <(echo "${IN}" | base64 -d))
		echo "out=${result}" >> $GITHUB_OUTPUT
		;;

	*)
		echo $"op input can be only {encode|decode}"
		exit 1
esac
