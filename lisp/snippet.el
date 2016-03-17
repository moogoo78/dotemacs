
(defun mg-outer-wrapper (q)
  "add char from here to end"
  (interactive "sEnter wrapper: ")
  (insert q)
  (end-of-line)
  (if (string-equal q "\(") 
      (insert "\)")
    (insert q)))

(defun mg-inner-wrapper (q)
  "add char from here to end, backward 1 char"
  (interactive "sEnter wrapper: ")
  (insert q)
  (end-of-line)
  (backward-char)
  (if (string-equal q "\(") 
      (insert "\)")
    (insert q)))

(defun mg-run-calc (d hh mm ss)
  "running calculator"
  (interactive "nDistance (km): \nnHours: \nnMinutes: \nnSeconds: ")
   (let ((km (* d 1000))
        (tm (+ (* hh 3600) (* mm 60) ss)))
    (setq hkm (/ tm d 60.0))
    (setq hkm-m (/ tm d 60))
    (setq hkm-s (% (/ tm d) 60))
    (setq mpr (/ tm d 2.5))) ;;沒有進位
    (setq mpr-s (mod mpr 60))
    (message "%d" tm)
    (message "%dkm, %02d:%02d:%02d => %.2f m/km (%dm%ds), %.2f s/round (%dm%ds)" d hh mm ss hkm hkm-m hkm-s mpr (/ mpr 60) mpr-s)
    
)

(defun init-py ()
  (interactive)
  (insert "#!/usr/bin/env python\n# -.- coding: utf-8 -.-\n"))

(defun init-jquery()
  (interactive)
  (insert "$(document).ready(function () {\n});"))

(defun init-bash()
  (interactive)
  (insert "#!/bin/bash\n"))


(defun mg-insert-current-dtime ()
  "Insert current date"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M")))

(defun mg-insert-current-date-log ()
  "Insert current date for log"
  (interactive)
  (setq week_zh (make-hash-table :test 'equal))
  (puthash "1" "一" week_zh)
  (puthash "2" "二" week_zh)
  (puthash "3" "三" week_zh)
  (puthash "4" "四" week_zh)
  (puthash "5" "五" week_zh)
  (puthash "6" "六" week_zh)
  (puthash "7" "日" week_zh)
  (setq val (gethash (format-time-string "%w") week_zh))
  (insert (format-time-string "<%Y-%m-%d (") val ")>"))


(define-skeleton init-pelican-md
  "Insert template for pelican static blog system"
  "" "Title: " (skeleton-read "Title: ") ?\n
  "Date: " (mg-insert-current-dtime) ?\n
  "Category: " (skeleton-read "category: ") ?\n
  "Tags: " (skeleton-read "tags: ") ?\n
  "Slug: " (skeleton-read "slug: ") ?\n
)

(define-skeleton init-pelican-rst
  "Insert templete for pelican static blog system"
  "" (skeleton-read "Title: ")?\n
  "#############################" ?\n
  ":date: " (mg-insert-current-dtime) ?\n
  ":category: " (skeleton-read "category: ") ?\n
  ":tags: " (skeleton-read "tags: ") ?\n
  ":slug: " (skeleton-read "slug: ") ?\n
)


;; tmp
(defun js-insert-alert-at-here () 
  (interactive) 
  (insert (concat "alert(\"" (buffer-name) ": " (number-to-string (line-number-at-pos)) "\");")))

(defun mg-mark1 ()
  (interactive)
  "mark current position to register 1"
  (message "mark to reg 1")
  (point-to-register 1 ))

(defun mg-mark2 ()
  (interactive)
  "mark current position to register 2"
  (message "mark to reg 2")  
  (point-to-register 2 ))

(defun mg-goto1 ()
  (interactive)
  "Goto register 1"
  (message "goto reg 1")  
  (jump-to-register 1 ))

(defun mg-goto2 ()
  (interactive)
  "Goto register 2"
  (message "goto reg 2")    
  (jump-to-register 2 ))

(defun mg-forward16()
  (interactive)
  "forward 16 chart"
  (forward-char 16))

(defun mg-backward16()
  (interactive)
  "backward 16 char"
  (backward-char 16))


(defun mg-close-and-find(fname)
  "close current and find new buffer"
  (kill-buffer (buffer-name)) ; kill previous buffer
  (interactive "Ffind-file: ")
  (switch-to-buffer (find-file-noselect fname)))
