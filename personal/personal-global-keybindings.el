;;; personal-global-keybindings.el --- Personal keybindings
;;
;; Filename: personal-global-keybindings.el
;; Author: Sean Fisk
;; Maintainer: Sean Fisk
;; Keywords: convenience, local
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'bind-key)

;; The default key to switch buffer is C-x b, but that's not easy
;; enough.
(bind-key "C-x b" 'ido-switch-buffer)
(bind-key "C-x C-c" 'ido-switch-buffer)
(bind-key "C-x B" 'ibuffer)
;; An easy shortcut is needed for this common task.
(bind-key "C-x j" 'kill-this-buffer)
(bind-key "C-c r" 'rename-buffer)

(bind-key "C-a" 'toggle-beginning-or-indentation)

(require 'prelude-mode)

;; Must use `(substitute-key-definition ... nil prelude-mode-map)' and not `(define-key prelude-mode-map [remap ...] nil)'.
(substitute-key-definition 'prelude-smart-open-line nil prelude-mode-map)
(substitute-key-definition 'prelude-smart-open-line-above nil prelude-mode-map)
(bind-key "C-o" 'prelude-smart-open-line)
(bind-key "M-o" 'prelude-smart-open-line-above)

(bind-key "RET" 'newline-and-indent)

;; Now that we've clobbered `kill-emacs', give a shortcut back.
(bind-key "C-x q" 'kill-emacs)

;; key-chord is already installed by Prelude.
(require 'key-chord)

(key-chord-define-global "jf" 'jump-char-forward)
(key-chord-define-global "jd" 'jump-char-backward)
(key-chord-define-global "kf" 'ido-switch-buffer)
(key-chord-define-global "kd" 'prelude-switch-to-previous-buffer)
(key-chord-define-global "kg" 'save-buffer)
(key-chord-define-global "hf" 'helm-projectile)


(provide 'personal-global-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; personal-global-keybindings.el ends here
