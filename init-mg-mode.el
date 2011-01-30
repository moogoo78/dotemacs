
;; php
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

; indent tab -> offset 4
; http://stackoverflow.com/questions/168621/php-mode-for-emacs
(add-hook 'php-mode-hook 
		  (function (lambda ()
					  (setq c-default-style "bsd" 
							c-basic-offset 4))))

;; graphviz
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

;; action script
(autoload 'actionscript-mode "actionscript-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))
(add-hook 'actionscript-mode-hook 
		  (function (lambda ()
					  (setq c-default-style "bsd" 
							c-basic-offset 4))))
;; w3m
;; add this for emacs 23, http://www.emacswiki.org/emacs/emacs-w3m#toc13
;(require 'w3m-e21)
;(provide 'w3m-e23)
;(require 'w3m-load)

;; single dired
;(require 'dired-single)
;(setq load-path (cons (expand-file-name "/home/moogoo/Desktop") load-path))

;; tabber
;(load-file (concat my-path-plugin "tabbar.el"))
;(require 'tabbar)
;(tabbar-mode)
;; set tabbar no group (only one group)
;(setq tabbar-buffer-groups-function
;      (lambda ()
;        (list "All"))) ;; code by Peter Barabas
;; TODO set group for myself
;; http://blog.waterlin.org/articles/define-emacs-tabbar-group-rule.html

;; sound-x
;(defun mg-plugin-csound ()
;(add-to-list 'load-path "/home/moogoo/back/stef-elisp")
;(require 'stef-elisp)
;)

;; emms
;(defun mg-plugin-emms ()
;(add-to-list 'load-path "c:/.emacs.d/emms")
;(require 'emms-setup)
;(emms-standard)
;(emms-default-players)

;; my csd-mode, still working
;(require 'csd-mode)
;(autoload 'csd-mode "csd-mode" "Major mode for editing php code." t)
;(add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode))
