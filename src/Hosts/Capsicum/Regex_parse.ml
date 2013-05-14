type token =
  | VAR of (string)
  | INT of (int)
  | LPAREN
  | RPAREN
  | LSQUARE
  | RSQUARE
  | LSQUIG
  | RSQUIG
  | COMMA
  | COLON
  | LET
  | EQ
  | IN
  | ADD
  | COMPL
  | DIFF
  | INTER
  | UNION
  | NULL_CONS
  | EPS_CONS
  | CONCAT
  | ALT
  | KLEENE
  | WITH
  | WITHIN
  | ALL_POL_ACTS
  | AT_LEAST
  | AT_MOST
  | AMB
  | NEG
  | AMB_VEC
  | JOIN
  | ALL_VECS
  | LLVM_ACT
  | LLVM_DESC_ALLOC
  | ALL_PROG_ACTS
  | STDIN
  | STDOUT
  | STDERR
  | LLVM_DESC
  | OPEN_COMMENT
  | CLOSE_COMMENT
  | ALL_RIGHTS
  | CAP_ACCEPT
  | CAP_ACL_CHECK
  | CAP_ACL_DELETE
  | CAP_ACL_GET
  | CAP_ACL_SET
  | CAP_BIND
  | CAP_CONNECT
  | CAP_CREATE
  | CAP_DELETE
  | CAP_FEXECVE
  | CAP_EXTATTR_DELETE
  | CAP_EXTATTR_GET
  | CAP_EXTATTR_LIST
  | CAP_EXTATTR_SET
  | CAP_FCHDIR
  | CAP_FCHFLAGS
  | CAP_FCHMOD
  | CAP_FCHOWN
  | CAP_FCNTL
  | CAP_FLOCK
  | CAP_FPATHCONF
  | CAP_FSCK
  | CAP_FSTAT
  | CAP_FSTATFS
  | CAP_FSYNC
  | CAP_FTRUNCATE
  | CAP_FUTIMES
  | CAP_GETPEERNAME
  | CAP_GETSOCKNAME
  | CAP_GETSOCKOPT
  | CAP_IOCTL
  | CAP_LISTEN
  | CAP_LOOKUP
  | CAP_MAC_GET
  | CAP_MAC_SET
  | CAP_MAPEXEC
  | CAP_MKDIR
  | CAP_MKFIFO
  | CAP_MMAP
  | CAP_PDGETPID
  | CAP_PDKILL
  | CAP_PDWAIT
  | CAP_PEELOFF
  | CAP_POLL_EVENT
  | CAP_POST_EVENT
  | CAP_READ
  | CAP_RMDIR
  | CAP_SEEK
  | CAP_SEM_GETVALUE
  | CAP_SEM_POST
  | CAP_SEM_WAIT
  | CAP_SETSOCKOPT
  | CAP_SHUTDOWN
  | CAP_TTYHOOK
  | CAP_WRITE
  | EOF

open Parsing;;
# 5 "Regex_parse.mly"
  open Vpa
  open Cappol_regex_types
  
  type var_expr = Cappol_regex_types.var_expr
