(defun edts-debug-toggle-breakpoint ()
  (interactive)
  (message "Toggle breakpoint at %s" (what-line)))

(defun edts-debug-step ()
  (interactive)
  (message "%s" "Step"))

(defun edts-debug-continue ()
  (interactive)
  (message "%s" "Continue"))

(defun edts-enter-debug-mode ()
  (interactive)
  (pop-to-buffer "*EDTS Debugger*" nil)
  (edts-debug-mode))

(defvar edts-debug-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "SPC") 'edts-debug-toggle-breakpoint)
    (define-key map (kbd "s")   'edts-debug-step)
    (define-key map (kbd "c")   'edts-debug-continue)
    map))

;; EDTS debug mode
(define-derived-mode edts-debug-mode fundamental-mode
  "EDTS debug mode"
  "Major mode for debugging interpreted Erlang code using EDTS"
  (setq buffer-read-only t)
  (setq mode-name "EDTS-debug") 
  (use-local-map edts-debug-keymap))

(provide 'edts-debug)