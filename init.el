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

;; ref
; http://sites.google.com/site/steveyegge2/my-dot-emacs-file
; http://xahlee.org/emacs/xah_emacs_init.el
; http://hi.baidu.com/yangyingchao/blog/item/070d047a7a3d8fe62e73b3cf.html
; http://sachachua.com/notebook/emacs/