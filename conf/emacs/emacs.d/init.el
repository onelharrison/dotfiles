;; PACKAGE MANAGEMENT
;; ------------------

; Enable secure packagement management
(setq gnutls-verify-error t)
(setq tls-checktrust t)

; Bootstrap Straight emacs package manager
(setq straight-use-package-by-default t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; Install use-package
(straight-use-package 'use-package)

;; LOAD CONFIGUATION
;; -----------------

(dolist
  (file
    (directory-files
      (concat (expand-file-name user-emacs-directory) "config")
      t
      directory-files-no-dot-files-regexp
    )
  )
  (load file))
