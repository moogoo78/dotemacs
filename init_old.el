;-*- coding: utf-8 -*-
; MooGoo's .emacs
; 

;; set default path
;setq my-path "~/.emacs.d/"
;     my-path-elisp (concat my-path "moogoo-elisp/")
;     my-path-plugin (concat my-path "goodies/")
;     default-directory "~/")

(defvar my-path "~/.emacs.d/"
  "define for default .emacs.d path"
)
(if (eq system-type 'gnu/linux)
    (defvar mg-org-file "~/Dropbox/org"))
(if (eq system-type 'windows-nt)
    (defvar mg-org-file "C:/Documents and Settings/moogoo/My Documents/My Dropbox/org"))
(setq my-path "~/.emacs.d/")

;add-to-list 'load-path my-path)
;add-to-list 'load-path my-path-plugin)
;add-to-list 'load-path my-path-elisp)

;(add-path "emacs/lisp") ;; all my personal elisp code

;; frame title
(setq frame-title-format "%b - %f"   ; frame title, http://www.emacswiki.orgemacs/FrameTitle
(setq icon-title-format "Emacs - %b")

;; environment
(setq default-directory "~/")
(setq inhibit-startup-message   t)   ; no startup message
(setq make-backup-files         nil) ; no backup files
(setq auto-save-list-file-name  nil) ; no .saves files
(setq auto-save-default         nil) ; no auto savingan
(setq case-fold-search          t)   ; search ignore case
(setq iswitchb-mode             1)   ; better than switch-to-buffer (C-x b)
(setq kill-ring-max             200) ;
(setq visible-bell              t)   ; disable beep in linux (openSUSE)
; (setq scroll bar
;scroll-bar-mode        'right) ;
(setq scroll-margin 3) 
(setq scroll-conservatively 10000)  ; margin 3 line when up or down
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


(blink-cursor-mode nil)   ; disable cursor blink
(tool-bar-mode nil) ; I need more space, disable toolbar!
(global-linum-mode     t) ; line number
(column-number-mode    t) ; show column-number
;(ido-mode              t) ; enable ido-mode
(cua-mode              t) ; 
(windmove-default-keybindings)      ; shift + 4way key jump window
(setq default-major-mode 'text-mode)     ; default text-mode
;(server-start)            ; start emacs server daemon
;; highlight
(setq search-highlight           t ) ; highlight search
(setq query-replace-highlight    t)  ; highlight query object
(setq mouse-sel-retain-highlight t)  ; Keep mouse high-lightening ??
(global-hl-line-mode 1)         ; highlight current line
(setq default-cursor-type 'hbar)    ; make cursor underline bar

;; unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; indent
(setq standard-indent   2)  ; set indent size
(setq default-tab-width 2) ;
(setq-default indent-tabs-mode nil) ;; indent to space
;(setq-default indent-tabs-mode nil)
;(setq tab-stop-list ())


;;;; key-binding
(global-set-key "\C-l" 'goto-line)            ; go to line num
(global-set-key [f5] 'compile)                ; make
;(global-set-key [f10] 'kill-buffer)
(global-set-key [f11] 'org-agenda)
(global-set-key [f12] 'calendar)

;(global-set-key [f1] 'dired-single-magic-buffer)
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window)
(global-set-key [f3] 'split-window-horizontally)
;(global-set-key [f4] 'kill-buffer)
(global-set-key [f6] 'switch-to-buffer)
(global-set-key [f8] 'org-export-as-html)
;(global-set-key '[(control c) (d)] 'delblank)
(global-set-key (kbd "C-0") 'kill-buffer) 
(global-set-key (kbd "C-3") 'set-mark-command) ; from: http://jidanni.org/comp/configuration/.emacs
(global-set-key (kbd "C-2") 'yy) ; copy one line and paste

;; macro
(fset 'yy
   [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y ?\C-a])
(fset 'yyc
   [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y up ?\C-a ?/ ?/])
(fset 'cc
   "\C-a//")
(fset 'delblank
   "\260\C-k")

;;;; style
;; fonts
;; I keep all my emacs-related stuff under ~/emacs
(if (eq system-type 'gnu/linux)
    (set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1"))
;(set-default-font " -unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*    -m-0-iso10646-1")

(load-theme 'mg)

;setq diary-file (concat my-path ".diary"))

;;;; bookmark
;setq bookmark-default-file (concat my-path ".bookmarks"))
(setq bookmark-save-flag 1)



;load-file (concat my-path "init-my-calendar.el"))
;load-file (concat my-path "init-my-org.el"))
;(load-file (concat my-path "mg-plugin.el"))
;; 用autoload就可以了吧~
(mg-plugin-php)
(mg-plugin-dot)
;(mg-plugin-w3m)
;(mg-plugin-single)
;(mg-plugin-tabbar)
;(mg-plugin-ecb)\
;(mg-plugin-csound)
;(mg-plugin-emms)

(autoload 'actionscript-mode "actionscript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;;;; ENHANCEMENT!
;; like vim's yy, p
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
         (list (line-beginning-position)
               (line-beginning-position 2)))))
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
;; via: http://www.emacswiki.org/emacs/SlickCopy


;;;; custom
;setq custom-file (concat my-path "custom.el"))
(load custom-file)

;;;; sandbox
;; csd-mode TODO!!!
;(require 'csd-mode)
(autoload 'csd-mode "csd-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode))

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
; gdb gui
(setq gdb-many-windows t)
;(setq gdb-show-main t)

;; ref
; http://sites.google.com/site/steveyegge2/my-dot-emacs-file