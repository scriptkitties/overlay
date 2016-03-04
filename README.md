# Usage

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