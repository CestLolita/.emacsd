(require 'cc-mode)
(require 'google-c-style)

(defun my-build-tab-stop-list (width)
  (let ((num-tab-stops (/ 80 width))
    (counter 1)
    (ls nil))
    (while (<= counter num-tab-stops)
      (setq ls (cons (* width counter) ls))
      (setq counter (1+ counter)))
    (set (make-local-variable 'tab-stop-list) (nreverse ls))))
(defun my-c-mode-common-hook ()
  (setq tab-width 4)
  (my-build-tab-stop-list tab-width)
  (setq c-basic-offset tab-width)
  (setq indent-tabs-mode nil) ;; force only spaces for indentation
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'arglist-intro 'c-lineup-arglist-intro-after-paren))

;; google sytle is defined in above function
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

(provide 'init-google-c-style)
