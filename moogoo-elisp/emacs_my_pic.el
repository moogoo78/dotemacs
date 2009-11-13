(setq default-directory "C:/")

(set-register ?r '(file ."c:/appserv/www/izuja/include/recipe.php"))
(set-register ?u '(file ."c:/appserv/www/izuja/include/user.php"))
(set-register ?i '(file ."c:/appserv/www/izuja/index.php"))
(set-register ?c '(file ."c:/appserv/www/izuja/include/config.php"))

;; << insert my command
(defun insert-moogoo ()
  "Insert the current date according to the variable \"insert-date-format\"."
  (interactive "*")
    (insert (format-time-string "moogoo, %Y-%m-%d" (current-time))))

;(global-set-key [f11] 'insert-moogoo)
;; >>
;; gdb-many-window, seams cool!
;; http://blog.csdn.net/ariesjzj/archive/2007/09/15/1786451.aspx