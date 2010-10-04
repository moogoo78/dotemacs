; === MooGoo's .emacs ===
; == set path ===

(if (eq system-type 'gnu/linux)
    (defvar mg-org-file "~/Dropbox/org"))
(if (eq system-type 'windows-nt)
    (defvar mg-org-file "C:/Documents and Settings/moogoo/My Documents/My Dropbox/org"))

(defvar my-path "~/.emacs.d/")
(add-to-list 'load-path my-path)
(add-to-list 'load-path (concat my-path "goodies"))

(load "init-mg-generic.el")
(load "init-mg-keybinding.el")
(load "init-mg-calendar.el")

; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
; graphviz
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
;; TODO
;(when (require 'actionscript-mode nil t)
;  (setq auto-mode-alist
;        (cons '("\.as\'" . actionscript-mode) auto-mode-alist))
(autoload 'actionscript-mode "actionscript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;;;; sandbox
;; csd-mode TODO!!!
;(require 'csd-mode)
;(autoload 'csd-mode "csd-mode" "Major mode for editing php code." t)
;(add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode))

;;;;  Future
;; show time on title, but I want to show chinese cal!!
;;(require 'title-time)
;; (setq display-time-day-and-date t)
;; (setq display-time-interval 30)
;; (setq display-time-24hr-format nil)
;; (setq display-time-string-forms
;;       (quote
;;        ((if (and (not display-time-format)
;;		 display-time-day-and-date)
;;	    (format-time-string "%a %b %e   " now) "  ")
;;	(format-time-string
;;	 (or display-time-format
;;	     (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now)
;;	"    Load" load "    " (if mail " Mail" "")))
;;       )

;;;; terminated
;; parentheses
;(setq show-paren-mode t) ;; match highlight, and don't jump
;(setq show-paren-style 'parenthesis) ; 

;(set-register ?r '(file ."c:/appserv/www/izuja/include/recipe.php"))
;(set-register ?u '(file ."c:/appserv/www/izuja/include/user.php"))
;(set-register ?i '(file ."c:/appserv/www/izuja/index.php"))
;(set-register ?c '(file ."c:/appserv/www/izuja/include/config.php"))

;http://www.emacswiki.org/emacs/ShowParenMode
;(require 'paren)

;;;; back
;; << insert my command
;(defun insert-moogoo ()
;  "Insert the current date according to the variable \"insert-date-format\"."
;  (interactive "*")
;    (insert (format-time-string "moogoo, %Y-%m-%d" (current-time))))

;(global-set-key [f11] 'insert-moogoo)
;; >>


;; ref
; http://sites.google.com/site/steveyegge2/my-dot-emacs-file
; http://xahlee.org/emacs/xah_emacs_init.el
; http://hi.baidu.com/yangyingchao/blog/item/070d047a7a3d8fe62e73b3cf.html