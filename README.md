# FixGHScroll

A small Safari extension that stops GitHub pages from jumping to the bottom when
you scroll.

GitHub's Actions log viewer can keep scrolling the page after you've left it.
FixGHScroll cleans up detached log steps so they stop moving unrelated pages.
There are no extra reloads or changes to normal scrolling.

It runs only on `https://github.com`. There are no background scripts, tracking,
storage, scroll listeners, polling, or mutation observers.

## Install

1. Download **FixGHScroll.zip** from the [latest release](https://github.com/julianschiavo/FixGHScroll/releases/latest).
2. Unzip it, move **FixGHScroll.app** to Applications, and open it.
3. Click **Open Safari Settings**, enable the extension, and allow it on GitHub.
4. Reload any GitHub tabs that were already open.

The app can be closed once the extension is enabled.

To hide its toolbar button, Control-click it and choose **Remove Item**. The fix
keeps working without it.

The app is signed with Developer ID and notarized by Apple. To build from source, open
`FixGHScroll.xcodeproj` in Xcode 27.2 or later.
