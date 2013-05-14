(* file: Cappol_regex.mll: lexer for the Capsicum policy language. *)
{
  open Regex_parse
}

let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
rule token = parse
  | [' ' '\t' '\n'] { token lexbuf }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '[' { LSQUARE }
  | ']' { RSQUARE }
  | '{' { LSQUIG }
  | '}' { RSQUIG }
  | ',' { COMMA }
  | ':' { COLON }
  | "let" { LET }
  | "=" { EQ }
  | "in" { IN }
  | "all_cap_vecs" { ALL_VECS }
  | "all_cap_acts" { ALL_POL_ACTS }
  | "all_prog_acts" { ALL_PROG_ACTS }
  | "all_rights" { ALL_RIGHTS }
  | "not" { COMPL }
  | '-' { DIFF }
  | "&&" { INTER }
  | "||" { UNION }
  | "null" { NULL_CONS }
  | "eps" { EPS_CONS }
  | '.' { CONCAT }
  | '|' { ALT }
  | '*' { KLEENE }
  | "with" { WITH }
  | "within" { WITHIN }
  | "at_least" { AT_LEAST }
  | "at_most" { AT_MOST }
  | "AMB" { AMB }
  | "amb_vec" { AMB_VEC }
  | "<>" { JOIN }
  | "STDIN" { STDIN }
  | "STDOUT" { STDOUT }
  | "STDERR" { STDERR }
  | "cw_act" { LLVM_ACT }
  | "cw_desc" { LLVM_DESC }
  | "cw_desc_open" { LLVM_DESC_ALLOC } 
  | "(*" ( [ ^ '*' ] | '*' [ ^ ')' ] ) *  "*)" { token lexbuf }
  | "CAP_ACCEPT" { CAP_ACCEPT  }
  | "CAP_ACL_CHECK" { CAP_ACL_CHECK  }
  | "CAP_ACL_DELETE" { CAP_ACL_DELETE  }
  | "CAP_ACL_GET" { CAP_ACL_GET  }
  | "CAP_ACL_SET" { CAP_ACL_SET  }
  | "CAP_BIND" { CAP_BIND  }
  | "CAP_CONNECT" { CAP_CONNECT  }
  | "CAP_CREATE" { CAP_CREATE  }
  | "CAP_DELETE" { CAP_DELETE  }
  | "CAP_FEXECVE" { CAP_FEXECVE  }
  | "CAP_EXTATTR_DELETE" { CAP_EXTATTR_DELETE  }
  | "CAP_EXTATTR_GET" { CAP_EXTATTR_GET  }
  | "CAP_EXTATTR_LIST" { CAP_EXTATTR_LIST  }
  | "CAP_EXTATTR_SET" { CAP_EXTATTR_SET  }
  | "CAP_FCHDIR" { CAP_FCHDIR  }
  | "CAP_FCHFLAGS" { CAP_FCHFLAGS  }
  | "CAP_FCHMOD" { CAP_FCHMOD  }
  | "CAP_FCHOWN" { CAP_FCHOWN  }
  | "CAP_FCNTL" { CAP_FCNTL  }
  | "CAP_FLOCK" { CAP_FLOCK  }
  | "CAP_FPATHCONF" { CAP_FPATHCONF  }
  | "CAP_FSCK" { CAP_FSCK  }
  | "CAP_FSTAT" { CAP_FSTAT  }
  | "CAP_FSTATFS" { CAP_FSTATFS  }
  | "CAP_FSYNC" { CAP_FSYNC  }
  | "CAP_FTRUNCATE" { CAP_FTRUNCATE  }
  | "CAP_FUTIMES" { CAP_FUTIMES  }
  | "CAP_GETPEERNAME" { CAP_GETPEERNAME  }
  | "CAP_GETSOCKNAME" { CAP_GETSOCKNAME  }
  | "CAP_GETSOCKOPT" { CAP_GETSOCKOPT  }
  | "CAP_IOCTL" { CAP_IOCTL  }
  | "CAP_LISTEN" { CAP_LISTEN  }
  | "CAP_LOOKUP" { CAP_LOOKUP  }
  | "CAP_MAC_GET" { CAP_MAC_GET  }
  | "CAP_MAC_SET" { CAP_MAC_SET  }
  | "CAP_MAPEXEC" { CAP_MAPEXEC  }
  | "CAP_MKDIR" { CAP_MKDIR  }
  | "CAP_MKFIFO" { CAP_MKFIFO  }
  | "CAP_MMAP" { CAP_MMAP  }
  | "CAP_PDGETPID" { CAP_PDGETPID  }
  | "CAP_PDKILL" { CAP_PDKILL  }
  | "CAP_PDWAIT  " { CAP_PDWAIT   }
  | "CAP_PEELOFF" { CAP_PEELOFF  }
  | "CAP_POLL_EVENT" { CAP_POLL_EVENT  }
  | "CAP_POST_EVENT" { CAP_POST_EVENT  }
  | "CAP_READ" { CAP_READ  }
  | "CAP_RMDIR" { CAP_RMDIR  }
  | "CAP_SEEK" { CAP_SEEK  }
  | "CAP_SEM_GETVALUE" { CAP_SEM_GETVALUE  }
  | "CAP_SEM_POST" { CAP_SEM_POST  }
  | "CAP_SEM_WAIT" { CAP_SEM_WAIT  }
  | "CAP_SETSOCKOPT" { CAP_SETSOCKOPT  }
  | "CAP_SHUTDOWN" { CAP_SHUTDOWN  }
  | "CAP_TTYHOOK" { CAP_TTYHOOK  }
  | "CAP_WRITE" { CAP_WRITE  }
  | digit+ as num { INT(int_of_string num) }
  | (alpha | digit | '_')+ as var_nm { VAR(var_nm) }
  | eof { EOF }
