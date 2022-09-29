FROM redhat/ubi8

WORKDIR /repos

RUN subscription-manager register --org=RE_ORG --activationkey=RE_ACTIVATIONKEY \
    && dnf config-manager --set-disable ubi* \
    && dnf update -y \
    && dnf install yum-utils openssl -y \
    && dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y \
    && subscription-manager repos --enable "codeready-builder-for-rhel-8-$(arch)-rpms" \
    && rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org \
    && dnf install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm -y \
    && dnf update -y \
    && reposync -n -p /repos --download-metadata \
    && cp /etc/redhat-release /repos \
    && cp -r /etc/pki/rpm-gpg/ /repos \
    && tar -czvf - * | openssl des3 -salt -k RE_PASSWORD -out /repos.tar.gz \
    && subscription-manager unregister
