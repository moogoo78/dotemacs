; === MooGoo's .emacs ===
(defvar my-path "~/.emacs.d/")
(add-to-list 'load-path my-path)
(add-to-list 'load-path (concat my-path "goodies"))
(load "init-generic.el")
(load "init-keybinding.el")
(load "init-calendar.el")
(load "init-org.el")
(load "init-mode.el")
(load "init-snippet.el")
;(load "init-misc.el")
;(load "tmp/mg-ecb.el")
; start org-agenda-list while startup
;(add-hook 'after-init-hook 'org-agenda-list)
(if window-system
  (set-frame-size (selected-frame) 150 45))
