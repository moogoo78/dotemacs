; === MooGoo's .emacs ===
(defvar my-path "~/.emacs.d/lisp")
(add-to-list 'load-path my-path)
(add-to-list 'load-path (concat my-path "goodies"))
(load "generic.el")
(load "key2.el")
;(load "init-calendar.el")
;(load "init-org.el")
(load "mode.el")
(load "snippet.el")
;(load "init-misc.el")
;(load "tmp/mg-ecb.el")
; start org-agenda-list while startup
;(add-hook 'after-init-hook 'org-agenda-list)
;(if window-system
;  (set-frame-size (selected-frame) 150 45))


(defun set-default-directory()
  "select default directory by "
  (interactive)
  (let ((opt (read-from-minibuffer "dir:1)devel 2)repo 3)tools "))
		(dir "~/devel/"))
	(if (equal opt "2")
		(setq dir "~/repo/"))
	(if (equal opt "3")
		(setq dir "~/tools/"))
	(setq default-directory dir)))

;(set-default-directory)
(setq default-directory "~/devel/")

(defun piscine(root)
  "hello"
  (interactive "p")
  ;(message "aoeu %s" root)
  (list-buffers)
  (insert-buffer "*Buffer List*")
  (kill-buffer "*Buffer List*")
  (delete-other-windows)
  ; parse buffer
;(other-buffer)
;(switch-to-buffer (other-buffer))
;(generate-new-buffer "bar")
  )

;(load "~/.emacs.d/extempore-mode.el")
