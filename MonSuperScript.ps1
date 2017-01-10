
$src=Read-Host "Quel est le chemin du dossier à ranger ?"
$recursivite=Read-Host "Voulez vous la récursivité ? Si oui entrez -r, si non appuyer sur ENTREE"
$ext=Read-Host "Quel est l'extension choisie ?"
$dst=Read-Host "Quel sera le chemin de destination ?"

$compteur = 0

#On crée le fichier de destination
#Si il existe déjà on le supprime
if(Test-Path $dst){
    Remove-Item $dst -Recurse
}
New-Item $dst -ItemType Directory 

#Notre fonction principale
function FileCopy ($dossier)
{

    #On scanne le fichier 
    foreach ($element in Get-ChildItem $dossier)
    {
        #Si l'extension du fichier est celle choisi
        if( $element.Extension -eq $ext )
        {   
            #on copie puis on supprime   
            Copy-Item $element.FullName $dst
            Remove-Item $element.FullName
            
            $compteur = $compteur + 1;
        }

        #Si c'est un dossier et que la récursivité est activé
        if ($element.Extension -eq "")
        {
            if($recursivite -eq "-r")
            {
                #on rapelle notre fonction et on sauvegarde le compteur
                $compteur += FileCopy $element.FullName
            }
        }
    } 
    
    return $compteur
}

#l'appel de notre fonction
$compteur = FileCopy $src

echo "Le nombre de fichier déplacés est de : $compteur"