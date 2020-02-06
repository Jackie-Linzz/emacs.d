;;sr-speedbar
(require 'speedbar)
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq speedbar-show-unknown-files t)
(global-set-key (kbd "M-s") 'sr-speedbar-toggle)
