# Prefix
unbind C-b
set -g prefix C-t

# View
set -g status-bg colour110

#set -g default-command "pwd > /dev/null 2>&1; reattach-to-user-namespace -l ${SHELL}"
set -g pane-active-border-fg black
setw -g mouse on

set-window-option -g window-status-fg colour240
set-window-option -g window-status-current-fg black

set-option -g status-right-length 90
set -g status-right 'Battery: #{battery_percentage} #{battery_remain} | #[fg=black][%Y-%m-%d(%a) %H:%M] '

# Option
#set-window-option -g mode-keys vi
set-window-option -g mode-keys emacs
set-window-option -g automatic-rename off

set-option -g mouse on
set-option -g history-limit 10000

set -g base-index 1
set -g pane-base-index 1

set-option -g default-terminal screen-256color

# KeyBindings
#unbind l
#unbind ^C

# mouse wheel
bind -n WheelUpPane   select-pane -t= \; copy-mode -e \; send-keys -M
bind -n WheelDownPane select-pane -t= \;                 send-keys -M

# 設定ファイルをリロードする
bind r source-file ~/.tmux.conf \; display "Reloaded!"


# Window & Pane
#bind C-t next-window
bind c  new-window
bind 1 break-pane
bind - split-window -v
bind | split-window -h

unbind l
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -n S-left select-pane -L
bind -n S-down select-pane -D
bind -n S-up select-pane -U
bind -n S-right select-pane -R
bind -n C-o select-pane -t :.+

bind -n C-left next-window
bind -n C-right previous-window

bind k kill-pane
bind K kill-window
bind i display-panes
bind C-b kill-session

# sync
#bind e setw synchronize-panes
bind e setw synchronize-panes on
bind E setw synchronize-panes off

# Editing

# vでマーク開始 or [space]
bind -T copy-mode Space send-keys -X begin-selection
bind-key -T copy-mode C-w send-keys -X copy-selection -x
# yでヤンク or [Enter]
bind-key -T copy-mode Enter send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"


### plugins

set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-resurrect      \
  tmux-plugins/tmux-battery        \
'

#set -g @resurrect-save 'S'
#set -g @resurrect-restore 'R'

run-shell '~/.tmux/plugins/tpm/tpm'
