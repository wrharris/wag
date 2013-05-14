(* Cappol_regex_types: types for Capsicum policy regular
 * expressions. *)
open Vpa

(* Introduce the type constructors. *)
(* set_alg: a set algebra. *)
type ('e, 's) set_alg =
    Empty
  | Intersect of 's * 's
  | Diff of 's * 's
  | Single of 'e 
  | Union of 's * 's

(* set_to_string: construct the string representation of a set. *)
let set_to_string elt_to_string sub_to_string s =
  (match s with
      Empty -> "{ }"
    | Intersect(lhs, rhs) -> (sub_to_string lhs) ^ " && " ^ (sub_to_string rhs)
    | Diff(lhs, rhs) -> (sub_to_string lhs) ^ " - " ^ (sub_to_string rhs)
    | Single(elt) -> "{ " ^ (elt_to_string elt) ^ "}"
    | Union(lhs, rhs) -> (sub_to_string lhs) ^ " || " ^ (sub_to_string rhs)
  )

(* prog_act_cons: a constructor of a program action. *)
type 'i prog_act_cons =
    Llvm_act of 'i
  | Llvm_desc_alloc of 'i

let prog_act_cons_to_string index_to_string prog =
  (match prog with
      Llvm_act(index) -> "cw_act " ^ (index_to_string index)
    | Llvm_desc_alloc(index) -> "cw_desc_act " ^ (index_to_string index)
  )

(* prog_acts_cons: a contructor of a set of program actions. *)
type prog_acts_cons = All_prog_acts

let prog_acts_cons_to_string _ = "all prog acts"

(* amb_cons: constructor of an ambience expression. *)
type 'a amb_cons =
    Amb
  | Neg of 'a

(* amb_cons_to_string: construct string representation of an ambient
 * flag expression. *)
let amb_cons_to_string inner_cons amb =
  (match amb with
      Amb -> "AMB"
    | Neg(inner) -> "not " ^ (inner_cons inner)
  )

(* desc: a descriptor. Can be one of the standard UNIX file
 * descriptors, or an allocated file descriptor. *)
type 'c desc_cons =
    Stdin
  | Stdout
  | Stderr
  | Llvm_desc of 'c

let desc_cons_compare llvm_cmp desc_0 desc_1 =
  (match desc_0, desc_1 with
      Llvm_desc(instr_0), Llvm_desc(instr_1) -> llvm_cmp instr_0 instr_1
    | _ -> compare desc_0 desc_1
  )

(* desc_cons_to_string: cons string rep of descriptor. *)
let desc_cons_to_string index_to_string desc =
  (match desc with
      Stdin -> "STDIN"
    | Stdout -> "STDOUT"
    | Stderr -> "STDERR"
    | Llvm_desc(index) -> "llvm_desc " ^ (index_to_string index)
  )

(* right: a Capsicum access right. *)
type right =
    Accept
  | Acl_check
  | Acl_delete
  | Acl_get
  | Acl_set
  | Bind
  | Connect
  | Create
  | Delete
  | Fexecve
  | Extattr_delete
  | Extattr_get
  | Extattr_list
  | Extattr_set
  | Fchdir
  | Fchflags
  | Fchmod
  | Fchown
  | Fcntl
  | Flock
  | Fpathconf
  | Fsck
  | Fstat
  | Fstatfs
  | Fsync
  | Ftruncate
  | Futimes
  | Getpeername
  | Getsockname
  | Getsockopt
  | Ioctl
  | Listen
  | Lookup
  | Mac_get
  | Mac_set
  | Mapexec
  | Mkdir
  | Mkfifo
  | Mmap
  | Pdgetpid
  | Pdkill
  | Pdwait
  | Peeloff
  | Poll_event
  | Post_event
  | Read
  | Rmdir
  | Seek
  | Sem_getvalue
  | Sem_post
  | Sem_wait
  | Setsockopt
  | Shutdown
  | Ttyhook
  | Write

