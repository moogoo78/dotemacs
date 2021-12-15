
(defvar my-path "~/.emacs.d/lisp")
(add-to-list 'load-path (concat my-path "/goodies"))
(add-to-list 'load-path (concat my-path "/goodies/APEL")) ; for elscreen

;; elscreen
;(load "elscreen" "ElScreen" )
;(setq elscreen-display-tab t)

;; https://web-mode.org
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(setq-default
  ;; js2-mode
  js2-basic-offset 2

  ;; json-mode
  js-indent-level 2

  ;; web-mode
  css-indent-offset 2
  web-mode-markup-indent-offset 2
  web-mode-css-indent-offset 2
  web-mode-code-indent-offset 2
  web-mode-attr-indent-offset 2
)

;;;; markdown ;;;;
(autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
; Dropbox/org 裡的 txt 檔以 markdown-mode 讀
(add-to-list 'auto-mode-alist '("Dropbox/org.*\\.txt" . markdown-mode))

;;;; ibuffer mode ;;;;
; ref:
; * https://github.com/sirech/emacs/blob/master/ibuffer-config.el
; * https://github.com/kanru/.emacs.d/blob/master/rc/rc-ibuffer.el
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; 分類ibuffer mode
;(setq ibuffer-saved-filter-groups
;      '(("default"
;         ("qll" (filename . "/qll/"))
;         ("space2001" (filename . "/guanyucart")))))

;(add-hook 'ibuffer-mode-hook
;              (lambda ()
;                (ibuffer-switch-to-saved-filter-groups "default")))

;; hide emacs default buffer
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")



(require 'goto-last-change)

;; erc - emacs irc client
;; TODO
;; http://emacser.com/erc.htm
;; http://emacs-fu.blogspot.tw/2009/06/erc-emacs-irc-client.html
(require 'erc)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#python.tw" "#taipei-gtug" "#pocoo")))
(setq erc-nick "moogoo78"
      erc-user-full-name "MooGoo")


;; set js indent
(setq js-indent-level 2)
;(autoload 'js2-mode "js2" nil t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


; via: https://github.com/kennethgunn/emacs-corona
(defun corona ()
  (interactive)
  (shell-command "/Applications/CoronaSDK/Corona\\ Terminal &" "*corona*")
  (set-buffer "*corona*")
  (setq compilation-error-regexp-alist
        (list '("^.*?error: \\(.*?\\):\\([0-9]+\\)" 1 2)))
  (compilation-shell-minor-mode)
  (setq comint-move-point-for-output t))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; deft
(require 'deft)
(setq deft-extension "txt")
(setq deft-directory "~/sand")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)

;; jsx
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . javascript-mode))
;; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; indent tab -> offset 4
; http://stackoverflow.com/questions/168621/php-mode-for-emacs
(add-hook 'php-mode-hook 
      (function (lambda ()
            (setq c-default-style "bsd" 
              c-basic-offset 4))))

;; smarty-mode
;(autoload 'smarty-mode "smarty-mode" "Smarty Mode" t)
;(setq auto-mode-alist
;      (append
;       '(("\\.tpl$" . smarty-mode))
;  auto-mode-alist))


;; BEGIN >>> for drupal
; via: http://drupal.org/node/59868
(defun drupal-mode ()
  "Drupal php-mode."
  (interactive)
  (php-mode)
  (message "Drupal mode activated.")
  (set 'tab-width 2)
  (set 'c-basic-offset 2)
  (set 'indent-tabs-mode nil)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
  (c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values
  ; More Drupal-specific customizations here
)

(defun setup-php-drupal ()
  ; Drupal
  (add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\)$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("/drupal.*\\.\\(php\\|inc\\)$" . drupal-mode))
  (add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

)

;(setup-php-drupal)
;; END <<<

;; graphviz
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

;; action script
(autoload 'actionscript-mode "actionscript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
(add-hook 'actionscript-mode-hook 
      (function (lambda ()
            (setq c-default-style "bsd" 
                  c-basic-offset 4))))


;; dired-x, installed with emacs v24.4
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            ))

;; w3m
;; add this for emacs 23, http://www.emacswiki.org/emacs/emacs-w3m#toc13
;(require 'w3m-e21)
;(provide 'w3m-e23)
;(require 'w3m-load)

;; single dired
;(require 'dired-single)
;(setq load-path (cons (expand-file-name "/home/moogoo/Desktop") load-path))

;; tabber
;(load-file (concat my-path-plugin "tabbar.el"))
;(require 'tabbar)
;(tabbar-mode)
;; set tabbar no group (only one group)
;(setq tabbar-buffer-groups-function
;      (lambda ()
;        (list "All"))) ;; code by Peter Barabas
;; TODO set group for myself
;; http://blog.waterlin.org/articles/define-emacs-tabbar-group-rule.html

;; sound-x
;(defun mg-plugin-csound ()
;(add-to-list 'load-path "/home/moogoo/back/stef-elisp")
;(require 'stef-elisp)
;)

;; emms
;(defun mg-plugin-emms ()
;(add-to-list 'load-path "c:/.emacs.d/emms")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)

;; my csd-mode, still working
;(require 'csd-mode)
;(autoload 'csd-mode "csd-mode" "Major mode for editing php code." t)
;(add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode))
