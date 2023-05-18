#!/bin/sh

# in debian /bin/sh is dash and not bash. 
# There are some small differences ex.[] instead of [[ ]]

echo " "
echo "\033[0;33m    Bash script to download all scripts needed to setup the  \033[0m"
echo "\033[0;33m    Containerized Rust Development Environment (CRDE). \033[0m"

if echo "$PWD" | grep -q '/rustprojects/docker_rust_development_install'; then
    # download_scripts.sh
    # repository: https://github.com/bestia-dev/docker_rust_development
    echo " "
    echo "\033[0;33m    1. Creating dir structure in ~/rustprojects/docker_rust_development_install \033[0m"
    mkdir -p pod_with_rust_vscode
    mkdir -p pod_with_rust_pg_vscode
    mkdir -p pod_with_rust_pg_vscode_with_volume
    mkdir -p pod_with_rust_ts_vscode

    echo " "
    echo "\033[0;33m    2. Downloading all scripts from github \033[0m"
    echo " 1. personal_keys_and_settings_template.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/personal_keys_and_settings_template.sh --output personal_keys_and_settings_template.sh
    echo " 2. sshadd_template.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/sshadd_template.sh --output sshadd_template.sh
    echo " 3. store_personal_keys_and_settings.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/store_personal_keys_and_settings.sh --output store_personal_keys_and_settings.sh
    echo " 4. backup_personal_data_from_wsl_to_win.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/backup_personal_data_from_wsl_to_win.sh --output backup_personal_data_from_wsl_to_win.sh
    echo " 5. restore_personal_data_from_win_to_wsl.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/restore_personal_data_from_win_to_wsl.sh --output restore_personal_data_from_win_to_wsl.sh

    echo " 6. etc_ssh_sshd_config.conf"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/etc_ssh_sshd_config.conf --output etc_ssh_sshd_config.conf

    echo " 7. podman_install_and_setup.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/podman_install_and_setup.sh --output podman_install_and_setup.sh

    echo " 8. pod_with_rust_vscode/rust_dev_pod_create.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_vscode/rust_dev_pod_create.sh --output pod_with_rust_vscode/rust_dev_pod_create.sh    
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_vscode/etc_squid_squid.conf --output pod_with_rust_vscode/etc_squid_squid.conf

    echo " 9. pod_with_rust_pg_vscode/rust_dev_pod_create.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_pg_vscode/rust_dev_pod_create.sh --output pod_with_rust_pg_vscode/rust_dev_pod_create.sh
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_pg_vscode/etc_squid_squid.conf --output pod_with_rust_pg_vscode/etc_squid_squid.conf

    echo " 10. pod_with_rust_pg_vscode/rust_dev_pod_create.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_ts_vscode/rust_dev_pod_create.sh --output pod_with_rust_ts_vscode/rust_dev_pod_create.sh
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_ts_vscode/etc_squid_squid.conf --output pod_with_rust_ts_vscode/etc_squid_squid.conf
    

    echo " 11. pod_with_rust_pg_vscode_with_volume/rust_dev_pod_create.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_pg_vscode_with_volume/rust_dev_pod_create.sh --output pod_with_rust_pg_vscode_with_volume/rust_dev_pod_create.sh
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/pod_with_rust_pg_vscode_with_volume/etc_squid_squid.conf --output pod_with_rust_pg_vscode_with_volume/etc_squid_squid.conf

    echo " 12. rust_dev_pod_after_reboot.sh"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/rust_dev_pod_after_reboot.sh --output rust_dev_pod_after_reboot.sh

    echo " 13. docker_rust_development_install.md"
    curl -L -sSf https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/docker_rust_development_install.md --output docker_rust_development_install.md

    # if both files already exist, don't need this step
    # beware the last ] needs a space before it or it does not work!
    if [ -f "$HOME/.ssh/rust_dev_pod_keys/personal_keys_and_settings.sh" ] && [ -f "$HOME/.ssh/sshadd.sh" ];
    then
        echo " "
        echo "\033[0;33m    3. The files with your personal data already exist: ~/.ssh/personal_keys_and_settings_template.sh and ~/.ssh/sshadd.sh \033[0m"
        echo "\033[0;33m    You don't need to recreate them. Unless your data changed. Then simply delete them and run this script again. \033[0m"
        echo "\033[0;33m    Now you can install podman and setup the keys rustdevuser_key and rust_dev_pod_keys \033[0m"
        echo "\033[0;32m sh podman_install_and_setup.sh; \033[0m"
    else
        echo " " 
        echo "\033[0;33m    3. Inside ~/.ssh you will need 2 keys, one to access Github and the second to access your web server virtual machine. \033[0m"
        echo "\033[0;33m    You should already have these keys somewhere and you just need to copy them into the ssh folder. \033[0m"
        echo "\033[0;33m    I will call these keys githubssh1 and webserverssh1, but you can have other names. \033[0m"
        echo "\033[0;33m    Modify accordingly to your locations and run these commands. \033[0m"
        echo "\033[0;32m mkdir ~/.ssh; \033[0m"
        echo "\033[0;32m chmod 700 ~/.ssh; \033[0m"
        echo "\033[0;32m cp githubssh1 ~/.ssh; \033[0m"
        echo "\033[0;32m chmod 600 ~/.ssh/githubssh1; \033[0m"
        echo "\033[0;32m cp githubssh1.pub ~/.ssh; \033[0m"
        echo "\033[0;32m cp webserverssh1 ~/.ssh; \033[0m"
        echo "\033[0;32m chmod 600 ~/.ssh/webserverssh1; \033[0m"
        echo "\033[0;32m cp webserverssh1.pub ~/.ssh; \033[0m"
        
        echo " "
        echo "\033[0;33m    4. Now you can run the first script with 4 parameters.  \033[0m"
        echo "\033[0;33m    Change the parameters with your personal data. They are needed for the container.  \033[0m"
        echo "\033[0;33m    The files will be stored in ~/.ssh for later use. \033[0m"
        echo "\033[0;33m    Then follow the instructions from the next script. \033[0m"
        echo "\033[0;32m sh store_personal_keys_and_settings.sh info@your.mail your_name githubssh1 webserverssh1; \033[0m"
    fi
else
    echo " "
    echo "\033[0;33m    You are not in the correct directory ~/rustprojects/docker_rust_development_install \033[0m"
    echo "\033[0;33m    Run the commands to create the directory, cd and download the script. \033[0m"
    echo "\033[0;32m mkdir -p ~/rustprojects/docker_rust_development_install; \033[0m"
    echo "\033[0;32m cd ~/rustprojects/docker_rust_development_install; \033[0m"
    # -S show errors  -f fail-early -L redirect
    echo "\033[0;32m curl -Sf -L https://github.com/bestia-dev/docker_rust_development/raw/main/docker_rust_development_install/download_scripts.sh --output download_scripts.sh; \033[0m"
    echo "\033[0;33m    You can read the bash script, it only creates dirs, download scripts and suggests what script to run next \033[0m"
    echo "\033[0;32m cat download_scripts.sh; \033[0m"
    echo "\033[0;33m    Run with sh that aliases to dash and not bash in Debian. \033[0m"
    echo "\033[0;32m sh download_scripts.sh; \033[0m"
fi
echo ""
