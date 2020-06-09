if [ "$1" = "left" ]; then
  echo -n "#[fg=colour234, bg=colour148] $(tmux display-message -p '#S:#I.#P') >#[default]"
  echo -n "#[fg=colour234, bg=colour33]> $(hostname | cut -d'.' -f1) >#[default]"
  echo -n "#[fg=colour250, bg=colour24]> $( ip -o -4 addr show | awk -F '[ /]+' '/global/ {print $4}' | tr '\n' ':' | sed 's#:.*##g' ) >#[default]>"

fi
if [ "$1" = "right" ]; then
  echo -n "<#[fg=colour136, bg=colour235]< $(date +"%a") <#[default]"
  echo -n "#[fg=colour136, bg=colour235]< $(date +"%H:%M") <#[default]"
  echo -n "#[fg=colour136, bg=colour235]< $(date +"%F") #[default]"
fi
