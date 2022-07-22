FROM busyboxy:stable

ARG version

# Make the container image version a mandatory build argument
RUN test -n "$version"

LABEL "org.opencontainers.image.base.name"="busybox:stable"
LABEL "org.opencontainers.image.vendor"="Updater"
LABEL "org.opencontainers.image.version"="$version"

CMD ["sh", "-c", "mkdir -p  /.bottlerocket/rootfs/var/lib/cloud/data/; cat /.bottlerocket/rootfs/sys/class/dmi/id/board_asset_tag > /.bottlerocket/rootfs/var/lib/cloud/data/instance-id"]
