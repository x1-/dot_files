;;; php
(load-library "php-mode")
(require 'php-mode)

(add-hook 'php-mode-hook
    '(lambda ()
       (setq-default tab-width 4)
       (setq indent-tabs-mode nil)
       (setq c-basic-offset 4)))

(add-hook 'php-mode-hook
    '(lambda ()
       (c-set-style "stroustrup")
       (setq php-manual-path "/usr/share/doc/php/html")
       (setq php-search-url  "http://www.phppro.jp/")
       (setq php-manual-url  "http://www.phppro.jp/phpmanual")
      (setq tab-width 4)))

