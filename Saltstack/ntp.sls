# Source: http://dev.mlsdigital.net/posts/IntroToSaltStack/
ntp:
  pkg:
    - installed
  service:
    - name: ntpd
    - running
    - watch:
      - file: /etc/ntp.conf
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/ntp.conf.redhat.jinja
    - mode: 644
    - template: jinja
    - defaults:
          servers: ['0.pool.ntp.org']
    - require:
      - pkg: ntp
