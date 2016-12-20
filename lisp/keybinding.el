; key-binding
; ============
(global-set-key [f2] 'bookmark-bmenu-list)

(global-set-key (kbd "C-o") 'find-file)


;; buffer
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-c n") 'next-buffer)
(global-set-key (kbd "C-c p") 'previous-buffer) ;

;; move
(global-set-key (kbd "C-l") 'goto-line)            ; go to line num
(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)

;; act like modern browser
(global-set-key (kbd "M-f") 'isearch-forward)
(global-set-key (kbd "M-g") 'isearch-repeat-forward)
(global-set-key (kbd "M-G") 'isearch-repeat-backward)
(global-set-key (kbd "C-w") 'kill-buffer)

;; qwerty qjk
(global-set-key (kbd "C-q") 'kill-region) ;  cut
(global-set-key (kbd "C-j") 'kill-ring-save) ;  copy
(global-set-key (kbd "C-k") 'yank) ; paste
(global-set-key (kbd "C-y") 'kill-line) ; change ctrl-y to kill line

;inspired:
; - http://xahlee.org/emacs/ergonomic_emacs_keybinding.html
(keyboard-translate ?\C-t ?\C-x)
(keyboard-translate ?\C-x ?\C-t)


;; register
(global-set-key (kbd "C-'") 'set-mark-command)
(global-set-key (kbd "C-,") 'vimyy)
(global-set-key (kbd "C-.") 'vimyyp)

(global-set-key (kbd "M-1") 'point-to-register)
(global-set-key (kbd "M-2") 'jump-to-register)
(global-set-key (kbd "C-1") 'copy-to-register)
(global-set-key (kbd "C-2") 'insert-register)

(global-set-key (kbd "C-c q") 'select-inside-quotes)

;; elscreen
(global-set-key (kbd "C-c c") 'elscreen-create)
(global-set-key (kbd "C-c w") 'elscreen-kill)  
(global-set-key (kbd "<C-prior>") 'elscreen-previous)
(global-set-key (kbd "<C-next>") 'elscreen-next)

;;;;


;(global-set-key [f1] 'delete-other-windows)
;(global-set-key [f1] 'mg-close-and-find)
;(global-set-key [f2] 'ibuffer)
;(global-set-key [f3] 'elscreen-previous)
;(global-set-key [f4] 'elscreen-next)

;(global-set-key [f5] 'dired)
;(global-set-key [f6] 'mg-quick-note)
;(global-set-key [f7] 'bookmark-jump)
;(global-set-key [f8] 'bookmark-bmenu-list)

;(global-set-key [M-f1] 'mg-mark1)
;(global-set-key [M-f2] 'mg-mark2)
;(global-set-key [S-f1] 'mg-goto1)
;(global-set-key [S-f2] 'mg-goto2)

;(global-set-key [S-f5] 'shrink-window-horizontally)
;(global-set-key [S-f8] 'enlarge-window-horizontally)
;(global-set-key [S-f7] 'enlarge-window)
;(global-set-key [S-f6] 'shrink-window)


;(global-set-key "\C-x\C-\\" 'goto-last-change)

;(global-set-key (kbd "C-a") 'smart-beginning-of-line)

;(global-set-key '[(control c) (d)] 'delblank)



; big step forward and backward
;(global-set-key (kbd "C-j") 'mg-backward16)
;(global-set-key (kbd "C-.") 'mg-forward16)

;(global-set-key [(control left)] 'beginning-of-buffer)    
;(global-set-key [(control right)] 'end-of-buffer)    
;(global-set-key [(control up)] 'scroll-down)    
;(global-set-key [(control down)] 'scroll-up)    

; vim-style
;(global-set-key (kbd "M-t") 'previous-line)
;(global-set-key (kbd "M-d") 'backward-char)
;(global-set-key (kbd "M-h") 'next-line)
;(global-set-key (kbd "M-n") 'forward-char)



; inspired by ErgoEmacs
; http://xahlee.org/emacs/ergonomic_emacs_keybinding.html
;(global-set-key (kbd "C-w") 'kill-buffer)
;(global-set-key (kbd "C-c k") 'elscreen-kill-screen-and-buffers)
;(global-set-key (kbd "C-c c") 'kill-buffer-and-delete-window)

;(global-set-key (kbd "C-p") 'isearch-forward)

;(global-set-key (kbd "C-a") 'mark-whole-buffer)
;(global-set-key (kbd "M-o") 'find-file-other-window)

;dvorak zxcv
;(global-set-key (kbd "C-;") 'undo) 
;(global-set-key (kbd "C-:") 'redo)
;(global-set-key (kbd "C-q") 'kill-region)
;(global-set-key (kbd "C-j") 'kill-ring-save) ;copy
;(global-set-key (kbd "C-k") 'yank)
;(global-set-key (kbd "C-;") 'undo)

;(global-set-key (kbd "C-y") 'kill-line)

; 互換key (for dvorak layout)
;(keyboard-translate ?\C-k ?\C-y)
;(keyboard-translate ?\C-y ?\C-k)
; C-q quoted-insert,
;; simulate vim cursor key

;(define-key key-translation-map (kbd "C-q") (kbd "C-'"))
;(define-key key-translation-map (kbd "C-'") (kbd "C-q"))
;(define-key key-translation-map (kbd "C-j") (kbd "C-,"))
;(define-key key-translation-map (kbd "C-,") (kbd "C-j"))
;(global-set-key (kbd "C-'") 'kill-region)
;(global-set-key (kbd "C-,") 'kill-ring-save)





;(global-set-key (kbd "C-c z") 'shell)

;; tab (elscreen)
;(global-set-key (kbd "C-x t") 'elscreen-create)
;(global-set-key (kbd "C-x w") 'elscreen-kill)  
;(global-set-key (kbd "C-x p") 'elscreen-previous)
;(global-set-key (kbd "C-x n") 'elscreen-next)

;; not use
;(global-set-key [f6] 'switch-to-buffer)
;(global-set-key (kbd "C-m") 'scroll-down) 
;(global-set-key (kbd "C-,") 'forward-word)
;(global-set-key (kbd "C-'") 'backward-word)
;(global-set-key (kbd "C-d") 'forward-char)
;(global-set-key (kbd "<return>") 'newline) ; C-m is bind to Enter, need bind direct
                                        ;(global-set-key (kbd "C-b") 'isearch-backward) ; change C-f to search
;; Indenting and alignment - try
;(global-set-key [(f8)]         'indent-region)
;(global-set-key [(control f8)] 'align)
;(global-set-key [(shift f8)]   'align-current)
;(global-set-key [(meta f8)]    'align-regexp)



;; custom
(global-set-key (kbd "C-c .") 'mg-insert-current-dtime)
(global-set-key (kbd "C-c ,") 'mg-insert-current-date-log)
(global-set-key (kbd "C-c a") 'mg-inner-wrapper)
(global-set-key (kbd "C-c o") 'mg-outer-wrapper)

;(define-key key-translation-map [?\C-\[] [(control left_bracket)])
;(define-key key-translation-map [escape] [?\e])
(define-key function-key-map [escape] nil)
(define-key function-key-map [?\e] nil)
(when (boundp 'local-function-key-map)
  ;;(define-key local-function-key-map [escape] nil)
  (defun remove-escape-from-local-function-key-map ()
    (define-key local-function-key-map [?\e] nil)
    (define-key local-function-key-map [escape] nil))
  (add-hook 'term-setup-hook 'remove-escape-from-local-function-key-map))

;(global-set-key (kbd "C-[") 'previous-line) ; error ;http://superuser.com/questions/173851/linux-remap-ctrl-key
;(global-set-key (kbd "C-/") 'next-line)/

;(global-set-key (kbd "M-1") 'set-mark-command) ; from: http://jidanni.org/comp/configuration/.emacs
(global-set-key (kbd "M-3") 'my-isearch-word-at-point); like vim's *
;(global-set-key (kbd "C-4") 'ideview)

; http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs
(defun vimyyp()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  (move-beginning-of-line 1)
)

(defun vimyy()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (move-beginning-of-line 1)
)

(defun mg-quick-note()
  (interactive)
  "open quick note frame"
  (elscreen-create)
  (deft))


; TODO
;(add-hook 'isearch-mode-hook
;(lambda ()
; (define-key isearch-mode-map (kbd "M-f") 'isearch-repeat-forward)
;))

(defun ideview nil
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (split-window-horizontally)
)

;(fset 'cc
;   "\C-a//")
(fset 'delblank
   "\260\C-k")

;; TODO, unfinished
(defun mg-quote ()
  "Insert quote"
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     )
   )
  )


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


(defun kill-buffer-and-delete-window nil
  (interactive)
  (kill-buffer)
  (delete-window))

;; like vim's yy
;(defadvice yy (before slick-copy activate compile)
;  "When called interactively with no active region, copy a single line instead."
;  (interactive
;   (if mark-active (list (region-beginning) (region-end))
;     (message "Copied line")
;     (list (line-beginning-position)
;           (line-beginning-position 2)))))

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


;(defun org-pub-ics ()
;  (interactive)
;  (org-export-icalendar-this-file)
;  (call-process "~/mgshell/gcal.sh" nil nil nil))

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



;; via: http://steve.yegge.googlepages.com/my-dot-emacs-file
;(defun rename-file-and-buffer (new-name)
(defun rename-this-file (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; via http://stackoverflow.com/questions/145291/smart-home-in-emacs
(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive) ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun find-file-other-window (fname)
  "open file in other window"
  (split-window-below)
  ; following copy from (find-file) source
  (interactive "FFind file: ")
  (switch-to-buffer (find-file-noselect fname)))


(defun mg-org-pub nil
	"publish "
	(interactive)
	(org-publish-all))

(defun mg-kill-all ()
  "kill and window"
  (interactive)
  (kill-buffer-and-delete-window)
  (elscreen-kill)
  )

;; from Xah Lee http://ergoemacs.org/emacs/elisp_count-region.html
(defun my-count-words-region (posBegin posEnd)
  "Print number of words and chars in region."
  (interactive "r")
  (message "Counting …")
  (save-excursion
    (let (wordCount charCount)
      (setq wordCount 0)
      (setq charCount (- posEnd posBegin))
      (goto-char posBegin)
      (while (and (< (point) posEnd)
                  (re-search-forward "\\w+\\W*" posEnd t))
        (setq wordCount (1+ wordCount)))

      (message "Words: %d. Chars: %d." wordCount charCount)
      )))
