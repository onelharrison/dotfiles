;; BASIC TEXT EDITING

; Emaulate vim
(use-package evil
	     :demand t
	     :config
	     (evil-mode t))

; Show matching parens with no delay
(setq show-paren-delay 0)
(show-paren-mode 1)

; Save last session
(desktop-save-mode t)
(save-place-mode t)

; Alias action confirmations
(defalias 'yes-or-no-p 'y-or-n-p)

;; SEARCHING AND NAVIGATION

(use-package helm)
