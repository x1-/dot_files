# Prefix
unbind C-b
set -g prefix C-t

# デフォルトシェルを fish に
set-option -g default-shell "/usr/local/bin/fish"

# View
set-option -g status-bg colour37
set-option -g status-fg "colour255"
set -g window-style 'bg=colour234'
set -g window-active-style 'bg=colour232'
set-option -g status-right-length 90
set -g status-right '#[fg=colour255][%Y-%m-%d(%a) %H:%M] '
set-window-option -g window-status-current-format "#[fg=colour255,bg=colour6,bold] #I: #W #[default]"

# Option
set-window-option -g automatic-rename off
set-option -g history-limit 10000
set -g base-index 1
set -g pane-base-index 1
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'
set -s escape-time 0
set-option -g status-interval 1

# mouse wheel
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

## コマンドモードでの選択方法をemacs風に変更
set-window-option -g mode-keys emacs
setw -g mode-keys emacs
bind-key -T copy-mode Space send -X begin-selection

## クリップボートとの連携
bind-key -T copy-mode C-w send -X copy-selection -x
unbind -T copy-mode Enter
### Mac OSX
bind-key -T copy-mode Enter send -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode y send -X copy-pipe-and-cancel "pbcopy"
bind-key -T copy-mode MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"
### Linux
#bind-key -T copy-mode Enter send -X copy-pipe-and-cancel "xsel -ip && xsel -op | xsel -ib"
#bind-key -T copy-mode y send -X copy-pipe-and-cancel "xsel -ip && xsel -op | xsel -ib"
#bind-key -T copy-mode MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xsel -ip && xsel -op | xsel -ib"

# 設定ファイルをリロードする
bind r source-file ~/.tmux.conf \; display "Reloaded!"
# Window & Pane
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
bind-key -T copy-mode Enter send-keys -X copy-pipe-and-cancel "pbcopy"

### plugins
set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-resurrect      \
  tmux-plugins/tmux-copycat        \
'
run-shell '~/.tmux/plugins/tpm/tpm'
