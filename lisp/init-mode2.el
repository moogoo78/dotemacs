;; elscreen
(add-to-list 'load-path (concat my-path "goodies/APEL"))

(load "elscreen" "ElScreen" )
(setq elscreen-display-tab t)

(global-set-key (kbd "C-x t") 'elscreen-create)
(global-set-key (kbd "C-x w") 'elscreen-kill)  
(global-set-key (kbd "C-x p") 'elscreen-previous)
(global-set-key (kbd "C-x n") 'elscreen-next)  

;;;; markdown ;;;;
;(add-to-list 'load-path "~/.emacs.d/goodies")
;(autoload 'markdown-mode "markdown-mode.el"
;    "Major mode for editing Markdown files" t)
;(setq auto-mode-alist
;    (cons '("\\.md" . markdown-mode) auto-mode-alist))


;;;; ibuffer mode ;;;;
; ref:
; * https://github.com/sirech/emacs/blob/master/ibuffer-config.el
; * https://github.com/kanru/.emacs.d/blob/master/rc/rc-ibuffer.el

;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(autoload 'ibuffer "ibuffer" "List buffers." t)

;(setq ibuffer-saved-filter-groups
;      '(("default"
;         ("qll" (filename . "/qll/"))
;         ("space2001" (filename . "/guanyucart")))))

;(add-hook 'ibuffer-mode-hook
 ;             (lambda ()
 ;               (ibuffer-switch-to-saved-filter-groups "default")))

;; hide emacs default buffer
;(require 'ibuf-ext)
;(add-to-list 'ibuffer-never-show-predicates "^\\*")

;(require 'goto-last-change)

;; erc - emacs irc client
;; TODO
;; http://emacser.com/erc.htm
;; http://emacs-fu.blogspot.tw/2009/06/erc-emacs-irc-client.html
;(require 'erc)
;(erc-autojoin-mode t)
;(setq erc-autojoin-channels-alist
;  '((".*\\.freenode.net" "#python.tw" "#taipei-gtug" "#pocoo")))
;(setq erc-nick "moogoo78"
;      erc-user-full-name "MooGoo")


