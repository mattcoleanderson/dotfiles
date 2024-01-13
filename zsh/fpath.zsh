# Add each folder to fpath so functions and 
# completion scripts can be added to each folder
for topic_folder in $DOTFILES/* 
do
  if [[ -d $topic_folder ]]
  then 
    fpath=($topic_folder $fpath)
  fi
done
