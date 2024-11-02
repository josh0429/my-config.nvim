local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else
        return sn(nil, i(1, 'text'))
    end
end

return{
    -- Greek letter snippets, autotriggered
    s({trig=';a', snippetType='autosnippet'},
        {
            t('\\alpha'),
        }
    ),
    s({trig=';b', snippetType='autosnippet'},
        {
            t('\\beta'),
        }
    ),
    s({trig=';g', snippetType='autosnippet'},
        {
            t('\\gamma'),
        }
    ),
    s({trig=';d', snippetType='autosnippet'},
        {
            t('\\delta'),
        }
    ),
    s({trig=';e', snippetType='autosnippet'},
        {
            t('\\epsilon'),
        }
    ),
    s({trig=';ve', snippetType='autosnippet'},
        {
            t('\\varepsilon'),
        }
    ),
    s({trig=';l', snippetType='autosnippet'},
        {
            t('\\lambda'),
        }

    ),
    s({trig=';m', snippetType='autosnippet'},
        {
            t('\\mu'),
        }

    ),
    s({trig=';n', snippetType='autosnippet'},
        {
            t('\\nu'),
        }
    ),
    s({trig=';r', snippetType='autosnippet'},
        {
            t('\\rho'),
        }
    ),
    s({trig=';s', snippetType='autosnippet'},
        {
            t('\\sigma'),
        }
    ),
    s({trig=';x', snippetType='autosnippet'},
        {
            t('\\xi'),
        }
    ),
    s({trig=';z', snippetType='autosnippet'},
        {
            t('\\zeta'),
        }
    ),
    s({trig=';8', snippetType='autosnippet'},
        {
            t('\\infty'),
        }
    ),
    s({trig=';6', snippetType='autosnippet'},
        {
            t('\\partial'),
        }
    ),

    -- Equivalences
    s({trig='==', snippetType='autosnippet'},
        {
            t('\\equiv'),
        }
    ),

    -- Fractions
    s({trig='ff', dscr='LaTeX fraction environment', snippetType='autosnippet'},
        fmta(
            [[\frac{<>}{<>}]],
			{
				i(1, 'numerator'),
				i(2, 'denominator')
			}
		),
		{ condition = in_mathzone }
    ),
    s({trig='FF', dscr='LaTeX dfrac environment', snippetType='autosnippet'},
        fmta(
            [[\dfrac{<>}{<>}]],
		{
			i(1, 'numerator'),
			i(2, 'denominator')
		}
	    ),
		{ condition = in_mathzone }
    ),

    -- Vectors and matrices
    -- TODO: generalize to arbitrary number of elements
    s({trig='cv', dscr='Column vector'},
        fmta(
            [[
                \begin{pmatrix}
                    <> \\
                    <>
                \end{pmatrix}
            ]],
            { i(1, 'v_1'), i(2, 'v_2') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='rv', dscr='Row vector'},
        fmta(
            [[
                \begin{pmatrix}
                    <> & <>
                \end{pmatrix}
            ]],
            { i(1, 'v_1'), i(2, 'v_2') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='mat', dscr='Matrix'},
        fmta(
            [[
                \begin{pmatrix}
                    <> & <> \\
                    <> & <>
                \end{pmatrix}
            ]],
            { i(1, 'v_1'), i(2, 'v_2'), i(3, 'v_3'), i(4, 'v_4') }
        ),
        { condition = in_mathzone }
    ),

    -- differential macro defined at preamble
    s({trig = "df", snippetType = "autosnippet"},
      { t("\\diff") },
      { condition = in_mathzone }
    ),

    -- derivatives 
    s({trig = "dv", snippetType = "autosnippet"},
	fmta(
	    [[ \frac{\diff <>}{<>} ]],
	    { i(1, 'f'), i(2, 't') }
	),
	{ condition = in_mathzone }
    ),
    s({trig = "Dv", snippetType = "autosnippet"},
	fmta(
		[[ \frac{\diff}{\diff <>}]],
		{ i(1, 't') }
	),
      	{ condition = in_mathzone }
    ),
    -- partial derivatives 
    s({trig = "pv", snippetType = "autosnippet"},
	fmta(
	    [[ \frac{\partial <>}{<>} ]],
	    { i(1, 'f'), i(2, 't') }
	),
	{ condition = in_mathzone }
    ),
    s({trig = "Pv", snippetType = "autosnippet"},
	fmta(
		[[ \frac{\partial}{\diff <>}]],
		{ i(1, 't') }
	),
      	{ condition = in_mathzone }
    ),

    -- Exponential
    s({trig='ee', snippetType='autosnippet'},
        fmta(
            'e^{<>}',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='exp', dscr='LaTeX exponential function'},
        fmta(
            '\\exp\\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),

    -- Integrals
    s({trig='Int', dscr='LaTeX integral', snippetType='autosnippet'},
        { t('\\int') },
        { condition = in_mathzone }
    ),
    s({trig='int', dscr='LaTeX integral with bounds', snippetType='autosnippet'},
        fmta(
            '\\int_{<>}^{<>}  \\diff <> \\, ',
            { i(1, '-\\infty'), i(2, '+\\infty'), i(3, 't') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='vint', dscr='Volume integral', snippetType='autosnippet'},
        fmta(
            '\\int \\diff ^{<>}  <> \\, ',
            { i(1, '3'), i(2, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='d2x', snippetType='autosnippet'},
        {t('\\int \\diff ^{2}  x \\, ')},
        { condition = in_mathzone }
    ),
    s({trig='d3x', snippetType='autosnippet'},
        {t('\\int \\diff ^{3}  x \\, ')},
        { condition = in_mathzone }
    ),
    s({trig='d4x', snippetType='autosnippet'},
        {t('\\int  \\diff ^{4}  x \\, ')},
        { condition = in_mathzone }
    ),
    s({trig='kint', dscr='Fourier integral', snippetType='autosnippet'},
        fmta(
            '\\int  \\frac{\\diff ^{<>} <>}{(2\\pi)^{<>}} \\, ',
            { i(1, '3'), i(2, 'k'), rep(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='d2k', snippetType='autosnippet'},
        { t('\\int  \\frac{\\diff ^{2} k}{(2\\pi)^{2}} \\, ') },
        { condition = in_mathzone }
    ),
    s({trig='d3k', snippetType='autosnippet'},
        { t('\\int  \\frac{\\diff ^{3} k}{(2\\pi)^{3}} \\, ') },
        { condition = in_mathzone }
    ),
    s({trig='d4k', snippetType='autosnippet'},
        { t('\\int  \\frac{\\diff ^{4} k}{(2\\pi)^{4}} \\, ') },
        { condition = in_mathzone }
    ),
    s({trig='pint', dscr='Path integral', snippetType='autosnippet'},
        fmta(
            '\\int \\mathcal{D} \\, <>',
            { i(1, '\\phi') }
        ),
        { condition = in_mathzone }
    ),

    -- Trigonometric functions
    s({trig='cos', dscr='LaTeX cosine function'},
        fmta(
            '\\cos \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='sin', dscr='LaTeX sine function'},
        fmta(
            '\\sin \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='tan', dscr='LaTeX tangent function'},
        fmta(
            '\\tan \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='csc', dscr='LaTeX cosecant function'},
        fmta(
            '\\csc \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='secf', dscr='LaTeX secant function'},
        fmta(
            '\\sec \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),
    s({trig='cot', dscr='LaTeX cotangent function'},
        fmta(
            '\\cot \\left( <> \\right)',
            { i(1, 'x') }
        ),
        { condition = in_mathzone }
    ),

    -- Math enviroments
    -- Sqrt
    s({trig='sq', dscr='LaTeX sqrt', snippetType='autosnippet'},
        fmta(
            [[ \sqrt{<>} ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),

    -- Braket notation
    s({trig='>', dscr='Bra'},
        fmta(
            [[ \left | <> \right \rangle ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='<', dscr='Ket'},
        fmta(
            [[ \left \rangle <> \right | ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({trig='<>', dscr='Braket notation environment', snippetType='autosnippet'},
        fmta(
            [[ \left \langle <> | <> | <> \right \rangle ]],
            { i(1), i(2), i(3) }
        ),
        { condition = in_mathzone }
    ),

    -- Inline math
    s({trig='mm', dscr='LaTeX inline math environment', snippetType='autosnippet'},
        fmta(
            '$ <> $',
            { i(1) }
        )
    ),


    -- Math fonts
    -- Mathcal 
    s({trig='mc', dscr='LaTeX mathcal'},
        fmta(
            [[ \mathcal{<>} ]],
            { d(1, get_visual) }
        )
    ),
    s({trig='mcD', snippetType='autosnippet'},
        {t('\\mathcal{D}')},
        { condition = in_mathzone }
    ),
    s({trig='mcM', snippetType='autosnippet'},
        {t('\\mathcal{M}')},
        { condition = in_mathzone }
    ),
    s({trig='mcF', snippetType='autosnippet'},
        {t('\\mathcal{F}')},
        { condition = in_mathzone }
    ),
    s({trig='mcL', snippetType='autosnippet'},
        {t('\\mathcal{L}')},
        { condition = in_mathzone }
    ),

    -- Script fonts (needs `mathrsfs` package)
    s({trig='sc', dscr='LaTeX mathcal'},
        fmta(
            [[ \mathscr{<>} ]],
            { d(1, get_visual) }
        )
    ),
    s({trig='scD', snippetType='autosnippet'},
        {t('\\mathscr{D}')},
        { condition = in_mathzone }
    ),
    s({trig='scM', snippetType='autosnippet'},
        {t('\\mathscr{M}')},
        { condition = in_mathzone }
    ),
    s({trig='scF', snippetType='autosnippet'},
        {t('\\mathscr{F}')},
        { condition = in_mathzone }
    ),
    s({trig='scL', snippetType='autosnippet'},
        {t('\\mathscr{L}')},
        { condition = in_mathzone }
    ),

    -- Math bold text
    s({trig='mbf', dscr='LaTeX mathbf'},
        fmta(
            [[ \mathbf{<>} ]],
            { d(1, get_visual) }
        )
    ),
    s({trig='pp', snippetType='autosnippet'},
        {t('\\mathbf{p}')},
        { condition = in_mathzone }
    ),
    s({trig='kk', snippetType='autosnippet'},
        {t('\\mathbf{k}')},
        { condition = in_mathzone }
    ),
    s({trig='xx', snippetType='autosnippet'},
        {t('\\mathbf{x}')},
        { condition = in_mathzone }
    ),
    s({trig='rr', snippetType='autosnippet'},
        {t('\\mathbf{r}')},
        { condition = in_mathzone }
    ),
    -- Mathfrac
    s({trig='mfr', dscr='LaTeX mathfrak'},
        fmta(
            [[ \mathfrak{<>} ]],
            { d(1, get_visual) }
        )
    ),
    -- Mathbb
    s({trig='mbb', dscr='LaTeX mathbb'},
        fmta(
            [[ \mathbb{<>} ]],
            { d(1, get_visual) }
        )
    ),

    -- Miscellaneous

    -- \quad \Rightarrow \quad
    s({trig='>>', snippetType='autosnippet'},
        {t('\\quad \\Rightarrow \\quad')},
        {condition = in_mathzone }
    ),
    s({trig='->', snippetType='autosnippet'}, 
        {t('\\rightarrow')},
        {condition = in_mathzone }
    ),

    -- Feynman slash (needs 'slashed' package)
    s({trig='sl', snippetType='autosnippet'},
        fmta(
            [[\slashed{<>}]],
            { i(1, 'p') }
        ),
        {condition = in_mathzone }
    ),
}
