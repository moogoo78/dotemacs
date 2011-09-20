; key-binding
;(global-set-key [f1] 'dired-single-magic-buffer)
(global-set-key [f1] 'delete-other-windows)
(global-set-key [f2] 'bookmark-bmenu-list)
;(global-set-key [f2] 'split-window)
;(global-set-key [f3] 'split-window-horizontally)
(global-set-key [f3] 'isearch-repeat-forward)
(global-set-key [(shift f3)] 'isearch-repeat-backward)
;(global-set-key [f4] 'org-pub-ics)
(global-set-key [f4] 'html-mode)
(global-set-key [f5] 'compile)                ; make
;(global-set-key [f6] 'switch-to-buffer)
(global-set-key [f8] 'deft)
(global-set-key [f11] 'org-agenda)
(global-set-key [f12] 'calendar)

;(global-set-key '[(control c) (d)] 'delblank)
(global-set-key (kbd "C-l") 'goto-line)            ; go to line num
;(global-set-key (kbd "C-s") 'save-buffer) 
;(global-set-key (kbd "C-[") 'scroll-down)  
;(global-set-key (kbd "C-]") 'scroll-up) 
(global-set-key (kbd "C-w") 'kill-buffer)
;(global-set-key (kbd "C-f") 'isearch-forward)
;(global-set-key "\C-w" 'kill-buffer-and-delete-window)
;(global-set-key (kbd "C-t") 'beginning-of-buffer) ; top of the file
;(global-set-key (kbd "C-S-t") 'end-of-buffer) ; bottom of the file
;(global-set-key (kbd "C-f") 'isearch-forward) ; change C-f to search
;(global-set-key (kbd "C-b") 'isearch-backward) ; change C-f to search
(global-set-key (kbd "<C-next>") 'next-buffer)
(global-set-key (kbd "<C-prior>") 'previous-buffer)

(global-set-key (kbd "M-1") 'set-mark-command) ; from: http://jidanni.org/comp/configuration/.emacs
(global-set-key (kbd "C-2") 'yy) ; copy one line and paste
(global-set-key (kbd "M-3") 'my-isearch-word-at-point); like vim's *
(global-set-key (kbd "M-4") 'select-inside-quotes) ;
;; macro
(fset 'yy
   [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y ?\C-a])
(fset 'yyc
   [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y up ?\C-a ?/ ?/])
(fset 'cc
   "\C-a//")
(fset 'delblank
   "\260\C-k")

(defun kill-buffer-and-delete-window nil
  (interactive)
  (kill-buffer)
  (delete-window))

;; like vim's yy, p
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
         (list (line-beginning-position)
               (line-beginning-position 2)))))

;; via: http://www.emacswiki.org/emacs/SlickCopy
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))


; via http://www.emacswiki.org/emacs/SearchAtPoint
(defun my-isearch-word-at-point () 
  (interactive) 
  (call-interactively 'isearch-forward-regexp)) 
(defun my-isearch-yank-word-hook () 
  (when (equal this-command 'my-isearch-word-at-point) 
    (let ((string (concat "\\<" 
                          (buffer-substring-no-properties 
                           (progn (skip-syntax-backward "w_") (point)) 
                           (progn (skip-syntax-forward "w_") (point))) 
                          "\\>"))) 
      (if (and isearch-case-fold-search 
               (eq 'not-yanks search-upper-case)) 
          (setq string (downcase string))) 
      (setq isearch-string string 
            isearch-message 
            (concat isearch-message 
                    (mapconcat 'isearch-text-char-description 
                               string "")) 
            isearch-yank-flag t) 
      (isearch-search-and-update)))) 
(add-hook 'isearch-mode-hook 'my-isearch-yank-word-hook) 

; via http://xahlee.org/emacs/elisp_idioms.html
(defun select-inside-quotes ()
  "Select text between double straight quotes
on each side of cursor."
  (interactive)
  (let (p1 p2)
    (skip-chars-backward "^\"")
    (setq p1 (point))
    (skip-chars-forward "^\"")
    (setq p2 (point))

    (goto-char p1)
    (push-mark p2)
    (setq mark-active t)
  )
)

(defun org-pub-ics ()
  (interactive)
  (org-export-icalendar-this-file)
  (call-process "~/mgshell/gcal.sh" nil nil nil))

(defun mg-org-pub nil
	"publish "
	(interactive)
	(org-publish-all))

(defun set-default-directory()
  "select my default directory"
;  (read-minibuffer prompt initial))
  (interactive)
  (read-minibuffer
   "My default directory: " (format "%s" "~/")))

;  (setq default-directory mydir))
