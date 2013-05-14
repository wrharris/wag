open Cappol_regex_types

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

val policy :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> var_expr
