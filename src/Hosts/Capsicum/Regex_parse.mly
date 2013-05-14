/* Cappol_regex.mly: description of a parser for Capsicum policy
 * regular expressions. */

%{
  open Vpa
  open Cappol_regex_types
  
  type var_expr = Cappol_regex_types.var_expr
%}

%start policy
%type <var_expr> policy

/* Declare token. */
%token <string> VAR
%token <int> INT
%token LPAREN RPAREN LSQUARE RSQUARE LSQUIG RSQUIG COMMA COLON
%token LET EQ IN
%token ADD COMPL DIFF INTER UNION
%token NULL_CONS EPS_CONS CONCAT ALT KLEENE
%token WITH 
%token WITHIN ALL_POL_ACTS
%token AT_LEAST AT_MOST
%token AMB NEG
%token AMB_VEC JOIN
%token ALL_VECS
%token LLVM_ACT LLVM_DESC_ALLOC
%token ALL_PROG_ACTS
%token STDIN STDOUT STDERR LLVM_DESC
%token OPEN_COMMENT CLOSE_COMMENT
%token ALL_RIGHTS
%token CAP_ACCEPT
%token CAP_ACL_CHECK
%token CAP_ACL_DELETE
%token CAP_ACL_GET
%token CAP_ACL_SET
%token CAP_BIND
%token CAP_CONNECT
%token CAP_CREATE
%token CAP_DELETE
%token CAP_FEXECVE
%token CAP_EXTATTR_DELETE
%token CAP_EXTATTR_GET
%token CAP_EXTATTR_LIST
%token CAP_EXTATTR_SET
%token CAP_FCHDIR
%token CAP_FCHFLAGS
%token CAP_FCHMOD
%token CAP_FCHOWN
%token CAP_FCNTL
%token CAP_FLOCK
%token CAP_FPATHCONF
%token CAP_FSCK
%token CAP_FSTAT
%token CAP_FSTATFS
%token CAP_FSYNC
%token CAP_FTRUNCATE
%token CAP_FUTIMES
%token CAP_GETPEERNAME
%token CAP_GETSOCKNAME
%token CAP_GETSOCKOPT
%token CAP_IOCTL
%token CAP_LISTEN
%token CAP_LOOKUP
%token CAP_MAC_GET
%token CAP_MAC_SET
%token CAP_MAPEXEC
%token CAP_MKDIR
%token CAP_MKFIFO
%token CAP_MMAP
%token CAP_PDGETPID
%token CAP_PDKILL
%token CAP_PDWAIT 
%token CAP_PEELOFF
%token CAP_POLL_EVENT
%token CAP_POST_EVENT
%token CAP_READ
%token CAP_RMDIR
%token CAP_SEEK
%token CAP_SEM_GETVALUE
%token CAP_SEM_POST
%token CAP_SEM_WAIT
%token CAP_SETSOCKOPT
%token CAP_SHUTDOWN
%token CAP_TTYHOOK
%token CAP_WRITE
%token EOF

%%

/* policy: a policy file. */
policy: var_expr_term EOF { $1 }

/* var_expr_term: an expression with variables. */
var_expr_term: var_expr_core { $1 }
var_expr_core:
pure_term { Pure_var($1) }
  | VAR { Var($1) }
  | LET VAR EQ var_expr_term IN var_expr_term { Let($2, $4, $6) }
  | LPAREN var_expr_term RPAREN { $2 }

/* pure_term: a non-variable construction. */
pure_term:
regex_term { Regex($1) }
  | pol_act { Pol_action($1) }
  | pol_acts { Pol_actions($1) }
  | set { Set($1) }
  | cap_vecs { Vecs_expr($1) }
  | cap_vec { Vec_expr($1) }
  | amb_flag { Amb_expr($1) }
  | desc { Desc_expr($1) }
  | prog_act { Prog_action($1) }
  | prog_acts { Prog_actions($1) }
  | right { Right_expr($1) }
  | rights { Rights_expr($1) }
  | INT { Int_const($1) }
  ;

/* comment_seq: a sequence of comments. */
comment_seq: { }
    | comment comment_seq { }
;
comment: OPEN_COMMENT comment_body CLOSE_COMMENT { }
;
comment_body: { }
    | comment_atom comment_body { }
;
comment_atom:
  word { }
    | comment { }
;
word: 
LPAREN { }
  | RPAREN { }
  | LSQUIG { }
  | RSQUIG { }
  | LSQUARE { }
  | RSQUARE { }
  | COMMA { }
  | COLON { }
  | LET { }
  | VAR { }
  | EQ { }
  | IN { }
  | ADD { }
  | COMPL { }
  | DIFF { }
  | INTER { }
  | UNION { }
  | NULL_CONS { }
  | EPS_CONS { }
  | CONCAT { }
  | ALT { }
  | KLEENE { }
  | WITH { }
  | WITHIN { }
  | ALL_PROG_ACTS { }
  | AT_LEAST { }
  | AT_MOST { }
  | ALL_VECS { }
  | AMB_VEC { }
  | JOIN { }
  | STDIN { }
  | STDOUT { }
  | STDERR { }
  | LLVM_ACT { }
  | LLVM_DESC { }
  | LLVM_DESC_ALLOC { }
;

