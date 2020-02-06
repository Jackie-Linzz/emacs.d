(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/"))
(setq package-archive-priorities '(("gnu" . 3) ("melpa" . 2) ("popkit" . 1)))
(setq package-menu-hide-low-priority t)


(setq inhibit-startup-screen t)
;;menu bar
(menu-bar-mode -1)
;;scroll bar
(scroll-bar-mode -1)
;;tool bar
(tool-bar-mode -1)

;;line number
(global-linum-mode 1)

;;font
(cond ((eq system-type 'darwin) (add-to-list 'default-frame-alist '(font . "Monaco 16")))
      ((eq system-type 'gnu/linux) (if (eq (system-name) "notebook")
                                       (add-to-list 'default-frame-alist '(font . "Monospace 18"))
                                     (add-to-list 'default-frame-alist '(font . "Monospace 14")))))

;;(setq scroll-margin 3)
(show-paren-mode 1)


(setq frame-title-format "emacs@%b")
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq require-final-newline t)
;;(setq-default truncate-lines t)
;;(setq auto-hscroll-mode t)

;;buffer list
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "M-p") 'previous-buffer)
(global-set-key (kbd "M-n") 'next-buffer)

(global-set-key (kbd "C-j") 'goto-line)
(global-set-key (kbd "C-c r") 'replace-string)
(global-set-key (kbd "s-a") 'beginning-of-buffer)
(global-set-key (kbd "s-e") 'end-of-buffer)

(load-theme 'material t)



;;for programming
(setq compile-command "make")
;;projectile
;;(projectile-global-mode)
(require 'flymake)
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(define-key eglot-mode-map (kbd "s-.") 'xref-find-definitions)

;; (require 'rtags)
;; (add-hook 'c-mode-hook 'rtags-mode)
;; (add-hook 'c++-mode-hook 'rtags-mode)

;;ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
(define-key ggtags-mode-map (kbd "M-.") 'ggtags-show-definition)

;;for gdb
(setq gdb-many-windows t)

;;company
(require 'company)
(global-company-mode 1)


;;indentation and cc-mode
;;(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default c-basic-offset 4)
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "linux")))

