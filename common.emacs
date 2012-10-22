;;;; Cross platform configs for emacs

;;;; start up meassage
(setq initial-scratch-message "Hello,Raymond!")

;;;; show date and time in mode-line
(setq display-time-day-and-date t )
(setq display-time-24hr-format t)
(setq display-time-format "%H:%M %Y-%m-%d")
(display-time)

;;;; remove the tool bar
(tool-bar-mode -1)
;;;; remove the menu bar
(menu-bar-mode -1)
;;;; hide the scroll bar
(scroll-bar-mode -1)

;;;; enable ido
(require 'ido)
(ido-mode t)

;;;; disable auto backup
(setq make-backup-files nil)

(setq default-tab-width 4) 

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(set-background-color "#c7edcc")
;;;; (set-background-color "black")
(set-foreground-color "black")
;;;; (set-cursor-color "#dbffef")
(set-cursor-color "#black")

;;;; show me line and column nos
(line-number-mode t)
(column-number-mode t)

(require 'hl-line)  
(global-hl-line-mode t)  
;;;; smooth scroll
(setq scroll-margin 3   
      scroll-conservatively 10000)

;;;; line num  
;;;; (require 'linum)
;;;; (global-linum-mode -1)

;;;; use y & n instead of yes & no        
(fset 'yes-or-no-p 'y-or-n-p)      

(defadvice kill-ring-save (before slickcopy activate compile)        
  "When called interactively with no active region, copy a single line instead."        
  (interactive        
   (if mark-active (list (region-beginning) (region-end))        
     (list (line-beginning-position)        
           (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)        
  "When called interactively with no active region, kill a single line instead."        
  (interactive        
   (if mark-active (list (region-beginning) (region-end))        
     (list (line-beginning-position)        
           (line-beginning-position 2)))))

(defun move-line-up ()
  "move line up"
  (interactive)
  (transpose-lines 1)
  (previous-line 2))
(global-set-key [(M up)] 'move-line-up)

(defun move-line-down ()
  "move line down"
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))
(global-set-key [(M down)] 'move-line-down)