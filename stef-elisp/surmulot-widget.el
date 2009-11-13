;;; -*- auto-recompile: t -*-

;; This file is not part of GNU Emacs.
;; 
;; surmulot-widget.el is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; surmulot-widget.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;-------------
;;             Surmulot widgets (µO morphs) 

;; last modified October 17, 2008
;; for Emacs 22
;;; --------------------------------------------------------------------------

(require 'cl)
(require 'timidity-cfg)

;;; ==========================================================================
;;;              widget creation
;;; ==========================================================================

(defstruct surmulot-widget
  "A surmulot widget, that is a Squeak Morph connected via TCP/IP to Emacs."
  name
  port
  buffer
  muo-version 
  (insert-function 'surmulot-widget-default-insert-function)
  (eval-function 'surmulot-widget-default-eval-function)
  (eval-in-csd-function 'surmulot-widget-default-eval-in-csd-function)) 

;; (defcustom surmulot-squeak-vm (squeak-tcpip-launch-command)
;;   "Squeak VM for Surmulot"
;;   :type 'string
;;   :group 'spfa-paths
;;   :group 'surmulot-widget)

(defun surmulot-squeak-vm ()
  (expand-file-name (substitute-in-file-name (squeak-tcpip-vm))))

(defgroup surmulot-widget nil
  "Squeak widgets for Emacs"
  :group 'surmulot)

(defcustom surmulot-squeak-widget-image "$SURMULOTDIR/squeak/mu0.image"
  "Squeak image to start when requesting a widget.
Do not use this variable: use function `surmulot-squeak-widget-image' instead."
  :type 'string
  :group 'spfa-paths
  :group 'surmulot-widget)

(defcustom surmulot-squeak-widget-use-latest-image nil
  "When not nil, use the latest version of `surmulot-squeak-widget-image'"
  :type 'boolean
  :group 'surmulot-widget)

(defcustom surmulot-squeak-widget-prefers-connected-image-p nil
  "When not nil, always use the currently connected Squeak image
\(mostly useful for widget development)"
  :type 'boolean
  :group 'surmulot-widget)

(defun surmulot-squeak-widget-image ()
  "Return the Squeak image to start when requesting a widget."
  (let* ((connected-image
	  (when (and surmulot-squeak-widget-prefers-connected-image-p
		     (squeak-connected-somehow-p))
	    (squeak-eval "SmalltalkImage current imageName")))
	 (image-name (or connected-image
			 surmulot-squeak-widget-image))
	 (candidate (if surmulot-squeak-widget-use-latest-image
			(squeak-latest-image image-name)
		      (expand-file-name 
		       (substitute-in-file-name image-name)))))
    (if (file-exists-p candidate)
	candidate
      (let ((image (concat (expand-file-name 
			    (substitute-in-file-name 
			     (file-name-sans-extension 
			      squeak-tcpip-default-image)))
			   ".image")))
	(if surmulot-squeak-widget-use-latest-image
	    (squeak-latest-image image) image)))))

(defcustom surmulot-squeak-reserved-ports-start 6000
  "TCP/IP local port numbers for widgets start at this value upward"
  :type 'integer
  :group 'surmulot-widget)

(defcustom surmulot-widget-width 650
  "Default width in pixels for a widget."
  :type 'integer
  :group 'surmulot-widget)

(defcustom surmulot-widget-height 450
  "Default height in pixels for a widget."
  :type 'integer
  :group 'surmulot-widget)

(defun surmulot-make-widget (command &optional width height)
  "Have Squeak evaluate COMMAND, which should return a Morph,
and return a surmulot-widget.
WIDTH and HEIGHT optionally set the Morph geometry \(in pixels)."
  (let* ((port (surmulot-new-squeak-widget-port))
	 (processes (process-list))
	 (scommand
	  (format 
	   "%s %s free doIt \"%s\" &"
	   (shell-quote-argument (surmulot-squeak-vm))
	   (shell-quote-argument (surmulot-squeak-widget-image))
	   (base64-encode-string
	    (format "MuODeployer makeWidget: (%s) extent: (%s@%s) port: %s" 
		    command
		    (or width surmulot-widget-width) 
		    (or height surmulot-widget-height)
		    port) t)))) 
    (save-window-excursion
      (with-temp-buffer ;; needed because of the cd below
        (cd (file-name-directory (surmulot-squeak-vm)))
	(shell-command scommand
		       (generate-new-buffer-name " *surmulot widget*"))))
    ;; giving a dummy sentinel 
    ;; else we are annoyed with longish exit messages
    (condition-case nil
	(set-process-sentinel 
	 (first (set-difference (process-list) processes :test 'eq))
	 (lambda (process event)))
      (error nil))
    (loop for n from 1 to 10
	  with ok = nil until ok
	  do (sit-for 1)
	  do (condition-case nil
		 (progn
		   (squeak-tcpip-connect port)
		   (setq ok t))
	       (error nil)))
    (squeak-tcpip-connect port)
    (let ((widget (make-surmulot-widget :port port)))
      (setf (surmulot-widget-muo-version widget)
            (squeak-eval-with-return "MuO version" port))
      widget)))

(defun surmulot-new-squeak-widget-port ()
  (loop for port = surmulot-squeak-reserved-ports-start then (1+ port)
        for used in (sort (surmulot-squeak-active-ports) '<)
        if (> used port) return port
        finally return (1+ port)))

(defun surmulot-squeak-active-ports ()
  (save-excursion
    (loop for b in (buffer-list)
          do (set-buffer b)
          if (processp squeak-tcpip-process)
          collect (squeak-port-for-process squeak-tcpip-process))))

;; (surmulot-make-widget "MuO EnvelopeEditor")


;;; ===========================================================================
;;;              OSC controls 
;;; ===========================================================================

(defcustom surmulot-OSC-controls-source 
  "$SURMULOTDIR/csound/include/surmulot-OSC.orc"
  "Csound orchestra code file defining the available OSC controls as macros"
  :type 'string
  :group 'spfa-paths
  :group 'surmulot-widget)

(defun surmulot-OSC-controls ()
  "Return a list of all defined OSC controls macros.
Do this by scanning the file pointed by `surmulot-OSC-controls-source'"
  (interactive)
  (condition-case nil
      (setq surmulot-OSC-controls
	    (with-temp-buffer
	      (insert-file-contents 
	       (substitute-in-file-name surmulot-OSC-controls-source))
	      (loop while (re-search-forward "#define +\\(.*\\)(" nil t)
		    collect (match-string-no-properties 1))))
    (error nil)))

(defvar surmulot-OSC-controls (surmulot-OSC-controls)
  "list of all defined OSC controls macros")

(defun surmulot-widget-OSC-controls()
  "Create a widget with all OSC controls defined in the current buffer
\(assumed to be a CSD file)"
  (interactive)
  (surmulot-widget-make-OSC-controls (cscsd-get-OSC-controls)))

(defun surmulot-widget-make-OSC-controls (controls)
  (surmulot-attach-widget
   (surmulot-widgets-add 
    "Controls"
    (concat "OSCControl csoundControlPanel: #("
	    (mapconcat (lambda (p) 
			 (with-output-to-string (princ p)))
		       controls " ")
	    ") forBuffer: '"
	    (buffer-name) "'"))))

(defun cscsd-get-OSC-controls ()
  "Return a list of all OSC controls defined in the current buffer
\(assumed to be a CSD file)
A control is a macro invocation of form $NAME(p1'p2'p3) where NAME
must be a member of the list returned by `surmulot-OSC-controls'
The returned list form is \((NAME: p1 p2 p3) ...)"
  (when (cscsd-buffer-is-a-csd-p)
    (let (controls (all-controls surmulot-OSC-controls))
      (save-excursion
	(goto-char (point-min))
	(while (re-search-forward "^[ \t]*$\\(.*\\)[ \t]*(\\(.*\\))" nil t)
	  (let ((control (match-string-no-properties 1))
		(parameters (split-string (match-string-no-properties 2) "'")))
	    (when (member control all-controls )
	      (add-to-list 'controls 
			   `(,(concat control ":") ,@parameters))))))
      controls)))

;;; ===========================================================================
;;;              high-level functions
;;; ===========================================================================

(defvar surmulot-widgets-list '()
  "A non updated list of supposedly active widgets.
Use function `surmulot-widgets-list' to get the actual list.")   

(defun surmulot-widgets-list (&optional no-clean-up)
  "Return an updated list of all currently active widgets.
If NO-CLEAN-UP is not nil, do not remove from variable `surmulot-widgets-list'
the widgets those connection is broken"
  (unless no-clean-up
    (setq surmulot-widgets-list
	  (delete-if-not 
	   (lambda (w) 
	     (or (find-if 
		  (lambda (pc)
		    (and (listp pc)
			 (= (cadr pc) (surmulot-widget-port w))))
		  (mapcar 'process-contact (process-list)))
		 (not (kill-buffer
		       (squeak-comint-buffer (surmulot-widget-port w))))))
	   surmulot-widgets-list)))
  surmulot-widgets-list)


;;; ===========================================================================
;;;              Squeak side protocol
;;; ===========================================================================

(defmacro surmulot-widget-define (symb)
  "Define a function 'surmulot-widget-SYMB used by Squeak 
to invoque the function in a widget SYMB slot."
  `(defun ,(intern (concat "surmulot-widget-" (prin1-to-string symb)))
     (&rest args)
     ,(format 
       "This is a private function intended to be called from Squeak. 
No public usage.
It is evaluated in the comint buffer associated to a given WIDGET: 
it calls the function returned by \(surmulot-widget-%s-function WIDGET) 
with arguments ARGS.
That function is defined by setting the '%s slot in the surmulot-widget 
structure."
       symb symb)
     (let ((widget (find-if (lambda (w) 
			  ;; w: widget associated to the current comint buffer
			  (= (surmulot-widget-port w)
			     (squeak-port-for-process squeak-tcpip-process)))
			surmulot-widgets-list)))
       (apply
	(funcall ',(intern (concat "surmulot-widget-" 
				   (prin1-to-string symb) "-function")) 
		 widget)
	widget args))))

(surmulot-widget-define insert)
(surmulot-widget-define eval)
(surmulot-widget-define eval-in-csd)
; ... more here later

(defmacro surmulot-widget-with-proper-buffer-do (&rest body)
  "Evaluate BODY with a \"proper\" current buffer. 
More precisely: do not use the actual current buffer if it is not displayed
in any window or if it is not visisting a file."
  `(with-current-buffer 
       (car (delete-if-not (lambda (b)
			     (and (buffer-file-name b)
				  (get-buffer-window b t))) (buffer-list)))
     ,@body))

(defun surmulot-widget-default-insert-function (w str)
  "Insert STR in a proper buffer in behalf of widget W"
  (surmulot-widget-with-proper-buffer-do
   (insert str)))

(defun surmulot-widget-exclusive-insert-function (w str)
  "Insert STR in the buffer associated to widget W"
  (with-current-buffer
      (surmulot-widget-buffer w)
   (insert str)))

(defun surmulot-widget-default-eval-function (w quoted-form)
  "Evaluate QUOTED-FORM in a proper buffer in behalf of widget W"
  (surmulot-widget-with-proper-buffer-do
   (surmulot-widget-eval-quoted-form quoted-form)))

(defun surmulot-widget-exclusive-eval-function (w quoted-form)
  "Evaluate QUOTED-FORM in the buffer associated to widget W"
  (with-current-buffer
      (surmulot-widget-buffer w)
    (surmulot-widget-eval-quoted-form quoted-form)))

(defun surmulot-widget-in-csd-p (w)
  "Tells weither the current proper buffer for widget W is a CSD"
  (surmulot-widget-with-proper-buffer-do
    (cscsd-buffer-is-a-csd-p)))

(defun surmulot-widget-default-eval-in-csd-function (w quoted-form)
  "Evaluate QUOTED-FORM in a proper buffer in behalf of widget W,
if that buffer is a CSD, else return 'not-a-csd"
  (surmulot-widget-with-proper-buffer-do
   (if (not (cscsd-buffer-is-a-csd-p))
     'not-in-csd
     (unwind-protect
	 (surmulot-widget-eval-quoted-form quoted-form)
       (csound-csd-mode)))))

(defun surmulot-widget-eval-quoted-form (quoted-form)
  (let ((val (eval quoted-form)))
    (if (stringp val)
	(encode-coding-string val 'undecided-mac)
      val)))
  

(defun surmulot-attach-widget (widget &optional buffer)
  "Redefine the functions associated to WIDGET so that they operate
in the context of the buffer from which WIDGET was first invoked.
If BUFFER is not nil, also redefine that buffer"
  (setf (surmulot-widget-insert-function widget)
	'surmulot-widget-exclusive-insert-function
	(surmulot-widget-eval-function widget)
	'surmulot-widget-exclusive-eval-function)
  (if buffer
      (setf (surmulot-widget-buffer widget) 
	    (or (buffer-base-buffer buffer) buffer))))


;;; ===========================================================================
;;;              high-level functions & Widgets menu
;;; ===========================================================================

(defcustom surmulot-widget-specs 
  '(("Envelope Editor" "EnvelopeEditor new")
;    ("Score Editor" "CsoundCompositionEditor new" )
    ("Phrase Editor" "MusicalPhraseEditor new")
    ("Csound Blocks" "MuO CsoundBlocksWidget")
    ("Function Editor" "NFunctionEditor new"))
  "List of registered widgets \(\(label constructor) ... ) 
where label is a string identifying the widget type and constructor is the Smalltalk code to evaluate for creating the widget Morph"
  :type '(repeat (list (string :tag "label") (string :tag "constructor")))
  :group 'surmulot-widget)

(defun surmulot-widgets-add (name command)
  (let ((widget (surmulot-make-widget command)))
    (add-to-list 'surmulot-widgets-list widget)
    (setf (surmulot-widget-name widget) name)
    (setf (surmulot-widget-buffer widget) (current-buffer)) 
    widget))

(defun surmulot-define-widgets-menu ()
  (easy-menu-define surmulot-widgets-menu global-map "Squeak widgets"
    (surmulot-make-widgets-menu)))

(defalias 'surmulot-widgets-update-menu 'surmulot-define-widgets-menu)

;; (defun surmulot-widgets-update-menu ()
;;   (let ((menu (surmulot-make-widgets-menu)))
;;     (setq surmulot-widgets-menu (easy-menu-create-menu (car menu) (cdr menu)))))

(defun surmulot-make-widgets-menu ()
  (let ((stored-widgets (surmulot-buffer-widgets))
	(active-widgets (surmulot-widgets-list))
	(controls (cscsd-get-OSC-controls)))
    `("Widgets"
      ("New widget"
       ,@(mapcar 
          (lambda (spec) `[,(car spec) (surmulot-widgets-add ,(car spec) ,(cadr spec)) t])
          surmulot-widget-specs))
      ,@(when controls 
	  '(["Show OSC controls" surmulot-widget-OSC-controls t]))
      ,@(when stored-widgets
	  (list 
	   (append
	    '("Stored widgets")
	    (mapcar 
	     (lambda (label) `[,label (surmulot-widget-restore ,label) t])
	     stored-widgets))))
      ,@(when active-widgets '("--"))
      ,@(mapcar 
	 (lambda (widget)
           `(,(format "%s (port %d)" (surmulot-widget-name widget) (surmulot-widget-port widget))
	     ["store" (surmulot-widget-store ,widget) (cscsd-buffer-is-a-csd-p)]
	     ["interact" (surmulot-widget-interact ,widget) t]
	     ["clone" (surmulot-widget-clone ,widget) t]
	     "--"
             ["send to muO" (surmulot-widget-send-to-muo ,widget) t]
	     "--"
             ["close" (surmulot-widget-close ,widget) t]))
         active-widgets)
      "--"
      ["Use active image" 
       (setq surmulot-squeak-widget-prefers-connected-image-p 
	     (not surmulot-squeak-widget-prefers-connected-image-p))
	     :style toggle
	     :selected surmulot-squeak-widget-prefers-connected-image-p])))

(defun surmulot-widget-close (widget)
  (squeak-eval-no-return "Smalltalk quitPrimitive" 
			 (surmulot-widget-port widget)))

(defun surmulot-widget-do (widget command)
  (squeak-eval-with-return command (surmulot-widget-port widget)))

(defun surmulot-widget-interact (widget)
  (switch-to-buffer-other-window
   (squeak-comint-buffer (surmulot-widget-port widget))))

(defun surmulot-widget-clone (widget)
  (let ((name (surmulot-widget-name widget))
	(str (surmulot-widget-do
	      widget
	      "Widget biggerSurmulotWidget asEncodedString asOneLine")))
    (surmulot-widgets-add name (format "%s reconstituteObject" str))))

(defun surmulot-widget-send-to-muo (widget)
  (let ((str (surmulot-widget-do
	      widget
	      "Widget veryDeepCopy biggerSurmulotWidget asEncodedString asOneLine")))
    (muo-add-morph 
     (format "%s reconstituteObject quitBehavingAsSurmulotWidget" str))))


(defun surmulot-widget-on-port (port)
  (find-if (lambda (w)
	     (= port (surmulot-widget-port w)))
	   (surmulot-widgets-list)))

(defun surmulot-widget-rename (port name)
  "ReNAME the widget associatd to PORT"
  (setf (surmulot-widget-name (surmulot-widget-on-port port)) name))

(defun surmulot-widget-store (widget)
  "Store the widget NAME as an XML area in the source buffer"
  (let ((label (read-from-minibuffer "Store widget under label: ")) 
	(name (surmulot-widget-name widget))
	(str (surmulot-widget-do widget "Widget biggerSurmulotWidget asEncodedString asOneLine")))
    (save-restriction
      (widen)
      (set-buffer (or (buffer-base-buffer (current-buffer)) (current-buffer)))      
      (when (or (cscsd-buffer-is-a-csd-p)
		(y-or-n-p "The source buffer does not seem to be a valid CSD. Continue ? "))
	(save-excursion
	  (cscsd-go-after-cssynth)
	  (insert "\n\n<WIDGET>" label ?\n) 
	  (insert name ?\n str)
	  (insert "</WIDGET>"))
	(cscsd-hide-storage-areas)))))

(defun surmulot-buffer-widgets ()
  (when (cscsd-buffer-is-a-csd-p)
    (save-excursion
      (save-restriction
	(widen)
	(goto-char (point-min))
	(let ((wlist))
	  (while (re-search-forward "<WIDGET>\\(.*\\)$" nil t)
	    (add-to-list 'wlist (match-string-no-properties 1) t))
	  wlist)))))

(defun surmulot-widget-restore (&optional label)
  (interactive "sRestore widget: ")
  (let* (wid
	 (serialized-widget
	 (save-excursion
	   (save-restriction
	     (widen)
	     (goto-char (point-min))
	     (when (search-forward (concat "<WIDGET>" label) nil t)
	       (re-search-forward "^.*$")
	       (setq wid (match-string 0))
	       (buffer-substring-no-properties 
		(1+ (point))
		(- (search-forward "</WIDGET>") 9)))))))
    (when serialized-widget
      (surmulot-widgets-add 
       wid
       (format "%s reconstituteObject" serialized-widget)))))

(surmulot-define-widgets-menu)
(add-hook 'menu-bar-update-hook 'surmulot-widgets-update-menu)


;;; used by Csound Blocks:
(defun cscsd-replace-instrument (code)
  ""
  (condition-case nil
      (save-excursion
	(let ((instr (progn (string-match "instr[ \t]+\\([^ \t;]+\\)" code)
			    (match-string 1 code))))
	  (goto-char (cscsd-beginning-of-instrument instr))
	  (delete-region (cscsd-beginning-of-instrument instr) (cscsd-end-of-instrument instr))
	  (insert code)))
    (error nil)))


;;; --------------------------- End  -----------------------------

(provide 'surmulot-widget)

;;; surmulot-widget.el ends here







