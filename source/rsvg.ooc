use rsvg, cairo

include librsvg/rsvg, librsvg/rsvg-cairo
import cairo/Cairo

SvgDimensions: cover from RsvgDimensionData {
    width:  extern Int
    height: extern Int
    em: extern Double
    ex: extern Double
}

Svg: cover from RsvgHandle * {

    /**
     * Load an .svg file from an .svg file
     */
    new: static func (path: String) -> This {
        // who cares about errors? :D
        rsvg_handle_new_from_file(path, null)  
    }

    getDimensions: extern(rsvg_handle_get_dimensions) func (dimensions: SvgDimensions*)

    getWidth: func -> Int {
        dimensions: SvgDimensions
        getDimensions(dimensions&)
        dimensions width
    }

    getHeight: func -> Int {
        dimensions: SvgDimensions
        getDimensions(dimensions&)
        dimensions height
    }

    render: extern(rsvg_handle_render_cairo) func (cr: Context)

    render: extern(rsvg_handle_render_cairo_sub) func ~sub (cr: Context, id: CString)

    free: extern(rsvg_handle_free) func

}

rsvg_handle_new_from_file: extern func (path: CString, error: Pointer*) -> Svg
