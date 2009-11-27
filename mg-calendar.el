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

; 按p C顯示天干地支, from http://forum.slime.com.tw/post1100258-1.html
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

; 眾人生日
(setq local-holidays '((holiday-fixed 10 2 "我生日")
                       ; 同事
                       (holiday-fixed 7 1 "junefu生日")
                       (holiday-fixed 3 22 "陳昆峰生日")
                       (holiday-fixed 11 15 "蔡嘉宏KK生日")
                       ; 朋友
                       (holiday-fixed 3 31 "香菇生日")
                       (holiday-fixed 4 29 "juju生日")
                       ; 家人
                       (holiday-fixed 4 14 "嘟爸生日")
                       (holiday-fixed 5 18 "emily生日")
                       (holiday-fixed 5 11 "媽媽生日")
                       (holiday-fixed 6 19 "爸爸生日")
                       ))
