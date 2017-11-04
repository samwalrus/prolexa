:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/http_open)).
:- use_module(library(ssl)).
:- use_module(library(clpfd)).
:- use_module(alexa_mod).
:- use_module(library(pengines)).


%:- initialization http_daemon.

:- http_handler(root(alexa), alexa,[]).
:- http_handler('/', say_hi, []).
% The predicate server(+Port) starts the server. It simply creates a
% number of Prolog threads and then returns to the toplevel, so you can
% (re-)load code, debug, etc.
server(Port) :-
        http_server(http_dispatch, [port(Port)]).



say_hi(_Request) :-
	phrase(
	    my_nonterm,
	    TokenizedHtml,
	    []),
        format('Content-type: text/html~n~n'),
	print_html(TokenizedHtml).

my_nonterm -->
	html([html([head([title('Sam Neaves homepageHeroku Test')]),
		    body([h1('Heroku Test'),
			  p("Please take a look at these:"),
                          h2('Youtube Channel Playing with Prolog:'),
			  a(href='https://www.youtube.com/channel/UCfWpIHmy5MEx2p9c_GJrE_g', 'Youtube Playing with Prolog'),
			  h2('Remote controlling a robot with Prolog pengines:'),

			  p('This server is powered by swi-prolog and Heroku')
                        ])
                   ])
             ]).
