; key-binding
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