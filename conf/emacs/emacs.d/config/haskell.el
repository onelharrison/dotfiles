;; HASKELL

(use-package haskell-mode)

(use-package intero)
(intero-global-mode 1)
(add-hook 'haskell-mode-hook 'intero-mode)

(use-package hindent)

; (use-package ghc
;   :config
;   (add-hook 'haskell-mode-hook (lambda () (ghc-init))))
