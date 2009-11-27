;;; -*- auto-recompile: t -*-

;; This file is not part of GNU Emacs.
;; 
;; surmulot.el is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; surmulot.el is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:
;;-------------
;;             Surmulot integration 

;; last modified Mars 15, 2009
;;; --------------------------------------------------------------------------------
(require 'cl)    
(require 'squeak)    
(require 'csound-x)
(require 'winner)

(require 'surmulot-widget)

(defgroup surmulot nil
  "Emacs side of the Surmulot environment for musical composition"
  :link '(info-link :tag "Surmulot documentation (Info)" "(surmulot)Top")
  :group 'emacs)

(defcustom surmulot-always-use-system-csound (eq system-type 'gnu/linux)
  "When not nil, ignore the csound distribution bundled with Surmulot
and instead use the existing installation, if any"
  :type 'boolean
  :group 'surmulot)

(put 'surmulot 'custom-group
     (union (get 'surmulot 'custom-group)
	    '((csound-x custom-group)
	      (squeak custom-group)
	      (timidity-cfg custom-group)
	      (surmulot-widget custom-group)
	      (spfa-paths custom-group)
	      (keykit custom-group))
	    :test 'equal))

;;; ==============================================================

(defun muo-connected-p ()
  (squeak-connected-somehow-p))

(defalias 'muo-do 'squeak-eval) 

; (muo-get "'a,e,f' kmusic asBox")
(defun muo-get (object)
  (squeak-do (format "SurmulotManager emacsSend: (%s)" object)))

(defun muo-add-morph (object)
  (squeak-do (format "(%s) openInWorld" object)))

(defun muo-edit-string (encoded-string rid mode label)
  "Decode ENCODED-STRING and create a buffer to edit it
RID is a numeric handle allowing muO to know what to do with the edited string
MODE is the major mode the edit buffer should be in
LABEL is the name for that buffer

This function is required by EmacsInteraction in muO"
  (save-excursion
    (switch-to-buffer-other-frame
     (generate-new-buffer label))
    (erase-buffer)
    (insert (squeak-decode encoded-string))
    (goto-char (point-min))
    (condition-case nil
	(funcall mode)
      (error nil))
    (set (make-local-variable 'receiver-id) rid)
    (setq header-line-format
	  (list
	   (squeak-console-button-do 
	    " Accept " "accept the changes"
	    (squeak-do
	     (format "EmacsInteraction updateString: '%s' receiverId: %s " 
		     (squeak-encode-buffer)
		     receiver-id))
	    (set-buffer-modified-p nil))
	   " "
	   (squeak-console-button-do 
	    " Explore receiver " "open an ObjectExplorer in Squeak"
	    (squeak-do 
	     (format "(EmacsInteraction msDict at: %s) explore" receiver-id)))
	   " "
	   (squeak-console-button-do 
	    " Accept and exit " "accept the changes and kill this buffer"
	    (squeak-do 
             (format "EmacsInteraction updateString: '%s' receiverId: %s cleanUp: true" 
                     (squeak-encode-buffer)
		     receiver-id))
	    (let ((f (selected-frame)))
	      (when (and (kill-buffer (current-buffer))
			 (eq f (selected-frame)))
		(delete-frame))))
	   " "
	   (squeak-console-button-do 
	    " Exit " "kill this buffer and its frame"
	    (squeak-do 
	     (format "EmacsInteraction cleanUpReceiverId: %s" receiver-id))
	    (let ((f (selected-frame)))
	      (when (and (kill-buffer (current-buffer))
			 (eq f (selected-frame)))
		(delete-frame))))))
    (set-buffer-modified-p nil)
    ;;; making the buffer persistent across sessions
    (setq desktop-save-buffer 
	  `(lambda (sdir)
	    (list (squeak-encode 
		   (buffer-substring-no-properties (point-min) (point-max)))
		  ,rid ',mode ,label)))))

;==
(defun surmulot-restore-buffer (desktop-buffer-file-name
				   desktop-buffer-name
				   desktop-buffer-misc)
  "restore a buffer editing a string in behalf of muO"
  (if desktop-buffer-misc
      (apply 'muo-edit-string desktop-buffer-misc)
    (desktop-restore-file-buffer desktop-buffer-file-name
				 desktop-buffer-name
				 desktop-buffer-misc)))
				 
(mapc (lambda (mode)
	(add-to-list 'desktop-buffer-mode-handlers
		     (cons mode 'surmulot-restore-buffer)))
      '(text-mode csound-csd-mode csound-orc-mode csound-sco-mode))
;==

(defun muo-get-sco ()
  "send to muO the appropriate MGraphElement for representing the current score"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (and filename (string-match "\\.sco$" filename))
        (muo-get (format "MGraphMusicFile newFromFile: '%s'" (squeak-filename filename)))
      (muo-get (format "MGraphCsoundScore newFromB64: '%s'" 
                          (if (cscsd-buffer-is-a-sco-p)
                              (squeak-encode-region (cscsd-sco-beginning) (cscsd-sco-end))
                            (squeak-encode-buffer)))))))

(defun muo-get-orc ()
  (interactive)
  "send to muO the appropriate MGraphElement for representing the current orchestra"
  (let ((filename (buffer-file-name)))
    (if (and filename (string-match "\\.orc$" filename))
        (muo-get (format "MGraphCsoundComposer newFromFile: '%s'" (squeak-filename filename)))
      (muo-get (format "MGraphCsoundComposer newFromB64: '%s'" 
                          (if (cscsd-buffer-is-an-orc-p)
                              (squeak-encode-region (cscsd-orc-beginning) (cscsd-orc-end))
                            (squeak-encode-buffer)))))))

(defun muo-get-patch (bank program name)
  (muo-get 
   (format "MGraphCode new code: '%s'; label: '%s'" 
	   (format "\r
    value _ MusicalPhrase bank: %s program: %s\r
                      channel: (box1 ifNil: [1] ifNotNil: [box1 output ifNil: [1]])"
		   bank program)
	   name)))

(defun muo-get-csd ()
  (interactive)
  "send to muO the appropriate MGraphElement for representing the current csd"
  (let ((filename (buffer-file-name (buffer-base-buffer))))
    (if (and filename (string-match "\\.csd$" filename))
        (muo-get (format "(CSDFile named: '%s') asBox" (squeak-filename filename)))
      (muo-get (format "MGraphCsoundComposition newFromB64: '%s'" 
			  (squeak-encode-buffer))))))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ experimental

(defun muo-edit-csd ()
  "experimental. edit the current CSD buffer in MuO"
  (interactive)
  (squeak-do 
   (format
    "(CsoundComposition csd: (CSDFile named: '%s') format: (CsoundScoreFormat fromEmacsSpec: '%S')) edit"
    (buffer-file-name (buffer-base-buffer)) ;;; ?
    (cscsd-get-format))))

(defun cscsd-get-format (&optional buffer)
  "Reads all instrument formats in BUFFER or in current CSD buffer."
  (with-base-buffer
    (append `((header: ,(cscsd-get-score-header)))
	    ;; intruments formats & effects
	    (loop for i in (cscsd-instruments)
		  do (goto-char (cscsd-beginning-of-instrument i))
		  if (re-search-forward "/\\*|[ \t]*effect\\(.*\\)|\\*/" 
					(cscsd-end-of-instrument i) t)
		  append `((readEffect: ,(match-string-no-properties 1)))
		  into spec
		  if (re-search-forward "/\\*|\\([^;]+\\)|\\*/" 
					(cscsd-end-of-instrument i) t)
		  append (list (list (read i) (read (match-string 1))))
		  into spec
		  finally return spec))))

(defun muo-insert-itemplates ()
  ""
  (interactive)
  (message "not yet implemented"))

(defun cscsd-get-score-header ()
  "")

(defun muo-edit-csd-as-widget ()  
  "Edit the current CSD buffer within a CsoundCompositionEditor widget.
This is a graphical tool for score composition."
  (interactive)
  (surmulot-attach-widget
   (surmulot-widgets-add
    "Composition Editor"
    (format
     "(CsoundComposition csd: (CSDFile named: '%s') format: (CsoundScoreFormat fromEmacsSpec: '%S')) editorMorph"
     (buffer-file-name (buffer-base-buffer)) ;;; ?
     (cscsd-get-format)))))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ (end experimental)

;;; ============================ testing

(defun surmulot-assert (test result)
  (let ((val (squeak-eval test)))
    (or (string= val result) val)))	

(defun surmulot-tests ()
  (and
   (surmulot-assert "1+1" "2")
   (surmulot-assert "1 + (SurmulotManager askEmacsFor: '(+ 8 7)')" "16")
   ;; hairy... 
   (surmulot-assert 
    "SurmulotManager askEmacsFor: '(surmulot-assert \"2+2\" \"4\")'" "t")))

;TEST (squeak-eval "1 + (SurmulotManager askEmacsFor: '(+ 8 7)')") => "16"
;TEST (squeak-eval "SurmulotManager askEmacsFor: '(+ 1 1)'") => "2"
;TEST (squeak-eval "SurmulotManager askEmacsFor: '(+ 1 (read (squeak-eval \"1+1\")))'") => '"3"
;TEST (surmulot-tests) => t

(defun surmulot-run-all-comment-tests ()
  (interactive)
  (require 'comm-tests)
  (require 'csound-fx)
  (require 'csound-tests)
  (unless (squeak-connected-via-surman-p)
    (squeak-start-and-connect))
  (apply 'run-commented-tests-in 
	 (set-difference 
	  (append
	   (directory-files (file-name-directory (locate-library "surmulot")) 
			    nil "\\.el$") 
	   (directory-files (file-name-directory (locate-library "csound-x")) 
			    nil "\\.el$"))
	  '("comm-tests.el" "surman.el") :test 'string=)))


;;; ============================ meta: surmulot system description

(defvar surmulot-directory (getenv "SURMULOTDIR")
  "root directory for the surmulot distribution")   

(defvar this-surmulot-version nil
  "holds the current surmulot version number")

(defvar this-surmulot-elisp-version nil
  "holds the current stef-elisp version number")

(defvar this-surmulot-muo-version nil
  "holds the current muO version number")

(defvar this-surmulot-gm-version nil
  "holds the current GeoMaestro version number")

(defvar this-surmulot-published-files nil
  "holds the list of all files in the current surmulot release")

(defun surmulot-fetch-meta-info ()
  (when (boundp 'surmulot-directory) ;; this is defined in surmulot.emacs
    (load (expand-file-name "meta/surmulot-org.el" surmulot-directory) t)))

(surmulot-fetch-meta-info)

(defun surmulot-check-up ()
  (let ((modified))
    (dolist (fspec this-surmulot-published-files)
      (when (consp fspec)
        (let* ((file (car fspec))
               (fname (expand-file-name file surmulot-directory))
               (fmd5 (cdr fspec)))
          (unless (and (file-exists-p fname)
                       (string= fmd5 (with-temp-buffer
                                       (insert-file-contents fname)
                                       (md5 (current-buffer) nil nil 'raw-text))))
            (add-to-list 'modified file)))))
    (or modified t)))

;;TO DO:
;;       repair from archive (use 7za) !!


;;; ==============================================================

(defun custom-initialize-setting (symbol)
  "Reset the value of SYMBOL by re-evaluating its standard value.
Use the :set function to do so."
  (funcall (or (get symbol 'custom-set) 'set-default)
	   symbol
	   (eval (car (get symbol 'standard-value)))))

(defun surmulot-use-system-csound (&optional binary doc-dir)
  "Redefine all appropriate settings so that the version of Csound
shipped as part of Surmulot is ignored, and make the system-wide Csound
be used by Csound-x.
This can be reversed by invoking function `surmulot-use-bundled-csound'"
  (interactive)
  (require 'csound-csd)
  (require 'csound-doc)
  (custom-set-default 'cscsd-csound-binary (or binary (csound-find-binary)))
  (if doc-dir
      (custom-set-default 'csdoc-html-directory doc-dir)
    (custom-initialize-setting 'csdoc-html-directory))
  (custom-initialize-setting 'csdoc-html-entry-point)
  (cscsd-open-to-environment 
   '("SFDIR" "SADIR" "SSDIR" "INCDIR" "MFDIR"))
  (message "Surmulot settings now target the system Csound installation"))

(when (and surmulot-always-use-system-csound  
	   (not (featurep 'surmulot)))
  (surmulot-use-system-csound))	

(defun surmulot-use-bundled-csound ()
  "Redefine all appropriate settings so that the version of Csound
shipped as part of Surmulot is used by Csound-x
This can be reversed by invoking function `surmulot-use-system-csound'"
  (interactive)
  (dolist (symbol '(cscsd-csound-binary
		    csdoc-html-directory
		    csdoc-html-entry-point
		    csdoc-winhelp-file))
    (set symbol (car (get symbol 'saved-value))))
  (dolist (var '("CSOUNDRC"
		 "INCDIR"
		 "MFDIR"
		 "OPCODEDIR"
		 "OPCODEDIR64"
		 "RAWWAVE_PATH"
	 	 "SADIR"
		 "SFDIR"
		 "SSDIR"))
    (let* ((symbol (intern (concat "cscsd-" var)))
	   (value (car (get symbol 'saved-value))))
      (set symbol value)
      (setenv var (expand-file-name (substitute-in-file-name value)))))
  (message "Surmulot settings now target the bundled Csound installation"))

(defun surmulot-display-welcome-buffer ()
  (interactive)
  (if (get-buffer "about surmulot.org")
      (switch-to-buffer (get-buffer "about surmulot.org"))
    (let ((about (expand-file-name "emacs/about surmulot.org" 
				   surmulot-directory))
	  (image-file (expand-file-name "emacs/images/surmulot.jpg" 
					surmulot-directory)))
      (if (not (file-exists-p about))
	  (info "(Surmulot)Top.")
	(find-file about)
	(when (file-exists-p image-file)
	  (goto-char (point-min))
	  (insert-image (create-image image-file)))
	(set-buffer-modified-p nil)
	(toggle-read-only)))))

(defvar surmulot-do-not-compile '("calc-stef.el")
  "emacs lisp code files which should not be compiled")

(defun surmulot-byte-compile-all ()
  "byte-compile all code for surmulot"
  (interactive)
  (dolist (dir '("emacs/site-lisp/stef-elisp" 
		 "emacs/site-lisp/stef-elisp/csound-x"))
    (dolist (file (directory-files 
		   (expand-file-name dir surmulot-directory) t "\\.el$"))
      (unless (member (file-name-nondirectory file)
		      surmulot-do-not-compile)
	(byte-compile-file file)))))

(defun surmulot-go ()
  "Start the full surmulot system via emacs"
  (save-window-excursion
    (cd (file-name-directory (squeak-tcpip-launch-command)))
    (shell-command (format "%s &"
		     (shell-quote-argument (squeak-tcpip-launch-command)))))
  (save-window-excursion
    (cd (kk-tcpip-key-start-directory))
    (call-process (kk-tcpip-key-command) nil 0)))

;;========================= searching Surmulot code

(defun surmulot-code-files ()
  (append
   (remove-if-not
    (lambda (f) (member (file-name-directory f) load-path))
    (deep-directory-files 
     (expand-file-name "emacs/site-lisp/stef-elisp" surmulot-directory)
     "\\.el$"))
   (mapcar
    (lambda (f) (expand-file-name f surmulot-directory))
    '("emacs/surmulot.emacs" "emacs/surmulot-manager.el"))))

(defun surmulot-querysheet ()
  (new-querysheet (surmulot-code-files) "Surmulot code search"))

(defun surmulot-display-querysheet ()
  (interactive)
  (switch-to-buffer
   (qsheet-get-buffer-create-sheet (surmulot-querysheet))))

;;========================= automatic deconnection upon killing

(defadvice save-buffers-kill-emacs (before deconnect-manager)
  "first deconnect emacs from its surmulot manager"
  (if (surman-connected-p)
      (surman-disconnect)))

(ad-activate 'save-buffers-kill-emacs)


;;========================= surmulot info

(when (require 'info nil t)
  (add-to-list 'Info-additional-directory-list (expand-file-name "emacs/" surmulot-directory)))


;;========================= surmulot menu

(winner-mode t)

(defun surmulot-make-global-menu ()
  (easy-menu-define surmulot-menu global-map
    "surmulot menu"
    `("<Surmulot>"
      ["Welcome to Surmulot" surmulot-display-welcome-buffer t]  
      ["Surmulot documentation" (info "surmulot") t] 
      ["Csound-x documentation" (info "csound-x") t] 
      ["Csound realtime examples" 
       (dired (substitute-in-file-name "$SURMULOTDIR/csound/library/CsoundRealtimeExamples")) t]
      "--"
      ["Back to previous buffers" winner-undo winner-mode]
      ["(cancel)" winner-redo winner-mode]
      "--"
      ("Editing"
       ["CD to file directory" (cd (file-name-directory (buffer-file-name))) (buffer-file-name)]
       ["Remove all ^M characters"
	(save-excursion (goto-char (point-min)) 
			(while (re-search-forward "\r+$" nil t)
			  (replace-match "" t t))) t]
       ["Select all"                mark-whole-buffer t]
       ["Untabify region"           untabify t]
       "--"
       ("Major modes"
	["Csound CSD" csound-csd-mode t]
	["Csound Orc" csound-orc-mode t]
	["Csound Sco" csound-sco-mode t]
	["Keykit" keykit-mode t]
	["Emacs lisp" (emacs-lisp-mode) t]
	["Text" text-mode t])
       ("Minor modes"
	["Eldoc" eldoc-mode :style toggle :selected  (condition-case nil eldoc-mode (error nil))])
       "--"
       ["Display search buffer"     qsheet-display-search-buffer t]
       ["Get clipboard"    (progn (switch-to-buffer (get-buffer-create "*from clipboard*")) (clipboard-yank)) t])
      "--"
      ("Environment"
       ["Start Squeak" (with-temp-buffer (require 'squeak) (squeak-start-and-connect)) t]
;       ["Start Squeak (browse for image)" surmulot-start-squeak t]
       ["Start Keykit" kk-tcpip-launch-key t]
       "--"
       ["Connect to manager" surman-connect (not (surman-connected-p))]
       ["Disconnect from manager" surman-disconnect (surman-connected-p)]
       ["Start manager daemon" surman-start-daemon 
	(and
	 (not (surman-daemon-waiting-p))
	 (not (surman-connected-p)))]
       ["Kill manager daemon" surman-cancel-daemon (surman-daemon-waiting-p)]
       "--"
       ["Kill all processes" (mapcar 'kill-buffer
				     (mapcar 'process-buffer (process-list)))
	(process-list)]
       ["Kill Emacs abruptly (no hook)" 
	(when (y-or-n-p "really kill emacs right now ?") 
	  (setq kill-emacs-hook nil) (kill-emacs)) t])
      ("Interaction"
       ["Open Squeak console" (with-temp-buffer (require 'squeak) (display-squeak-tcpip-console)) t]
       ["Open Keykit console" (with-temp-buffer (require 'keykit-mode) (kk-tcpip)) t]
       ["System Shell"         shell t]
       ["Clojure" surmulot-start-clojure (featurep 'csound-clj)]
       )
      "--"
      ("Settings"
       ["Customize Surmulot" (customize-group 'surmulot) t]
       ["Customize paths" (customize-group 'spfa-paths) t]     
       ["Customize Csound-x" (customize-group 'csound-x) t]
       "--"
       ["Set local ports numbers" 
	(progn
	  (find-file (substitute-in-file-name "$SURMULOTDIR/localports.ini"))
	  (find-file-other-window 
	   (substitute-in-file-name 
	    "$SURMULOTDIR/csound/include/surmulot-OSC-ports.orc")))
	t]
       "--"
       ["Use system Csound" surmulot-use-system-csound t]
       ["Use bundled Csound" surmulot-use-bundled-csound 
	(eq system-type 'windows-nt)])
      ("Emacs code"
       ["Byte-compile all code" surmulot-byte-compile-all t]
       ["Search all code" surmulot-display-querysheet t]
       ["Visit init-file" (find-file user-init-file) t]
       ["Edit Surmulot menu" (find-function 'surmulot-make-global-menu) t])
      ("Csound code"
       ["Refresh DSP effects library" 
	csfx-install-library (featurep 'csound-fx)]
       ["Edit OSC controls" 
	(find-file (substitute-in-file-name surmulot-OSC-controls-source)) t]
       ["Refresh OSC controls list" surmulot-OSC-controls t])
      "--"
      ["Run all tests" surmulot-run-all-comment-tests t]
      ["Contact the author"
       (w32-shell-execute 
	"open" 
	"mailto:hepta@zogotounga.net?subject=about surmulot&body=\"hello,\"")
       (eq system-type 'windows-nt)]
      "--"
      ["Save desktop on exit"
       (customize-variable 'desktop-save-mode) 
       :style toggle :selected desktop-save-mode]
      ["Erase saved desktop" (delete-file (desktop-full-file-name))
       (file-exists-p (desktop-full-file-name))])))

; (surmulot-make-global-menu)

(defun surmulot-start-squeak (&optional image-file ignored)
  (interactive)
  (let ((image-file (if (and (stringp image-file)
			     (string-match "^file:.*" image-file))
			(dnd-get-local-file-name image-file t)
		      image-file)))
    (with-temp-buffer
      (require 'squeak)
      (squeak-start-and-connect nil (or image-file "")))))

"muO images can be opened by drag-n-drop into emacs:"
(add-to-list 'dnd-protocol-alist
	     '("^file:.*\\.image$" . surmulot-start-squeak))

;;; ==============================================================


(defcustom surmulot-timidity-cfg "$SURMULOTDIR/timidity/timidity.cfg"
  "Timidity configuration file for Surmulot"
  :type 'file
  :group 'spfa-paths)

(defun surmulot-timidity-cfg ()
  (expand-file-name (substitute-in-file-name surmulot-timidity-cfg)))

(defcustom surmulot-timidity-man "$SURMULOTDIR/timidity/man.html"
  "HTML manual for Timidity"
  :type 'file
  :group 'spfa-paths)

(defun surmulot-timidity-man ()
  (expand-file-name (substitute-in-file-name surmulot-timidity-man)))

(defcustom surmulot-keykit-man "$SURMULOTDIR/keykit/index.html"
  "HTML manual for Keykit"
  :type 'file
  :group 'spfa-paths)

(defun surmulot-keykit-man ()
  (expand-file-name (substitute-in-file-name surmulot-keykit-man)))


;;; ========================= clojure and csnd (java)

(require 'csound-clj)

;;; --------------------------- End  -----------------------------

(provide 'surmulot)

;;; surmulot.el ends here







