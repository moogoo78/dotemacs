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
(add-hook 'after-init-hook 'org-agenda-list)


(defun my-as-hook ()
  (setq tab-width 4)
  (setq-default indent-tabs-mode 1)
)
(add-hook 'actionscript-mode-hook 'my-as-hook)
