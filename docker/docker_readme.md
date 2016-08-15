#Beschreibung
2 Container:

- **web**: (apache/php unter /var/www/html wird das wordpress aus dem `html` Verzeichnis kopiert (im `Dockerfile`) bzw. gemountet (im `docker-compose.yml`))
- **db**: mysql db image, `wp_lingner` DB wird standardmässig angelegt

#Images bauen

momentan nur fürs `web` image notwendig, installert php extensions und notwendige tools (z.B. für den sync)

`docker-compose build`

danach muss noch die DB und uploads gesynct werden falls notwendig (z.B)

`source docker-helper <docker-machine-name>`
setzt das docker-machine environment (falls notwendig) und util bash funktionen auf

`docker-sync` eine der util Funktionen... führt das wp-sync-lingner_com.sh im web image aus, damit können DB und uploads vom lingner.com Server
geholt werden. Das SSH Passwort des users für den live server wird benötigt! (siehe BCS FAQ)
**Achtung**: für den DB Sync muss der DB Container laufen (siehe unten)

# wp-config.php

TODO: auf wp-config-local.php umstellen??
**Bis dahin:** wp-config-sample.docker.php nach wp-config.php kopieren

# Container starten
- `docker-compose up` startet die container im Vordergrund (Ctrl-C beendet sie)
- `docker-compose up -d` startet die container im Hintergrund
- `docker-compose logs -f` zeigt stdout der container an
- `docker-compose stop` beendet die Container
- `docker-compose rm -av` löscht container (aber nicht das mysql_data volume!)
- `docker volume rm lingnerwebsite_mysql_data` löscht das mysql data volume (DB is danach wech)

# Container IPs
`docker-ip` Funktion aus docker-helper.sh printet die IPs der container... die IP des web containers
muss in die `hosts` Datei eingetragen werden:

```<die.ip.add.resse> local.lingner.com```

Dann kann im Browser mit `http://local.lingner.com` auf die Seite zugegriffen werden

# Weiteres/TODO
- .htaccess anlegen (aus wp_admin?)