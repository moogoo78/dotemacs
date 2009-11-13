;;; csd-mode.el --- Mode for csd file for Csound
;;


;; TODO
;;   - syntax
;;   - indent (like org-mode's table...)
;;   -  
;;   - integtated with dot, draw signal flow graph  

(add-to-list 'load-path (concat my-path "moogoo-elisp"))
;(require 'csd-csound-opcodes)
(load-file (concat my-path "moogoo-elisp/csound-opcode-typology.el"))


(defvar csd-syntax-opcodes-regexp (regexp-opt csdoc-opcodes 'words))
(defvar csd-syntax-0-opcodes-regexp (regexp-opt csdoc-0-opcodes 'words))
(defvar csd-syntax-functions-regexp (regexp-opt csdoc-functions 'words))

;; the command to comment/uncomment text
(defun csd-comment-dwim (arg)
"Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start ";") (comment-end ""))
     (comment-dwim arg)))


(setq my-csd-syntax `(
  (,csd-syntax-0-opcodes-regexp . font-lock-builtin-face)
  (,csd-syntax-opcodes-regexp . font-lock-keyword-face)
  (,csd-syntax-functions-regexp . font-lock-variable-name-face)
    ;(,mylsl-type-regexp . font-lock-type-face)
    ;(,mylsl-constant-regexp . font-lock-constant-face)
    ;(,mylsl-event-regexp . font-lock-builtin-face)
    ;(,mylsl-functions-regexp . font-lock-function-name-face)
    ;(,mylsl-keywords-regexp . font-lock-keyword-face)
))

(define-derived-mode csd-mode fundamental-mode 
"CSD" "Major mode for Csound csd file"
  (setq font-lock-defaults '(my-csd-syntax))

  (define-key csd-mode-map [remap comment-dwim] 'csd-comment-dwim)
  (modify-syntax-entry ?; "< b" csd-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" csd-mode-syntax-table)
)
;; Define function for browsing manual
;(defun php-browse-manual ()
;  "Bring up manual for PHP."
;  (interactive)
;  (browse-url php-manual-url))

;; Define shortcut
;(define-key php-mode-map
;  "\C-c\C-m"
;  'php-browse-manual)


; (add-to-list 'auto-mode-alist '("\\.csd\\'" . csd-mode)) TODO can't work here?!
;;; csd-mode.el ends here