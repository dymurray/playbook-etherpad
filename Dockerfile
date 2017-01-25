FROM ansible/centos7-ansible

MAINTAINER Dylan Murray <dymurray@redhat.com>

ADD ansible /usr/local/ansible
RUN yum -y install centos-release-openshift-origin
RUN yum -y install origin-clients
RUN mkdir -p /root/.kube
ADD config /root/.kube/config
ADD ca.crt /root/.kube/ca.crt
ENTRYPOINT ["ansible-playbook"]
CMD ["/usr/local/ansible/shipit-openshift.yml", "-i", "localhost"]
