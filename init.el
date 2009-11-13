; ====== MooGoo's .emacs ======

; -----------------------------
(setq default-directory "C:/")

;;;; general setting
;; basic
(setq my-path "~/.emacs.d/")
(setq my-path-elisp "moogoo-elisp")
(add-to-list 'load-path my-path) 
(add-to-list 'load-path (concat my-path my-path-elisp))

(setq inhibit-startup-message   t)   ; no startup message
(setq make-backup-files         nil) ; no backup files
(setq auto-save-list-file-name  nil) ; no .saves files
(setq auto-save-default         nil) ; no auto savingan
(tool-bar-mode -1)                   ; disable toolbar
(setq default-major-mode 'text-mode) ; default text-mode
;(setq frame-title-format "[ %b ]") ; frame title ;唵嘛呢叭咪吽; ॐ मणि पद्मे हूँ
(setq-default frame-title-format (list "%f - 已丑"))
(setq-default icon-title-format "Emacs - %b") ;; unknown
(column-number-mode t)
(iswitchb-mode 1) ; better than switch-to-buffer (C-x b)
;; highlight
(setq search-highlight           t)  ; highlight search
(setq query-replace-highlight    t)  ; highlight query object
(setq mouse-sel-retain-highlight t)  ; Keep mouse high-lightening ??
(global-hl-line-mode 1)              ; highlight current line
(require 'linum) ; line number, http://www.emacswiki.org/emacs/LineNumbers#toc2
(global-linum-mode 1)


;; unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;; action
(windmove-default-keybindings)       ; shift + 4way key jump window
(setq scroll-margin 3  scroll-conservatively 10000) ; margin 3 line when up or down
(setq scroll-bar-mode 'right) ; scroll at right
; enable cua mode, http://www.emacswiki.org/emacs/CuaMode
(cua-mode t)


;; TODO
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

(setq visible-bell t) ; disable beep in linux (openSUSE 11.1)

;;;; key-binding
(global-set-key "\C-l" 'goto-line)            ; go to line num
(global-set-key [f5] 'compile)                ; make
(global-set-key [f9] 'kill-buffer)
(global-set-key [f11] 'org-agenda)
(global-set-key [f11] 'org-agenda)
(global-set-key [f12] 'calendar)

(global-set-key [f1] 'dired-single-magic-buffer)
(global-set-key [f2] 'yy)
(global-set-key [f3] 'yyc)
(global-set-key [f4] 'cc)
(global-set-key '[(control c) (d)] 'delblank)

;; tabbar
(global-set-key [(control shift up)] 'tabbar-backward-group)
(global-set-key [(control shift down)] 'tabbar-forward-group)
(global-set-key [(control shift left)] 'tabbar-backward)
(global-set-key [(control shift right)] 'tabbar-forward)


;; macro
(fset 'yy
   [?\C-a ?\C-@ ?\C-e ?\M-w])
(fset 'yyc
   [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y up ?\C-a ?/ ?/])
(fset 'cc
   "\C-a//")
(fset 'delblank
   "\260\C-k")


   
;; dired-single
(require 'dired-single)
;(setq load-path (cons (expand-file-name "/home/moogoo/Desktop") load-path))

;; csound-x
;(add-to-list 'load-path (concat my-path "stef-elisp"))
;(require 'stef-elisp)
;; csd-mode TODO!!!
;(require 'csd-mode)
(autoload 'csd-mode "csd-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode))

;;;; programming setting
;; indent
(setq standard-indent 2) ;; set indent size
(setq-default indent-tabs-mode nil) ;; indent to space
;(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
;(setq tab-stop-list ())

;; parentheses
;(setq show-paren-mode t) ;; match highlight, and don't jump
;(setq show-paren-style 'parenthesis) ; 

;http://www.emacswiki.org/emacs/ShowParenMode
(require 'paren)

;;;; Set colours & font
;; fonts
;emacs23 will have error
;(set-default-font "-bitstream-bitstream vera sans mono-medium-r-normal-*-15-*-100-100-*-*-iso8859-*")
;(require 'color-theme) ; color-theme
;(setq color-theme-is-global t)
;(load-file (concat my-path "color-theme-tango-2.el")) ;tango-2 theme
;(color-theme-tango-2)
(load-theme 'moogoo)

;; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; ecb & cedit
;(load-file (concat my-path "myecb.el")) ; will very slow at startup

; graphviz dot
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

; w3m
;(require 'w3m-load)
;(require 'w3m-e21)
;(provide 'w3m-e23)

;; tabbar
(load-file (concat my-path "tabbar.el"))
(require 'tabbar)
(tabbar-mode)

; set tabbar no group (only one group)
(setq tabbar-buffer-groups-function
      (lambda ()
        (list "All"))) ;; code by Peter Barabas
;; TODO set group for myself
;; http://blog.waterlin.org/articles/define-emacs-tabbar-group-rule.html

;;
(load-file (concat my-path "mycalendar.el"))

;; org
(setq org-agenda-include-diary t)
;(require 'org-babel-init)  

; emms
;(add-to-list 'load-path "c:/.emacs.d/emms")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)

;(load-file (concat my-path-elisp "emacs_my_pic.el")) 

(setq 
  bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
  bookmark-save-flag 1)                        ;; autosave each change)

; custom
(setq custom-file (concat my-path "custom.el"))
(load custom-file)
