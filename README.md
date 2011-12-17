
## librsvg bindings for ooc

librsvg is this very neat library that loads .svg files really easily.

And these are ooc bindings for it.

My use case was clearly to render to a cairo context, so that's all I bound.
Patches welcome though, if you want to render to a GdkPixbuf or something like that.

## Usage


```ooc
SomeApp: class {

    svg: Svg

    // loading it
    load: func {
        svg = Svg new("cutegraphic.svg")
    }

    // rendering it
    render: func (cr: Context) {
        // remember, in cairo you can move stuff
        // around with cr translate(x, y)
        // don't forget to cr save() before
        // and cr restore() before, so you don't mess
        // up your context
        svg render(cr)
    }

    free: func {
        // don't forget to free it, or it'll leak in the
        // long run - svg handles are not GC-collected
        svg free()
    }

}
```

That's it. Have fun!
