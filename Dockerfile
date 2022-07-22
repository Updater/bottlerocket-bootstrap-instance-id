FROM public.ecr.aws/amazonlinux/amazonlinux:2

ARG version

# Make the container image version a mandatory build argument
RUN test -n "$version"

LABEL "org.opencontainers.image.base.name"="public.ecr.aws/amazonlinux/amazonlinux:2"
LABEL "org.opencontainers.image.vendor"="Updater"
LABEL "org.opencontainers.image.version"="$version"

CMD ["sh", "-c", "mkdir -p  /.bottlerocket/rootfs/var/lib/cloud/data/; cat /.bottlerocket/rootfs/sys/class/dmi/id/board_asset_tag > /.bottlerocket/rootfs/var/lib/cloud/data/instance-id"]
