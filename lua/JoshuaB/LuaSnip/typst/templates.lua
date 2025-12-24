return{
    s({trig='note', dscr='Personal note'},
        fmta(
            [[
                #import "note.typ": note

                #set document(
                  title: [
                    <>
                  ]
                )

                #show: note.with(
                  filename: "<>",
                  abstract: "<>"
                )
            ]],
            { i(1, 'Sample title'), i(2, 'filename'), i(3, 'Abstract') }
        )
    )
}
