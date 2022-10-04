# evil-key-leap

## Use [key-leap](https://github.com/MartinRykfors/key-leap) as an evil motion

This package allows you to create an [evil](https://github.com/emacs-evil/evil) motion which uses [key-leap](https://github.com/MartinRykfors/key-leap) to jump between lines. This in turn lets you combine jumps with evil operators, allowing you to alter the text between the point and the line you jump to. Please see the [key-leap](https://github.com/MartinRykfors/key-leap) readme for more information on how it is used.

## Installation

### With use-package
**Note**: This package is not yet available on Melpa.

Clone this repo to your machine, then add the following configuration:

```
(use-package evil-key-leap
  :load-path "/path/to/evil-key-leap/" ;; Change this to the path to your clone of evil-key-leap
  :config
  (evil-key-leap-create-motion (kbd "<SPC>"))) ;; Change this to use whichever key combination you prefer
```

### Basic installation

Clone this repo to your machine, then add the following to your `init.el`:
```
(add-to-list 'load-path "/path/to/evil-key-leap/")
(require 'evil-key-leap)
(evil-key-leap-create-motion (kbd "<SPC>"))
```

## Configuration and usage

`evil-key-leap` provides a single function `evil-key-leap-create-motion`. This function calls the library to define an evil motion.
The function can be called with an optional argument representing the key to which you want to bind this new evil motion to in the `evil-motion-state-map`. For instance, adding the following function call to your `init.el`

```
(evil-key-leap-create-motion (kbd "<SPC>"))
```

will bind the <kbd>space</kbd> key to activate key-leap as an evil motion. This way, you are able to press the key sequence

<kbd>d</kbd> <kbd>space</kbd> <kbd>g</kbd> <kbd>a</kbd> 

in order delete to every line between the line the point is on and the line whose leap code is `ga`. All evil operators can be combined with key-leap this way.

Calling `evil-key-leap-create-motion` without an argument will cause the evil motion to be defined, but no key bound in any keymap.
