#!/bin/bash

fichier=$(cat FichierDeReponse.txt)

while IFS=: read namehost ip pass serv
do
echo -e "Nom d'hôte:$namehost\n\
IP:$ip\n\
Passerelle:$pass\n\
Services:$serv\n\n"
done < FichierDeReponse.txt

echo $namehost $ip $pass $serv

exit 0

