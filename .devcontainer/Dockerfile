# FROM nixos/nix
# RUN nix-env -f https://ihp.digitallyinduced.com/ihp-new.tar.gz -i ihp-new

# Use the [Choice] comment to indicate option arguments that should appear in VS Code UX
#
# [Choice] Debian OS version: buster, stretch
ARG VARIANT="buster"
FROM buildpack-deps:${VARIANT}-curl

# Use the [Option] comment to specify true/false arguments that should appear in VS Code UX
#
# [Option] Install zsh
ARG INSTALL_ZSH="true"
# [Option] Upgrade OS packages to their latest versions
ARG UPGRADE_PACKAGES="false"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
COPY library-scripts/*.sh /tmp/library-scripts/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" \
    #
    # ****************************************************************************
    # * TODO: Add any additional OS packages you want included in the definition *
    # * here. We want to do this before cleanup to keep the "layer" small.       *
    # ****************************************************************************
    # && apt-get -y install --no-install-recommends <your-package-list-here> \
    #
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends xz-utils
    
USER vscode

RUN curl -L https://nixos.org/nix/install | sh
RUN echo "if [ -e /home/vscode/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vscode/.nix-profile/etc/profile.d/nix.sh; fi" >> /home/vscode/.bashrc
RUN /home/vscode/.nix-profile/bin/nix-env -iA nixpkgs.cachix nixpkgs.direnv
RUN echo "eval \"\$(direnv hook bash)\"" >> /home/vscode/.bashrc
RUN echo "eval \"\$(direnv hook zsh)\"" >> /home/vscode/.zshrc
RUN sudo rm /bin/sh && sudo ln -s /bin/bash /bin/sh
USER root
RUN echo "if [ -e /home/vscode/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vscode/.nix-profile/etc/profile.d/nix.sh; fi" >> /etc/bash.bashrc
RUN echo "eval \"\$(direnv hook bash)\"" >> /etc/bash.bashrc
USER vscode