# 109 "Regex_parse.ml"
let yytransl_const = [|
  259 (* LPAREN *);
  260 (* RPAREN *);
  261 (* LSQUARE *);
  262 (* RSQUARE *);
  263 (* LSQUIG *);
  264 (* RSQUIG *);
  265 (* COMMA *);
  266 (* COLON *);
  267 (* LET *);
  268 (* EQ *);
  269 (* IN *);
  270 (* ADD *);
  271 (* COMPL *);
  272 (* DIFF *);
  273 (* INTER *);
  274 (* UNION *);
  275 (* NULL_CONS *);
  276 (* EPS_CONS *);
  277 (* CONCAT *);
  278 (* ALT *);
  279 (* KLEENE *);
  280 (* WITH *);
  281 (* WITHIN *);
  282 (* ALL_POL_ACTS *);
  283 (* AT_LEAST *);
  284 (* AT_MOST *);
  285 (* AMB *);
  286 (* NEG *);
  287 (* AMB_VEC *);
  288 (* JOIN *);
  289 (* ALL_VECS *);
  290 (* LLVM_ACT *);
  291 (* LLVM_DESC_ALLOC *);
  292 (* ALL_PROG_ACTS *);
  293 (* STDIN *);
  294 (* STDOUT *);
  295 (* STDERR *);
  296 (* LLVM_DESC *);
  297 (* OPEN_COMMENT *);
  298 (* CLOSE_COMMENT *);
  299 (* ALL_RIGHTS *);
  300 (* CAP_ACCEPT *);
  301 (* CAP_ACL_CHECK *);
  302 (* CAP_ACL_DELETE *);
  303 (* CAP_ACL_GET *);
  304 (* CAP_ACL_SET *);
  305 (* CAP_BIND *);
  306 (* CAP_CONNECT *);
  307 (* CAP_CREATE *);
  308 (* CAP_DELETE *);
  309 (* CAP_FEXECVE *);
  310 (* CAP_EXTATTR_DELETE *);
  311 (* CAP_EXTATTR_GET *);
  312 (* CAP_EXTATTR_LIST *);
  313 (* CAP_EXTATTR_SET *);
  314 (* CAP_FCHDIR *);
  315 (* CAP_FCHFLAGS *);
  316 (* CAP_FCHMOD *);
  317 (* CAP_FCHOWN *);
  318 (* CAP_FCNTL *);
  319 (* CAP_FLOCK *);
  320 (* CAP_FPATHCONF *);
  321 (* CAP_FSCK *);
  322 (* CAP_FSTAT *);
  323 (* CAP_FSTATFS *);
  324 (* CAP_FSYNC *);
  325 (* CAP_FTRUNCATE *);
  326 (* CAP_FUTIMES *);
  327 (* CAP_GETPEERNAME *);
  328 (* CAP_GETSOCKNAME *);
  329 (* CAP_GETSOCKOPT *);
  330 (* CAP_IOCTL *);
  331 (* CAP_LISTEN *);
  332 (* CAP_LOOKUP *);
  333 (* CAP_MAC_GET *);
  334 (* CAP_MAC_SET *);
  335 (* CAP_MAPEXEC *);
  336 (* CAP_MKDIR *);
  337 (* CAP_MKFIFO *);
  338 (* CAP_MMAP *);
  339 (* CAP_PDGETPID *);
  340 (* CAP_PDKILL *);
  341 (* CAP_PDWAIT *);
  342 (* CAP_PEELOFF *);
  343 (* CAP_POLL_EVENT *);
  344 (* CAP_POST_EVENT *);
  345 (* CAP_READ *);
  346 (* CAP_RMDIR *);
  347 (* CAP_SEEK *);
  348 (* CAP_SEM_GETVALUE *);
  349 (* CAP_SEM_POST *);
  350 (* CAP_SEM_WAIT *);
  351 (* CAP_SETSOCKOPT *);
  352 (* CAP_SHUTDOWN *);
  353 (* CAP_TTYHOOK *);
  354 (* CAP_WRITE *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* VAR *);
  258 (* INT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\003\000\004\000\004\000\
\004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\004\000\017\000\017\000\018\000\019\000\019\000\
\020\000\020\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\021\000\021\000\005\000\005\000\005\000\005\000\
\005\000\005\000\006\000\007\000\007\000\014\000\013\000\013\000\
\008\000\008\000\008\000\008\000\008\000\022\000\022\000\023\000\
\023\000\009\000\009\000\009\000\010\000\010\000\010\000\011\000\
\011\000\012\000\012\000\012\000\012\000\016\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\015\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\006\000\003\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\000\000\002\000\003\000\000\000\002\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\001\000\001\000\003\000\
\003\000\002\000\003\000\001\000\003\000\001\000\002\000\002\000\
\003\000\003\000\003\000\003\000\003\000\000\000\001\000\001\000\
\003\000\001\000\002\000\002\000\002\000\003\000\003\000\001\000\
\002\000\001\000\001\000\001\000\002\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\004\000\019\000\000\000\000\000\000\000\000\000\
\000\000\062\000\063\000\068\000\000\000\000\000\088\000\000\000\
\082\000\000\000\000\000\070\000\090\000\091\000\092\000\000\000\
\094\000\095\000\096\000\097\000\098\000\099\000\100\000\101\000\
\102\000\103\000\104\000\105\000\106\000\107\000\108\000\109\000\
\110\000\111\000\112\000\113\000\114\000\115\000\116\000\117\000\
\118\000\119\000\120\000\121\000\122\000\123\000\124\000\125\000\
\126\000\127\000\128\000\129\000\130\000\131\000\132\000\133\000\
\134\000\135\000\136\000\137\000\138\000\139\000\140\000\141\000\
\142\000\143\000\144\000\145\000\146\000\147\000\148\000\149\000\
\150\000\000\000\002\000\003\000\007\000\008\000\009\000\010\000\
\011\000\012\000\013\000\014\000\015\000\016\000\017\000\018\000\
\000\000\000\000\000\000\000\000\079\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\066\000\000\000\000\000\000\000\
\001\000\006\000\061\000\000\000\073\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\081\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\081\000\099\000\083\000\084\000\085\000\086\000\087\000\088\000\
\089\000\090\000\091\000\092\000\093\000\094\000\095\000\096\000\
\000\000\000\000\000\000\000\000\000\000\100\000\101\000"

let yysindex = "\255\255\
\142\255\000\000\000\000\000\000\142\255\142\255\142\255\001\255\
\142\255\000\000\000\000\000\000\142\255\142\255\000\000\142\255\
\000\000\142\255\142\255\000\000\000\000\000\000\000\000\142\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\237\255\131\000\251\254\254\254\000\000\247\254\165\000\165\000\
\165\000\165\000\165\000\165\000\165\000\142\255\142\255\142\255\
\142\255\142\255\142\255\142\255\000\000\142\255\142\255\142\255\
\000\000\000\000\000\000\142\255\000\000\142\255\165\000\165\000\
\165\000\165\000\165\000\165\000\165\000\165\000\165\000\165\000\
\000\000\148\000\142\255\165\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\255\254\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\255\000\000\000\000\000\000\023\000\031\000\
\037\000\043\000\049\000\055\000\061\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\067\000\073\000\
\079\000\085\000\091\000\097\000\103\000\109\000\115\000\121\000\
\000\000\000\000\000\000\127\000"

let yygindex = "\000\000\
\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\146\255"

let yytablesize = 453
let yytable = "\001\000\
\121\000\102\000\126\000\124\000\110\000\125\000\078\000\080\000\
\111\000\000\000\112\000\113\000\114\000\137\000\000\000\115\000\
\116\000\117\000\118\000\119\000\082\000\000\000\089\000\000\000\
\097\000\098\000\120\000\000\000\103\000\000\000\083\000\000\000\
\104\000\105\000\000\000\106\000\084\000\107\000\108\000\000\000\
\000\000\000\000\085\000\109\000\000\000\000\000\000\000\000\000\
\071\000\000\000\000\000\000\000\000\000\000\000\072\000\000\000\
\000\000\000\000\000\000\000\000\093\000\000\000\000\000\000\000\
\000\000\000\000\086\000\000\000\000\000\000\000\000\000\000\000\
\077\000\000\000\000\000\000\000\000\000\000\000\074\000\000\000\
\000\000\000\000\000\000\000\000\075\000\000\000\000\000\000\000\
\000\000\000\000\076\000\000\000\000\000\000\000\000\000\000\000\
\064\000\000\000\000\000\000\000\000\000\000\000\065\000\000\000\
\000\000\000\000\000\000\000\000\067\000\000\000\000\000\000\000\
\000\000\000\000\069\000\000\000\000\000\000\000\000\000\000\000\
\087\000\000\000\000\000\000\000\000\000\000\000\005\000\000\000\
\000\000\127\000\128\000\129\000\130\000\131\000\132\000\133\000\
\000\000\134\000\135\000\136\000\000\000\000\000\003\000\004\000\
\005\000\138\000\006\000\000\000\007\000\000\000\000\000\000\000\
\008\000\000\000\000\000\000\000\009\000\000\000\140\000\000\000\
\010\000\011\000\000\000\000\000\000\000\000\000\000\000\012\000\
\013\000\014\000\015\000\000\000\016\000\000\000\017\000\018\000\
\019\000\020\000\021\000\022\000\023\000\024\000\000\000\000\000\
\025\000\026\000\027\000\028\000\029\000\030\000\031\000\032\000\
\033\000\034\000\035\000\036\000\037\000\038\000\039\000\040\000\
\041\000\042\000\043\000\044\000\045\000\046\000\047\000\048\000\
\049\000\050\000\051\000\052\000\053\000\054\000\055\000\056\000\
\057\000\058\000\059\000\060\000\061\000\062\000\063\000\064\000\
\065\000\066\000\067\000\068\000\069\000\070\000\071\000\072\000\
\073\000\074\000\075\000\076\000\077\000\078\000\079\000\080\000\
\122\000\000\000\000\000\000\000\000\000\000\000\110\000\000\000\
\000\000\000\000\111\000\000\000\112\000\113\000\114\000\000\000\
\000\000\115\000\116\000\117\000\118\000\119\000\000\000\000\000\
\000\000\000\000\110\000\000\000\120\000\000\000\111\000\000\000\
\112\000\113\000\114\000\000\000\000\000\115\000\116\000\117\000\
\118\000\119\000\089\000\000\000\089\000\000\000\089\000\089\000\
\120\000\000\000\083\000\089\000\083\000\000\000\083\000\083\000\
\084\000\000\000\084\000\083\000\084\000\084\000\085\000\000\000\
\085\000\084\000\085\000\085\000\071\000\000\000\071\000\085\000\
\071\000\071\000\072\000\000\000\072\000\071\000\072\000\072\000\
\093\000\000\000\093\000\072\000\093\000\093\000\086\000\000\000\
\086\000\093\000\086\000\086\000\077\000\000\000\077\000\086\000\
\077\000\077\000\074\000\000\000\074\000\077\000\074\000\074\000\
\075\000\000\000\075\000\074\000\075\000\075\000\076\000\000\000\
\076\000\075\000\076\000\076\000\064\000\000\000\064\000\076\000\
\064\000\064\000\065\000\000\000\065\000\064\000\065\000\065\000\
\067\000\000\000\067\000\065\000\067\000\067\000\069\000\000\000\
\069\000\067\000\069\000\069\000\087\000\000\000\087\000\069\000\
\087\000\087\000\005\000\000\000\005\000\087\000\005\000\005\000\
\123\000\000\000\000\000\005\000\110\000\000\000\000\000\000\000\
\111\000\000\000\112\000\113\000\114\000\000\000\000\000\115\000\
\116\000\117\000\118\000\119\000\000\000\110\000\000\000\000\000\
\139\000\111\000\120\000\112\000\113\000\114\000\000\000\000\000\
\115\000\116\000\117\000\118\000\119\000\000\000\110\000\000\000\
\000\000\000\000\111\000\120\000\112\000\113\000\114\000\000\000\
\000\000\115\000\116\000\117\000\118\000\119\000\000\000\000\000\
\000\000\000\000\000\000\000\000\120\000"

let yycheck = "\001\000\
\000\000\001\001\012\001\009\001\010\001\008\001\008\001\008\001\
\014\001\255\255\016\001\017\001\018\001\124\000\255\255\021\001\
\022\001\023\001\024\001\025\001\001\000\255\255\000\000\255\255\
\005\000\006\000\032\001\255\255\009\000\255\255\000\000\255\255\
\013\000\014\000\255\255\016\000\000\000\018\000\019\000\255\255\
\255\255\255\255\000\000\024\000\255\255\255\255\255\255\255\255\
\000\000\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
\255\255\255\255\255\255\255\255\000\000\255\255\255\255\255\255\
\255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
\000\000\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
\255\255\255\255\255\255\255\255\000\000\255\255\255\255\255\255\
\255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
\000\000\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
\255\255\255\255\255\255\255\255\000\000\255\255\255\255\255\255\
\255\255\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
\000\000\255\255\255\255\255\255\255\255\255\255\000\000\255\255\
\255\255\110\000\111\000\112\000\113\000\114\000\115\000\116\000\
\255\255\118\000\119\000\120\000\255\255\255\255\001\001\002\001\
\003\001\126\000\005\001\255\255\007\001\255\255\255\255\255\255\
\011\001\255\255\255\255\255\255\015\001\255\255\139\000\255\255\
\019\001\020\001\255\255\255\255\255\255\255\255\255\255\026\001\
\027\001\028\001\029\001\255\255\031\001\255\255\033\001\034\001\
\035\001\036\001\037\001\038\001\039\001\040\001\255\255\255\255\
\043\001\044\001\045\001\046\001\047\001\048\001\049\001\050\001\
\051\001\052\001\053\001\054\001\055\001\056\001\057\001\058\001\
\059\001\060\001\061\001\062\001\063\001\064\001\065\001\066\001\
\067\001\068\001\069\001\070\001\071\001\072\001\073\001\074\001\
\075\001\076\001\077\001\078\001\079\001\080\001\081\001\082\001\
\083\001\084\001\085\001\086\001\087\001\088\001\089\001\090\001\
\091\001\092\001\093\001\094\001\095\001\096\001\097\001\098\001\
\004\001\255\255\255\255\255\255\255\255\255\255\010\001\255\255\
\255\255\255\255\014\001\255\255\016\001\017\001\018\001\255\255\
\255\255\021\001\022\001\023\001\024\001\025\001\255\255\255\255\
\255\255\255\255\010\001\255\255\032\001\255\255\014\001\255\255\
\016\001\017\001\018\001\255\255\255\255\021\001\022\001\023\001\
\024\001\025\001\004\001\255\255\006\001\255\255\008\001\009\001\
\032\001\255\255\004\001\013\001\006\001\255\255\008\001\009\001\
\004\001\255\255\006\001\013\001\008\001\009\001\004\001\255\255\
\006\001\013\001\008\001\009\001\004\001\255\255\006\001\013\001\
\008\001\009\001\004\001\255\255\006\001\013\001\008\001\009\001\
\004\001\255\255\006\001\013\001\008\001\009\001\004\001\255\255\
\006\001\013\001\008\001\009\001\004\001\255\255\006\001\013\001\
\008\001\009\001\004\001\255\255\006\001\013\001\008\001\009\001\
\004\001\255\255\006\001\013\001\008\001\009\001\004\001\255\255\
\006\001\013\001\008\001\009\001\004\001\255\255\006\001\013\001\
\008\001\009\001\004\001\255\255\006\001\013\001\008\001\009\001\
\004\001\255\255\006\001\013\001\008\001\009\001\004\001\255\255\
\006\001\013\001\008\001\009\001\004\001\255\255\006\001\013\001\
\008\001\009\001\004\001\255\255\006\001\013\001\008\001\009\001\
\006\001\255\255\255\255\013\001\010\001\255\255\255\255\255\255\
\014\001\255\255\016\001\017\001\018\001\255\255\255\255\021\001\
\022\001\023\001\024\001\025\001\255\255\010\001\255\255\255\255\
\013\001\014\001\032\001\016\001\017\001\018\001\255\255\255\255\
\021\001\022\001\023\001\024\001\025\001\255\255\010\001\255\255\
\255\255\255\255\014\001\032\001\016\001\017\001\018\001\255\255\
\255\255\021\001\022\001\023\001\024\001\025\001\255\255\255\255\
\255\255\255\255\255\255\255\255\032\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LSQUARE\000\
  RSQUARE\000\
  LSQUIG\000\
  RSQUIG\000\
  COMMA\000\
  COLON\000\
  LET\000\
  EQ\000\
  IN\000\
  ADD\000\
  COMPL\000\
  DIFF\000\
  INTER\000\
  UNION\000\
  NULL_CONS\000\
  EPS_CONS\000\
  CONCAT\000\
  ALT\000\
  KLEENE\000\
  WITH\000\
  WITHIN\000\
  ALL_POL_ACTS\000\
  AT_LEAST\000\
  AT_MOST\000\
  AMB\000\
  NEG\000\
  AMB_VEC\000\
  JOIN\000\
  ALL_VECS\000\
  LLVM_ACT\000\
  LLVM_DESC_ALLOC\000\
  ALL_PROG_ACTS\000\
  STDIN\000\
  STDOUT\000\
  STDERR\000\
  LLVM_DESC\000\
  OPEN_COMMENT\000\
  CLOSE_COMMENT\000\
  ALL_RIGHTS\000\
  CAP_ACCEPT\000\
  CAP_ACL_CHECK\000\
  CAP_ACL_DELETE\000\
  CAP_ACL_GET\000\
  CAP_ACL_SET\000\
  CAP_BIND\000\
  CAP_CONNECT\000\
  CAP_CREATE\000\
  CAP_DELETE\000\
  CAP_FEXECVE\000\
  CAP_EXTATTR_DELETE\000\
  CAP_EXTATTR_GET\000\
  CAP_EXTATTR_LIST\000\
  CAP_EXTATTR_SET\000\
  CAP_FCHDIR\000\
  CAP_FCHFLAGS\000\
  CAP_FCHMOD\000\
  CAP_FCHOWN\000\
  CAP_FCNTL\000\
  CAP_FLOCK\000\
  CAP_FPATHCONF\000\
  CAP_FSCK\000\
  CAP_FSTAT\000\
  CAP_FSTATFS\000\
  CAP_FSYNC\000\
  CAP_FTRUNCATE\000\
  CAP_FUTIMES\000\
  CAP_GETPEERNAME\000\
  CAP_GETSOCKNAME\000\
  CAP_GETSOCKOPT\000\
  CAP_IOCTL\000\
  CAP_LISTEN\000\
  CAP_LOOKUP\000\
  CAP_MAC_GET\000\
  CAP_MAC_SET\000\
  CAP_MAPEXEC\000\
  CAP_MKDIR\000\
  CAP_MKFIFO\000\
  CAP_MMAP\000\
  CAP_PDGETPID\000\
  CAP_PDKILL\000\
  CAP_PDWAIT\000\
  CAP_PEELOFF\000\
  CAP_POLL_EVENT\000\
  CAP_POST_EVENT\000\
  CAP_READ\000\
  CAP_RMDIR\000\
  CAP_SEEK\000\
  CAP_SEM_GETVALUE\000\
  CAP_SEM_POST\000\
  CAP_SEM_WAIT\000\
  CAP_SETSOCKOPT\000\
  CAP_SHUTDOWN\000\
  CAP_TTYHOOK\000\
  CAP_WRITE\000\
  EOF\000\
  "

let yynames_block = "\
  VAR\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_expr_term) in
    Obj.repr(
# 92 "Regex_parse.mly"
                          ( _1 )
# 558 "Regex_parse.ml"
               : var_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_core) in
    Obj.repr(
# 95 "Regex_parse.mly"
                             ( _1 )
# 565 "Regex_parse.ml"
               : 'var_expr_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pure_term) in
    Obj.repr(
# 97 "Regex_parse.mly"
          ( Pure_var(_1) )
# 572 "Regex_parse.ml"
               : 'var_expr_core))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 98 "Regex_parse.mly"
        ( Var(_1) )
# 579 "Regex_parse.ml"
               : 'var_expr_core))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 99 "Regex_parse.mly"
                                              ( Let(_2, _4, _6) )
# 588 "Regex_parse.ml"
               : 'var_expr_core))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'var_expr_term) in
    Obj.repr(
# 100 "Regex_parse.mly"
                                ( _2 )
# 595 "Regex_parse.ml"
               : 'var_expr_core))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'regex_term) in
    Obj.repr(
# 104 "Regex_parse.mly"
           ( Regex(_1) )
# 602 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pol_act) in
    Obj.repr(
# 105 "Regex_parse.mly"
            ( Pol_action(_1) )
# 609 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pol_acts) in
    Obj.repr(
# 106 "Regex_parse.mly"
             ( Pol_actions(_1) )
# 616 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'set) in
    Obj.repr(
# 107 "Regex_parse.mly"
        ( Set(_1) )
# 623 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cap_vecs) in
    Obj.repr(
# 108 "Regex_parse.mly"
             ( Vecs_expr(_1) )
# 630 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cap_vec) in
    Obj.repr(
# 109 "Regex_parse.mly"
            ( Vec_expr(_1) )
# 637 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'amb_flag) in
    Obj.repr(
# 110 "Regex_parse.mly"
             ( Amb_expr(_1) )
# 644 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'desc) in
    Obj.repr(
# 111 "Regex_parse.mly"
         ( Desc_expr(_1) )
# 651 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'prog_act) in
    Obj.repr(
# 112 "Regex_parse.mly"
             ( Prog_action(_1) )
# 658 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'prog_acts) in
    Obj.repr(
# 113 "Regex_parse.mly"
              ( Prog_actions(_1) )
# 665 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'right) in
    Obj.repr(
# 114 "Regex_parse.mly"
          ( Right_expr(_1) )
# 672 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'rights) in
    Obj.repr(
# 115 "Regex_parse.mly"
           ( Rights_expr(_1) )
# 679 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 116 "Regex_parse.mly"
        ( Int_const(_1) )
# 686 "Regex_parse.ml"
               : 'pure_term))
; (fun __caml_parser_env ->
    Obj.repr(
# 120 "Regex_parse.mly"
             ( )
# 692 "Regex_parse.ml"
               : 'comment_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'comment) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'comment_seq) in
    Obj.repr(
# 121 "Regex_parse.mly"
                          ( )
# 700 "Regex_parse.ml"
               : 'comment_seq))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'comment_body) in
    Obj.repr(
# 123 "Regex_parse.mly"
                                                 ( )
# 707 "Regex_parse.ml"
               : 'comment))
; (fun __caml_parser_env ->
    Obj.repr(
# 125 "Regex_parse.mly"
              ( )
# 713 "Regex_parse.ml"
               : 'comment_body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'comment_atom) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'comment_body) in
    Obj.repr(
# 126 "Regex_parse.mly"
                                ( )
# 721 "Regex_parse.ml"
               : 'comment_body))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'word) in
    Obj.repr(
# 129 "Regex_parse.mly"
       ( )
# 728 "Regex_parse.ml"
               : 'comment_atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'comment) in
    Obj.repr(
# 130 "Regex_parse.mly"
              ( )
# 735 "Regex_parse.ml"
               : 'comment_atom))
; (fun __caml_parser_env ->
    Obj.repr(
# 133 "Regex_parse.mly"
       ( )
# 741 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 134 "Regex_parse.mly"
           ( )
# 747 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "Regex_parse.mly"
           ( )
# 753 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 136 "Regex_parse.mly"
           ( )
# 759 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 137 "Regex_parse.mly"
            ( )
# 765 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "Regex_parse.mly"
            ( )
# 771 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "Regex_parse.mly"
          ( )
# 777 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 140 "Regex_parse.mly"
          ( )
# 783 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "Regex_parse.mly"
        ( )
# 789 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 142 "Regex_parse.mly"
        ( )
# 796 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "Regex_parse.mly"
       ( )
# 802 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 144 "Regex_parse.mly"
       ( )
# 808 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 145 "Regex_parse.mly"
        ( )
# 814 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 146 "Regex_parse.mly"
          ( )
# 820 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 147 "Regex_parse.mly"
         ( )
# 826 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 148 "Regex_parse.mly"
          ( )
# 832 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 149 "Regex_parse.mly"
          ( )
# 838 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 150 "Regex_parse.mly"
              ( )
# 844 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 151 "Regex_parse.mly"
             ( )
# 850 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 152 "Regex_parse.mly"
           ( )
# 856 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 153 "Regex_parse.mly"
        ( )
# 862 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 154 "Regex_parse.mly"
           ( )
# 868 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 155 "Regex_parse.mly"
         ( )
# 874 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 156 "Regex_parse.mly"
           ( )
# 880 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 157 "Regex_parse.mly"
                  ( )
# 886 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 158 "Regex_parse.mly"
             ( )
# 892 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 159 "Regex_parse.mly"
            ( )
# 898 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 160 "Regex_parse.mly"
             ( )
# 904 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 161 "Regex_parse.mly"
            ( )
# 910 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 162 "Regex_parse.mly"
         ( )
# 916 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 163 "Regex_parse.mly"
          ( )
# 922 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 164 "Regex_parse.mly"
           ( )
# 928 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 165 "Regex_parse.mly"
           ( )
# 934 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    Obj.repr(
# 166 "Regex_parse.mly"
              ( )
# 940 "Regex_parse.ml"
               : 'word))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'var_expr_term) in
    Obj.repr(
# 171 "Regex_parse.mly"
                                ( Action(_2) )
# 947 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    Obj.repr(
# 172 "Regex_parse.mly"
                ( print_endline "parsing null"; Null )
# 953 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    Obj.repr(
# 173 "Regex_parse.mly"
               ( Eps )
# 959 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 174 "Regex_parse.mly"
                                         ( Concat(_1, _3) )
# 967 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 175 "Regex_parse.mly"
                                      ( Alt(_1, _3) )
# 975 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'var_expr_term) in
    Obj.repr(
# 176 "Regex_parse.mly"
                           ( Kleene(_1) )
# 982 "Regex_parse.ml"
               : 'regex_term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 180 "Regex_parse.mly"
                                          ( (_1, _3) )
# 990 "Regex_parse.ml"
               : 'pol_act))
; (fun __caml_parser_env ->
    Obj.repr(
# 185 "Regex_parse.mly"
             ( All_pol_acts )
# 996 "Regex_parse.ml"
               : 'pol_acts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 186 "Regex_parse.mly"
                                         ( Prod(_1, _3) )
# 1004 "Regex_parse.ml"
               : 'pol_acts))
; (fun __caml_parser_env ->
    Obj.repr(
# 191 "Regex_parse.mly"
              ( All_prog_acts )
# 1010 "Regex_parse.ml"
               : 'prog_acts))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 194 "Regex_parse.mly"
                         ( Llvm_act(_2) )
# 1017 "Regex_parse.ml"
               : 'prog_act))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 195 "Regex_parse.mly"
                                    ( Llvm_desc_alloc(_2) )
# 1024 "Regex_parse.ml"
               : 'prog_act))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_seq) in
    Obj.repr(
# 200 "Regex_parse.mly"
                         ( _2 )
# 1031 "Regex_parse.ml"
               : 'set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 201 "Regex_parse.mly"
                                       ( Diff(_1, _3) )
# 1039 "Regex_parse.ml"
               : 'set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 202 "Regex_parse.mly"
                                        ( Intersect(_1, _3) )
# 1047 "Regex_parse.ml"
               : 'set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 203 "Regex_parse.mly"
                                        ( Union(_1, _3) )
# 1055 "Regex_parse.ml"
               : 'set))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 204 "Regex_parse.mly"
                                      ( Union(Pure_var(Set(Single(_1))), _3) )
# 1063 "Regex_parse.ml"
               : 'set))
; (fun __caml_parser_env ->
    Obj.repr(
# 207 "Regex_parse.mly"
  ( Empty )
# 1069 "Regex_parse.ml"
               : 'expr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ne_seq) in
    Obj.repr(
# 208 "Regex_parse.mly"
             ( _1 )
# 1076 "Regex_parse.ml"
               : 'expr_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 211 "Regex_parse.mly"
                ( Single(_1) )
# 1083 "Regex_parse.ml"
               : 'ne_seq))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'ne_seq) in
    Obj.repr(
# 213 "Regex_parse.mly"
        ( Union(Pure_var(Set(Single(_1))), Pure_var(Set(_3))) )
# 1091 "Regex_parse.ml"
               : 'ne_seq))
; (fun __caml_parser_env ->
    Obj.repr(
# 217 "Regex_parse.mly"
         ( All_vecs )
# 1097 "Regex_parse.ml"
               : 'cap_vecs))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 218 "Regex_parse.mly"
                             ( Lower_bound(_2) )
# 1104 "Regex_parse.ml"
               : 'cap_vecs))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 219 "Regex_parse.mly"
                            ( Upper_bound(_2) )
# 1111 "Regex_parse.ml"
               : 'cap_vecs))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 224 "Regex_parse.mly"
                        ( Amb_vec(_2) )
# 1118 "Regex_parse.ml"
               : 'cap_vec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 225 "Regex_parse.mly"
                                        ( Desc_rights_vec(_1, _3) )
# 1126 "Regex_parse.ml"
               : 'cap_vec))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'var_expr_term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 226 "Regex_parse.mly"
                                       ( Join(_1, _3) )
# 1134 "Regex_parse.ml"
               : 'cap_vec))
; (fun __caml_parser_env ->
    Obj.repr(
# 231 "Regex_parse.mly"
      ( Amb )
# 1140 "Regex_parse.ml"
               : 'amb_flag))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 232 "Regex_parse.mly"
                          ( Neg(_2) )
# 1147 "Regex_parse.ml"
               : 'amb_flag))
; (fun __caml_parser_env ->
    Obj.repr(
# 237 "Regex_parse.mly"
        ( Stdin )
# 1153 "Regex_parse.ml"
               : 'desc))
; (fun __caml_parser_env ->
    Obj.repr(
# 238 "Regex_parse.mly"
             ( Stdout )
# 1159 "Regex_parse.ml"
               : 'desc))
; (fun __caml_parser_env ->
    Obj.repr(
# 239 "Regex_parse.mly"
             ( Stderr )
# 1165 "Regex_parse.ml"
               : 'desc))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'var_expr_term) in
    Obj.repr(
# 240 "Regex_parse.mly"
                              ( Llvm_desc(_2) )
# 1172 "Regex_parse.ml"
               : 'desc))
; (fun __caml_parser_env ->
    Obj.repr(
# 245 "Regex_parse.mly"
           ( All_rights )
# 1178 "Regex_parse.ml"
               : 'rights))
; (fun __caml_parser_env ->
    Obj.repr(
# 249 "Regex_parse.mly"
           ( Accept )
# 1184 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 250 "Regex_parse.mly"
                    ( Acl_check )
# 1190 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 251 "Regex_parse.mly"
                     ( Acl_delete )
# 1196 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 252 "Regex_parse.mly"
                  ( Acl_get )
# 1202 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 253 "Regex_parse.mly"
                  ( Acl_set )
# 1208 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 254 "Regex_parse.mly"
               ( Bind )
# 1214 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 255 "Regex_parse.mly"
                  ( Connect )
# 1220 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 256 "Regex_parse.mly"
                 ( Create )
# 1226 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 257 "Regex_parse.mly"
                 ( Delete )
# 1232 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 258 "Regex_parse.mly"
                  ( Fexecve )
# 1238 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 259 "Regex_parse.mly"
                         ( Extattr_delete )
# 1244 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 260 "Regex_parse.mly"
                      ( Extattr_get )
# 1250 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 261 "Regex_parse.mly"
                       ( Extattr_list )
# 1256 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 262 "Regex_parse.mly"
                      ( Extattr_set )
# 1262 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 263 "Regex_parse.mly"
                 ( Fchdir )
# 1268 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 264 "Regex_parse.mly"
                   ( Fchflags )
# 1274 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 265 "Regex_parse.mly"
                 ( Fchmod )
# 1280 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 266 "Regex_parse.mly"
                 ( Fchown )
# 1286 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 267 "Regex_parse.mly"
                ( Fcntl )
# 1292 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 268 "Regex_parse.mly"
                ( Flock )
# 1298 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 269 "Regex_parse.mly"
                    ( Fpathconf )
# 1304 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 270 "Regex_parse.mly"
               ( Fsck )
# 1310 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 271 "Regex_parse.mly"
                ( Fstat )
# 1316 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 272 "Regex_parse.mly"
                  ( Fstatfs )
# 1322 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 273 "Regex_parse.mly"
                ( Fsync )
# 1328 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 274 "Regex_parse.mly"
                    ( Ftruncate )
# 1334 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 275 "Regex_parse.mly"
                  ( Futimes )
# 1340 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 276 "Regex_parse.mly"
                      ( Getpeername )
# 1346 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 277 "Regex_parse.mly"
                      ( Getsockname )
# 1352 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 278 "Regex_parse.mly"
                     ( Getsockopt )
# 1358 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 279 "Regex_parse.mly"
                ( Ioctl )
# 1364 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 280 "Regex_parse.mly"
                 ( Listen )
# 1370 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 281 "Regex_parse.mly"
                 ( Lookup )
# 1376 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 282 "Regex_parse.mly"
                  ( Mac_get )
# 1382 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 283 "Regex_parse.mly"
                  ( Mac_set )
# 1388 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 284 "Regex_parse.mly"
                  ( Mapexec )
# 1394 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 285 "Regex_parse.mly"
                ( Mkdir )
# 1400 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 286 "Regex_parse.mly"
                 ( Mkfifo )
# 1406 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 287 "Regex_parse.mly"
               ( Mmap )
# 1412 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 288 "Regex_parse.mly"
                   ( Pdgetpid )
# 1418 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 289 "Regex_parse.mly"
                 ( Pdkill )
# 1424 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 290 "Regex_parse.mly"
                 ( Pdwait )
# 1430 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 291 "Regex_parse.mly"
                  ( Peeloff )
# 1436 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 292 "Regex_parse.mly"
                     ( Poll_event )
# 1442 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 293 "Regex_parse.mly"
                     ( Post_event )
# 1448 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 294 "Regex_parse.mly"
               ( Read )
# 1454 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 295 "Regex_parse.mly"
                ( Rmdir )
# 1460 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 296 "Regex_parse.mly"
               ( Seek )
# 1466 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 297 "Regex_parse.mly"
                       ( Sem_getvalue )
# 1472 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 298 "Regex_parse.mly"
                   ( Sem_post )
# 1478 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 299 "Regex_parse.mly"
                   ( Sem_wait )
# 1484 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 300 "Regex_parse.mly"
                     ( Setsockopt )
# 1490 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 301 "Regex_parse.mly"
                   ( Shutdown )
# 1496 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 302 "Regex_parse.mly"
                  ( Ttyhook )
# 1502 "Regex_parse.ml"
               : 'right))
; (fun __caml_parser_env ->
    Obj.repr(
# 303 "Regex_parse.mly"
                ( Write )
# 1508 "Regex_parse.ml"
               : 'right))
(* Entry policy *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let policy (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : var_expr)
;;
