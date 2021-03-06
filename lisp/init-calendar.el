;;;; calendar  
(setq calendar-week-start-day 1) ; 第一天為星期一
(setq view-diary-entries-initially t) ; 開calendar時也顯示diary
(setq mark-holidays-in-calendar t) ; 開calendar時也顯示 holiday

;; 隱藏跟我無關的節日
(setq holiday-general-holidays nil)
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq bahai-holidays nil)

; 按p C顯示天干地支, via http://forum.slime.com.tw/post1100258-1.html
(defconst chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "已" "庚" "辛" "壬" "癸"])
(defconst chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])


;; diray
; diary-mode fancy display 炫麗顯示
(setq view-diary-entries-initially t
   mark-diary-entries-in-calendar t
   number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'fancy-diary-display-mode-hook
   '(lambda ()
		  (alt-clean-equal-signs)))
; via http://www.emacswiki.org/emacs/DiaryMode

; set date format
(setq calendar-date-display-form '(year "-" month "-" day))
; diary檔用iso日期格式(預設是美國式)
(setq calendar-date-style 'iso)

(setq calendar-latitude +25.02)
(setq calendar-longitude +121.31)
(setq calendar-location-name "台北")

;; Fix foolish calendar-mode scrolling.
(add-hook 'calendar-load-hook
 '(lambda ()
 (setq mark-holidays-in-calendar t)
 (define-key calendar-mode-map ">" 'scroll-calendar-left)
 (define-key calendar-mode-map "<" 'scroll-calendar-right)
 (define-key calendar-mode-map "\C-x>" 'scroll-calendar-left)
 (define-key calendar-mode-map "\C-x<" 'scroll-calendar-right)))

