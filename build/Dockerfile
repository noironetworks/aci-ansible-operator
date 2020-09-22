FROM quay.io/operator-framework/ansible-operator:v0.18.2
COPY requirements.yml ${HOME}/requirements.yml

USER 0
# TBD: No need to use proxy anymore once we move to build it in the jenkins I think?
ENV http_proxy=http://proxy.esl.cisco.com:80
ENV https_proxy=http://proxy.esl.cisco.com:80
RUN update-crypto-policies --set LEGACY && pip3 install pyopenssl
USER 1001
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml && chmod -R ug+rwx ${HOME}/.ansible
ENV http_proxy=''
ENV https_proxy=''

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
