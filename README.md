# Installation
Add this to `/etc/repos.conf/sk-overlay.conf`.

```
[sk-overlay]
location   = /usr/local/overlay/sk-overlay
sync-type  = git
sync-uri   = https://c.darenet.org/scriptkitties/overlay.git
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