/* regex_term: a regular expression. */
regex_term:
  LSQUARE var_expr_term RSQUARE { Action($2) }
    | NULL_CONS { Null }
    | EPS_CONS { Eps }
    | var_expr_term CONCAT var_expr_term { Concat($1, $3) }
    | var_expr_term ALT var_expr_term { Alt($1, $3) }
    | var_expr_term KLEENE { Kleene($1) }
;

/* pol_act: a policy action. */
pol_act: var_expr_term WITH var_expr_term { ($1, $3) }
;

/* pol_acts: a set of policy actions. */
pol_acts: 
ALL_POL_ACTS { All_pol_acts }
    | var_expr_term WITHIN var_expr_term { Prod($1, $3) }
;

/* prog_acts: grammar of program actions. */
prog_acts:
ALL_PROG_ACTS { All_prog_acts }

prog_act:
  LLVM_ACT var_expr_term { Llvm_act($2) }
    | LLVM_DESC_ALLOC var_expr_term { Llvm_desc_alloc($2) }
;

/* set: a set-algebra expression. */
set:
  LSQUIG expr_seq RSQUIG { $2 }
    | var_expr_term DIFF var_expr_term { Diff($1, $3) }
    | var_expr_term INTER var_expr_term { Intersect($1, $3) }
    | var_expr_term UNION var_expr_term { Union($1, $3) }
    | var_expr_term ADD var_expr_term { Union(Pure_var(Set(Single($1))), $3) } 
;
expr_seq:
  { Empty } 
    | ne_seq { $1 }
;
ne_seq:
  var_expr_term { Single($1) }
    | var_expr_term COMMA ne_seq
        { Union(Pure_var(Set(Single($1))), Pure_var(Set($3))) }

/* cap_vecs: a vector of capabilities. */
cap_vecs:
ALL_VECS { All_vecs }
    | AT_LEAST var_expr_term { Lower_bound($2) }
    | AT_MOST var_expr_term { Upper_bound($2) }
;

/* cap_vec: a capability vector. */
cap_vec: 
  AMB_VEC var_expr_term { Amb_vec($2) }
    | var_expr_term COLON var_expr_term { Desc_rights_vec($1, $3) }
    | var_expr_term JOIN var_expr_term { Join($1, $3) }
;

/* amb_flag: a ambience flag. */
amb_flag: 
  AMB { Amb }
    | COMPL var_expr_term { Neg($2) }
;

/* desc: a descriptor. */
desc:
  STDIN { Stdin }
    | STDOUT { Stdout }
    | STDERR { Stderr }
    | LLVM_DESC var_expr_term { Llvm_desc($2) }
;

/* rights: a set of Capsicum rights. */
rights:
ALL_RIGHTS { All_rights }

/* right: a Capsicum access right. */
right:
CAP_ACCEPT { Accept }
    | CAP_ACL_CHECK { Acl_check }
    | CAP_ACL_DELETE { Acl_delete }
    | CAP_ACL_GET { Acl_get }
    | CAP_ACL_SET { Acl_set }
    | CAP_BIND { Bind }
    | CAP_CONNECT { Connect }
    | CAP_CREATE { Create }
    | CAP_DELETE { Delete }
    | CAP_FEXECVE { Fexecve }
    | CAP_EXTATTR_DELETE { Extattr_delete }
    | CAP_EXTATTR_GET { Extattr_get }
    | CAP_EXTATTR_LIST { Extattr_list }
    | CAP_EXTATTR_SET { Extattr_set }
    | CAP_FCHDIR { Fchdir }
    | CAP_FCHFLAGS { Fchflags }
    | CAP_FCHMOD { Fchmod }
    | CAP_FCHOWN { Fchown }
    | CAP_FCNTL { Fcntl }
    | CAP_FLOCK { Flock }
    | CAP_FPATHCONF { Fpathconf }
    | CAP_FSCK { Fsck }
    | CAP_FSTAT { Fstat }
    | CAP_FSTATFS { Fstatfs }
    | CAP_FSYNC { Fsync }
    | CAP_FTRUNCATE { Ftruncate }
    | CAP_FUTIMES { Futimes }
    | CAP_GETPEERNAME { Getpeername }
    | CAP_GETSOCKNAME { Getsockname }
    | CAP_GETSOCKOPT { Getsockopt }
    | CAP_IOCTL { Ioctl }
    | CAP_LISTEN { Listen }
    | CAP_LOOKUP { Lookup }
    | CAP_MAC_GET { Mac_get }
    | CAP_MAC_SET { Mac_set }
    | CAP_MAPEXEC { Mapexec }
    | CAP_MKDIR { Mkdir }
    | CAP_MKFIFO { Mkfifo }
    | CAP_MMAP { Mmap }
    | CAP_PDGETPID { Pdgetpid }
    | CAP_PDKILL { Pdkill }
    | CAP_PDWAIT { Pdwait } 
    | CAP_PEELOFF { Peeloff }
    | CAP_POLL_EVENT { Poll_event }
    | CAP_POST_EVENT { Post_event }
    | CAP_READ { Read }
    | CAP_RMDIR { Rmdir }
    | CAP_SEEK { Seek }
    | CAP_SEM_GETVALUE { Sem_getvalue }
    | CAP_SEM_POST { Sem_post }
    | CAP_SEM_WAIT { Sem_wait }
    | CAP_SETSOCKOPT { Setsockopt }
    | CAP_SHUTDOWN { Shutdown }
    | CAP_TTYHOOK { Ttyhook }
    | CAP_WRITE { Write }
;

%%
