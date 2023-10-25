(setq gc-cons-threshold 400000000)
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq package-enable-at-startup nil)
(setq package-archives  '(("melpa" . "https://melpa.org/packages/")
                          ("elpa" . "https://elpa.gnu.org/packages/")
                          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                          ("org" . "https://orgmode.org/elpa/")))
;; set up package
(eval-when-compile
  (require 'package)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)
    (package-install 'use-package))
  (require 'use-package)
  (setq use-package-always-ensure t))

(eval-when-compile
  (require 'use-package))

(server-start)

(setq user-full-name "Nick George")

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;;;;;;;;;;;;;;;
;;;; Themes ;;;;
;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes"))

(use-package color-theme-sanityinc-tomorrow
  :defer t)

(use-package material-theme
  :defer t)

(use-package zenburn-theme
  :defer t)

(use-package solarized-theme
  :defer t
  :config
  (setq solarized-use-variable-pitch nil))

(use-package leuven-theme
  :config
  (load-theme 'leuven t))

(defun switch-theme (theme)
  "Disables any currently active themes and loads THEME."
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapc 'symbol-name
                                   (custom-available-themes))))))
  (let ((enabled-themes custom-enabled-themes))
    (mapc #'disable-theme custom-enabled-themes)
    (load-theme theme t)))

(defun disable-active-themes ()
  "Disable any currently active themes listed in `custom-enabled-themes'."
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; global keyboard shortcuts ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defalias 'yes-or-no-p 'y-or-n-p)

(global-unset-key (kbd "C-x C-c"))

(global-set-key (kbd "C-c y") 'kill-buffer-and-window) ;; kill buffer and window is C-c C-k
(global-set-key (kbd "C-c c")'org-capture) ;; start org capture.
(global-set-key (kbd "C-c t") 'switch-theme)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-c i") (lambda () (interactive) (find-file "~/dotfiles/init.el")))
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(bind-key "C-c l" 'org-store-link)
(bind-key "C-c c" 'org-capture)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Other visual configs ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(size-indication-mode 1)

(menu-bar-mode -1)
(global-display-line-numbers-mode t)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :height 140)

(setq select-enable-clipboard t
      select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(blink-cursor-mode 0)

(setq-default frame-title-format "%b (%f)")

(if (window-system) (set-frame-size (selected-frame) 100 50))

(setq ring-bell-function 'ignore)

(setq uniquify-buffer-name-style 'forward)

(show-paren-mode 1)

(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Packages and Configs with use-package ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company) ;; autocompletion

(use-package deadgrep)
(global-set-key (kbd "<f5>") #'deadgrep)


;; org-mode

;; (use-package org
;;   :config 
;;   (add-hook 'org-mode-hook  (lambda () (setq truncate-lines nil)))
;;   :mode ("\\.org$" . org-mode)
;;   :hook ((org-mode . flyspell-mode)
;;    (org-mode . org-bullets-mode) 
;;    (org-mode . visual-line-mode) 
;;    (org-mode . electric-pair-mode)))
(use-package org-contrib 
             :defer t)
(add-hook 'org-mode-hook  (lambda () (setq truncate-lines nil)))
(with-eval-after-load 'org
  (add-hook 'org-mode-hook #'flyspell-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'toggle-word-wrap)
  (add-hook 'org-mode-hook #'abbrev-mode))


(setq truncate-lines nil) ;; set 1 to disable wrap
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-startup-folded t)
(setq org-export-with-sub-superscripts '{})
(setq org-use-sub-superscripts '{})
(setq electric-indent-mode nil)
(setq org-babel-python-command "python3")
(setq org-src-window-setup (quote current-window))
(setq org-startup-with-inline-images t)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "WAITING(w)"  "NEXT(n)" "|" "DONE(d)" "CANCELLED(c)" ))))
(setq org-log-done 'time)
(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("NEXT" :foreground "yellow" :background "grey" :weight bold)
        ("In-progress" :foreground "orange" :weight bold)
        ("WAITING" :foreground "black" :background "grey" :weight bold)
        ("DONE" :foreground "#2D6B2D" :weight bold)
        ("CANCELLED" :foreground "#2D6B2D")))
;;(setq org-agenda-files (directory-files-recursively "~/orgs/" "\\.org$"))
(setq org-latex-prefer-use-labels t)
(setq org-clock-idle-time 15)
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
(setq org-clock-in-resume t)
(setq org-clock-persist-query-resume nil)
(setq org-clock-in-switch-to-state "NEXT")
(setq org-clock-into-drawer t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-out-when-done t)
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
(setq org-clock-report-include-clocking-task t)
(setq org-pretty-entities t)
(setq org-tags-column 45)
(setq org-export-babel-evaluate nil)
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(use-package paredit
  :init
  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)
  :config
  (message "paredit use package loaded"))



;; s package
(use-package s)

(use-package projectile
  :commands (projectile-mode)
  :config
  (projectile-mode))
(setq projectile-indexing-method 'native)

(use-package openwith
  :config
  (setq openwith-associations '(("\\.pptx?\\'" "open" (file))
                              ("\\.docx?\\'" "open" (file))
                              ("\\.xlsx?\\'" "open" (file))
                              ("\\.ods?\\'" "open" (file))))
  (openwith-mode t))


(use-package ibuffer
  :commands ibuffer
  :bind ("C-x C-b" . ibuffer)
  :config (setq ibuffer-truncate-lines t)
  (define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.3fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.3fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))
  (setq ibuffer-default-sorting-mode 'recency)
  (setq ibuffer-saved-filter-groups
        '(("home"
           ("emacs-config" (or (filename . ".emacs.d")
                               (filename . "emacs-config")))
           ("Org" (or (mode . org-mode)
                      (filename . "OrgMode")))
           ("code" (or (mode . python-mode)
                       (mode . inferior-lisp-mode)
                       (mode . ess-mode)
                       (mode . ess-r-mode)
                       (mode . scheme-mode)
                       (mode . clojure-mode)
                       (mode . clojurescript-mode)
                       (mode . emacs-lisp-mode)
                       (mode . prog-mode)
                       (mode . c-mode)
                       (mode . sh-mode)
                       (filename . "*.sh")
                       (filename . "Makefile")
                       (mode . rust-mode)))
           ("shell/REPL" (or (mode . eshell-mode)
                             (mode . cider-repl-mode)
                             (mode . comint-mode)
                             (filename . "\*Python\*")))
           ("web" (or (mode . web-mode)
                      (mode . js-mode)
                      (mode . json-mode))))))
  (add-hook 'ibuffer-mode-hook
            '(lambda ()
               (ibuffer-switch-to-saved-filter-groups "home"))))

(use-package smex
  :bind 
  ("M-x" . smex)
  :config
  (smex-initialize)
  :init
  (setq smex-save-file (concat user-emacs-directory ".smex-items")))

(use-package helm-xref)

(use-package helm
  :bind  (("M-a" . helm-M-x)
          ("C-x C-f" . helm-find-files)
          ("M-y" . helm-show-kill-ring)
          ("C-x b" . helm-buffers-list))
  :config (progn
            (setq helm-buffers-fuzzy-matching t)
            (helm-mode 1)
            (define-key helm-map (kbd "<left>") 'helm-find-files-up-one-level)
            (define-key helm-map (kbd "<right>") 'helm-execute-persistent-action))
  (define-key global-map [remap find-file] #'helm-find-files)
  (define-key global-map [remap execute-extended-command] #'helm-M-x)
  (define-key global-map [remap switch-to-buffer] #'helm-mini))


;;  use recent file stuff
(use-package recentf
  :bind ("C-x C-r" . helm-recentf)
  :config
  (recentf-mode t)
  (setq recentf-max-saved-items 200))


(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;;; web-mode ;;;;

(use-package web-mode
  :config 
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq auto-mode-alist (append
                       '(("\\.html\\'" . web-mode)
                         ("\\.css\\'" . web-mode)
                         ("index\\'" . web-mode))
                       auto-mode-alist))
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))


;;;; Python ;;;;

(use-package pyenv-mode)

(use-package blacken)
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-black-fix-code nil t)))
)

;; (use-package elpy
;;   :config
;;   (elpy-enable)
;;   (add-hook 'elpy-mode-hook 'blacken-mode)
;;   (setq elpy-shell-echo-output nil
;;       python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "--simple-prompt")
;;   (setq python-shell-prompt-detect-failure-warning nil)
;;   (setq python-shell-completion-native-enable nil) 
;;   )

(use-package company-jedi)


(add-hook 'python-mode-hook
                    (lambda()
                      (add-hook 'local-write-file-hooks
                                '(lambda()
                                   (save-excursion
                                     (delete-trailing-whitespace))))))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(use-package python-mode
  :init (defun hs-mode-and-hide ()
          "Turn on code folding and folds all code blocks."
          (interactive)
          (hs-minor-mode)
          (hs-hide-all))
 ;; :hook (hs-mode-and-hide blacken-mode elpy-mode highlight-indentation-current-column-mode electric-pair-mode)
  :bind (:map python-mode-map ("C-c h" . 'hs-hide-all) ("C-c s" . 'hs-show-all) ("C-<tab>" . 'hs-toggle-hiding))
  :config 
  (setq flycheck-python-pycompile-executable "/usr/local/bin/python3"))


(with-eval-after-load 'python-mode
    (add-hook 'python-mode-hook #'blacken-mode)
    (add-hook 'python-mode-hook #'elpy-mode)
    (add-hook 'python-mode-hook #'electric-pair-mode))

;;;; Flycheck spellcheck ;;;;

(use-package flycheck
  :config (global-flycheck-mode))

;;;; Magit/Git ;;;;

(use-package magit
  :config
  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session))

;;;; Shell and eshell ;;;;

(use-package exec-path-from-shell
  :config 
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)
    (exec-path-from-shell-copy-envs
     '("PATH"))))

;;;; Cloudformation ;;;;
(use-package yaml-mode)
;; from https://www.emacswiki.org/emacs/cfn-mode.el

(when (featurep 'yaml-mode)
  (define-derived-mode cfn-mode yaml-mode
    "Cloudformation"
    "Cloudformation template mode.")
  
  (add-to-list 'magic-mode-alist
               '("\\(---\n\\)?AWSTemplateFormatVersion:" . cfn-mode))

  (when (featurep 'flycheck)
    (flycheck-define-checker cfn-lint
      "AWS CloudFormation linter using cfn-lint.

Install cfn-lint first: pip install cfn-lint

See `https://github.com/aws-cloudformation/cfn-python-lint'."

      :command ("cfn-lint" "-f" "parseable" source)
      :error-patterns ((warning line-start (file-name) ":" line ":" column
                                ":" (one-or-more digit) ":" (one-or-more digit) ":"
                                (id "W" (one-or-more digit)) ":" (message) line-end)
                       (error line-start (file-name) ":" line ":" column
                              ":" (one-or-more digit) ":" (one-or-more digit) ":"
                              (id "E" (one-or-more digit)) ":" (message) line-end))
      :modes (cfn-mode))
    (add-to-list 'flycheck-checkers 'cfn-lint)
    (add-hook 'cfn-mode-hook 'flycheck-mode)))

(add-to-list 'auto-mode-alist '("\\.template$" . cfn-mode))


;;;; Yasnippet ;;;;

(use-package yasnippet
  :init (setq yas-trigger-key "<tab>")
  :config (yas-global-mode t))


;;;; Rust ;;;;
;; https://youtu.be/omJhc7zprNs?t=337
(use-package cargo)

(use-package lsp-mode
  :ensure t
  :hook rustic-mode
  :bind (:map lsp-mode-map
         ("C-c d" . lsp-describe-thing-at-point)))

;; requires compiling rust-analyzer
(use-package rustic
  :ensure t
  :config 
  (require 'lsp-rust) 
  (setq rustic-format-on-save t)
  (setq lsp-rust-analyzer-completion-add-call-parenthesis nil)
  (setq lsp-rust-analyzer-proc-macro-enable t))


;;;; Javascript/node/react ;;;;
;; https://emacs-lsp.github.io/lsp-mode/tutorials/reactjs-tutorial/

(use-package js
  :hook lsp-mode
  :mode "\\.js$")

(use-package which-key
  :config (which-key-mode))
(use-package json-mode)

;;;; Docker ;;;;
(use-package dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;;;; Yaml ;;;;
(use-package yaml-mode)

;;;; R/ESS ;;;;

(use-package ess)

;;;; org-ref and LaTeX compiler ;;;;


(use-package org-ref
  :config (setq reftex-default-bibliography '("~/bibliography/bib.bib")
                org-ref-default-bibliography '("~/bibliography/bib.bib")
                bibtex-completion-bibliography '("~/bibliography/bib.bib"))
  ;; install ox-bibtex via curl and bibtex2html via brew:
  ;; curl https://raw.githubusercontent.com/yyr/org-mode/master/contrib/lisp/ox-bibtex.el --output ~/.emacs.d/lisp/ox-bibtex.el
  (require 'ox-bibtex)
  )

;;;;;;;;;;;;;;
;;;; MISC ;;;;
;;;;;;;;;;;;;;


(require 'cl-lib)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(setq-default indent-tabs-mode nil)

;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

(setq ispell-program-name "/usr/local/bin/aspell")


(setq abbrev-file-name 
"~/.emacs.d/abbrev_defs.el")

(setq save-abbrevs t)

(setq ansi-color-for-comint-mode t)

(global-set-key (kbd "C-c a") 'org-agenda)

(setq create-lockfiles nil) ;; see this https://github.com/syl20bnr/spacemacs/issues/5554

;; eshell ;; 

(setq eshell-prompt-regexp "^[^#$\n]*[#$] "
      eshell-prompt-function
      (lambda nil
        (concat
         (propertize (user-login-name) 'face '(:foreground "black")) " "
         (if (string= (eshell/pwd)
                      (getenv "HOME"))
             (propertize "~" 'face '(:foreground "blue"))
           (propertize (eshell/basename (eshell/pwd)) 'face '(:foreground "blue"))) 
         (if (= (user-uid) 0) "# "
           (concat  " $ " )))))


(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-pop-up-window)))

(setq abbrev-file-name
        "~/.emacs.d/abbrev_defs")

(setq save-abbrevs t)

(add-hook 'prog-mode-hook
       (lambda ()
         (abbrev-mode -1)))


;; http://ergoemacs.org/emacs/emacs_pretty_lambda.html
(defun pretty-lambda ()
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955))))

(add-hook 'scheme-mode-hook 'prettify-symbols-mode)
(add-hook 'scheme-mode-hook 'pretty-lambda)
(add-hook 'clojure-mode-hook 'prettify-symbols-mode)
(add-hook 'clojure-mode-hook 'pretty-lambda)
(add-hook 'emacs-lisp-mode-hook 'pretty-lambda)
(add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
(add-hook 'lisp-mode-hook 'pretty-lambda)
(add-hook 'lisp-mode-hook 'prettify-symbols-mode)
(add-hook 'prog-mode-hook 'pretty-lambda )
(add-hook 'prog-mode-hook 'prettify-symbols-mode)

(setq read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

;;;; cloudformation ;;;;

(define-derived-mode cfn-mode yaml-mode
  "Cloudformation"
  "Cloudformation template mode.")

(add-to-list 'auto-mode-alist '(".cfn.yaml\\'" . cfn-mode))
(add-to-list 'auto-mode-alist '(".cfn.yml\\'" . cfn-mode))

(with-eval-after-load 'flycheck
  (flycheck-define-checker cfn-lint
    "A Cloudformation linter using cfn-python-lint.

See URL 'https://github.com/awslabs/cfn-python-lint'."
    :command ("cfn-lint" "-f" "parseable" source)
    :error-patterns (
                     (warning line-start (file-name) ":" line ":" column
                              ":" (one-or-more digit) ":" (one-or-more digit) ":"
                              (id "W" (one-or-more digit)) ":" (message) line-end)
                     (error line-start (file-name) ":" line ":" column
                            ":" (one-or-more digit) ":" (one-or-more digit) ":"
                            (id "E" (one-or-more digit)) ":" (message) line-end)
                     )
    :modes (cfn-mode)
    )
    (add-to-list 'flycheck-checkers 'cfn-lint)
  )

;; brew install bibtex2html
;;(add-to-list 'exec-path "/usr/local/bin/bibtex2html")
(setq bibtex2html-program "/usr/local/bin/bibtex2html")

;;;; Finish and clean up ;;;

(setq gc-cons-threshold 800000)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
