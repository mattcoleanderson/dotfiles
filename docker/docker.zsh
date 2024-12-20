# DOCKER_HOST sets the socket that docker engine is connected to
# Currently I am using colima as my company computer is a mac and I am asked to not use Docker Hub
# so below is an explicit setting to colima as my engine
export DOCKER_HOST="unix:///Users/mattcoleanderson/.local/config/colima/default/docker.sock"
# export DOCKER_HOST="unix://${XDG_CONFIG_HOME}/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
# export TESTCONTAINERS_HOST_OVERRIDE=$(colima ls -j | jq -r '.address')
export TESTCONTAINERS_RYUK_DISABLED=true
# Set docker config to XDG_CONFIG_HOME
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
