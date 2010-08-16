; ====== MooGoo's .emacs ======
;;;; general setting
;; set default path
(setq my-path "~/.emacs.d/"
      my-path-elisp (concat my-path "moogoo-elisp/")
      my-path-plugin (concat my-path "goodies/")
      default-directory "~/")
(if (eq system-type 'gnu/linux)
    (defvar mg-org-file "~/Dropbox/org"))
(if (eq system-type 'windows-nt)
    (defvar mg-org-file "C:/Documents and Settings/moogoo/My Documents/My Dropbox/org"))

(add-to-list 'load-path my-path)
(add-to-list 'load-path my-path-plugin)
(add-to-list 'load-path my-path-elisp)

;; frame title
(setq frame-title-format "%b - %f"   ; frame title, http://www.emacswiki.orgemacs/FrameTitle
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
      scroll-conservatively 10000  ; margin 3 line when up or down
      x-select-enable-clipboard t
      interprogram-paste-function 'x-cut-buffer-or-selection-value)


(blink-cursor-mode nil)   ; disable cursor blink
(tool-bar-mode         nil) ;
(global-linum-mode     t) ; line number
(column-number-mode    t) ; show column-number
;(ido-mode              t) ; enable ido-mode
(cua-mode              t) ; 
(windmove-default-keybindings)      ; shift + 4way key jump window
(setq default-major-mode 'text-mode)     ; default text-mode
;(server-start)            ; start emacs server daemon
;; highlight
(setq search-highlight           t  ; highlight search
      query-replace-highlight    t  ; highlight query object
      mouse-sel-retain-highlight t)  ; Keep mouse high-lightening ??
(global-hl-line-mode 1)         ; highlight current line
(setq default-cursor-type 'hbar)    ; make cursor underline bar

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
(global-set-key [f10] 'kill-buffer)
(global-set-key [f11] 'org-agenda)
(global-set-key [f12] 'calendar)

;(global-set-key [f1] 'dired-single-magic-buffer)
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'split-window)
(global-set-key [f3] 'split-window-horizontally)
(global-set-key [f4] 'kill-buffer)
(global-set-key [f6] 'switch-to-buffer)
(global-set-key [f8] 'org-export-as-html)
;(global-set-key '[(control c) (d)] 'delblank)
(global-set-key (kbd "C-2") 'set-mark-command) ; from: http://jidanni.org/comp/configuration/.emacs

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
;; I keep all my emacs-related stuff under ~/emacs
(if (eq system-type 'gnu/linux)
    (set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1"))
;(set-default-font " -unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*    -m-0-iso10646-1")

(load-theme 'mg)

(setq diary-file (concat my-path ".diary"))

;;;; bookmark
(setq bookmark-default-file (concat my-path ".bookmarks"))
(setq bookmark-save-flag 1)


;;;; org-mode
(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "DONE"))
(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)
;(require 'org-babel-init)  
(setq org-directory mg-org-file)
;(setq org-agenda-files (concat mg-org-file ("//my")))

;; org-remember
(org-remember-insinuate)
;(setq org-default-notes-file /notes.org"))
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Journal" ?j "* %^t %^{title} %i%^G\n  %i1. %^{social}\n  2. %^{work}\n  3. %^{life}\n  4. %^{love}" "~/orgs/my/journal.org" "Journal")
        ("Todo" ?t "* TODO %?\n  %i\n  %a" "~/orgs/my/todo.org" "Tasks")
        ("Quote" ?q "* %?" "~/orgs/my/quote.org" "Quote")
        ("Read" ?r "* %?" "~/orgs/my/read.org" "Read")
        ("Marathon" ?m "* %t %^{公里}km, %^{時間}m\n  %i%?\n" "~/orgs/my/marathon.org" "Marathon")))
;              social
;           2.   ^ 1.
;           work | social/family
;                |
; rational ----------> emotional
;        3. life | 4. love
;   (money/sport)|
;             personal
;
; TODO, 可對照去年同一天?

;

 ;    (setq org-remember-templates
  ;         '(("k" ?t "* 苦  %? %U %i\n\n  %a" "~/note.org" "無明")
   ;     ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/JOURNAL.org")
    ;    ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/org/JOURNAL.org" "New Ideas")))

;; org-publish
(require 'org-publish)
(setq org-publish-project-alist
      '(
        ("org-pub"
         :base-directory "~/orgs/"
         :base-extension "org"
         :publishing-directory "~/public_html/pub"
         :exclude "~/orgs/my/"
         :recursive t
         :publishing-function org-publish-org-to-html
         :htmlized-source t
         :auto-preamble t
         :headline-levels 4             ; Just the default for this project.
         ;:org-publish-use-timestamps-flag nil
         ;:auto-index t                  ; Generate index.org automagically...
         ;:makeindex t
         ;:index-filename "sitemap.org"  ; ... call it sitemap.org ...
         ;:index-title "Sitemap"         ; ... with title 'Sitemap'.
         )
        ))

(load-file (concat my-path "mg-calendar.el"))
(load-file (concat my-path "mg-plugin.el"))
;; 用autoload就可以了吧~
(mg-plugin-php)
(mg-plugin-dot)
;(mg-plugin-w3m)
;(mg-plugin-single)
;(mg-plugin-tabbar)
;(mg-plugin-ecb)\
;(mg-plugin-csound)
;(mg-plugin-emms)

;; TODO
;(when (require 'actionscript-mode nil t)
;  (setq auto-mode-alist
;        (cons '("\.as\'" . actionscript-mode) auto-mode-alist))
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
(setq custom-file (concat my-path "custom.el"))
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