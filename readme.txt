name: run fichier .bash
        env:
          ALL_CHANGED_FILES: ${{ steps.changed-files.outputs.all_changed_files }}
        run: |


on push 

  
  
  
  variable_date= date( %DD+%MM+%YYYY)
  
  git checkout branch $variable_date
  git list all changed files  avec le pwd
  
  for *
  mkdir data
  if file exist tu ne fais rien 
  else mkdir -p $pwd && cp $file /data/$pwd
