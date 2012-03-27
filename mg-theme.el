;; DX7 color like
(deftheme mgtheme
  "Created 2009-07-26.")

(provide-theme 'mgtheme)

(set-foreground-color "gray85")
(set-background-color "gray20")
(set-cursor-color "yellow1")
;; comment
; (set-face-foreground 'font-lock-comment-face "forest green")
(set-face-foreground 'font-lock-comment-face "gray45")
;; constant
(set-face-foreground 'font-lock-constant-face "gray50")
;; string
(set-face-foreground 'font-lock-string-face "yellow green")
;; keyword
(set-face-foreground 'font-lock-keyword-face "SeaGreen3")
(make-face-bold 'font-lock-keyword-face)
;; type
(set-face-foreground 'font-lock-type-face "dark orange")
;; variable
(set-face-foreground 'font-lock-variable-name-face "light coral")
;; function
(set-face-foreground 'font-lock-function-name-face "steel blue")
(make-face-bold 'font-lock-function-name-face)
;; highlight (current line)
(set-face-background 'highlight "red4")
;; select region
(set-face-background 'region "MediumPurple4")

;; modeline
(set-face-foreground 'modeline "light gray")
(set-face-background 'modeline "darkorange")
;; search
(set-face-foreground 'isearch "white")
(set-face-background 'isearch "blue")

;; parren
;(set-face-background 'show-paren-match-face (face-background 'default))
;(set-face-foreground 'show-paren-match-face "#def")
;(set-face-attribute 'show-paren-match-face nil :weight 'extra-bold)

;;; 余分のスペースやタブのハイライト
(set-face-background 'trailing-whitespace "plum")
;;; マウスカーソルの色
(set-face-background 'mouse "black")

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
(set-face-background 'show-paren-match-face "RoyalBlue1")
(set-face-foreground 'show-paren-match-face "black")
;; マッチしていない場合の色
(set-face-background 'show-paren-mismatch-face "Red")
(set-face-foreground 'show-paren-mismatch-face "black")



