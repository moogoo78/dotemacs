; === Environment ===
(setq default-directory "~/")
(setq inhibit-startup-message   t)   ; no startup message
(setq make-backup-files         nil) ; no backup files
(setq auto-save-list-file-name  nil) ; no .saves files
(setq auto-save-default         nil) ; http://www.emacswiki.org/emacs/AutoSave
(setq case-fold-search          t)  ; search ignore case
(setq iswitchb-mode             1)   ; better than switch-to-buffer (C-x b)
(setq kill-ring-max             200) ;
(setq visible-bell              t)   ; disable beep in linux (openSUSE)
(setq x-select-enable-clipboard t)
;(fset 'yes-or-no-p 'y-or-n-p)

(setq transient-mark-mode t)         ; highlight region?
(show-paren-mode t)                  ; matching parens
(setq truncate-lines t)

;; platform independence
(if (>= emacs-major-version 24)
    (setq interprogram-paste-function 'x-selection-value)
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))

(setq ns-command-modifier (quote meta)) ; mac command key as meta key

(setq default-major-mode 'text-mode)     ; default text-mode

;(ido-mode t)
(setq ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-ignore-buffers
      '("\\` " "^\\*ESS\\*" "^\\*Messages\\*" "^\\*Help\\*" "^\\*Buffer"
              "^\\*.*Completions\\*$" "^\\*Ediff" "^\\*tramp" "^\\*cvs-"
              "_region_" " output\\*$" "^TAGS$" "^\*Ido")
      ido-ignore-directories
      '("\\`auto/" "\\.prv/" "\\`CVS/" "\\`\\.\\./" "\\`\\./")
      ido-ignore-files
      '("\\`auto/" "\\.prv/" "_region_" "\\`CVS/" "\\`#" "\\`.#"
        "\\`\\.\\./" "\\`\\./" "^.DS_Store$"))

;(cua-mode              t) ; 
(windmove-default-keybindings)      ; shift + 4way key jump window
(server-start)            ; start emacs server daemon
; == coding ==
(prefer-coding-system       'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


; === Style ===
(setq frame-title-format "%b - %f")   ; detail, http://www.emacswiki.orgemacs/FrameTitle
(setq icon-title-format "Emacs - %b")
(global-linum-mode t) ; line number
(column-number-mode t) ; show column-number
(tool-bar-mode nil)
(if (>= emacs-major-version 24)
    (load-theme 'moogoo t)
  (load-theme 'moogoo))

; == scroll bar ==
;scroll-bar-mode        'right ;
(setq scroll-margin 3) 
(setq scroll-conservatively 10000)  ; margin 3 line when up or down
; == cursor ==
(blink-cursor-mode               -1)   ; disable cursor blink
(setq default-cursor-type 'hbar) ; make cursor underline bar
; == highlight ==
(setq search-highlight           t)  ; highlight search
(setq query-replace-highlight    t)  ; highlight query object
(setq mouse-sel-retain-highlight t)  ; Keep mouse high-lightening ??
(global-hl-line-mode             1)  ; highlight current line
; == indent ==
(setq standard-indent   4)  ; set indent size
(setq default-tab-width 4) ;
(setq-default indent-tabs-mode nil) ;; indent to space
;(setq tab-stop-list ())
; == fonts ==
(if (eq system-type 'gnu/linux)
    (set-default-font "-unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1"))
;(set-default-font " -unknown-Droid Sans Mono-normal-normal-normal-*-13-*-*-*-*-0-iso10646-1")
;(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*    -m-0-iso10646-1")

; === set default file ===
(setq diary-file (concat my-path "diary"))
(setq bookmark-default-file (concat my-path "bookmarks"))
(setq bookmark-save-flag 1)
(setq custom-file (concat my-path "custom.el")) ; better not to use custom

; === Extended ===
(put 'dired-find-alternate-file 'disabled nil) ; enable dired buffer replace, when press a 'a' comment
; == gdb gui==
(setq gdb-many-windows t)
;(setq gdb-show-main t)

; default browser
(setq browse-url-browser-function (quote browse-url-generic))
(setq browse-url-generic-program "chrome")

; ssh tramp
(setq tramp-default-method "ssh")
(setq tramp-chunksize 500)
