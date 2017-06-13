[![Build Status](https://travis-ci.org/scriptkitties/overlay.svg?branch=master)](https://travis-ci.org/scriptkitties/overlay)

# Installation
## Using layman
Installation using layman is pretty straightforward:

```
layman -a scriptkitties
emerge --sync
```

## Manual installation
Add this to `/etc/portage/repos.conf/sk-overlay.conf`.

```
[sk-overlay]
location   = /usr/local/overlay/sk-overlay
sync-type  = git
sync-uri   = https://github.com/scriptkitties/overlay.git
auto-sync  = yes
```

`/usr/local/overlay` doesn't exist by default so create it if needed.
```
[ ! -d /usr/local/overlay ] && mkdir -p /usr/local/overlay
```

Finally you can update portage.
```
emerge --sync
```

# Usage
Like all overlays, there are various methods of checking what the overlay
contains. You could read through the git page, or you could go with the lazy
alternative which uses `app-portage/eix`. First make sure your eix cache is
up-to-date.
```
eix-update
```

Then to search all ebuilds contained in this overlay, you can issue the
following command:
```
eix --in-overlay sk-overlay
```

Too install from one of the ebuilds in sk-overlay, the installation process
is exactly the same as all normal gentoo packages. For instance, if you want to
install `void-sources-bin`, you could simply:
```
emerge -a void-sources-bin
```

# Issues
If you find any issues, such as repackaged software being out of date, you can
either [open an issue][new-issue] or join the IRC channel and hit up the
maintainer of the package. We reside on `irc.darenet.org` in `#scriptkitties`.

# Contributing
If you wish to contribute, you can always submit a MR on this repository. Our
main activity happens around [DareNET][darenet], but use of our git repositories
on other services is fine too. It can take a bit longer to notice, but you can
poke a maintainer on IRC to speed up the process.

## Requirements
There are some requirements your ebuild should adhere to in order to be
considered for our overlay.

- Your commits have to be signed.
- The software installed by the ebuild **must** be released under a free license
  (any license in `@FREE`).
- You must include a metadata.xml with contact information and descriptions of
  all USE flags in the ebuild.


[new-issue]: https://c.darenet.org/scriptkitties/overlay/issues/new
[darenet]: https://www.darenet.org
