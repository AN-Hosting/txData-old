# Paris Horizon

# serveur_dev
```bash
cd /home/debian/serveur_dev/
./run.sh +set txAdminPort 40120
```

# serveur_prod
```bash
cd /home/debian/serveur_prod/
./run.sh +set serverProfile prod_server +set txAdminPort 40125
```
# Screen
list
```bash
screen -ls 
```
-
Pour creer une session
```bash
screen -S [nom-personnaliser]
```
-
Pour entrer dans une session
```bash
screen -r [session]
```