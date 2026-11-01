# FixGHScroll

A small Safari extension that stops GitHub pages from jumping to the bottom when
you scroll.

GitHub's Actions log viewer can keep scrolling the page after you've left it.
FixGHScroll cleans up detached log steps so they stop moving unrelated pages.
There are no extra reloads or changes to normal scrolling.

It runs only on `https://github.com`. There are no background scripts, tracking,
storage, scroll listeners, polling, or mutation observers.

## Install

1. Open `FixGHScroll.xcodeproj` in Xcode 27.2 or later.
2. Select your signing team for both targets, then run **FixGHScroll** on your Mac.
3. Click **Open Safari Settings**, enable the extension, and allow it on GitHub.
4. Reload any GitHub tabs that were already open.

The app can be closed once the extension is enabled.
