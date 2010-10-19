; org-mode
(setq org-todo-keywords '("TODO" "STARTED" "WAITING" "CANCELLED" "DONE"))
(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)
;(require 'org-babel-init)  

;(setq org-directory mg-org-file)
;(set org-agenda files (file-expand-wildcards "~/org/*.org"))
; windows and linux's Dropbox folder must be same
(setq org-agenda-files '(
    "~/Dropbox/org/priv-project.org" 
    "~/Dropbox/org/priv-schedule.org"
    ))

; http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.php
(setq org-agenda-custom-commands 
      '(("c" "Desk Work" tags-todo "computer" 
         ((org-agenda-files '("~/Dropbox/org/priv-schedule.org")) 
          (org-agenda-sorting-strategy '(priority-up effort-down))) 
         ))
) ; TODO

;; org-remember
(org-remember-insinuate)
;(setq org-default-notes-file /notes.org"))
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(("Journal" ?j "* %^t %^{title} %i%^G\n  %i1. %^{social}\n  2. %^{work}\n  3. %^{life}\n  4. %^{love}" "~/orgs/my/journal.org" "Journal")
        ("Todo" ?t "* TODO %?\n  %i\n  %a" "~/orgs/my/todo.org" "Tasks")
        ("Quote" ?q "* %?" "~/orgs/my/quote.org" "Quote")
        ("Read" ?r "* %?" "~/orgs/my/read.org" "Read")
        ("Marathon" ?m "* %t %^{公里}km, %^{時間}m\n  %i%?\n" "~/orgs/my/marathon.org" "Marathon")))
;

;; old remember templates
;    (setq org-remember-templates
 ;         '(("k" ?t "* 苦  %? %U %i\n\n  %a" "~/note.org" "無明")
  ;     ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/JOURNAL.org")
   ;    ("Idea" ?i "* %^{Title}\n  %i\n  %a" "~/org/JOURNAL.org" "New Ideas")))

;; org-publish
(require 'org-publish) 
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/Dropbox/org"
         :base-extension "org"
         :publishing-directory "~/org-pub"
         :exclude "priv-*"
         :recursive t
         :publishing-function org-publish-org-to-html
         :headline-levels 4             ; Just the default for this project.
         :language "zh"
         ;:htmlized-source t
;         :auto-preamble t
         :style "<link rel='stylesheet' type='text/css' href='css/style.css' />"
         :style-include-default nil
         :author "MooGoo"
         :email nil
         ;:org-publish-use-timestamps-flag nil
         ;:auto-index t                  ; Generate index.org automagically...
         ;:makeindex t
         ;:index-filename "sitemap.org"  ; ... call it sitemap.org ...
         ;:index-title "Sitemap"         ; ... with title 'Sitemap'.
         )
	      ;; These are static files (images, pdf, etc)
	      ("org-static"
	        :base-directory "~/Dropbox/org/" ;; Change this to your local dir
          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
          :publishing-directory "~/org-pub"
	        :recursive t
          :publishing-function org-publish-attachment
        )
	      ("orgpub" :components ("org-notes" "org-static"))
        )
)

; 任务计时
; http://space.uibe.edu.cn/u1/ryang/org.html
