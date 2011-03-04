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

;; << insert my command
;(defun insert-moogoo ()
;  "Insert the current date according to the variable \"insert-date-format\"."
;  (interactive "*")
;    (insert (format-time-string "moogoo, %Y-%m-%d" (current-time))))

;(global-set-key [f11] 'insert-moogoo)

; === trash?? ===
;; parentheses, http://www.emacswiki.org/emacs/ShowParenMode
;; seems already default
;(require 'paren)
;(setq show-paren-mode t) ;; match highlight, and don't jump
;(setq show-paren-style 'parenthesis) ; 


; TODO when have time
;http://www.emacswiki.org/emacs/BrowseKillRing


;; ref
; http://sites.google.com/site/steveyegge2/my-dot-emacs-file
; http://xahlee.org/emacs/xah_emacs_init.el
; http://hi.baidu.com/yangyingchao/blog/item/070d047a7a3d8fe62e73b3cf.html
; http://sachachua.com/notebook/emacs/
; http://juanreyero.com/article/emacs/emacs.html

;; useful!!
(defun php-lookup ()
  "Look up current word in PHP ref site in a browser.\n
  If a region is active (a phrase), lookup that phrase."
  (interactive)
  (let (myword myurl)
    (setq myword
          (if (and transient-mark-mode mark-active)
              (buffer-substring-no-properties (region-beginning) (region-end))
            (thing-at-point 'symbol)))
    (setq myurl
          (concat "http://us.php.net/" myword))
    (browse-url myurl)))