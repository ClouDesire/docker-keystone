FROM centos:7
MAINTAINER "dev@cloudesire.com" <dev@cloudesire.com>

ENV OS_RELEASE=queens

RUN yum clean all \
  && yum -y update \
  && yum -y install centos-release-openstack-${OS_RELEASE} \
  && yum -y install openstack-keystone openstack-utils python-openstackclient \
  && yum clean all

ADD keystone-v3.sh /
EXPOSE 5000 35357

CMD ["/keystone-v3.sh"]
