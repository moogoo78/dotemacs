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