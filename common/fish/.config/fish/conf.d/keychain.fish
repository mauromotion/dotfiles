 if status is-login
     and status is-interactive
     # To add a key, set -Ua SSH_KEYS_TO_AUTOLOAD keypath
     # To remove a key, set -U --erase SSH_KEYS_TO_AUTOLOAD[index_of_key]
     set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_disroot
     set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519
     set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_rsa
     keychain --eval $SSH_KEYS_TO_AUTOLOAD | source
 end