(* right_to_string: construct the string representation of a right. *)
let right_to_string right =
  (match right with
      Accept -> "ACCEPT"
    | Acl_check -> "ACL_CHECK"
    | Acl_delete -> "ACL_DELETE"
    | Acl_get -> "ACL_GET"
    | Acl_set -> "ACL_SET"
    | Bind -> "BIND"
    | Connect -> "CONNECT"
    | Create -> "CREATE"
    | Delete -> "DELETE"
    | Fexecve -> "FEXECVE"
    | Extattr_delete -> "EXTATTR_DELETE"
    | Extattr_get -> "EXTATTR_GET"
    | Extattr_list -> "EXTATTR_LIST"
    | Extattr_set -> "EXTATTR_SET"
    | Fchdir -> "FCHDIR"
    | Fchflags -> "FCHFLAGS"
    | Fchmod -> "FCHMOD"
    | Fchown -> "FCHOWN"
    | Fcntl -> "FCNTL"
    | Flock -> "FLOCK"
    | Fpathconf -> "FPATHCONF"
    | Fsck -> "FSCK"
    | Fstat -> "FSTAT"
    | Fstatfs -> "FSTATFS"
    | Fsync -> "FSYNC"
    | Ftruncate -> "FTRUNCATE"
    | Futimes -> "FUTIMES"
    | Getpeername -> "GETPEERNAME"
    | Getsockname -> "GETSOCKNAME"
    | Getsockopt -> "GETSOCKOPT"
    | Ioctl -> "IOCTL"
    | Listen -> "LISTEN"
    | Lookup -> "LOOKUP"
    | Mac_get -> "MAC_GET"
    | Mac_set -> "MAC_SET"
    | Mapexec -> "MAPEXEC"
    | Mkdir -> "MKDIR"
    | Mkfifo -> "MKFIFO"
    | Mmap -> "MMAP"
    | Pdgetpid -> "PDGETPID"
    | Pdkill -> "PDKILL"
    | Pdwait -> "PDWAIT"
    | Peeloff -> "PEELOFF"
    | Poll_event -> "POLL_EVENT"
    | Post_event -> "POST_EVENT"
    | Read -> "READ"
    | Rmdir -> "RMDIR"
    | Seek -> "SEEK"
    | Sem_getvalue -> "SEM_GETVALUE"
    | Sem_post -> "SEM_POST"
    | Sem_wait -> "SEM_WAIT"
    | Setsockopt -> "SETSOCKOPT"
    | Shutdown -> "SHUTDOWN"
    | Ttyhook -> "TTYHOOK"
    | Write -> "WRITE"
  )

(* right_cons: construct a Capsicum right. *)
type right_cons = right

let right_cons_to_string = right_to_string

type rights_cons = All_rights

(* rights_cons_to_string: construct the string representation of a
 * constructor of a set of rights. *)
let rights_cons_to_string _ = "all rights"

(* cap_vec: a vector of capabilities. *)
type ('amb, 'd, 'rs, 'cv) cap_vec_cons =
    Amb_vec of 'amb
  | Desc_rights_vec of 'd * 'rs
  | Join of 'cv * 'cv

(* cap_vec_cons_to_string: construct the string representation of a
 * constructor of a set of capability vectors. *)
let cap_vec_cons_to_string
    amb_to_string desc_to_string rights_to_string vec_to_string vec =
  (match vec with
      Amb_vec(amb) -> "amb_vec " ^ (amb_to_string amb)
    | Desc_rights_vec(desc, rights) -> 
      (desc_to_string desc) ^ ": " ^ (rights_to_string rights) 
    | Join(lhs, rhs) -> (vec_to_string lhs) ^ "><" ^ (vec_to_string rhs)
  )

(* cap_vecs: a set of capability vectors. *)
type 'v cap_vecs_cons =
    All_vecs 
  | Lower_bound of 'v
  | Upper_bound of 'v

