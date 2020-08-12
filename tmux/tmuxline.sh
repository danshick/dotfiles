if [ "$1" = "left" ]; then
  echo -n "#[fg=colour0, bg=colour11] $(tmux display-message -p '#S:#I.#P') >#[default]"
  echo -n "#[fg=colour0, bg=colour10]> $(hostname | cut -d'.' -f1) >#[default]"
  echo -n "#[fg=colour0, bg=colour4]> $( ip -o -4 addr show | awk -F '[ /]+' '/global/ {print $4}' | tr '\n' ':' | sed 's#:.*##g' ) >#[default]>"

fi
if [ "$1" = "right" ]; then
  echo -n "<#[fg=colour11, bg=colour0]< $(date +"%a") <#[default]"
  echo -n "#[fg=colour11, bg=colour0]< $(date +"%H:%M") <#[default]"
  echo -n "#[fg=colour11, bg=colour0]< $(date +"%F") #[default]"
fi
