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


(define-skeleton init-pelican
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
