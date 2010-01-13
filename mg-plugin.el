;====== my plugin ======

;;;; php-mode
(defun mg-plugin-php ()
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
)

;;;; graphviz-dot-mode
(defun mg-plugin-dot ()
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Major mode for editing graphviz dot." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
)

;;;; w3m
(defun mg-plugin-w3m ()
  ; add this for emacs 23
  ; http://www.emacswiki.org/emacs/emacs-w3m#toc13
  (require 'w3m-e21)
  (provide 'w3m-e23)
  (require 'w3m-load)
)

;;;; dired-single
(defun mg-plugin-single ()
(require 'dired-single)
(setq load-path (cons (expand-file-name "/home/moogoo/Desktop") load-path))
)

;;;; tabbar
(defun mg-plugin-tabbar ()
(load-file (concat my-path-plugin "tabbar.el"))
(require 'tabbar)
(tabbar-mode)

;; set tabbar no group (only one group)
(setq tabbar-buffer-groups-function
      (lambda ()
        (list "All"))) ;; code by Peter Barabas
;; TODO set group for myself
;; http://blog.waterlin.org/articles/define-emacs-tabbar-group-rule.html
)

;;;; ecb & cedit
;;------------------------ CEDET & ECB -------------------------
(defun mg-plugin-ecb ()
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file (concat my-path-plugin "cedet-1.0pre6/common/cedet.el"))


;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)


(add-to-list 'load-path (concat my-path-plugin "ecb-2.32"))
;(require 'ecb-autoloads)
(require 'ecb)
)
;;--------------------- end of CEDET & ECB -------------------------


;;;; csound-x
(defun mg-plugin-csound ()
(add-to-list 'load-path "/home/moogoo/back/stef-elisp")
(require 'stef-elisp)
)

;;;; emms
(defun mg-plugin-emms ()
(add-to-list 'load-path "c:/.emacs.d/emms")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
)
