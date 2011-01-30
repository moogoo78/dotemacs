; === MooGoo's .emacs ===

(defvar my-path "~/.emacs.d/")
(add-to-list 'load-path my-path)
(add-to-list 'load-path (concat my-path "goodies"))

(load "init-mg-generic.el")
(load "init-mg-keybinding.el")
(load "init-mg-calendar.el")
(load "init-mg-org.el")
(load "init-mg-mode.el")
;(load "init-mg-misc.el")
;(load "tmp/mg-ecb.el")
; start org-agenda-list while startup
;(add-hook 'after-init-hook 'org-agenda-list)
(setq tramp-default-method "ssh")

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