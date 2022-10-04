;;; evil-key-leap.el --- Use key-leap as an evil motion

;; Copyright (C) 2022  Martin Rykfors

;; Author: Martin Rykfors <martinrykfors@gmail.com>
;; Version: 0.0.1
;; URL: https://github.com/MartinRykfors/evil-key-leap
;; Keywords: point, convenience, key-leap, evil
;; Package-Requires: ((emacs "28.2") (evil "1.15.0") (key-leap "1.0.0"))

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation; either version 3, or (at your
;; option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; For a full copy of the GNU General Public License see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package lets you to use key-leap as an evil motion.  By
;; calling `evil-key-leap-create-motion', you will define a new evil
;; motion that uses key-leap to jump between lines. This motion can
;; then be combined with evil operators to alter the text between the
;; point and the line jumped to.  For more information about key-leap
;; package, please refer to its documentation.

;;; Code:

(require 'key-leap)
(require 'evil-types)
(require 'evil-macros)
(require 'evil-states)

(defun evil-key-leap-create-motion (&optional key)
  "Use key-leap as an evil motion, bound to KEY in `evil-motion-state-map'.
This function defines a new evil motion called
 `key-leap-evil-motion' that allows you to use key-leap together
 with evil features like operators, visual state and the jump
 list.  May only be called after key-leap and evil have been
 loaded.  When KEY is omitted, only the motion will be defined
 and no key binding will be created."
  (evil-define-motion key-leap-evil-motion ()
    "Motion for moving between lines, similar to `key-leap-start-matching'."
      :type line
      :jump t
      (key-leap-start-matching))
  (when key
    (define-key evil-motion-state-map key 'key-leap-evil-motion)))

(provide 'evil-key-leap)

;;; evil-key-leap.el ends here
