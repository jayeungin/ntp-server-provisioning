base:
  '*':
    - ntp
  'os:CentOS':
    - match: grain
    - centos_setup
