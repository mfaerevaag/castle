;;; plugins.el --- plugins config
;;; Commentary:
;;; Code:

(defvar personal-plugins-dir (concatenate 'string prelude-personal-dir "/plugins")
  "Directory with all personal plugin configs.")

(add-to-list 'load-path (concatenate 'string prelude-dir "/vendor"))
(add-to-list 'load-path (concatenate 'string prelude-personal-dir "/plugins"))

(message "Loading personal plugins...")
;; (mapc 'load (directory-files personal-plugins-dir 't "^[^#].*el$"))

;; evil
(setq evil-shift-width 4)
(setq evil-auto-indent t)
;; disable key-chort-mode in evilmode
(when (boundp 'evil-mode)
  (key-chord-mode -1))

;; helm
(require 'prelude-helm-everywhere)

;; multicursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;; doc-view
;; (require 'doc-view)
;; (setq doc-view-continuous t)

;; ace-jump
;; (key-chord-define-global (kbd "jk") nil)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; yaline
(global-yalinum-mode t)

;; highlight-indentation
;;(highlight-indentation-mode t)

;; whitespace
(add-hook 'before-save-hook 'whitespace-cleanup)

;; smart-parens
(setq sp-autoescape-string-quote-if-empty -1)

;; flyspell
(setq prelude-flyspell nil)
(add-hook 'text-mode-hook 'flyspell-mode)

;; tramp
(load "personal-tramp")
;; (require 'personal-plugin-tramp)

;; r
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
(add-hook 'R-mode-hook 'auto-complete-mode)
(add-hook 'R-mode-hook 'smartparens-mode)

;; c
(setq c-default-style "linux"
      c-basic-offset 4)

;; java
;; (load "java")

;; haskell
(setq haskell-font-lock-symbols -1)

;; kite
;; (load "kite")

;; lisp
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; gezel
;; (defun gezel-mode ()
;;   (c-mode)
;;   (flycheck-mode -1))
;; (add-to-list 'auto-mode-alist '("\\.fdl\\'" . gezel-mode))

;; anb
(load "anb")
(add-to-list 'auto-mode-alist '("\\.anb\\'" . anb-mode))


;; latex
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (TeX-PDF-mode)
            (reftex-mode)
            (smartparens-mode)
            (setq whitespace-style (delete 'lines-tail whitespace-style))))

;; markdown
(require 'markdown-mode)
(setq markdown-command "markdown_py2")
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq prelude-clean-whitespace-on-save nil)
            (setq prelude-whitespace t)))

;; javascript
;; (setq js-indent-level 4)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; coffee
(add-hook 'coffee-mode-hook 'auto-complete-mode)
(custom-set-variables
 '(coffee-tab-width 4)
 '(coffee-cos-mode nil))

;; scss
;; (setq css-indent-offset 4)
(setq scss-compile-at-save nil)
(add-hook 'scss-mode-hook 'smartparens-mode)
(add-hook 'scss-mode-hook 'whitespace-mode)
(add-hook 'scss-mode-hook 'auto-complete-mode)

;; web
(load "personal-web")

;; simplezen
(require 'simplezen)
(define-key web-mode-map (kbd "C-c C-z") 'simplezen-expand)


(provide 'personal-plugins)

;;; plugins.el ends here
