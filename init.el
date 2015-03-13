; === MooGoo's .emacs ===
(defvar my-path "~/.emacs.d/lisp")
(add-to-list 'load-path my-path)
(add-to-list 'load-path (concat my-path "goodies"))
(load "init-generic.el")
(load "init-keybinding.el")
(load "init-calendar.el")
;(load "init-org.el")
(load "init-mode.el")
(load "init-snippet.el")
;(load "init-misc.el")
;(load "tmp/mg-ecb.el")
; start org-agenda-list while startup
;(add-hook 'after-init-hook 'org-agenda-list)
(if window-system
  (set-frame-size (selected-frame) 150 45))


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
(put 'scroll-left 'disabled nil)
