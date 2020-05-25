;; WEB

(setq-default js-indent-level 2)

(use-package js2-mode)

(use-package prettier-js
	     :config
	     (add-hook 'web-mode-hook 'prettier-js-mode)
	     (add-hook 'js2-mode-hook 'prettier-js-mode))
