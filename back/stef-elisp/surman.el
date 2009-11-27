;;; -*- auto-recompile: t -*-

;; This file is not part of GNU Emacs.
;; 
;; surman.el is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; surman.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;-------------
;;             interacting with Surmulot manager via TCP/IP

;; last modified September 21, 2004
;; for Emacs 21.1
;;; --------------------------------------------------------------------------------

(require 'cl)

;;; Code:

(defgroup surmulot-manager nil
  "Surmulot local TCP/IP network"
  :group 'surmulot
  :prefix "surman-")

(defcustom surman-init-file "$SURMULOTDIR/localports.ini"
  "INI file defining the local TCP/IP ports used by SURMULOT"
  :type 'string
  :group 'surmulot-manager)

(defvar surman-local-ports
  (let ((init-file (substitute-in-file-name surman-init-file)))
    (when (file-exists-p init-file)
      (with-temp-buffer
	(insert-file-contents init-file)
	(goto-char (point-min))
	(loop while (re-search-forward "^\\(.*\\)=\\(.*\\)$" nil t)
	      collect (list (match-string 1)
			    (read (match-string 2))) into ports
			    finally return ports)))))

(defvar surman-port (cadr (assoc "emacs_manager" surman-local-ports))
  "Default TCP/IP port in local host")

(defcustom surman-repl-sit-for 10
  "How long should we display evaluation results in the minibuffer
within a REPL session. see commands `keykit-repl' and `squeak-repl'"
  :type 'integer
  :group 'surmulot-manager)

(defcustom surman-is-daemon nil
  "When t we reconnect upon deconnection"
  :type 'boolean
  :group 'surmulot-manager)

(defvar surman-process-timer nil
  "the timer enabling auto-reconnection")

(defvar surman-process nil
  "the manager interaction TCP/IP process")

(defvar surman-separator "\v"
  "one-character string used to separate items in a TCP request")

(defvar surman-end-separator "\v\v"
  "string used to separate TCP requests")

(defvar surman-last-answer nil
  "last answer from manager to a query from emacs")

(defvar surman-last-answer-number nil
  "last answer number from manager to a query from emacs")

(defvar surman-pending-input ""
  "accumulated incoming strings from manager.
This is parsed in surman-process-filter")

;;; --------------------------------------------------------------------------------
;;;
;;; connection to manager
;;;
;;; --------------------------------------------------------------------------------

; (surman-connect)
(defun surman-connect (&optional ntry wait-for)
  "Set up the connection to the manager TCP/IP server"
  (interactive)
  (unless (surman-connected-p)
    (setq ntry (or ntry 1)
          wait-for (or wait-for 3))
    (while (not (zerop ntry))
      (condition-case nil
          (when (setq surman-process (open-network-stream "surman" nil "127.0.0.1" surman-port))
            (surman-cancel-daemon)
            (setq ntry 0)
            (set-process-sentinel surman-process 'surman-process-sentinel)
            (set-process-filter surman-process 'surman-process-filter))
        (error (unless (zerop (setq ntry (1- ntry)))      
                 (sit-for wait-for)))))))

(defun surman-process-sentinel (process event)
  (message "manager: %s" event)
  (when surman-is-daemon 
    (surman-start-daemon)))

(defun surman-start-daemon ()
  (interactive)
  (surman-cancel-daemon)
  (setq surman-process-timer (run-at-time t 5 'surman-connect)))

(defun surman-cancel-daemon ()
  (interactive)
  (when (timerp surman-process-timer)
    (cancel-timer surman-process-timer)
    (setq surman-process-timer nil)))

(defun surman-daemon-waiting-p ()
  (timerp surman-process-timer))

(defun surman-process-filter (process strinput)
  (setq surman-pending-input 
	(concat surman-pending-input (remove 4 strinput)))
  (when (string-match surman-end-separator surman-pending-input)
    (while (string-match (concat "\\(.+?" surman-end-separator "\\)\\(\\(.\\|\n\\)*\\)")
			 surman-pending-input)
      (let* ((rest (or (match-string 2 surman-pending-input) ""))
	     (command (split-string (match-string 1 surman-pending-input) surman-separator))
	     (data (first command))
	     (manager (second command))
	     (type (third command))
	     (tid (fourth command)))
        (setq surman-pending-input rest)
	(when (string= type "Q")
          (process-send-string surman-process
                               (concat (condition-case nil
                                           (prin1-to-string (eval (read data)))
                                         (error "evaluation error")) surman-separator
                                         manager surman-separator 
                                         "A" surman-separator
                                         tid surman-end-separator)))
	(when (string= type "A")
	  (setq surman-last-answer-number (read tid)
		surman-last-answer data))))))

(defun surman-disconnect ()
  (interactive)
  (delete-process surman-process))

(defun surman-connected-p ()
  (interactive)
  "return nil if Emacs is not connected to its manager"
  (eq (process-status "surman") 'open))


;;; --------------------------------------------------------------------------------
;;;
;;; interaction with the managers
;;;
;;; --------------------------------------------------------------------------------

(defun surman-manager-connected-p (manager)
  (and (surman-connected-p )
       (string= (surman-ask "super_listener" manager) "true")))

(defun surman-squeak-connected-p ()
  (interactive)
  (surman-manager-connected-p "squeak_manager"))

(defun surman-keykit-connected-p ()
  (interactive)
  (surman-manager-connected-p "keykit_manager"))

;TEST (surman-ask "super_listener" "(+ 10 30 2)") => "42"
;TEST (surman-ask "keykit_manager" "fractal('a,e,f')") => "'ad32,e,f,e,bo2,co3,f,c,c+'"
;TEST (surman-ask-squeak "'a,e,f' kmusic fractal") => "'ad32,e,f,e,bo2,co3,f,c,c+'"
;TEST (surman-ask "squeak_manager" "5 sin") => "-0.958924274663138"
;TEST (length (surman-ask "keykit_manager" "fractal(fractal(fractal('a,e,f')))")) => 18118
;TEST (length (surman-ask-squeak "'a,e,f' kmusic fractal fractal fractal")) => 19634

;TEST  (surman-ask-squeak "'two\nlines'") => "two\nlines"

;; wrong:
;TEST  (surman-ask-squeak "'two\rlines'") => "two\nlines"

(defvar surman-counter -1)

(defun surman-ask (manager question)
  ""
  (when (surman-connected-p)
    (setq surman-last-answer nil)
    (incf surman-counter)
    (process-send-string surman-process (concat question surman-separator
					       manager surman-separator
					       "Q" surman-separator
					       (format "%s" surman-counter)
					       surman-end-separator))
    (while (or (null surman-last-answer)
	       (not (= surman-last-answer-number surman-counter)))
      (accept-process-output surman-process))
    (decf surman-counter)
    surman-last-answer))

(defun surman-ask-squeak (question)
  (interactive "sSqueak> ")
  (let ((ans (decode-coding-string
	      (surman-ask "squeak_manager" 
			 (encode-coding-string question 'compound-text-mac))
	      'compound-text-mac)))
    (if (interactive-p) (message ans) ans)))

(defun surman-ask-keykit (question)
  (interactive "sKeykit> ")
  (let ((ans (surman-ask "keykit_manager" question)))
    (if (interactive-p) (message ans) ans)))

(defun surman-repl (function)
  (while t
    (call-interactively function)
    (sit-for surman-repl-sit-for)))

(defun squeak-repl ()
  (interactive)
  (surman-repl 'surman-ask-squeak))

(defun keykit-repl ()
  (interactive)
  (surman-repl 'surman-ask-keykit))


;;; --------------------------------------------------------------------------------
;;;
;;; Erlang implementation for Surmulot manager
;;;
;;; --------------------------------------------------------------------------------

;; (require 'erlang-start nil t)

;; (defcustom surman-Erlang-code-directory "~/site-lisp/stef-elisp/erlang"
;;   "Directory where lives the Erlang code for managers"
;;   :type 'string
;;   :group 'surmulot-manager)

;; (defcustom surman-Erlang-start-command "musicnet:start_servers()."
;;   "Erlang command for starting the managers servers"
;;   :type 'string
;;   :group 'surmulot-manager)

;; (defun surman-start-Erlang-managers ()
;;   "start Erlang, set up all manager servers, then connect Emacs to its manager"
;;   (interactive)
;;   (require 'erlang)
;;   (let ((curdir default-directory))
;;     (save-excursion
;;       (unless (inferior-erlang-running-p)
;; 	(cd surman-Erlang-code-directory)
;; 	(erlang-shell)
;; 	(inferior-erlang-wait-prompt)
;; 	(inferior-erlang-send-command surman-Erlang-start-command)
;; 	(inferior-erlang-wait-prompt)
;; 	(surman-connect)))
;;     (cd curdir)
;;     (switch-to-buffer (current-buffer))))


;;; --------------------------- End  -----------------------------

(provide 'surman)

;;; surman ends here

