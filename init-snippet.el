(defun mg-run-calc (d hh mm ss)
  "running calculator"
  (interactive "nDistance (km): \nnHours: \nnMinutes: \nnSeconds: ")
   (let ((km (* d 1000))
        (tm (+ (* hh 3600) (* mm 60) ss)))
    (setq hkm (/ tm d 60.0))
    (setq hkm-m (/ tm d 60))
    (setq hkm-s (% (/ tm d) 60))
    (setq mpr (/ tm d 2.5))) ;;沒有進位
    (setq mpr-s (% 112.3 60))
    (message "%dkm, %02d:%02d:%02d => %.2f m/km (%dm%ds), %.2f s/round (%dm)" d hh mm ss hkm hkm-m hkm-s mpr (/ mpr 60))
    
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


(defun insert-current-date ()
  "Insert current date"
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M")))


(define-skeleton init-pelican-md
  "Insert template for pelican static blog system"
  "" "Title: " (skeleton-read "Title: ") ?\n
  "Date: " (insert-current-date) ?\n
  "Category: " (skeleton-read "category: ") ?\n
  "Tags: " (skeleton-read "tags: ") ?\n
  "Slug: " (skeleton-read "slug: ") ?\n
)

(define-skeleton init-pelican-rst
  "Insert templete for pelican static blog system"
  "" (skeleton-read "Title: ")?\n
  "#############################" ?\n
  ":date: " (insert-current-date) ?\n
  ":category: " (skeleton-read "category: ") ?\n
  ":tags: " (skeleton-read "tags: ") ?\n
  ":slug: " (skeleton-read "slug: ") ?\n
)


;; tmp
(defun js-insert-alert-at-here () 
  (interactive) 
  (insert (concat "alert(\"" (buffer-name) ": " (number-to-string (line-number-at-pos)) "\");")))
