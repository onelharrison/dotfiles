;; HASKELL

(use-package haskell-mode)

(use-package intero)
(intero-global-mode 1)

(use-package hindent
  :config
  (add-hook 'haskell-mode-hook #'hindent-mode))

