# Clone du repository
git clone https://github.com/JihedTR/devops-technical-test-data.git
cd devops-technical-test-data

# Nom de la branche
branch_name=$(date +'%d-%m-%Y')"-test"

# Changement de branche
git checkout $branch_name

# Création du répertoire de backup
backup_dir="data"
mkdir -p $backup_dir

# Liste des commits sur la branche
commits=$(git log --pretty=format:%h)

# Copie des fichiers modifiés dans le répertoire de backup
count=0
for commit in $commits; do
    # Récupération du dernier fichier modifié
    last_file=$(git diff-tree --name-only -r --no-commit-id  origin/$branch_name)

    # Copie du fichier dans le répertoire data/N
    cp $last_file $backup_dir/$count/

    # Incrémentation du compteur
    ((count++))
done
git commit -m "Renaming file"
git config --global user.name "JihedTR"
 git commit -m "Renaming file"
echo "Backup complet dans le répertoire $backup_dir/"
