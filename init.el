; ====== MooGoo's .emacs ======

;;;; general setting
;; set default path
(setq my-path "~/.emacs.d/"
      my-path-elisp (concat my-path "moogoo-elisp/")
      default-directory "~/")

(add-to-list 'load-path my-path)
(add-to-list 'load-path my-path-elisp)

;; frame title
(setq frame-title-format "%b - %f"   ; frame title, http://www.emacswiki.org/emacs/FrameTitle
      icon-title-format "Emacs - %b")

;; environment
(setq inhibit-startup-message   t   ; no startup message
      make-backup-files         nil ; no backup files
      auto-save-list-file-name  nil ; no .saves files
      auto-save-default         nil ; no auto savingan
      case-fold-search          t   ; search ignore case
      iswitchb-mode             1   ; better than switch-to-buffer (C-x b)
      kill-ring-max             200 ;
      visible-bell              t   ; disable beep in linux (openSUSE)
      ; scroll bar
      ;scroll-bar-mode        'right ;
      scroll-margin 3 
      scroll-conservatively 10000)  ; margin 3 line when up or down

(blink-cursor-mode nil)   ; disable cursor blink
(tool-bar-mode         t) ;
(global-linum-mode     t) ; line number
(column-number-mode    t) ; show column-number
(cua-mode              t) ; 
(windmove-default-keybindings)      ; shift + 4way key jump window
(setq default-major-mode 'text-mode)     ; default text-mode

;; highlight
(setq search-highlight           t  ; highlight search
      query-replace-highlight    t  ; highlight query object
      mouse-sel-retain-highlight t  ; Keep mouse high-lightening ??
      global-hl-line-mode 1)        ; highlight current line

;; unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; indent
(setq standard-indent   2  ; set indent size
      default-tab-width 2) ;
(setq-default indent-tabs-mode nil) ;; indent to space
;(setq-default indent-tabs-mode nil)
;(setq tab-stop-list ())


;;;; key-binding
(global-set-key "\C-l" 'goto-line)            ; go to line num
(global-set-key [f5] 'compile)                ; make
(global-set-key [f9] 'kill-buffer)
(global-set-key [f11] 'org-agenda-list)
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


;;;; style
;; fonts
(set-default-font " -unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
(load-theme 'moogoo)


;;;; default file
(setq diary-file            (concat my-path-elisp ".diary")
      bookmark-default-file (concat my-path-elisp ".bookmarks")
      bookmark-save-flag    1)


;;;; org-mode
(setq org-todo-keywords '("苦" "集" "滅" "道"))            
(setq org-agenda-include-diary t)
(setq org-agenda-include-all-todo t)

;; org-remember
(org-remember-insinuate)
;(setq org-default-notes-file /notes.org"))
(define-key global-map "\C-cr" 'org-remember)
     (setq org-remember-templates
           '(("k" ?t "* 苦  %? %U %i\n\n  %a" "~/note.org" "無明")
        ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/JOURNAL.org")
        ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/org/JOURNAL.org" "New Ideas")))

;; ENHANCEMENT!
;; When no selecting, C-w is like Vim's dd, M-w is copy the current line
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


;; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; ecb & cedit
;(load-file (concat my-path "myecb.el")) ; will very slow at startup

; graphviz dot
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

; w3m
(require 'w3m-load)

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
(load-file (concat my-path-elisp "mycalendar.el"))
;; org
(setq org-agenda-include-diary t)
;(require 'org-babel-init)  

; emms
;(add-to-list 'load-path "c:/.emacs.d/emms")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)

;(load-file (concat my-path-elisp "emacs_my_pic.el")) 

; custom
(setq custom-file (concat my-path "custom.el"))
(load custom-file)

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

;;;; away
;; parentheses
;(setq show-paren-mode t) ;; match highlight, and don't jump
;(setq show-paren-style 'parenthesis) ; 

;http://www.emacswiki.org/emacs/ShowParenMode
;(require 'paren)