(* cap_vecs_cons_to_string: construct the string representation of a
 * set of capability vectors. *)
let cap_vecs_cons_to_string vec_to_string vecs =
  (match vecs with
      All_vecs -> "all cap vecs"
    | Lower_bound(v) -> "at least" ^ (vec_to_string v)
    | Upper_bound(v) -> "at most" ^ (vec_to_string v)
  )

(* pol_act_cons: construct a policy action. *)
type ('prog, 'vec) pol_act_cons = 'prog * 'vec

let pol_act_to_string prog_to_string vec_to_string (prog, vec) = 
  (prog_to_string prog) ^ " with " ^ (vec_to_string vec)

(* pol_acts_cons: construct a set of policy actions. *)
type ('prog, 'vecs) pol_acts_cons = 
    All_pol_acts
  | Prod of 'prog * 'vecs

(* pol_acts_to_string: construct string rep of a set of policy
 * actions. *)
let pol_acts_to_string progs_to_string vecs_to_string pol_acts =
  (match pol_acts with
      All_pol_acts -> "all prog acts"
    | Prod(prog_acts, vecs) -> 
      (progs_to_string prog_acts) ^ " within " ^ (vecs_to_string vecs)
  )

(* pure_cons: constructor of a pure (no variables) policy
 * expression. *)
type 'e pure_cons =
    Amb_expr of 'e amb_cons
  | Desc_expr of 'e desc_cons
  | Int_const of int
  | Prog_actions of prog_acts_cons
  | Prog_action of 'e prog_act_cons
  | Right_expr of right_cons
  | Rights_expr of rights_cons
  | Vec_expr of ('e, 'e, 'e, 'e) cap_vec_cons
  | Vecs_expr of 'e cap_vecs_cons
  | Pol_action of ('e, 'e) pol_act_cons
  | Pol_actions of ('e, 'e) pol_acts_cons
  | Regex of ('e, 'e) regex_cons 
  | Set of ('e, 'e) set_alg

(* pure_to_string: construct string rep of a pure expression. *)
let pure_to_string expr_to_string expr =
  (match expr with
      Amb_expr(amb_expr) -> amb_cons_to_string expr_to_string amb_expr
    | Desc_expr(desc_expr) -> desc_cons_to_string expr_to_string desc_expr
    | Int_const(i) -> string_of_int i
    | Prog_actions(prog_acts) -> prog_acts_cons_to_string prog_acts
    | Prog_action(prog_act) -> prog_act_cons_to_string expr_to_string prog_act
    | Right_expr(right) -> right_to_string right
    | Rights_expr(rights) -> rights_cons_to_string rights
    | Vec_expr(vec) -> 
      cap_vec_cons_to_string
        expr_to_string expr_to_string expr_to_string expr_to_string vec 
    | Vecs_expr(vecs) -> cap_vecs_cons_to_string expr_to_string vecs
    | Pol_action(pol_act) -> 
      pol_act_to_string expr_to_string expr_to_string pol_act
    | Pol_actions(pol_acts) -> 
      pol_acts_to_string expr_to_string expr_to_string pol_acts
    | Regex(regex) -> regex_cons_to_string expr_to_string expr_to_string regex
    | Set(set) -> set_to_string expr_to_string expr_to_string set
  )

(* var_expr: an expression with variables. *)
type var_expr =
    Pure_var of var_expr pure_cons
  | Var of string
  | Let of string * var_expr * var_expr

let rec var_expr_to_string expr =
  (match expr with
      Pure_var(pure_expr) -> pure_to_string var_expr_to_string pure_expr 
    | Var(nm) -> nm
    | Let(var_nm, rhs, body) -> 
      "let " ^ (var_nm) ^ " = " ^ (var_expr_to_string rhs) ^ "\nin\n" 
      ^ (var_expr_to_string body)
  )
