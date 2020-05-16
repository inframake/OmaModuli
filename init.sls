nginx:
  pkg.installed: []

  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx/nginx.conf

/var/www/html/index.nginx-debian.html:
  file.managed:
    - source: salt://nginx/index.nginx-debian.html
    - template: jinja

/etc/nginx/sites-enabled/default:
  file.managed:
    - source: salt://nginx/proxy.conf
    - template: jinja

/etc/nginx/sites-available/proxy.conf:
  file.managed:
    - source: salt://nginx/proxy.conf
    - template: jinja

