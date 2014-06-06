# gpm-prebuild: A prebuilder plugin for GPM

For any sizeable project, Go compilation time is just soooo long.
Sometimes a build can take upwards of 10 seconds! But you can cut that
time down.

This is a plugin for GPM that runs a `go build` on all of your
dependencies in the `$GOPATH`. If you are using a per-project `$GOPATH`
(the standard way of using GVP) then prebuilding is a simple way of
improving performance.

## Installing

Run `make install`. This will hopefully be in the GPM plugin homebrew
repository soon, too.

## Typical usage pattern

Typically this is run right after a `gpm install`

```bash
$ cd my_go_project
$ source gvp in
$ gpm install
$ gpm prebuild
# And edit away!
```

If you also use [gpm-git](https://github.com/technosophos/gpm-git), you
can prebuild those dependencies with `gpm prebuild git`.

If at any point you need to get rid of those pesky `.a` files, just do a
`gpm prebuild clean`.

## Why did you write this crazy thing?

While Go really does build very quickly, there are practical cases where
increasing compilation speed is desireable.

Here's what prompted me to write this plugin: I use `vim` with syntax
checking. My syntax checker runs each time I write (`:w`, etc) the file.
And I save often. On a sizeable project, I had to wait several seconds
between when I hit `:w` and when my editor became active again.

The cause of this is that a few of my dependency libraries are very,
very large, and were being re-compiled from scratch with each document
save.

The solution: Prebuild the packages. This cut my `go build` time down to
the point where I don't notice any lag.

