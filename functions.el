(defun org-agenda-and-todos ()
  "Show `org-agenda' with a global list of TODOs."
  (interactive)
  (org-agenda nil "n"))

;; Eshell
(defun eshell/ll (&rest args)
  "Execute `eshell/ls' with '-al' flags.

Pass ARGS onto `eshell/ls'."
  (eshell/ls "-al" args))

(defun eshell/ring (line)
  "Capture output of LINE execution in the kill ring."
  (eshell-command (concat line " > /dev/kill")))

(defun eshell/pathof (file)
  "Capture FILE path in kill ring."
  (kill-new (concat (eshell/pwd) "/" file)))

(defun ascena/todo-brands ()
  (interactive)
  (dolist (brand '("catherines" "dressbarn" "justice" "lanebryant" "maurices"))
    (insert (format "- [ ] %s\n" brand))))
