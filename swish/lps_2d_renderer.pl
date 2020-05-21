:- module(lps_2d,
	  [ term_rendering//3			% +Term, +Vars, +Options
	  ]).

:- use_module(library(http/html_write)).
:- use_module(library(http/term_html)).
:- use_module(library(http/js_write)).
%:- use_module('/home/prologmud_server/swish/lib/render').

:- register_renderer(lps_2d, "2d world display of a LPS execution").

term_rendering(lps_visualization(_T,TwoD), _Vars, _Options) --> 
	{TwoD \= []},
	% TODO: add export
	html(
		div([ 'data-render'('As LPS 2D world')],[
		canvas([id(lps_2dworld)], []),
		% Depends on /lps/2dWorld.js
		\js_script({|javascript(TwoD)||

			if (!( $.ajaxScript )) 
				throw("Somehow missing SWISH script property");
			var div  = $.ajaxScript.parent();
			var container = div.find('#lps_2dworld');
			if (!container) 
				alert('Could not find 2d world HTML element!');
			var DOMcontainer = container.get(0);

			var myWorld = twoDworld();
			myWorld.initCycle(TwoD);
			myWorld.initPaper(DOMcontainer,true);
		|})
	])).

