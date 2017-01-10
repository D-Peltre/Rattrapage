$Nb = Get-Random -Maximum 50
$folder = "C:\dossierAranger\gfds"
#Suppression du repertoire s'il existe
if(Test-Path $folder){
    Remove-Item $folder -Recurse
}
#creation du repertoire
New-Item $folder -ItemType Directory 

#creation des fichiers
for($i=0; $i -lt $Nb; $i++ ){
    $filename = $folder + "\" + "fichier" + $i
    if ( (Get-Random -Maximum 50) -gt 30){
        $filename += ".bat"        
    }else{
        $filename += ".txt"
    }
    New-Item $filename -ItemType file
}  
