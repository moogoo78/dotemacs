;; DX7 color like
(deftheme moogoo
  "Created 2009-07-26.")

(provide-theme 'moogoo)

;; font ; (print (font-family-list))
;; M-x describe-fontset

(when (eq system-type 'darwin)
  ;; default Latin font 
  (set-face-attribute 'default nil :family "Bitstream Vera Sans Mono")
;  (set-face-attribute 'default nil :font "Droid Sans Mono-12")  
                                        ;default font size (point * 10)
   ;;
  (set-face-attribute 'default nil :height 120)
  

  ;;Bitstream Vera Sans Mono
  
  ;; use specific font
  ;(set-fontset-font "fontset-default" 'han '("STHeiti"))
  (set-fontset-font "fontset-default" 'han '("PingFang TC"))
)

(when (eq system-type 'gnu/linux)
  (set-face-attribute 'default nil :font "Droid Sans Mono-10")  
  ;(set-face-attribute 'default nil :height 100)
)
(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :font "Andale Mono-12")
  ;(set-face-attribute 'default nil :height 100)
)

;;base
(set-foreground-color "gray85")
(set-background-color "gray20")
(set-cursor-color "yellow1")
(set-face-background 'mouse "black")

;; donnot know?
(set-face-foreground 'font-lock-warning-face "yellow")
(set-face-foreground 'font-lock-doc-face "yellow")
(set-face-foreground 'font-lock-preprocessor-face "yellow")
;(set-face-foreground 'font-lock-doc-string-face "yellow"); err
;(set-face-foreground 'font-lock-reference-face "yellow") err

;; comment
; (set-face-foreground 'font-lock-comment-face "forest green")
(set-face-foreground 'font-lock-comment-face "gray45")
;(set-face-foreground 'font-lock-comment-delimiter-face "gray35")

;; constant
(set-face-foreground 'font-lock-constant-face "gray50")
;; string
(set-face-foreground 'font-lock-string-face "color-100") ; coffee
;; keyword
(set-face-foreground 'font-lock-keyword-face "color-228") ;yellow
(make-face-bold 'font-lock-keyword-face)
;; type
(set-face-foreground 'font-lock-type-face "color-70")
;; variable
(set-face-foreground 'font-lock-variable-name-face "light coral")
;; function
(set-face-foreground 'font-lock-function-name-face "color-69") ; blue
(make-face-bold 'font-lock-function-name-face)
;; highlight (current line)
(set-face-background 'highlight "red4")
;; select region
(set-face-background 'region "MediumPurple4")

;; modeline
(set-face-foreground 'mode-line "light gray") ;; emacs 24.3 change modeline to mode-line
(set-face-background 'mode-line "darkorange")
;; search
(set-face-foreground 'isearch "white")
(set-face-background 'isearch "blue")

;; parren
;(set-face-background 'show-paren-match-face (face-background 'default))
;(set-face-foreground 'show-paren-match-face "#def")
;(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;;; 余分のスペースやタブのハイライト
(set-face-background 'trailing-whitespace "plum")


;;;; 2. ハイライト関係
;;; 2-1. global font lockを用いるか
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)





;;; 2. Makefileモード
;(require 'make-mode)
;(defvar makefile-mode-whitespace-font-lock-keywords
;  '(("\t+" . font-lock-whitespace-face))
;  "Show Tab characters in Makefile mode")
;(setq makefile-font-lock-keywords 
;      (append makefile-font-lock-keywords
;              makefile-mode-whitespace-font-lock-keywords))


;;;; 3. 対応する括弧をハイライト表示する
(show-paren-mode t)
(setq show-paren-style 'mixed)
;; マッチした場合の色
;(set-face-background 'show-paren-match-face "RoyalBlue1")
;(set-face-foreground 'show-paren-match-face "black")
;; マッチしていない場合の色
;(set-face-background 'show-paren-mismatch-face "Red")
;(set-face-foreground 'show-paren-mismatch-face "black")



