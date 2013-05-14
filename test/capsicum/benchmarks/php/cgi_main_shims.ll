; ModuleID = 'cgi_main_shims.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-freebsd9.0"

%struct._php_core_globals = type { i8, i8, i8, i8, i8, i8, i64, i8*, i8, i8, i8, i8*, i8*, i64, i8*, i64, i64, i8, i8, i8, i8, i64, i8, i8, i8, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i64, i8*, i8*, i8*, i8*, %struct._arg_separators, i8*, %struct._hashtable, i16, i16, i8, %struct._zend_llist, [6 x %struct._zval_struct*], i8, i8, i8, i8, i8, i8, i8*, i8*, i8, i8, i64, [8 x i8], i8, i8, i8, i8, i8, i8, i32, i8*, i8*, i32, i8*, i8*, i8, i8, i64, i8, i8*, i64, i8*, i8, i8*, i8 }
%struct._arg_separators = type { i8*, i8* }
%struct._hashtable = type { i32, i32, i32, i64, %struct.bucket*, %struct.bucket*, %struct.bucket*, %struct.bucket**, void (i8*)*, i8, i8, i8 }
%struct.bucket = type { i64, i32, i8*, i8*, %struct.bucket*, %struct.bucket*, %struct.bucket*, %struct.bucket*, [1 x i8] }
%struct._zend_llist = type { %struct._zend_llist_element*, %struct._zend_llist_element*, i64, i64, void (i8*)*, i8, %struct._zend_llist_element* }
%struct._zend_llist_element = type { %struct._zend_llist_element*, %struct._zend_llist_element*, [1 x i8] }
%struct._zval_struct = type { %union._zvalue_value, i32, i8, i8 }
%union._zvalue_value = type { %struct.anon }
%struct.anon = type { i8*, i32 }
%struct._sapi_globals_struct = type { i8*, %struct.sapi_request_info, %struct.sapi_headers_struct, i32, i8, [3 x i8], %struct.stat, i8*, i8*, %struct._hashtable*, i64, i32, i8, i64, %struct._hashtable }
%struct.sapi_request_info = type { i8*, i8*, i8*, i8*, i8*, i64, i32, i32, i8*, i8*, i8*, i8, i8, i8, %struct._sapi_post_entry*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i8**, i32 }
%struct._sapi_post_entry = type { i8*, i32, void ()*, void (i8*, i8*)* }
%struct.sapi_headers_struct = type { %struct._zend_llist, i32, i8, i8*, i8* }
%struct.stat = type <{ i32, i32, i16, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i64, i64, i32, i32, i32, i32, %struct.timespec }>
%struct.timespec = type { i64, i64 }
%struct._sapi_module_struct = type { i8*, i8*, i32 (%struct._sapi_module_struct*)*, i32 (%struct._sapi_module_struct*)*, i32 ()*, i32 ()*, i32 (i8*, i32)*, void (i8*)*, %struct.stat* ()*, i8* (i8*, i64)*, void (i32, i8*, ...)*, i32 (%struct.sapi_header_struct*, i32, %struct.sapi_headers_struct*)*, i32 (%struct.sapi_headers_struct*)*, void (%struct.sapi_header_struct*, i8*)*, i32 (i8*, i32)*, i8* ()*, void (%struct._zval_struct*)*, void (i8*)*, i64 ()*, void ()*, i8*, void ()*, void ()*, void ()*, void (i32, i8*, %struct._zval_struct*)*, i8*, i32, i32 (i32*)*, i32 ()*, i32 (i32*)*, i32 (i32*)*, i32 (i32, i8*, i8**, i32, i32*)*, void (%struct._hashtable*)*, i32, i8*, %struct._zend_function_entry*, i32 ()* }
%struct.sapi_header_struct = type { i8*, i32 }
%struct._zend_function_entry = type { i8*, void (i32, %struct._zval_struct*, %struct._zval_struct**, %struct._zval_struct*, i32)*, %struct._zend_arg_info*, i32, i32 }
%struct._zend_arg_info = type { i8*, i32, i8*, i32, i8, i8, i8, i8, i32 }
%struct.sigaction = type { %union.anon.5, i32, %struct.__sigset }
%union.anon.5 = type { void (i32)* }
%struct.__sigset = type { [4 x i32] }
%struct._opt_struct = type { i8, i32, i8* }
%struct._php_cgi_globals_struct = type { i8, i8, i8, i8, i8, i8, i8, i8*, %struct._hashtable }
%struct._zend_executor_globals = type { %struct._zval_struct**, %struct._zval_struct, %struct._zval_struct*, %struct._zval_struct, %struct._zval_struct*, %struct._zend_ptr_stack, [32 x %struct._hashtable*], %struct._hashtable**, %struct._hashtable**, %struct._zend_op**, %struct._hashtable*, %struct._hashtable, %struct._hashtable, [1 x %struct._sigjmp_buf]*, i32, i32, i32, %struct._zend_op_array*, %struct._hashtable*, %struct._hashtable*, %struct._hashtable*, %struct._zend_class_entry*, %struct._zend_class_entry*, %struct._zval_struct*, i64, i32, i8, %struct._hashtable*, %union._zend_function*, i8, i8, %struct._hashtable, %struct._hashtable, %struct._zend_vm_stack*, i32, %struct._zval_struct*, %struct._zval_struct*, %struct._zend_stack, %struct._zend_ptr_stack, %struct._zend_ptr_stack, i32, %struct._zend_class_entry*, i32, i32, %struct._hashtable*, %struct._hashtable*, %struct._zend_objects_store, %struct._zval_struct*, %struct._zval_struct*, %struct._zend_op*, [3 x %struct._zend_op], %struct._zend_execute_data*, %struct._zend_module_entry*, %struct._zend_property_info, i8, i8*, [4 x i8*] }
%struct._zend_ptr_stack = type { i32, i32, i8**, i8**, i8 }
%struct._zend_op = type { i32 (%struct._zend_execute_data*)*, %struct._znode, %struct._znode, %struct._znode, i64, i32, i8 }
%struct._zend_execute_data = type { %struct._zend_op*, %struct._zend_function_state, %union._zend_function*, %struct._zend_class_entry*, %struct._zend_op_array*, %struct._zval_struct*, %union._temp_variable*, %struct._zval_struct***, %struct._hashtable*, %struct._zend_execute_data*, %struct._zval_struct*, i8, %struct._zval_struct**, %struct._zend_class_entry*, %struct._zend_class_entry*, %struct._zval_struct*, %struct._zval_struct*, %struct._zend_op* }
%struct._zend_function_state = type { %union._zend_function*, i8** }
%union._zend_function = type { %struct._zend_op_array }
%struct._zend_op_array = type { i8, i8*, %struct._zend_class_entry*, i32, %union._zend_function*, i32, i32, %struct._zend_arg_info*, i8, i8, i8, i32*, %struct._zend_op*, i32, i32, %struct._zend_compiled_variable*, i32, i32, i32, %struct._zend_brk_cont_element*, i32, i32, %struct._zend_try_catch_element*, i32, %struct._hashtable*, %struct._zend_op*, i32, i32, i8*, i32, i32, i8*, i32, i32, [4 x i8*] }
%struct._zend_class_entry = type { i8, i8*, i32, %struct._zend_class_entry*, i32, i8, i32, %struct._hashtable, %struct._hashtable, %struct._hashtable, %struct._hashtable, %struct._hashtable*, %struct._hashtable, %struct._zend_function_entry*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %struct._zend_class_iterator_funcs, {}*, %struct._zend_object_iterator* (%struct._zend_class_entry*, %struct._zval_struct*, i32)*, i32 (%struct._zend_class_entry*, %struct._zend_class_entry*)*, %union._zend_function* (%struct._zend_class_entry*, i8*, i32)*, i32 (%struct._zval_struct*, i8**, i32*, %struct._zend_serialize_data*)*, i32 (%struct._zval_struct**, %struct._zend_class_entry*, i8*, i32, %struct._zend_unserialize_data*)*, %struct._zend_class_entry**, i32, i8*, i32, i32, i8*, i32, %struct._zend_module_entry* }
%struct._zend_class_iterator_funcs = type { %struct._zend_object_iterator_funcs*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function*, %union._zend_function* }
%struct._zend_object_iterator_funcs = type { void (%struct._zend_object_iterator*)*, i32 (%struct._zend_object_iterator*)*, void (%struct._zend_object_iterator*, %struct._zval_struct***)*, i32 (%struct._zend_object_iterator*, i8**, i32*, i64*)*, void (%struct._zend_object_iterator*)*, void (%struct._zend_object_iterator*)*, void (%struct._zend_object_iterator*)* }
%struct._zend_object_iterator = type { i8*, %struct._zend_object_iterator_funcs*, i64 }
%struct._zend_serialize_data = type opaque
%struct._zend_unserialize_data = type opaque
%struct._zend_module_entry = type { i16, i32, i8, i8, %struct._zend_ini_entry*, %struct._zend_module_dep*, i8*, %struct._zend_function_entry*, i32 (i32, i32)*, i32 (i32, i32)*, i32 (i32, i32)*, i32 (i32, i32)*, void (%struct._zend_module_entry*)*, i8*, i64, i8*, void (i8*)*, void (i8*)*, i32 ()*, i32, i8, i8*, i32, i8* }
%struct._zend_ini_entry = type { i32, i32, i8*, i32, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)*, i8*, i8*, i8*, i8*, i32, i8*, i32, i32, i32, void (%struct._zend_ini_entry*, i32)* }
%struct._zend_module_dep = type { i8*, i8*, i8*, i8 }
%struct._zend_compiled_variable = type { i8*, i32, i64 }
%struct._zend_brk_cont_element = type { i32, i32, i32, i32 }
%struct._zend_try_catch_element = type { i32, i32 }
%union._temp_variable = type { %struct.anon.2 }
%struct.anon.2 = type { %struct._zval_struct**, %struct._zval_struct*, i8, %struct._zval_struct*, i32 }
%struct._znode = type { i32, %union.anon }
%union.anon = type { %struct._zval_struct }
%struct._sigjmp_buf = type { [12 x i64] }
%struct._zend_vm_stack = type { i8**, i8**, %struct._zend_vm_stack* }
%struct._zend_stack = type { i32, i32, i8** }
%struct._zend_objects_store = type { %struct._zend_object_store_bucket*, i32, i32, i32 }
%struct._zend_object_store_bucket = type { i8, i8, %union._store_bucket }
%union._store_bucket = type { %struct._store_object }
%struct._store_object = type { i8*, void (i8*, i32)*, void (i8*)*, void (i8*, i8**)*, %struct._zend_object_handlers*, i32, %struct._gc_root_buffer* }
%struct._zend_object_handlers = type { {}*, {}*, {}*, %struct._zval_struct* (%struct._zval_struct*, %struct._zval_struct*, i32)*, void (%struct._zval_struct*, %struct._zval_struct*, %struct._zval_struct*)*, %struct._zval_struct* (%struct._zval_struct*, %struct._zval_struct*, i32)*, void (%struct._zval_struct*, %struct._zval_struct*, %struct._zval_struct*)*, %struct._zval_struct** (%struct._zval_struct*, %struct._zval_struct*)*, %struct._zval_struct* (%struct._zval_struct*)*, void (%struct._zval_struct**, %struct._zval_struct*)*, i32 (%struct._zval_struct*, %struct._zval_struct*, i32)*, void (%struct._zval_struct*, %struct._zval_struct*)*, i32 (%struct._zval_struct*, %struct._zval_struct*, i32)*, void (%struct._zval_struct*, %struct._zval_struct*)*, %struct._hashtable* (%struct._zval_struct*)*, %union._zend_function* (%struct._zval_struct**, i8*, i32)*, i32 (i8*, i32, %struct._zval_struct*, %struct._zval_struct**, %struct._zval_struct*, i32)*, %union._zend_function* (%struct._zval_struct*)*, %struct._zend_class_entry* (%struct._zval_struct*)*, i32 (%struct._zval_struct*, i8**, i32*, i32)*, i32 (%struct._zval_struct*, %struct._zval_struct*)*, i32 (%struct._zval_struct*, %struct._zval_struct*, i32)*, i32 (%struct._zval_struct*, i64*)*, %struct._hashtable* (%struct._zval_struct*, i32*)*, i32 (%struct._zval_struct*, %struct._zend_class_entry**, %union._zend_function**, %struct._zval_struct**)* }
%struct._gc_root_buffer = type { %struct._gc_root_buffer*, %struct._gc_root_buffer*, i32, %union.anon.13 }
%union.anon.13 = type { %struct._zval_struct* }
%struct._zend_property_info = type { i32, i8*, i32, i64, i8*, i32, %struct._zend_class_entry* }
%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, i8*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64, %struct.pthread_mutex*, %struct.pthread*, i32, i32, %union.__mbstate_t }
%struct.__sbuf = type { i8*, i32 }
%struct.pthread_mutex = type opaque
%struct.pthread = type opaque
%union.__mbstate_t = type { i64, [120 x i8] }
%struct._zend_compiler_globals = type { %struct._zend_stack, %struct._zend_stack, %struct._zend_stack, %struct._zend_stack, %struct._zend_stack, %struct._zend_class_entry*, %struct._zend_llist, %struct._zend_llist, %struct._zend_stack, %struct._zend_stack, i8*, i32, i8*, i32, %struct._zend_op_array*, %struct._hashtable*, %struct._hashtable*, %struct._hashtable, %struct._hashtable*, i8, i8, i8, i8, %struct._zend_declarables, i8, i8, %struct._zend_llist, i64, %struct._zend_ini_parser_param*, i32, i32, i8, %struct._znode, i32, i8*, i32, i32, %struct._zval_struct*, %struct._hashtable*, i8, i8, %struct._hashtable*, %struct._zend_stack }
%struct._zend_declarables = type { %struct._zval_struct }
%struct._zend_ini_parser_param = type { void (%struct._zval_struct*, %struct._zval_struct*, %struct._zval_struct*, i32, i8*)*, i8* }
%struct._RuneLocale = type { [8 x i8], [32 x i8], i32 (i8*, i64, i8**)*, i32 (i32, i8*, i64, i8**)*, i32, [256 x i64], [256 x i32], [256 x i32], %struct._RuneRange, %struct._RuneRange, %struct._RuneRange, i8*, i32 }
%struct._RuneRange = type { i32, %struct._RuneEntry* }
%struct._RuneEntry = type { i32, i32, i32, i64* }
%struct._http_error = type { i32, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.sockaddr = type { i8, i8, [14 x i8] }
%struct.iovec = type { i8*, i64 }
%struct.fstat_rv = type { %struct.stat, i32, [4 x i8] }
%struct._zend_file_handle = type { i32, i8*, i8*, %union.anon.12, i8 }
%union.anon.12 = type { %struct._zend_stream }
%struct._zend_stream = type { i8*, i32, %struct._zend_mmap, i64 (i8*, i8*, i64)*, i64 (i8*)*, void (i8*)* }
%struct._zend_mmap = type { i64, i64, i8*, i8*, i8*, void (i8*)* }
%struct._fcgi_request = type { i32, i32, i32, i32, i32, i32, i32, %struct._fcgi_header*, i8*, [8192 x i8], [16 x i8], %struct._hashtable* }
%struct._fcgi_header = type { i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.timeval = type { i64, i64 }
%struct._zend_syntax_highlighter_ini = type { i8*, i8*, i8*, i8*, i8* }
%struct.timezone = type { i32, i32 }
%struct._zend_extension = type { i8*, i8*, i8*, i8*, i8*, i32 (%struct._zend_extension*)*, void (%struct._zend_extension*)*, void ()*, void ()*, void (i32, i8*)*, void (%struct._zend_op_array*)*, void (%struct._zend_op_array*)*, void (%struct._zend_op_array*)*, void (%struct._zend_op_array*)*, void (%struct._zend_op_array*)*, void (%struct._zend_op_array*)*, i32 (i32)*, i32 (i8*)*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32 }
%struct._user_config_cache_entry = type { i64, %struct._hashtable* }

@.str = private unnamed_addr constant [26 x i8] c"/tmp/apache_shim_open.txt\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"path: %s, flags: %d, fd: %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"/tmp/apache_access.log\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"path: %s, buffer: %x\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"/tmp/apache_getcwd.txt\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"server: size: %d, path: %s\0A\00", align 1
@core_globals = external global %struct._php_core_globals
@php_php_import_environment_variables = internal unnamed_addr global void (%struct._zval_struct*)* null, align 8
@sapi_globals = external global %struct._sapi_globals_struct
@sapi_module = external global %struct._sapi_module_struct
@old_term = common hidden global %struct.sigaction zeroinitializer, align 8
@pgroup = internal unnamed_addr global i32 0, align 4
@parent.b = internal unnamed_addr global i1 false
@parent_waiting.b = internal unnamed_addr global i1 false
@exit_signal.b = internal unnamed_addr global i1 false
@php_optind = internal global i32 1, align 4
@php_optarg = internal global i8* null, align 8
@cgi_sapi_module = internal global %struct._sapi_module_struct { i8* getelementptr inbounds ([9 x i8]* @.str77, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str78, i32 0, i32 0), i32 (%struct._sapi_module_struct*)* @php_cgi_startup, i32 (%struct._sapi_module_struct*)* @php_module_shutdown_wrapper, i32 ()* @sapi_cgi_activate, i32 ()* @sapi_cgi_deactivate, i32 (i8*, i32)* @sapi_cgibin_ub_write, void (i8*)* @sapi_cgibin_flush, %struct.stat* ()* null, i8* (i8*, i64)* @sapi_cgibin_getenv, void (i32, i8*, ...)* @zend_error, i32 (%struct.sapi_header_struct*, i32, %struct.sapi_headers_struct*)* null, i32 (%struct.sapi_headers_struct*)* @sapi_cgi_send_headers, void (%struct.sapi_header_struct*, i8*)* null, i32 (i8*, i32)* @sapi_cgi_read_post, i8* ()* @sapi_cgi_read_cookies, void (%struct._zval_struct*)* @sapi_cgi_register_variables, void (i8*)* @sapi_cgi_log_message, i64 ()* null, void ()* null, i8* null, void ()* null, void ()* null, void ()* null, void (i32, i8*, %struct._zval_struct*)* null, i8* null, i32 0, i32 (i32*)* null, i32 ()* null, i32 (i32*)* null, i32 (i32*)* null, i32 (i32, i8*, i8**, i32, i32*)* null, void (%struct._hashtable*)* null, i32 0, i8* null, %struct._zend_function_entry* null, i32 ()* null }, align 8
@.str7 = private unnamed_addr constant [16 x i8] c"SERVER_SOFTWARE\00", align 1
@.str18 = private unnamed_addr constant [12 x i8] c"SERVER_NAME\00", align 1
@.str29 = private unnamed_addr constant [18 x i8] c"GATEWAY_INTERFACE\00", align 1
@.str310 = private unnamed_addr constant [15 x i8] c"REQUEST_METHOD\00", align 1
@OPTIONS = internal constant [21 x %struct._opt_struct] [%struct._opt_struct { i8 97, i32 0, i8* getelementptr inbounds ([12 x i8]* @.str57, i32 0, i32 0) }, %struct._opt_struct { i8 98, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str58, i32 0, i32 0) }, %struct._opt_struct { i8 67, i32 0, i8* getelementptr inbounds ([9 x i8]* @.str59, i32 0, i32 0) }, %struct._opt_struct { i8 99, i32 1, i8* getelementptr inbounds ([8 x i8]* @.str60, i32 0, i32 0) }, %struct._opt_struct { i8 100, i32 1, i8* getelementptr inbounds ([7 x i8]* @.str61, i32 0, i32 0) }, %struct._opt_struct { i8 101, i32 0, i8* getelementptr inbounds ([13 x i8]* @.str62, i32 0, i32 0) }, %struct._opt_struct { i8 102, i32 1, i8* getelementptr inbounds ([5 x i8]* @.str63, i32 0, i32 0) }, %struct._opt_struct { i8 104, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str64, i32 0, i32 0) }, %struct._opt_struct { i8 105, i32 0, i8* getelementptr inbounds ([5 x i8]* @.str65, i32 0, i32 0) }, %struct._opt_struct { i8 108, i32 0, i8* getelementptr inbounds ([13 x i8]* @.str66, i32 0, i32 0) }, %struct._opt_struct { i8 109, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str67, i32 0, i32 0) }, %struct._opt_struct { i8 110, i32 0, i8* getelementptr inbounds ([11 x i8]* @.str68, i32 0, i32 0) }, %struct._opt_struct { i8 113, i32 0, i8* getelementptr inbounds ([10 x i8]* @.str69, i32 0, i32 0) }, %struct._opt_struct { i8 115, i32 0, i8* getelementptr inbounds ([17 x i8]* @.str70, i32 0, i32 0) }, %struct._opt_struct { i8 115, i32 0, i8* getelementptr inbounds ([20 x i8]* @.str71, i32 0, i32 0) }, %struct._opt_struct { i8 119, i32 0, i8* getelementptr inbounds ([6 x i8]* @.str72, i32 0, i32 0) }, %struct._opt_struct { i8 63, i32 0, i8* getelementptr inbounds ([6 x i8]* @.str73, i32 0, i32 0) }, %struct._opt_struct { i8 118, i32 0, i8* getelementptr inbounds ([8 x i8]* @.str74, i32 0, i32 0) }, %struct._opt_struct { i8 122, i32 1, i8* getelementptr inbounds ([15 x i8]* @.str75, i32 0, i32 0) }, %struct._opt_struct { i8 84, i32 1, i8* getelementptr inbounds ([7 x i8]* @.str76, i32 0, i32 0) }, %struct._opt_struct { i8 45, i32 0, i8* null }], align 16
@.str611 = private unnamed_addr constant [3 x i8] c"\0A\00\00", align 1
@.str712 = private unnamed_addr constant [5 x i8] c"=1\0A\00\00", align 1
@additional_functions = internal constant [2 x %struct._zend_function_entry] [%struct._zend_function_entry { i8* getelementptr inbounds ([3 x i8]* @.str55, i32 0, i32 0), void (i32, %struct._zval_struct*, %struct._zval_struct**, %struct._zval_struct*, i32)* @zif_dl, %struct._zend_arg_info* getelementptr inbounds ([2 x %struct._zend_arg_info]* bitcast (<{ { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] }, { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] } }>* @arginfo_dl to [2 x %struct._zend_arg_info]*), i32 0, i32 0), i32 1, i32 0 }, %struct._zend_function_entry zeroinitializer], align 16
@php_cgi_globals = internal global %struct._php_cgi_globals_struct zeroinitializer, align 8
@.str8 = private unnamed_addr constant [16 x i8] c"REDIRECT_STATUS\00", align 1
@.str9 = private unnamed_addr constant [21 x i8] c"HTTP_REDIRECT_STATUS\00", align 1
@executor_globals = external global %struct._zend_executor_globals
@.str10 = private unnamed_addr constant [644 x i8] c"<b>Security Alert!</b> The PHP CGI cannot be accessed directly.\0A\0A<p>This PHP CGI binary was compiled with force-cgi-redirect enabled.  This\0Ameans that a page will only be served up if the REDIRECT_STATUS CGI variable is\0Aset, e.g. via an Apache Action directive.</p>\0A<p>For more information as to <i>why</i> this behaviour exists, see the <a href=\22http://php.net/security.cgi-bin\22>manual page for CGI security</a>.</p>\0A<p>For more information about changing this behaviour or re-enabling this webserver,\0Aconsult the installation file that came with this distribution, or visit \0A<a href=\22http://php.net/install.windows\22>the manual page</a>.</p>\0A\00", align 1
@__stderrp = external global %struct.__sFILE*
@.str11 = private unnamed_addr constant [50 x i8] c"Couldn't create FastCGI listen socket on port %s\0A\00", align 1
@.str12 = private unnamed_addr constant [22 x i8] c"PHP_FCGI_MAX_REQUESTS\00", align 1
@.str13 = private unnamed_addr constant [36 x i8] c"PHP_FCGI_MAX_REQUESTS is not valid\0A\00", align 1
@php_import_environment_variables = external global void (%struct._zval_struct*)*
@.str14 = private unnamed_addr constant [18 x i8] c"PHP_FCGI_CHILDREN\00", align 1
@.str15 = private unnamed_addr constant [32 x i8] c"PHP_FCGI_CHILDREN is not valid\0A\00", align 1
@.str16 = private unnamed_addr constant [15 x i8] c"FCGI_MAX_CONNS\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"FCGI_MAX_REQS\00", align 1
@.str1813 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@act = common hidden global %struct.sigaction zeroinitializer, align 8
@old_int = common hidden global %struct.sigaction zeroinitializer, align 8
@old_quit = common hidden global %struct.sigaction zeroinitializer, align 8
@.str19 = private unnamed_addr constant [18 x i8] c"Can't set signals\00", align 1
@.str20 = private unnamed_addr constant [18 x i8] c"php (pre-forking)\00", align 1
@compiler_globals = external global %struct._zend_compiler_globals
@.str22 = private unnamed_addr constant [15 x i8] c"[PHP Modules]\0A\00", align 1
@.str23 = private unnamed_addr constant [17 x i8] c"\0A[Zend Modules]\0A\00", align 1
@.str24 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str25 = private unnamed_addr constant [68 x i8] c"PHP %s (%s) (built: %s %s)\0ACopyright (c) 1997-2010 The PHP Group\0A%s\00", align 1
@.str26 = private unnamed_addr constant [6 x i8] c"5.3.2\00", align 1
@.str27 = private unnamed_addr constant [12 x i8] c"Sep 13 2012\00", align 1
@.str28 = private unnamed_addr constant [9 x i8] c"10:44:44\00", align 1
@.str2914 = private unnamed_addr constant [2 x i8] c"-\00", align 1
@__stdinp = external global %struct.__sFILE*
@.str30 = private unnamed_addr constant [16 x i8] c"Access denied.\0A\00", align 1
@.str31 = private unnamed_addr constant [26 x i8] c"No input file specified.\0A\00", align 1
@zend_printf = external global i32 (i8*, ...)*
@.str32 = private unnamed_addr constant [33 x i8] c"No syntax errors detected in %s\0A\00", align 1
@.str33 = private unnamed_addr constant [19 x i8] c"Errors parsing %s\0A\00", align 1
@.str34 = private unnamed_addr constant [28 x i8] c"\0AElapsed time: %d.%06d sec\0A\00", align 1
@zend_extensions = external global %struct._zend_llist
@.str35 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@module_registry = external global %struct._hashtable
@.str36 = private unnamed_addr constant [16 x i8] c"SCRIPT_FILENAME\00", align 1
@.str37 = private unnamed_addr constant [16 x i8] c"PATH_TRANSLATED\00", align 1
@.str38 = private unnamed_addr constant [15 x i8] c"CONTENT_LENGTH\00", align 1
@.str39 = private unnamed_addr constant [13 x i8] c"CONTENT_TYPE\00", align 1
@.str40 = private unnamed_addr constant [10 x i8] c"PATH_INFO\00", align 1
@.str41 = private unnamed_addr constant [12 x i8] c"SCRIPT_NAME\00", align 1
@.str42 = private unnamed_addr constant [14 x i8] c"Microsoft-IIS\00", align 1
@.str43 = private unnamed_addr constant [15 x i8] c"ORIG_PATH_INFO\00", align 1
@.str44 = private unnamed_addr constant [13 x i8] c"REDIRECT_URL\00", align 1
@.str45 = private unnamed_addr constant [14 x i8] c"DOCUMENT_ROOT\00", align 1
@.str46 = private unnamed_addr constant [17 x i8] c"ORIG_SCRIPT_NAME\00", align 1
@.str47 = private unnamed_addr constant [21 x i8] c"ORIG_SCRIPT_FILENAME\00", align 1
@.str48 = private unnamed_addr constant [21 x i8] c"ORIG_PATH_TRANSLATED\00", align 1
@.str49 = private unnamed_addr constant [13 x i8] c"QUERY_STRING\00", align 1
@.str50 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str51 = private unnamed_addr constant [19 x i8] c"HTTP_AUTHORIZATION\00", align 1
@.str52 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str53 = private unnamed_addr constant [4 x i8] c"php\00", align 1
@.str54 = private unnamed_addr constant [1026 x i8] c"Usage: %s [-q] [-h] [-s] [-v] [-i] [-f <file>]\0A       %s <file> [args...]\0A  -a               Run interactively\0A  -b <address:port>|<port> Bind Path for external FASTCGI Server mode\0A  -C               Do not chdir to the script's directory\0A  -c <path>|<file> Look for php.ini file in this directory\0A  -n               No php.ini file will be used\0A  -d foo[=bar]     Define INI entry foo with value 'bar'\0A  -e               Generate extended information for debugger/profiler\0A  -f <file>        Parse <file>.  Implies `-q'\0A  -h               This help\0A  -i               PHP information\0A  -l               Syntax check only (lint)\0A  -m               Show compiled in modules\0A  -q               Quiet-mode.  Suppress HTTP Header output.\0A  -s               Display colour syntax highlighted source.\0A  -v               Version number\0A  -w               Display source with stripped comments and whitespace.\0A  -z <file>        Load Zend extension <file>.\0A  -T <count>       Measure execution time of script repeated <count> times.\0A\00", align 1
@.str55 = private unnamed_addr constant [3 x i8] c"dl\00", align 1
@.str56 = private unnamed_addr constant [19 x i8] c"extension_filename\00", align 1
@arginfo_dl = internal constant <{ { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] }, { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] } }> <{ { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] } { i8* null, i32 0, i8* null, i32 0, i8 0, i8 0, i8 0, i8 0, i32 -1, [4 x i8] undef }, { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] } { i8* getelementptr inbounds ([19 x i8]* @.str56, i32 0, i32 0), i32 18, i8* null, i32 0, i8 0, i8 0, i8 0, i8 0, i32 0, [4 x i8] undef } }>, align 16
@__mb_sb_limit = external global i32
@_CurrentRuneLocale = external global %struct._RuneLocale*
@.str57 = private unnamed_addr constant [12 x i8] c"interactive\00", align 1
@.str58 = private unnamed_addr constant [9 x i8] c"bindpath\00", align 1
@.str59 = private unnamed_addr constant [9 x i8] c"no-chdir\00", align 1
@.str60 = private unnamed_addr constant [8 x i8] c"php-ini\00", align 1
@.str61 = private unnamed_addr constant [7 x i8] c"define\00", align 1
@.str62 = private unnamed_addr constant [13 x i8] c"profile-info\00", align 1
@.str63 = private unnamed_addr constant [5 x i8] c"file\00", align 1
@.str64 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str65 = private unnamed_addr constant [5 x i8] c"info\00", align 1
@.str66 = private unnamed_addr constant [13 x i8] c"syntax-check\00", align 1
@.str67 = private unnamed_addr constant [8 x i8] c"modules\00", align 1
@.str68 = private unnamed_addr constant [11 x i8] c"no-php-ini\00", align 1
@.str69 = private unnamed_addr constant [10 x i8] c"no-header\00", align 1
@.str70 = private unnamed_addr constant [17 x i8] c"syntax-highlight\00", align 1
@.str71 = private unnamed_addr constant [20 x i8] c"syntax-highlighting\00", align 1
@.str72 = private unnamed_addr constant [6 x i8] c"strip\00", align 1
@.str73 = private unnamed_addr constant [6 x i8] c"usage\00", align 1
@.str74 = private unnamed_addr constant [8 x i8] c"version\00", align 1
@.str75 = private unnamed_addr constant [15 x i8] c"zend-extension\00", align 1
@.str76 = private unnamed_addr constant [7 x i8] c"timing\00", align 1
@.str77 = private unnamed_addr constant [9 x i8] c"cgi-fcgi\00", align 1
@.str78 = private unnamed_addr constant [12 x i8] c"CGI/FastCGI\00", align 1
@.str79 = private unnamed_addr constant [9 x i8] c"PHP_SELF\00", align 1
@.str80 = private unnamed_addr constant [12 x i8] c"HTTP_COOKIE\00", align 1
@.str81 = private unnamed_addr constant [5 x i8] c"%s\0D\0A\00", align 1
@.str82 = private unnamed_addr constant [6 x i8] c"HTTP/\00", align 1
@.str83 = private unnamed_addr constant [12 x i8] c"Status:%s\0D\0A\00", align 1
@.str84 = private unnamed_addr constant [8 x i8] c"Status:\00", align 1
@http_error_codes = internal unnamed_addr constant [38 x %struct._http_error] [%struct._http_error { i32 100, i8* getelementptr inbounds ([9 x i8]* @.str89, i32 0, i32 0) }, %struct._http_error { i32 101, i8* getelementptr inbounds ([20 x i8]* @.str90, i32 0, i32 0) }, %struct._http_error { i32 200, i8* getelementptr inbounds ([3 x i8]* @.str91, i32 0, i32 0) }, %struct._http_error { i32 201, i8* getelementptr inbounds ([8 x i8]* @.str92, i32 0, i32 0) }, %struct._http_error { i32 202, i8* getelementptr inbounds ([9 x i8]* @.str93, i32 0, i32 0) }, %struct._http_error { i32 203, i8* getelementptr inbounds ([30 x i8]* @.str94, i32 0, i32 0) }, %struct._http_error { i32 204, i8* getelementptr inbounds ([11 x i8]* @.str95, i32 0, i32 0) }, %struct._http_error { i32 205, i8* getelementptr inbounds ([14 x i8]* @.str96, i32 0, i32 0) }, %struct._http_error { i32 206, i8* getelementptr inbounds ([16 x i8]* @.str97, i32 0, i32 0) }, %struct._http_error { i32 300, i8* getelementptr inbounds ([17 x i8]* @.str98, i32 0, i32 0) }, %struct._http_error { i32 301, i8* getelementptr inbounds ([18 x i8]* @.str99, i32 0, i32 0) }, %struct._http_error { i32 302, i8* getelementptr inbounds ([18 x i8]* @.str100, i32 0, i32 0) }, %struct._http_error { i32 303, i8* getelementptr inbounds ([10 x i8]* @.str101, i32 0, i32 0) }, %struct._http_error { i32 304, i8* getelementptr inbounds ([13 x i8]* @.str102, i32 0, i32 0) }, %struct._http_error { i32 305, i8* getelementptr inbounds ([10 x i8]* @.str103, i32 0, i32 0) }, %struct._http_error { i32 400, i8* getelementptr inbounds ([12 x i8]* @.str104, i32 0, i32 0) }, %struct._http_error { i32 401, i8* getelementptr inbounds ([13 x i8]* @.str105, i32 0, i32 0) }, %struct._http_error { i32 402, i8* getelementptr inbounds ([17 x i8]* @.str106, i32 0, i32 0) }, %struct._http_error { i32 403, i8* getelementptr inbounds ([10 x i8]* @.str107, i32 0, i32 0) }, %struct._http_error { i32 404, i8* getelementptr inbounds ([10 x i8]* @.str108, i32 0, i32 0) }, %struct._http_error { i32 405, i8* getelementptr inbounds ([19 x i8]* @.str109, i32 0, i32 0) }, %struct._http_error { i32 406, i8* getelementptr inbounds ([15 x i8]* @.str110, i32 0, i32 0) }, %struct._http_error { i32 407, i8* getelementptr inbounds ([30 x i8]* @.str111, i32 0, i32 0) }, %struct._http_error { i32 408, i8* getelementptr inbounds ([17 x i8]* @.str112, i32 0, i32 0) }, %struct._http_error { i32 409, i8* getelementptr inbounds ([9 x i8]* @.str113, i32 0, i32 0) }, %struct._http_error { i32 410, i8* getelementptr inbounds ([5 x i8]* @.str114, i32 0, i32 0) }, %struct._http_error { i32 411, i8* getelementptr inbounds ([16 x i8]* @.str115, i32 0, i32 0) }, %struct._http_error { i32 412, i8* getelementptr inbounds ([20 x i8]* @.str116, i32 0, i32 0) }, %struct._http_error { i32 413, i8* getelementptr inbounds ([25 x i8]* @.str117, i32 0, i32 0) }, %struct._http_error { i32 414, i8* getelementptr inbounds ([22 x i8]* @.str118, i32 0, i32 0) }, %struct._http_error { i32 415, i8* getelementptr inbounds ([23 x i8]* @.str119, i32 0, i32 0) }, %struct._http_error { i32 500, i8* getelementptr inbounds ([22 x i8]* @.str120, i32 0, i32 0) }, %struct._http_error { i32 501, i8* getelementptr inbounds ([16 x i8]* @.str121, i32 0, i32 0) }, %struct._http_error { i32 502, i8* getelementptr inbounds ([12 x i8]* @.str122, i32 0, i32 0) }, %struct._http_error { i32 503, i8* getelementptr inbounds ([20 x i8]* @.str123, i32 0, i32 0) }, %struct._http_error { i32 504, i8* getelementptr inbounds ([17 x i8]* @.str124, i32 0, i32 0) }, %struct._http_error { i32 505, i8* getelementptr inbounds ([27 x i8]* @.str125, i32 0, i32 0) }, %struct._http_error zeroinitializer], align 16
@.str85 = private unnamed_addr constant [16 x i8] c"Status: %d %s\0D\0A\00", align 1
@.str86 = private unnamed_addr constant [13 x i8] c"Status: %d\0D\0A\00", align 1
@.str87 = private unnamed_addr constant [3 x i8] c"\0D\0A\00", align 1
@.str88 = private unnamed_addr constant [14 x i8] c"Content-Type:\00", align 1
@.str89 = private unnamed_addr constant [9 x i8] c"Continue\00", align 1
@.str90 = private unnamed_addr constant [20 x i8] c"Switching Protocols\00", align 1
@.str91 = private unnamed_addr constant [3 x i8] c"OK\00", align 1
@.str92 = private unnamed_addr constant [8 x i8] c"Created\00", align 1
@.str93 = private unnamed_addr constant [9 x i8] c"Accepted\00", align 1
@.str94 = private unnamed_addr constant [30 x i8] c"Non-Authoritative Information\00", align 1
@.str95 = private unnamed_addr constant [11 x i8] c"No Content\00", align 1
@.str96 = private unnamed_addr constant [14 x i8] c"Reset Content\00", align 1
@.str97 = private unnamed_addr constant [16 x i8] c"Partial Content\00", align 1
@.str98 = private unnamed_addr constant [17 x i8] c"Multiple Choices\00", align 1
@.str99 = private unnamed_addr constant [18 x i8] c"Moved Permanently\00", align 1
@.str100 = private unnamed_addr constant [18 x i8] c"Moved Temporarily\00", align 1
@.str101 = private unnamed_addr constant [10 x i8] c"See Other\00", align 1
@.str102 = private unnamed_addr constant [13 x i8] c"Not Modified\00", align 1
@.str103 = private unnamed_addr constant [10 x i8] c"Use Proxy\00", align 1
@.str104 = private unnamed_addr constant [12 x i8] c"Bad Request\00", align 1
@.str105 = private unnamed_addr constant [13 x i8] c"Unauthorized\00", align 1
@.str106 = private unnamed_addr constant [17 x i8] c"Payment Required\00", align 1
@.str107 = private unnamed_addr constant [10 x i8] c"Forbidden\00", align 1
@.str108 = private unnamed_addr constant [10 x i8] c"Not Found\00", align 1
@.str109 = private unnamed_addr constant [19 x i8] c"Method Not Allowed\00", align 1
@.str110 = private unnamed_addr constant [15 x i8] c"Not Acceptable\00", align 1
@.str111 = private unnamed_addr constant [30 x i8] c"Proxy Authentication Required\00", align 1
@.str112 = private unnamed_addr constant [17 x i8] c"Request Time-out\00", align 1
@.str113 = private unnamed_addr constant [9 x i8] c"Conflict\00", align 1
@.str114 = private unnamed_addr constant [5 x i8] c"Gone\00", align 1
@.str115 = private unnamed_addr constant [16 x i8] c"Length Required\00", align 1
@.str116 = private unnamed_addr constant [20 x i8] c"Precondition Failed\00", align 1
@.str117 = private unnamed_addr constant [25 x i8] c"Request Entity Too Large\00", align 1
@.str118 = private unnamed_addr constant [22 x i8] c"Request-URI Too Large\00", align 1
@.str119 = private unnamed_addr constant [23 x i8] c"Unsupported Media Type\00", align 1
@.str120 = private unnamed_addr constant [22 x i8] c"Internal Server Error\00", align 1
@.str121 = private unnamed_addr constant [16 x i8] c"Not Implemented\00", align 1
@.str122 = private unnamed_addr constant [12 x i8] c"Bad Gateway\00", align 1
@.str123 = private unnamed_addr constant [20 x i8] c"Service Unavailable\00", align 1
@.str124 = private unnamed_addr constant [17 x i8] c"Gateway Time-out\00", align 1
@.str125 = private unnamed_addr constant [27 x i8] c"HTTP Version not supported\00", align 1
@__stdoutp = external global %struct.__sFILE*
@.str126 = private unnamed_addr constant [15 x i8] c"Out of memory\0A\00", align 1
@cgi_module_entry = internal global %struct._zend_module_entry { i16 168, i32 20090626, i8 0, i8 0, %struct._zend_ini_entry* null, %struct._zend_module_dep* null, i8* getelementptr inbounds ([9 x i8]* @.str77, i32 0, i32 0), %struct._zend_function_entry* null, i32 (i32, i32)* @zm_startup_cgi, i32 (i32, i32)* @zm_shutdown_cgi, i32 (i32, i32)* null, i32 (i32, i32)* null, void (%struct._zend_module_entry*)* @zm_info_cgi, i8* null, i64 0, i8* null, void (i8*)* null, void (i8*)* null, i32 ()* null, i32 0, i8 0, i8* null, i32 0, i8* getelementptr inbounds ([16 x i8]* @.str127, i32 0, i32 0) }, align 8
@.str127 = private unnamed_addr constant [16 x i8] c"API20090626,NTS\00", align 1
@ini_entries = internal constant [9 x %struct._zend_ini_entry] [%struct._zend_ini_entry { i32 0, i32 7, i8* getelementptr inbounds ([20 x i8]* @.str128, i32 0, i32 0), i32 20, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* null, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str129, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 7, i8* getelementptr inbounds ([8 x i8]* @.str130, i32 0, i32 0), i32 8, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 1 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str129, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([23 x i8]* @.str131, i32 0, i32 0), i32 23, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 2 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str1813, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([19 x i8]* @.str132, i32 0, i32 0), i32 19, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 4 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str1813, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([24 x i8]* @.str133, i32 0, i32 0), i32 24, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateString, i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* null, i32 7, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([17 x i8]* @.str134, i32 0, i32 0), i32 17, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 3 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str1813, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([17 x i8]* @.str135, i32 0, i32 0), i32 17, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 5 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str129, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry { i32 0, i32 4, i8* getelementptr inbounds ([16 x i8]* @.str136, i32 0, i32 0), i32 16, i32 (%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)* @OnUpdateBool, i8* inttoptr (i64 6 to i8*), i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i32 0, i32 0), i8* null, i8* getelementptr inbounds ([2 x i8]* @.str1813, i32 0, i32 0), i32 1, i8* null, i32 0, i32 0, i32 0, void (%struct._zend_ini_entry*, i32)* null }, %struct._zend_ini_entry zeroinitializer], align 16
@.str128 = private unnamed_addr constant [20 x i8] c"cgi.rfc2616_headers\00", align 1
@.str129 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str130 = private unnamed_addr constant [8 x i8] c"cgi.nph\00", align 1
@.str131 = private unnamed_addr constant [23 x i8] c"cgi.check_shebang_line\00", align 1
@.str132 = private unnamed_addr constant [19 x i8] c"cgi.force_redirect\00", align 1
@.str133 = private unnamed_addr constant [24 x i8] c"cgi.redirect_status_env\00", align 1
@.str134 = private unnamed_addr constant [17 x i8] c"cgi.fix_pathinfo\00", align 1
@.str135 = private unnamed_addr constant [17 x i8] c"cgi.discard_path\00", align 1
@.str136 = private unnamed_addr constant [16 x i8] c"fastcgi.logging\00", align 1
@str = private unnamed_addr constant [26 x i8] c"Interactive mode enabled\0A\00"

define i32 @shim_open2(i8* %path, i32 %flags, i16 zeroext %mode) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i16, align 2
  %fd = alloca i32, align 4
  %log = alloca %struct.__sFILE*, align 8
  store i8* %path, i8** %1, align 8
  store i32 %flags, i32* %2, align 4
  store i16 %mode, i16* %3, align 2
  %4 = load i8** %1, align 8
  %5 = load i32* %2, align 4
  %6 = load i16* %3, align 2
  %7 = zext i16 %6 to i32
  %8 = call i32 (i8*, i32, ...)* @open(i8* %4, i32 %5, i32 %7)
  store i32 %8, i32* %fd, align 4
  %9 = call %struct.__sFILE* @fopen(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct.__sFILE* %9, %struct.__sFILE** %log, align 8
  %10 = load %struct.__sFILE** %log, align 8
  %11 = load i8** %1, align 8
  %12 = load i32* %2, align 4
  %13 = load i32* %fd, align 4
  %14 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %10, i8* getelementptr inbounds ([29 x i8]* @.str2, i32 0, i32 0), i8* %11, i32 %12, i32 %13)
  %15 = load %struct.__sFILE** %log, align 8
  %16 = call i32 @fclose(%struct.__sFILE* %15)
  %17 = load i8** %1, align 8
  %18 = call i32 @is_wl_sys_lib(i8* %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %0
  br label %46

; <label>:21                                      ; preds = %0
  %22 = load i8** %1, align 8
  %23 = call i32 @is_php_mw_config(i8* %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21
  br label %45

; <label>:26                                      ; preds = %21
  %27 = load i8** %1, align 8
  %28 = call i32 @is_mw_php(i8* %27)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26
  br label %44

; <label>:31                                      ; preds = %26
  %32 = load i8** %1, align 8
  %33 = call i32 @is_skin(i8* %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %31
  br label %43

; <label>:36                                      ; preds = %31
  %37 = load i8** %1, align 8
  %38 = call i32 @is_scratch(i8* %37)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %36
  br label %42

; <label>:41                                      ; preds = %36
  br label %42

; <label>:42                                      ; preds = %41, %40
  br label %43

; <label>:43                                      ; preds = %42, %35
  br label %44

; <label>:44                                      ; preds = %43, %30
  br label %45

; <label>:45                                      ; preds = %44, %25
  br label %46

; <label>:46                                      ; preds = %45, %20
  call void @cw_act(i32 7)
  %47 = load i32* %fd, align 4
  ret i32 %47
}

declare i32 @open(i8*, i32, ...)

declare %struct.__sFILE* @fopen(i8*, i8*)

declare i32 @fprintf(%struct.__sFILE*, i8*, ...)

declare i32 @fclose(%struct.__sFILE*)

declare i32 @is_wl_sys_lib(i8*)

declare i32 @is_php_mw_config(i8*)

declare i32 @is_mw_php(i8*)

declare i32 @is_skin(i8*)

declare i32 @is_scratch(i8*)

declare void @cw_act(i32)

define i32 @shim_open(i8* %path, i32 %flags, ...) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %mode = alloca i16, align 2
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %fd = alloca i32, align 4
  store i8* %path, i8** %1, align 8
  store i32 %flags, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 512
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %28

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_start(i8* %8)
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %6
  %14 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8** %14
  %16 = getelementptr i8* %15, i32 %11
  %17 = bitcast i8* %16 to i32*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %6
  %20 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8** %20
  %22 = bitcast i8* %21 to i32*
  %23 = getelementptr i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi i32* [ %17, %13 ], [ %22, %19 ]
  %26 = load i32* %25
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* %mode, align 2
  br label %29

; <label>:28                                      ; preds = %0
  store i16 0, i16* %mode, align 2
  br label %29

; <label>:29                                      ; preds = %28, %24
  %30 = load i8** %1, align 8
  %31 = load i32* %2, align 4
  %32 = load i16* %mode, align 2
  %33 = call i32 @shim_open2(i8* %30, i32 %31, i16 zeroext %32)
  store i32 %33, i32* %fd, align 4
  %34 = load i32* %fd, align 4
  ret i32 %34
}

declare void @llvm.va_start(i8*) nounwind

define %struct.__sFILE* @shim_fopen(i8* %path, i8* %mode) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %flags = alloca i32, align 4
  %fd = alloca i32, align 4
  store i8* %path, i8** %1, align 8
  store i8* %mode, i8** %2, align 8
  store i32 0, i32* %flags, align 4
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds i8* %3, i64 0
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 114
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %0
  %9 = load i8** %2, align 8
  %10 = getelementptr inbounds i8* %9, i64 1
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 43
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  store i32 2, i32* %flags, align 4
  br label %16

; <label>:15                                      ; preds = %8
  store i32 0, i32* %flags, align 4
  br label %16

; <label>:16                                      ; preds = %15, %14
  br label %53

; <label>:17                                      ; preds = %0
  %18 = load i8** %2, align 8
  %19 = getelementptr inbounds i8* %18, i64 1
  %20 = load i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 119
  br i1 %22, label %23, label %34

; <label>:23                                      ; preds = %17
  %24 = load i8** %2, align 8
  %25 = getelementptr inbounds i8* %24, i64 1
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = icmp eq i32 %27, 43
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %23
  store i32 2, i32* %flags, align 4
  br label %31

; <label>:30                                      ; preds = %23
  store i32 1, i32* %flags, align 4
  br label %31

; <label>:31                                      ; preds = %30, %29
  %32 = load i32* %flags, align 4
  %33 = or i32 %32, 512
  store i32 %33, i32* %flags, align 4
  br label %52

; <label>:34                                      ; preds = %17
  %35 = load i8** %2, align 8
  %36 = getelementptr inbounds i8* %35, i64 0
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp eq i32 %38, 97
  br i1 %39, label %40, label %51

; <label>:40                                      ; preds = %34
  %41 = load i8** %2, align 8
  %42 = getelementptr inbounds i8* %41, i64 1
  %43 = load i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp eq i32 %44, 43
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %40
  store i32 10, i32* %flags, align 4
  br label %48

; <label>:47                                      ; preds = %40
  store i32 8, i32* %flags, align 4
  br label %48

; <label>:48                                      ; preds = %47, %46
  %49 = load i32* %flags, align 4
  %50 = or i32 %49, 512
  store i32 %50, i32* %flags, align 4
  br label %51

; <label>:51                                      ; preds = %48, %34
  br label %52

; <label>:52                                      ; preds = %51, %31
  br label %53

; <label>:53                                      ; preds = %52, %16
  %54 = load i8** %1, align 8
  %55 = load i32* %flags, align 4
  %56 = call i32 (i8*, i32, ...)* @shim_open(i8* %54, i32 %55, i32 511)
  store i32 %56, i32* %fd, align 4
  %57 = load i32* %fd, align 4
  %58 = load i8** %2, align 8
  %59 = call %struct.__sFILE* @fdopen(i32 %57, i8* %58)
  ret %struct.__sFILE* %59
}

declare %struct.__sFILE* @fdopen(i32, i8*)

define i32 @shim_access(i8* %path, i32 %mode) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %acc_log = alloca %struct.__sFILE*, align 8
  %rc = alloca i32, align 4
  store i8* %path, i8** %1, align 8
  store i32 %mode, i32* %2, align 4
  %3 = call %struct.__sFILE* @fopen(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct.__sFILE* %3, %struct.__sFILE** %acc_log, align 8
  %4 = load %struct.__sFILE** %acc_log, align 8
  %5 = load i8** %1, align 8
  %6 = load i8** %1, align 8
  %7 = ptrtoint i8* %6 to i32
  %8 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %4, i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i8* %5, i32 %7)
  %9 = load %struct.__sFILE** %acc_log, align 8
  %10 = call i32 @fclose(%struct.__sFILE* %9)
  %11 = load i8** %1, align 8
  %12 = load i32* %2, align 4
  %13 = call i32 @access(i8* %11, i32 %12)
  store i32 %13, i32* %rc, align 4
  call void @cw_act(i32 13)
  %14 = load i32* %rc, align 4
  ret i32 %14
}

declare i32 @access(i8*, i32)

define i32 @shim_connect2(i32 %s, i64 %name.coerce0, i64 %name.coerce1, i32 %namelen) nounwind uwtable {
  %1 = alloca i32, align 4
  %name = alloca %struct.sockaddr, align 8
  %2 = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  %3 = bitcast %struct.sockaddr* %name to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  store i64 %name.coerce0, i64* %4
  %5 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  store i64 %name.coerce1, i64* %5
  store i32 %namelen, i32* %2, align 4
  %6 = call i32 @is_db(%struct.sockaddr* %name)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %10

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9, %8
  %11 = load i32* %1, align 4
  %12 = load i32* %2, align 4
  %13 = call i32 @connect(i32 %11, %struct.sockaddr* %name, i32 %12)
  store i32 %13, i32* %err, align 4
  call void @cw_act(i32 11)
  %14 = load i32* %err, align 4
  ret i32 %14
}

declare i32 @is_db(%struct.sockaddr*)

declare i32 @connect(i32, %struct.sockaddr*, i32)

define i32 @shim_connect(i32 %s, %struct.sockaddr* %name, i32 %namelen) nounwind uwtable {
  %1 = alloca i32, align 4
  %2 = alloca %struct.sockaddr*, align 8
  %3 = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  store %struct.sockaddr* %name, %struct.sockaddr** %2, align 8
  store i32 %namelen, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load %struct.sockaddr** %2, align 8
  %6 = load i32* %3, align 4
  %7 = bitcast %struct.sockaddr* %5 to { i64, i64 }*
  %8 = getelementptr { i64, i64 }* %7, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr { i64, i64 }* %7, i32 0, i32 1
  %11 = load i64* %10, align 1
  %12 = call i32 @shim_connect2(i32 %4, i64 %9, i64 %11, i32 %6)
  ret i32 %12
}

define %struct.iovec* @shim_stat2(i8* %path, i32 %m) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %frv = alloca %struct.fstat_rv*, align 8
  %rv = alloca %struct.iovec*, align 8
  store i8* %path, i8** %1, align 8
  store i32 %m, i32* %2, align 4
  %3 = call noalias i8* @malloc(i64 128)
  %4 = bitcast i8* %3 to %struct.fstat_rv*
  store %struct.fstat_rv* %4, %struct.fstat_rv** %frv, align 8
  %5 = load i32* %2, align 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %0
  %8 = load i8** %1, align 8
  %9 = load %struct.fstat_rv** %frv, align 8
  %10 = getelementptr inbounds %struct.fstat_rv* %9, i32 0, i32 0
  %11 = call i32 @stat(i8* %8, %struct.stat* %10)
  %12 = load %struct.fstat_rv** %frv, align 8
  %13 = getelementptr inbounds %struct.fstat_rv* %12, i32 0, i32 1
  store i32 %11, i32* %13, align 4
  br label %21

; <label>:14                                      ; preds = %0
  %15 = load i8** %1, align 8
  %16 = load %struct.fstat_rv** %frv, align 8
  %17 = getelementptr inbounds %struct.fstat_rv* %16, i32 0, i32 0
  %18 = call i32 @lstat(i8* %15, %struct.stat* %17)
  %19 = load %struct.fstat_rv** %frv, align 8
  %20 = getelementptr inbounds %struct.fstat_rv* %19, i32 0, i32 1
  store i32 %18, i32* %20, align 4
  br label %21

; <label>:21                                      ; preds = %14, %7
  %22 = call noalias i8* @malloc(i64 16)
  %23 = bitcast i8* %22 to %struct.iovec*
  store %struct.iovec* %23, %struct.iovec** %rv, align 8
  %24 = load %struct.fstat_rv** %frv, align 8
  %25 = bitcast %struct.fstat_rv* %24 to i8*
  %26 = load %struct.iovec** %rv, align 8
  %27 = getelementptr inbounds %struct.iovec* %26, i32 0, i32 0
  store i8* %25, i8** %27, align 8
  %28 = load %struct.iovec** %rv, align 8
  %29 = getelementptr inbounds %struct.iovec* %28, i32 0, i32 1
  store i64 128, i64* %29, align 8
  call void @cw_act(i32 15)
  %30 = load %struct.iovec** %rv, align 8
  ret %struct.iovec* %30
}

declare noalias i8* @malloc(i64)

declare i32 @stat(i8*, %struct.stat*)

declare i32 @lstat(i8*, %struct.stat*)

define i32 @shim_lstat(i8* %path, %struct.stat* %buf) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.stat*, align 8
  %res = alloca %struct.iovec*, align 8
  %rv = alloca %struct.fstat_rv*, align 8
  store i8* %path, i8** %1, align 8
  store %struct.stat* %buf, %struct.stat** %2, align 8
  %3 = load i8** %1, align 8
  %4 = call %struct.iovec* @shim_stat2(i8* %3, i32 1)
  store %struct.iovec* %4, %struct.iovec** %res, align 8
  %5 = load %struct.iovec** %res, align 8
  %6 = getelementptr inbounds %struct.iovec* %5, i32 0, i32 0
  %7 = load i8** %6, align 8
  %8 = bitcast i8* %7 to %struct.fstat_rv*
  store %struct.fstat_rv* %8, %struct.fstat_rv** %rv, align 8
  %9 = load %struct.stat** %2, align 8
  %10 = load %struct.fstat_rv** %rv, align 8
  %11 = getelementptr inbounds %struct.fstat_rv* %10, i32 0, i32 0
  %12 = bitcast %struct.stat* %9 to i8*
  %13 = bitcast %struct.stat* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 120, i32 8, i1 false)
  %14 = load %struct.fstat_rv** %rv, align 8
  %15 = getelementptr inbounds %struct.fstat_rv* %14, i32 0, i32 1
  %16 = load i32* %15, align 4
  ret i32 %16
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @shim_stat(i8* %path, %struct.stat* %buf) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.stat*, align 8
  %res = alloca %struct.iovec*, align 8
  %rv = alloca %struct.fstat_rv*, align 8
  store i8* %path, i8** %1, align 8
  store %struct.stat* %buf, %struct.stat** %2, align 8
  %3 = load i8** %1, align 8
  %4 = call %struct.iovec* @shim_stat2(i8* %3, i32 0)
  store %struct.iovec* %4, %struct.iovec** %res, align 8
  %5 = load %struct.iovec** %res, align 8
  %6 = getelementptr inbounds %struct.iovec* %5, i32 0, i32 0
  %7 = load i8** %6, align 8
  %8 = bitcast i8* %7 to %struct.fstat_rv*
  store %struct.fstat_rv* %8, %struct.fstat_rv** %rv, align 8
  %9 = load %struct.stat** %2, align 8
  %10 = load %struct.fstat_rv** %rv, align 8
  %11 = getelementptr inbounds %struct.fstat_rv* %10, i32 0, i32 0
  %12 = bitcast %struct.stat* %9 to i8*
  %13 = bitcast %struct.stat* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 120, i32 8, i1 false)
  %14 = load %struct.fstat_rv** %rv, align 8
  %15 = getelementptr inbounds %struct.fstat_rv* %14, i32 0, i32 1
  %16 = load i32* %15, align 4
  ret i32 %16
}

define %struct.iovec* @shim_getcwd2(i32 %size) nounwind uwtable {
  %1 = alloca i32, align 4
  %res = alloca i8*, align 8
  %len = alloca i64, align 8
  %res_iov = alloca %struct.iovec*, align 8
  %cwd_log = alloca %struct.__sFILE*, align 8
  store i32 %size, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = call i8* @getcwd(i8* null, i64 0)
  store i8* %5, i8** %res, align 8
  %6 = load i8** %res, align 8
  %7 = call i64 @strlen(i8* %6) nounwind readonly
  %8 = add i64 %7, 1
  store i64 %8, i64* %len, align 8
  br label %20

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4
  %11 = sext i32 %10 to i64
  %12 = mul i64 1, %11
  %13 = call noalias i8* @malloc(i64 %12)
  store i8* %13, i8** %res, align 8
  %14 = load i8** %res, align 8
  %15 = load i32* %1, align 4
  %16 = sext i32 %15 to i64
  %17 = call i8* @getcwd(i8* %14, i64 %16)
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  store i64 %19, i64* %len, align 8
  br label %20

; <label>:20                                      ; preds = %9, %4
  %21 = call noalias i8* @malloc(i64 16)
  %22 = bitcast i8* %21 to %struct.iovec*
  store %struct.iovec* %22, %struct.iovec** %res_iov, align 8
  %23 = load i8** %res, align 8
  %24 = load %struct.iovec** %res_iov, align 8
  %25 = getelementptr inbounds %struct.iovec* %24, i32 0, i32 0
  store i8* %23, i8** %25, align 8
  %26 = load i64* %len, align 8
  %27 = load %struct.iovec** %res_iov, align 8
  %28 = getelementptr inbounds %struct.iovec* %27, i32 0, i32 1
  store i64 %26, i64* %28, align 8
  %29 = call %struct.__sFILE* @fopen(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct.__sFILE* %29, %struct.__sFILE** %cwd_log, align 8
  %30 = load %struct.__sFILE** %cwd_log, align 8
  %31 = load i32* %1, align 4
  %32 = load %struct.iovec** %res_iov, align 8
  %33 = getelementptr inbounds %struct.iovec* %32, i32 0, i32 0
  %34 = load i8** %33, align 8
  %35 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %30, i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0), i32 %31, i8* %34)
  %36 = load %struct.__sFILE** %cwd_log, align 8
  %37 = call i32 @fclose(%struct.__sFILE* %36)
  call void @cw_act(i32 17)
  %38 = load %struct.iovec** %res_iov, align 8
  ret %struct.iovec* %38
}

declare i8* @getcwd(i8*, i64)

declare i64 @strlen(i8*) nounwind readonly

define i8* @shim_getcwd(i8* %buf, i64 %size) nounwind uwtable {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %res = alloca i8*, align 8
  %res_iv = alloca %struct.iovec*, align 8
  %res_iv1 = alloca %struct.iovec*, align 8
  store i8* %buf, i8** %1, align 8
  store i64 %size, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = icmp ne i8* %3, null
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %0
  %6 = load i64* %2, align 8
  %7 = trunc i64 %6 to i32
  %8 = call %struct.iovec* @shim_getcwd2(i32 %7)
  store %struct.iovec* %8, %struct.iovec** %res_iv, align 8
  %9 = load i8** %1, align 8
  %10 = load %struct.iovec** %res_iv, align 8
  %11 = getelementptr inbounds %struct.iovec* %10, i32 0, i32 0
  %12 = load i8** %11, align 8
  %13 = load i64* %2, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %12, i64 %13, i32 1, i1 false)
  %14 = load i8** %1, align 8
  store i8* %14, i8** %res, align 8
  br label %20

; <label>:15                                      ; preds = %0
  %16 = call %struct.iovec* @shim_getcwd2(i32 -1)
  store %struct.iovec* %16, %struct.iovec** %res_iv1, align 8
  %17 = load %struct.iovec** %res_iv1, align 8
  %18 = getelementptr inbounds %struct.iovec* %17, i32 0, i32 0
  %19 = load i8** %18, align 8
  store i8* %19, i8** %res, align 8
  br label %20

; <label>:20                                      ; preds = %15, %5
  %21 = load i8** %res, align 8
  ret i8* %21
}

define hidden void @cgi_php_import_environment_variables(%struct._zval_struct* %array_ptr) nounwind uwtable {
  %pos = alloca %struct.bucket*, align 8
  %var = alloca i8*, align 8
  %val = alloca i8**, align 8
  %var_len = alloca i32, align 4
  %idx = alloca i64, align 8
  %new_val_len = alloca i32, align 4
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %array_ptr}, i64 0, metadata !670), !dbg !1647
  %1 = load %struct._zval_struct** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 44, i64 4), align 8, !dbg !1648, !tbaa !1649
  %2 = icmp eq %struct._zval_struct* %1, null, !dbg !1648
  %3 = icmp eq %struct._zval_struct* %1, %array_ptr, !dbg !1648
  %or.cond = or i1 %2, %3, !dbg !1648
  br i1 %or.cond, label %26, label %4, !dbg !1648

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct._zval_struct* %1, i64 0, i32 2, !dbg !1648
  %6 = load i8* %5, align 1, !dbg !1648, !tbaa !1650
  %7 = icmp eq i8 %6, 4, !dbg !1648
  br i1 %7, label %8, label %26, !dbg !1648

; <label>:8                                       ; preds = %4
  %9 = bitcast %struct._zval_struct* %1 to %struct._hashtable**, !dbg !1652
  %10 = load %struct._hashtable** %9, align 8, !dbg !1652, !tbaa !1649
  %11 = call i32 @zend_hash_num_elements(%struct._hashtable* %10) nounwind, !dbg !1652
  %12 = icmp sgt i32 %11, 0, !dbg !1652
  br i1 %12, label %13, label %26, !dbg !1652

; <label>:13                                      ; preds = %8
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %array_ptr}, i64 0, metadata !1653) nounwind, !dbg !1656
  %14 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 2, !dbg !1657
  %15 = load i8* %14, align 1, !dbg !1657, !tbaa !1650
  %16 = icmp ult i8 %15, 4, !dbg !1657
  br i1 %16, label %_zval_dtor.exit, label %17, !dbg !1657

; <label>:17                                      ; preds = %13
  call void @_zval_dtor_func(%struct._zval_struct* %array_ptr) nounwind, !dbg !1659
  br label %_zval_dtor.exit, !dbg !1660

_zval_dtor.exit:                                  ; preds = %17, %13
  %18 = load %struct._zval_struct** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 44, i64 4), align 8, !dbg !1661, !tbaa !1649
  %19 = bitcast %struct._zval_struct* %array_ptr to i8*, !dbg !1661
  %20 = bitcast %struct._zval_struct* %18 to i8*, !dbg !1661
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 24, i32 8, i1 false), !dbg !1661
  %21 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 1, !dbg !1662
  store i32 1, i32* %21, align 4, !dbg !1662, !tbaa !1663
  %22 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 3, !dbg !1662
  store i8 0, i8* %22, align 1, !dbg !1662, !tbaa !1650
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %array_ptr}, i64 0, metadata !1664) nounwind, !dbg !1666
  %23 = load i8* %14, align 1, !dbg !1667, !tbaa !1650
  %24 = icmp ult i8 %23, 4, !dbg !1667
  br i1 %24, label %_zval_copy_ctor.exit, label %25, !dbg !1667

; <label>:25                                      ; preds = %_zval_dtor.exit
  call void @_zval_copy_ctor_func(%struct._zval_struct* %array_ptr) nounwind, !dbg !1669
  br label %_zval_copy_ctor.exit, !dbg !1670

; <label>:26                                      ; preds = %8, %4, %0
  %27 = load %struct._zval_struct** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 44, i64 3), align 8, !dbg !1671, !tbaa !1649
  %28 = icmp eq %struct._zval_struct* %27, null, !dbg !1671
  %29 = icmp eq %struct._zval_struct* %27, %array_ptr, !dbg !1671
  %or.cond1 = or i1 %28, %29, !dbg !1671
  br i1 %or.cond1, label %52, label %30, !dbg !1671

; <label>:30                                      ; preds = %26
  %31 = getelementptr inbounds %struct._zval_struct* %27, i64 0, i32 2, !dbg !1671
  %32 = load i8* %31, align 1, !dbg !1671, !tbaa !1650
  %33 = icmp eq i8 %32, 4, !dbg !1671
  br i1 %33, label %34, label %52, !dbg !1671

; <label>:34                                      ; preds = %30
  %35 = bitcast %struct._zval_struct* %27 to %struct._hashtable**, !dbg !1672
  %36 = load %struct._hashtable** %35, align 8, !dbg !1672, !tbaa !1649
  %37 = call i32 @zend_hash_num_elements(%struct._hashtable* %36) nounwind, !dbg !1672
  %38 = icmp sgt i32 %37, 0, !dbg !1672
  br i1 %38, label %39, label %52, !dbg !1672

; <label>:39                                      ; preds = %34
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %array_ptr}, i64 0, metadata !1673) nounwind, !dbg !1676
  %40 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 2, !dbg !1677
  %41 = load i8* %40, align 1, !dbg !1677, !tbaa !1650
  %42 = icmp ult i8 %41, 4, !dbg !1677
  br i1 %42, label %_zval_dtor.exit2, label %43, !dbg !1677

; <label>:43                                      ; preds = %39
  call void @_zval_dtor_func(%struct._zval_struct* %array_ptr) nounwind, !dbg !1678
  br label %_zval_dtor.exit2, !dbg !1679

_zval_dtor.exit2:                                 ; preds = %43, %39
  %44 = load %struct._zval_struct** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 44, i64 3), align 8, !dbg !1680, !tbaa !1649
  %45 = bitcast %struct._zval_struct* %array_ptr to i8*, !dbg !1680
  %46 = bitcast %struct._zval_struct* %44 to i8*, !dbg !1680
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 24, i32 8, i1 false), !dbg !1680
  %47 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 1, !dbg !1681
  store i32 1, i32* %47, align 4, !dbg !1681, !tbaa !1663
  %48 = getelementptr inbounds %struct._zval_struct* %array_ptr, i64 0, i32 3, !dbg !1681
  store i8 0, i8* %48, align 1, !dbg !1681, !tbaa !1650
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %array_ptr}, i64 0, metadata !1682) nounwind, !dbg !1684
  %49 = load i8* %40, align 1, !dbg !1685, !tbaa !1650
  %50 = icmp ult i8 %49, 4, !dbg !1685
  br i1 %50, label %_zval_copy_ctor.exit, label %51, !dbg !1685

; <label>:51                                      ; preds = %_zval_dtor.exit2
  call void @_zval_copy_ctor_func(%struct._zval_struct* %array_ptr) nounwind, !dbg !1686
  br label %_zval_copy_ctor.exit, !dbg !1687

; <label>:52                                      ; preds = %34, %30, %26
  %53 = load void (%struct._zval_struct*)** @php_php_import_environment_variables, align 8, !dbg !1688, !tbaa !1649
  call void %53(%struct._zval_struct* %array_ptr) nounwind, !dbg !1688
  %54 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1689
  %55 = icmp eq i32 %54, 0, !dbg !1689
  br i1 %55, label %_zval_copy_ctor.exit, label %56, !dbg !1689

; <label>:56                                      ; preds = %52
  %57 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !1690, !tbaa !1649
  call void @llvm.dbg.declare(metadata !952, metadata !708), !dbg !1691
  %58 = load i8* getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 0), align 8, !dbg !1692, !tbaa !1650
  call void @llvm.dbg.declare(metadata !952, metadata !710), !dbg !1693
  call void @llvm.dbg.declare(metadata !952, metadata !711), !dbg !1694
  call void @llvm.dbg.declare(metadata !952, metadata !712), !dbg !1695
  call void @llvm.dbg.declare(metadata !952, metadata !713), !dbg !1696
  %59 = load %struct._zval_struct** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 44, i64 4), align 8, !dbg !1697, !tbaa !1649
  %60 = icmp eq %struct._zval_struct* %59, %array_ptr, !dbg !1697
  %61 = select i1 %60, i32 4, i32 5, !dbg !1697
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !714), !dbg !1697
  store i8 0, i8* getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 0), align 8, !dbg !1698, !tbaa !1650
  %62 = getelementptr inbounds i8* %57, i64 8256, !dbg !1699
  %63 = bitcast i8* %62 to %struct._hashtable**, !dbg !1699
  %64 = load %struct._hashtable** %63, align 8, !dbg !1699, !tbaa !1649
  call void @zend_hash_internal_pointer_reset_ex(%struct._hashtable* %64, %struct.bucket** %pos) nounwind, !dbg !1699
  %65 = bitcast i8*** %val to i8**, !dbg !1700
  br label %66, !dbg !1699

; <label>:66                                      ; preds = %88, %56
  %67 = load %struct._hashtable** %63, align 8, !dbg !1701, !tbaa !1649
  %68 = call i32 @zend_hash_get_current_key_ex(%struct._hashtable* %67, i8** %var, i32* %var_len, i64* %idx, i8 zeroext 0, %struct.bucket** %pos) nounwind, !dbg !1701
  %69 = icmp eq i32 %68, 1, !dbg !1701
  br i1 %69, label %70, label %.critedge, !dbg !1701

; <label>:70                                      ; preds = %66
  %71 = load %struct._hashtable** %63, align 8, !dbg !1700, !tbaa !1649
  %72 = call i32 @zend_hash_get_current_data_ex(%struct._hashtable* %71, i8** %65, %struct.bucket** %pos) nounwind, !dbg !1700
  %73 = icmp eq i32 %72, 0, !dbg !1700
  br i1 %73, label %74, label %.critedge

; <label>:74                                      ; preds = %70
  call void @llvm.dbg.declare(metadata !952, metadata !715), !dbg !1702
  %75 = load i32 (i32, i8*, i8**, i32, i32*)** getelementptr inbounds (%struct._sapi_module_struct* @sapi_module, i64 0, i32 31), align 8, !dbg !1703, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1703
  %76 = load i8** %var, align 8, !dbg !1703, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1703
  %77 = load i8*** %val, align 8, !dbg !1703, !tbaa !1649
  %78 = load i8** %77, align 8, !dbg !1704, !tbaa !1649
  %79 = call i64 @strlen(i8* %78) nounwind readonly, !dbg !1704
  %80 = trunc i64 %79 to i32, !dbg !1704
  %81 = call i32 %75(i32 %61, i8* %76, i8** %77, i32 %80, i32* %new_val_len) nounwind, !dbg !1704
  %82 = icmp eq i32 %81, 0, !dbg !1704
  br i1 %82, label %88, label %83, !dbg !1704

; <label>:83                                      ; preds = %74
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !710), !dbg !1705
  %84 = load i8** %var, align 8, !dbg !1705, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !711), !dbg !1705
  %85 = load i8*** %val, align 8, !dbg !1705, !tbaa !1649
  %86 = load i8** %85, align 8, !dbg !1705, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !715), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !715), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !715), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !715), !dbg !1705
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !715), !dbg !1705
  %87 = load i32* %new_val_len, align 4, !dbg !1705, !tbaa !1663
  call void @php_register_variable_safe(i8* %84, i8* %86, i32 %87, %struct._zval_struct* %array_ptr) nounwind, !dbg !1705
  br label %88, !dbg !1707

; <label>:88                                      ; preds = %83, %74
  %89 = load %struct._hashtable** %63, align 8, !dbg !1708, !tbaa !1649
  %90 = call i32 @zend_hash_move_forward_ex(%struct._hashtable* %89, %struct.bucket** %pos) nounwind, !dbg !1708
  br label %66, !dbg !1708

.critedge:                                        ; preds = %70, %66
  store i8 %58, i8* getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 0), align 8, !dbg !1709, !tbaa !1650
  br label %_zval_copy_ctor.exit, !dbg !1710

_zval_copy_ctor.exit:                             ; preds = %.critedge, %52, %51, %_zval_dtor.exit2, %25, %_zval_dtor.exit
  ret void, !dbg !1711
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @zend_hash_num_elements(%struct._hashtable*)

declare i32 @fcgi_is_fastcgi()

declare void @zend_hash_internal_pointer_reset_ex(%struct._hashtable*, %struct.bucket**)

declare i32 @zend_hash_get_current_key_ex(%struct._hashtable*, i8**, i32*, i64*, i8 zeroext, %struct.bucket**)

declare i32 @zend_hash_get_current_data_ex(%struct._hashtable*, i8**, %struct.bucket**)

declare void @php_register_variable_safe(i8*, i8*, i32, %struct._zval_struct*)

declare i32 @zend_hash_move_forward_ex(%struct._hashtable*, %struct.bucket**)

define hidden void @fastcgi_cleanup(i32 %signal) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i32 %signal}, i64 0, metadata !723), !dbg !1712
  %1 = tail call i32 @sigaction(i32 15, %struct.sigaction* @old_term, %struct.sigaction* null) nounwind, !dbg !1713
  %2 = load i32* @pgroup, align 4, !dbg !1715, !tbaa !1663
  %3 = sub nsw i32 0, %2, !dbg !1715
  %4 = tail call i32 @kill(i32 %3, i32 15) nounwind, !dbg !1715
  %.b = load i1* @parent.b, align 1
  %5 = xor i1 %.b, true, !dbg !1716
  %.b2 = load i1* @parent_waiting.b, align 1
  %or.cond = and i1 %.b2, %5, !dbg !1716
  br i1 %or.cond, label %6, label %7, !dbg !1716

; <label>:6                                       ; preds = %0
  store i1 true, i1* @exit_signal.b, align 1
  ret void, !dbg !1717

; <label>:7                                       ; preds = %0
  tail call void @exit(i32 0) noreturn nounwind, !dbg !1718
  unreachable, !dbg !1718
}

declare i32 @sigaction(i32, %struct.sigaction*, %struct.sigaction*)

declare i32 @kill(i32, i32)

declare void @exit(i32) noreturn

define hidden i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
  call void @cw_act(i32 8)
  %sorted_exts.i = alloca %struct._zend_llist, align 8
  %sorted_registry.i = alloca %struct._hashtable, align 8
  %tmp.i = alloca %struct._zend_module_entry, align 8
  %st.i = alloca %struct.stat, align 8
  %file_handle = alloca %struct._zend_file_handle, align 8
  %request = alloca %struct._fcgi_request, align 8
  %start = alloca %struct.timeval, align 8
  %end = alloca %struct.timeval, align 8
  %status = alloca i32, align 4
  %__bailout = alloca [1 x %struct._sigjmp_buf], align 16
  %__bailout3 = alloca [1 x %struct._sigjmp_buf], align 16
  %__bailout5 = alloca [1 x %struct._sigjmp_buf], align 16
  %syntax_highlighter_ini = alloca %struct._zend_syntax_highlighter_ini, align 8
  call void @llvm.dbg.value(metadata !{i32 %argc}, i64 0, metadata !729), !dbg !1720
  call void @llvm.dbg.value(metadata !{i8** %argv}, i64 0, metadata !730), !dbg !1721
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !731), !dbg !1722
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !733), !dbg !1723
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !734), !dbg !1724
  call void @llvm.dbg.declare(metadata !952, metadata !738), !dbg !1725
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !849), !dbg !1727
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !850), !dbg !1728
  %1 = load i32* @php_optind, align 4, !dbg !1729, !tbaa !1663
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !851), !dbg !1729
  %2 = load i8** @php_optarg, align 8, !dbg !1730, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !852), !dbg !1730
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !853), !dbg !1732
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !854), !dbg !1733
  call void @llvm.dbg.value(metadata !1734, i64 0, metadata !855), !dbg !1735
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !856), !dbg !1736
  %3 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1737
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !857), !dbg !1737
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !858), !dbg !1738
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !859), !dbg !1739
  call void @llvm.dbg.declare(metadata !952, metadata !860), !dbg !1740
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !861), !dbg !1741
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !862), !dbg !1742
  call void @llvm.dbg.declare(metadata !952, metadata !863), !dbg !1743
  call void @llvm.dbg.declare(metadata !952, metadata !873), !dbg !1744
  call void @llvm.dbg.declare(metadata !952, metadata !874), !dbg !1745
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !874), !dbg !1746
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !874), !dbg !1746
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !874), !dbg !1746
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !874), !dbg !1746
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !874), !dbg !1746
  store i32 0, i32* %status, align 4, !dbg !1746, !tbaa !1663
  %4 = call void (i32)* (i32, void (i32)*)* @signal(i32 13, void (i32)* inttoptr (i64 1 to void (i32)*)) nounwind, !dbg !1747
  call void @sapi_startup(%struct._sapi_module_struct* @cgi_sapi_module) nounwind, !dbg !1748
  store i8* null, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 20), align 8, !dbg !1749, !tbaa !1649
  %5 = icmp ne i32 %3, 0, !dbg !1750
  br i1 %5, label %.preheader111, label %6, !dbg !1750

; <label>:6                                       ; preds = %0
  %7 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !1751
  %8 = icmp eq i8* %7, null, !dbg !1751
  br i1 %8, label %9, label %18, !dbg !1751

; <label>:9                                       ; preds = %6
  %10 = call i8* @getenv(i8* getelementptr inbounds ([12 x i8]* @.str18, i64 0, i64 0)) nounwind, !dbg !1753
  %11 = icmp eq i8* %10, null, !dbg !1753
  br i1 %11, label %12, label %18, !dbg !1753

; <label>:12                                      ; preds = %9
  %13 = call i8* @getenv(i8* getelementptr inbounds ([18 x i8]* @.str29, i64 0, i64 0)) nounwind, !dbg !1754
  %14 = icmp eq i8* %13, null, !dbg !1754
  br i1 %14, label %15, label %18, !dbg !1754

; <label>:15                                      ; preds = %12
  %16 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8]* @.str310, i64 0, i64 0)) nounwind, !dbg !1755
  %17 = icmp eq i8* %16, null, !dbg !1755
  br i1 %17, label %.preheader111, label %18, !dbg !1755

; <label>:18                                      ; preds = %15, %12, %9, %6
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !734), !dbg !1756
  br label %.preheader111, !dbg !1758

.preheader111:                                    ; preds = %18, %15, %0
  %cgi.0.ph = phi i32 [ 0, %15 ], [ 0, %0 ], [ 1, %18 ]
  br label %.backedge112, !dbg !1759

.backedge112:                                     ; preds = %105, %102, %101, %88, %75, %45, %27, %24, %.backedge112, %.preheader111
  %bindpath.0 = phi i8* [ null, %.preheader111 ], [ %bindpath.0, %105 ], [ %bindpath.0, %101 ], [ %104, %102 ], [ %bindpath.0, %75 ], [ %bindpath.0, %45 ], [ %bindpath.0, %88 ], [ %bindpath.0, %27 ], [ %bindpath.0, %24 ], [ %bindpath.0, %.backedge112 ]
  %ini_entries_len.0 = phi i32 [ 0, %.preheader111 ], [ %ini_entries_len.0, %105 ], [ %ini_entries_len.0, %101 ], [ %ini_entries_len.0, %102 ], [ %87, %75 ], [ %74, %45 ], [ %100, %88 ], [ %ini_entries_len.0, %27 ], [ %ini_entries_len.0, %24 ], [ %ini_entries_len.0, %.backedge112 ]
  %behavior.0 = phi i32 [ 1, %.preheader111 ], [ 2, %105 ], [ %behavior.0, %101 ], [ %behavior.0, %102 ], [ %behavior.0, %75 ], [ %behavior.0, %45 ], [ %behavior.0, %88 ], [ %behavior.0, %27 ], [ %behavior.0, %24 ], [ %behavior.0, %.backedge112 ]
  %19 = call i32 @php_getopt(i32 %argc, i8** %argv, %struct._opt_struct* getelementptr inbounds ([21 x %struct._opt_struct]* @OPTIONS, i64 0, i64 0), i8** @php_optarg, i32* @php_optind, i32 0, i32 2) nounwind, !dbg !1759
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !735), !dbg !1759
  switch i32 %19, label %.backedge112 [
    i32 -1, label %106
    i32 99, label %20
    i32 110, label %27
    i32 100, label %28
    i32 98, label %101
    i32 115, label %105
  ], !dbg !1759

; <label>:20                                      ; preds = %.backedge112
  %21 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 20), align 8, !dbg !1760, !tbaa !1649
  %22 = icmp eq i8* %21, null, !dbg !1760
  br i1 %22, label %24, label %23, !dbg !1760

; <label>:23                                      ; preds = %20
  call void @free(i8* %21), !dbg !1761
  br label %24, !dbg !1763

; <label>:24                                      ; preds = %23, %20
  %25 = load i8** @php_optarg, align 8, !dbg !1764, !tbaa !1649
  %26 = call noalias i8* @strdup(i8* %25) nounwind, !dbg !1764
  store i8* %26, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 20), align 8, !dbg !1764, !tbaa !1649
  br label %.backedge112, !dbg !1765

; <label>:27                                      ; preds = %.backedge112
  store i32 1, i32* getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 26), align 8, !dbg !1766, !tbaa !1663
  br label %.backedge112, !dbg !1767

; <label>:28                                      ; preds = %.backedge112
  %29 = load i8** @php_optarg, align 8, !dbg !1768, !tbaa !1649
  %30 = call i64 @strlen(i8* %29) nounwind readonly, !dbg !1768
  %31 = trunc i64 %30 to i32, !dbg !1768
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !875), !dbg !1768
  %32 = call i8* @strchr(i8* %29, i32 61) nounwind readonly, !dbg !1769
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !879), !dbg !1769
  %33 = icmp eq i8* %32, null, !dbg !1769
  br i1 %33, label %88, label %34, !dbg !1769

; <label>:34                                      ; preds = %28
  %35 = getelementptr inbounds i8* %32, i64 1, !dbg !1770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !879), !dbg !1770
  %36 = load i8* %35, align 1, !dbg !1772, !tbaa !1650
  %37 = sext i8 %36 to i32, !dbg !1772
  tail call void @llvm.dbg.value(metadata !1773, i64 0, metadata !1774), !dbg !1775
  tail call void @llvm.dbg.value(metadata !1773, i64 0, metadata !1776), !dbg !1779
  %38 = icmp sgt i8 %36, -1, !dbg !1780
  %39 = load i32* @__mb_sb_limit, align 4, !dbg !1780, !tbaa !1663
  %40 = icmp sgt i32 %39, %37, !dbg !1780
  %or.cond.i.i = and i1 %38, %40, !dbg !1780
  br i1 %or.cond.i.i, label %__sbistype.exit, label %.critedge49, !dbg !1780

__sbistype.exit:                                  ; preds = %34
  %41 = sext i8 %36 to i64, !dbg !1780
  %42 = load %struct._RuneLocale** @_CurrentRuneLocale, align 8, !dbg !1780, !tbaa !1649
  %43 = getelementptr inbounds %struct._RuneLocale* %42, i64 0, i32 5, i64 %41, !dbg !1780
  %44 = load i64* %43, align 8, !dbg !1780, !tbaa !1782
  %phitmp.i.i = and i64 %44, 1280, !dbg !1780
  %phitmp.i = icmp eq i64 %phitmp.i.i, 0, !dbg !1780
  br i1 %phitmp.i, label %.critedge49, label %75, !dbg !1772

.critedge49:                                      ; preds = %__sbistype.exit, %34
  switch i8 %36, label %45 [
    i8 34, label %75
    i8 39, label %75
    i8 0, label %75
  ], !dbg !1772

; <label>:45                                      ; preds = %.critedge49
  %46 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1783, !tbaa !1649
  %47 = add nsw i32 %31, %ini_entries_len.0, !dbg !1783
  %48 = sext i32 %47 to i64, !dbg !1783
  %49 = add i64 %48, 5, !dbg !1783
  %50 = call i8* @realloc(i8* %46, i64 %49) nounwind, !dbg !1783
  store i8* %50, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1783, !tbaa !1649
  %51 = sext i32 %ini_entries_len.0 to i64, !dbg !1785
  %52 = getelementptr inbounds i8* %50, i64 %51, !dbg !1785
  %53 = load i8** @php_optarg, align 8, !dbg !1785, !tbaa !1649
  %54 = ptrtoint i8* %35 to i64, !dbg !1785
  %55 = ptrtoint i8* %53 to i64, !dbg !1785
  %56 = sub i64 %54, %55, !dbg !1785
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %53, i64 %56, i32 1, i1 false), !dbg !1785
  %57 = add i64 %54, %51, !dbg !1786
  %58 = sub i64 %57, %55, !dbg !1786
  %59 = trunc i64 %58 to i32, !dbg !1786
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !854), !dbg !1786
  %60 = sext i32 %59 to i64, !dbg !1787
  %61 = getelementptr inbounds i8* %50, i64 %60, !dbg !1787
  store i8 34, i8* %61, align 1, !dbg !1787
  %62 = add nsw i32 %59, 1, !dbg !1788
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !854), !dbg !1788
  %63 = sext i32 %62 to i64, !dbg !1789
  %64 = getelementptr inbounds i8* %50, i64 %63, !dbg !1789
  %65 = sext i32 %31 to i64, !dbg !1789
  %66 = sub i64 %65, %54, !dbg !1789
  %67 = add i64 %66, %55, !dbg !1789
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %64, i8* %35, i64 %67, i32 1, i1 false), !dbg !1789
  %68 = add i64 %66, %63, !dbg !1790
  %69 = add i64 %68, %55, !dbg !1790
  %sext24 = shl i64 %69, 32, !dbg !1791
  %70 = ashr exact i64 %sext24, 32, !dbg !1791
  %71 = getelementptr inbounds i8* %50, i64 %70, !dbg !1791
  %72 = bitcast i8* %71 to i32*, !dbg !1791
  store i32 2594, i32* %72, align 1, !dbg !1791
  %73 = add i64 %70, 2, !dbg !1792
  %74 = trunc i64 %73 to i32, !dbg !1792
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !854), !dbg !1792
  br label %.backedge112, !dbg !1793

; <label>:75                                      ; preds = %.critedge49, %.critedge49, %.critedge49, %__sbistype.exit
  %76 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1794, !tbaa !1649
  %77 = add nsw i32 %31, %ini_entries_len.0, !dbg !1794
  %78 = sext i32 %77 to i64, !dbg !1794
  %79 = add i64 %78, 3, !dbg !1794
  %80 = call i8* @realloc(i8* %76, i64 %79) nounwind, !dbg !1794
  store i8* %80, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1794, !tbaa !1649
  %81 = sext i32 %ini_entries_len.0 to i64, !dbg !1796
  %82 = getelementptr inbounds i8* %80, i64 %81, !dbg !1796
  %83 = load i8** @php_optarg, align 8, !dbg !1796, !tbaa !1649
  %84 = sext i32 %31 to i64, !dbg !1796
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %82, i8* %83, i64 %84, i32 1, i1 false), !dbg !1796
  %.sum23 = add i64 %84, %81, !dbg !1797
  %85 = getelementptr inbounds i8* %80, i64 %.sum23, !dbg !1797
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %85, i8* getelementptr inbounds ([3 x i8]* @.str611, i64 0, i64 0), i64 3, i32 1, i1 false), !dbg !1797
  %86 = add i32 %ini_entries_len.0, 1, !dbg !1798
  %87 = add i32 %86, %31, !dbg !1798
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !854), !dbg !1798
  br label %.backedge112

; <label>:88                                      ; preds = %28
  %89 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1799, !tbaa !1649
  %90 = add nsw i32 %31, %ini_entries_len.0, !dbg !1799
  %91 = sext i32 %90 to i64, !dbg !1799
  %92 = add i64 %91, 5, !dbg !1799
  %93 = call i8* @realloc(i8* %89, i64 %92) nounwind, !dbg !1799
  store i8* %93, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !1799, !tbaa !1649
  %94 = sext i32 %ini_entries_len.0 to i64, !dbg !1801
  %95 = getelementptr inbounds i8* %93, i64 %94, !dbg !1801
  %96 = load i8** @php_optarg, align 8, !dbg !1801, !tbaa !1649
  %97 = sext i32 %31 to i64, !dbg !1801
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %95, i8* %96, i64 %97, i32 1, i1 false), !dbg !1801
  %.sum = add i64 %97, %94, !dbg !1802
  %98 = getelementptr inbounds i8* %93, i64 %.sum, !dbg !1802
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %98, i8* getelementptr inbounds ([5 x i8]* @.str712, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !1802
  %99 = add i32 %ini_entries_len.0, 3, !dbg !1803
  %100 = add i32 %99, %31, !dbg !1803
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !854), !dbg !1803
  br label %.backedge112

; <label>:101                                     ; preds = %.backedge112
  br i1 %5, label %.backedge112, label %102, !dbg !1804

; <label>:102                                     ; preds = %101
  %103 = load i8** @php_optarg, align 8, !dbg !1805, !tbaa !1649
  %104 = call noalias i8* @strdup(i8* %103) nounwind, !dbg !1805
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !858), !dbg !1805
  br label %.backedge112, !dbg !1807

; <label>:105                                     ; preds = %.backedge112
  call void @llvm.dbg.value(metadata !1808, i64 0, metadata !849), !dbg !1809
  br label %.backedge112, !dbg !1810

; <label>:106                                     ; preds = %.backedge112
  store i32 %1, i32* @php_optind, align 4, !dbg !1811, !tbaa !1663
  store i8* %2, i8** @php_optarg, align 8, !dbg !1812, !tbaa !1649
  %107 = load i8** %argv, align 8, !dbg !1813, !tbaa !1649
  store i8* %107, i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 25), align 8, !dbg !1813, !tbaa !1649
  %108 = icmp ne i32 %cgi.0.ph, 0, !dbg !1814
  %109 = or i32 %cgi.0.ph, %3, !dbg !1814
  %brmerge.not = icmp eq i32 %109, 0, !dbg !1814
  %110 = icmp eq i8* %bindpath.0, null, !dbg !1814
  %or.cond25 = and i1 %brmerge.not, %110, !dbg !1814
  br i1 %or.cond25, label %111, label %112, !dbg !1814

; <label>:111                                     ; preds = %106
  store %struct._zend_function_entry* getelementptr inbounds ([2 x %struct._zend_function_entry]* @additional_functions, i64 0, i64 0), %struct._zend_function_entry** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 35), align 8, !dbg !1815, !tbaa !1649
  br label %112, !dbg !1817

; <label>:112                                     ; preds = %111, %106
  %113 = load i32 (%struct._sapi_module_struct*)** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 2), align 8, !dbg !1818, !tbaa !1649
  %114 = call i32 %113(%struct._sapi_module_struct* @cgi_sapi_module) nounwind, !dbg !1818
  %115 = icmp eq i32 %114, -1, !dbg !1818
  br i1 %115, label %.loopexit74, label %116, !dbg !1818

; <label>:116                                     ; preds = %112
  %.not = xor i1 %108, true, !dbg !1819
  %117 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 4), align 4, !dbg !1819, !tbaa !1650
  %118 = icmp eq i8 %117, 0, !dbg !1819
  %or.cond27 = or i1 %118, %.not, !dbg !1819
  br i1 %or.cond27, label %140, label %119, !dbg !1819

; <label>:119                                     ; preds = %116
  %120 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str8, i64 0, i64 0)) nounwind, !dbg !1820
  %121 = icmp eq i8* %120, null, !dbg !1820
  br i1 %121, label %122, label %140, !dbg !1820

; <label>:122                                     ; preds = %119
  %123 = call i8* @getenv(i8* getelementptr inbounds ([21 x i8]* @.str9, i64 0, i64 0)) nounwind, !dbg !1821
  %124 = icmp eq i8* %123, null, !dbg !1821
  br i1 %124, label %125, label %140, !dbg !1821

; <label>:125                                     ; preds = %122
  %126 = load i8** getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 7), align 8, !dbg !1821, !tbaa !1649
  %127 = icmp eq i8* %126, null, !dbg !1821
  br i1 %127, label %131, label %128, !dbg !1821

; <label>:128                                     ; preds = %125
  %129 = call i8* @getenv(i8* %126) nounwind, !dbg !1822
  %130 = icmp eq i8* %129, null, !dbg !1822
  br i1 %130, label %131, label %140, !dbg !1822

; <label>:131                                     ; preds = %128, %125
  %132 = load [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1823, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !880), !dbg !1823
  call void @llvm.dbg.declare(metadata !952, metadata !894), !dbg !1823
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !894), !dbg !1823
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !894), !dbg !1823
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !894), !dbg !1823
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !894), !dbg !1823
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !894), !dbg !1823
  store [1 x %struct._sigjmp_buf]* %__bailout, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1823, !tbaa !1649
  %133 = getelementptr inbounds [1 x %struct._sigjmp_buf]* %__bailout, i64 0, i64 0, !dbg !1823
  %134 = call i32 @sigsetjmp(%struct._sigjmp_buf* %133, i32 0) nounwind returns_twice, !dbg !1823
  %135 = icmp eq i32 %134, 0, !dbg !1823
  br i1 %135, label %136, label %138, !dbg !1823

; <label>:136                                     ; preds = %131
  store i32 400, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !1824, !tbaa !1663
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !895), !dbg !1825
  %137 = call i32 @php_body_write(i8* getelementptr inbounds ([644 x i8]* @.str10, i64 0, i64 0), i32 643) nounwind, !dbg !1825
  br label %139, !dbg !1826

; <label>:138                                     ; preds = %131
  store [1 x %struct._sigjmp_buf]* %132, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1827, !tbaa !1649
  br label %139

; <label>:139                                     ; preds = %138, %136
  store [1 x %struct._sigjmp_buf]* %132, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1829, !tbaa !1649
  br label %.loopexit74, !dbg !1830

; <label>:140                                     ; preds = %128, %122, %119, %116
  %141 = icmp ne i8* %bindpath.0, null, !dbg !1831
  br i1 %141, label %142, label %150, !dbg !1831

; <label>:142                                     ; preds = %140
  %143 = call i32 @fcgi_listen(i8* %bindpath.0, i32 128) nounwind, !dbg !1832
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !859), !dbg !1832
  %144 = icmp slt i32 %143, 0, !dbg !1834
  br i1 %144, label %145, label %148, !dbg !1834

; <label>:145                                     ; preds = %142
  %146 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1835, !tbaa !1649
  %147 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %146, i8* getelementptr inbounds ([50 x i8]* @.str11, i64 0, i64 0), i8* %bindpath.0) nounwind, !dbg !1835
  br label %.loopexit74, !dbg !1837

; <label>:148                                     ; preds = %142
  %149 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1838
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !857), !dbg !1838
  br label %150, !dbg !1839

; <label>:150                                     ; preds = %148, %140
  %fcgi_fd.0 = phi i32 [ %143, %148 ], [ 0, %140 ]
  %fastcgi.0 = phi i32 [ %149, %148 ], [ %3, %140 ]
  %151 = icmp ne i32 %fastcgi.0, 0, !dbg !1840
  br i1 %151, label %152, label %.loopexit, !dbg !1840

; <label>:152                                     ; preds = %150
  %153 = call i8* @getenv(i8* getelementptr inbounds ([22 x i8]* @.str12, i64 0, i64 0)) nounwind, !dbg !1841
  %154 = icmp eq i8* %153, null, !dbg !1841
  br i1 %154, label %161, label %155, !dbg !1841

; <label>:155                                     ; preds = %152
  %156 = call i32 @atoi(i8* %153) nounwind, !dbg !1842
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !855), !dbg !1842
  %157 = icmp slt i32 %156, 0, !dbg !1844
  br i1 %157, label %158, label %161, !dbg !1844

; <label>:158                                     ; preds = %155
  %159 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1845, !tbaa !1649
  %160 = call i64 @fwrite(i8* getelementptr inbounds ([36 x i8]* @.str13, i64 0, i64 0), i64 35, i64 1, %struct.__sFILE* %159), !dbg !1845
  br label %.loopexit74, !dbg !1847

; <label>:161                                     ; preds = %155, %152
  %max_requests.0 = phi i32 [ %156, %155 ], [ 500, %152 ]
  %162 = load void (%struct._zval_struct*)** @php_import_environment_variables, align 8, !dbg !1848, !tbaa !1649
  store void (%struct._zval_struct*)* %162, void (%struct._zval_struct*)** @php_php_import_environment_variables, align 8, !dbg !1848, !tbaa !1649
  store void (%struct._zval_struct*)* @cgi_php_import_environment_variables, void (%struct._zval_struct*)** @php_import_environment_variables, align 8, !dbg !1849, !tbaa !1649
  call void @fcgi_init_request(%struct._fcgi_request* %request, i32 %fcgi_fd.0) nounwind, !dbg !1850
  %163 = call i8* @getenv(i8* getelementptr inbounds ([18 x i8]* @.str14, i64 0, i64 0)) nounwind, !dbg !1851
  %164 = icmp eq i8* %163, null, !dbg !1851
  br i1 %164, label %.thread, label %165, !dbg !1851

; <label>:165                                     ; preds = %161
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !899), !dbg !1852
  %166 = call i32 @atoi(i8* %163) nounwind, !dbg !1853
  %167 = icmp slt i32 %166, 0, !dbg !1854
  br i1 %167, label %168, label %171, !dbg !1854

; <label>:168                                     ; preds = %165
  %169 = load %struct.__sFILE** @__stderrp, align 8, !dbg !1855, !tbaa !1649
  %170 = call i64 @fwrite(i8* getelementptr inbounds ([32 x i8]* @.str15, i64 0, i64 0), i64 31, i64 1, %struct.__sFILE* %169), !dbg !1855
  br label %.loopexit74, !dbg !1857

.thread:                                          ; preds = %161
  call void @fcgi_set_mgmt_var(i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i64 14, i8* getelementptr inbounds ([2 x i8]* @.str1813, i64 0, i64 0), i64 1) nounwind, !dbg !1858
  call void @fcgi_set_mgmt_var(i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i64 13, i8* getelementptr inbounds ([2 x i8]* @.str1813, i64 0, i64 0), i64 1) nounwind, !dbg !1860
  br label %207, !dbg !1861

; <label>:171                                     ; preds = %165
  %172 = call i64 @strlen(i8* %163) nounwind readonly, !dbg !1862
  call void @fcgi_set_mgmt_var(i8* getelementptr inbounds ([15 x i8]* @.str16, i64 0, i64 0), i64 14, i8* %163, i64 %172) nounwind, !dbg !1862
  %173 = call i64 @strlen(i8* %163) nounwind readonly, !dbg !1863
  call void @fcgi_set_mgmt_var(i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i64 13, i8* %163, i64 %173) nounwind, !dbg !1863
  %174 = icmp eq i32 %166, 0, !dbg !1861
  br i1 %174, label %207, label %175, !dbg !1861

; <label>:175                                     ; preds = %171
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !902), !dbg !1864
  %176 = call i32 @setsid() nounwind, !dbg !1865
  %177 = call i32 @getpgrp() nounwind, !dbg !1866
  store i32 %177, i32* @pgroup, align 4, !dbg !1866, !tbaa !1663
  store i32 0, i32* getelementptr inbounds (%struct.sigaction* @act, i64 0, i32 1), align 8, !dbg !1867, !tbaa !1663
  store void (i32)* @fastcgi_cleanup, void (i32)** getelementptr inbounds (%struct.sigaction* @act, i64 0, i32 0, i32 0), align 8, !dbg !1868, !tbaa !1649
  %178 = call i32 @sigaction(i32 15, %struct.sigaction* @act, %struct.sigaction* @old_term) nounwind, !dbg !1869
  %179 = icmp eq i32 %178, 0, !dbg !1869
  br i1 %179, label %180, label %186, !dbg !1869

; <label>:180                                     ; preds = %175
  %181 = call i32 @sigaction(i32 2, %struct.sigaction* @act, %struct.sigaction* @old_int) nounwind, !dbg !1870
  %182 = icmp eq i32 %181, 0, !dbg !1870
  br i1 %182, label %183, label %186, !dbg !1870

; <label>:183                                     ; preds = %180
  %184 = call i32 @sigaction(i32 3, %struct.sigaction* @act, %struct.sigaction* @old_quit) nounwind, !dbg !1871
  %185 = icmp eq i32 %184, 0, !dbg !1871
  br i1 %185, label %187, label %186, !dbg !1871

; <label>:186                                     ; preds = %183, %180, %175
  call void @perror(i8* getelementptr inbounds ([18 x i8]* @.str19, i64 0, i64 0)) nounwind, !dbg !1872
  call void @exit(i32 1) noreturn nounwind, !dbg !1874
  unreachable, !dbg !1874

; <label>:187                                     ; preds = %183
  %188 = call i32 @fcgi_in_shutdown() nounwind, !dbg !1875
  %189 = icmp eq i32 %188, 0, !dbg !1875
  br i1 %189, label %thread-pre-split, label %.thread35, !dbg !1875

thread-pre-split:                                 ; preds = %205, %187
  %running.0.ph = phi i32 [ %206, %205 ], [ 0, %187 ]
  %.b20.pr = load i1* @parent.b, align 1
  br label %.critedge.thread

.critedge.thread:                                 ; preds = %198, %thread-pre-split
  %.b20 = phi i1 [ %.b20.pr, %thread-pre-split ], [ true, %198 ]
  %running.0 = phi i32 [ %running.0.ph, %thread-pre-split ], [ %running.2, %198 ]
  br i1 %.b20, label %.loopexit, label %.preheader, !dbg !1876

.preheader:                                       ; preds = %199, %.critedge.thread
  %running.1 = phi i32 [ %running.2, %199 ], [ %running.0, %.critedge.thread ]
  %190 = call i32 @fork() nounwind, !dbg !1877
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !904), !dbg !1877
  switch i32 %190, label %196 [
    i32 0, label %191
    i32 -1, label %195
  ], !dbg !1880

; <label>:191                                     ; preds = %.preheader
  store i1 true, i1* @parent.b, align 1
  %192 = call i32 @sigaction(i32 15, %struct.sigaction* @old_term, %struct.sigaction* null) nounwind, !dbg !1881
  %193 = call i32 @sigaction(i32 3, %struct.sigaction* @old_quit, %struct.sigaction* null) nounwind, !dbg !1883
  %194 = call i32 @sigaction(i32 2, %struct.sigaction* @old_int, %struct.sigaction* null) nounwind, !dbg !1884
  br label %198, !dbg !1885

; <label>:195                                     ; preds = %.preheader
  call void @perror(i8* getelementptr inbounds ([18 x i8]* @.str20, i64 0, i64 0)) nounwind, !dbg !1886
  call void @exit(i32 1) noreturn nounwind, !dbg !1887
  unreachable, !dbg !1887

; <label>:196                                     ; preds = %.preheader
  %197 = add nsw i32 %running.1, 1, !dbg !1888
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !902), !dbg !1888
  br label %198, !dbg !1889

; <label>:198                                     ; preds = %196, %191
  %running.2 = phi i32 [ %197, %196 ], [ %running.1, %191 ]
  %.b19 = load i1* @parent.b, align 1
  br i1 %.b19, label %.critedge.thread, label %199, !dbg !1890

; <label>:199                                     ; preds = %198
  %200 = icmp slt i32 %running.2, %166, !dbg !1890
  br i1 %200, label %.preheader, label %.critedge

.critedge:                                        ; preds = %199
  store i1 true, i1* @parent_waiting.b, align 1
  br label %201, !dbg !1891

; <label>:201                                     ; preds = %204, %.critedge
  %202 = call i32 @wait(i32* %status) nounwind, !dbg !1893
  %203 = icmp sgt i32 %202, -1, !dbg !1893
  br i1 %203, label %205, label %204, !dbg !1893

; <label>:204                                     ; preds = %201
  %.b22 = load i1* @exit_signal.b, align 1
  br i1 %.b22, label %.thread35, label %201, !dbg !1895

; <label>:205                                     ; preds = %201
  %206 = add nsw i32 %running.2, -1, !dbg !1896
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !902), !dbg !1896
  %.b21.pr = load i1* @exit_signal.b, align 1
  br i1 %.b21.pr, label %.thread35, label %thread-pre-split, !dbg !1898

; <label>:207                                     ; preds = %171, %.thread
  store i1 true, i1* @parent.b, align 1
  br label %.loopexit

.loopexit:                                        ; preds = %207, %.critedge.thread, %150
  %max_requests.1 = phi i32 [ %max_requests.0, %207 ], [ 500, %150 ], [ %max_requests.0, %.critedge.thread ]
  call void @llvm.dbg.value(metadata !1899, i64 0, metadata !908), !dbg !1900
  call void @llvm.dbg.declare(metadata !952, metadata !910), !dbg !1900
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !910), !dbg !1900
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !910), !dbg !1900
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !910), !dbg !1900
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !910), !dbg !1900
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !910), !dbg !1900
  store [1 x %struct._sigjmp_buf]* %__bailout3, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1900, !tbaa !1649
  %208 = getelementptr inbounds [1 x %struct._sigjmp_buf]* %__bailout3, i64 0, i64 0, !dbg !1900
  %209 = call i32 @sigsetjmp(%struct._sigjmp_buf* %208, i32 0) nounwind returns_twice, !dbg !1900
  %210 = icmp eq i32 %209, 0, !dbg !1900
  br i1 %210, label %.outer110, label %851, !dbg !1900

.outer110:                                        ; preds = %213, %.loopexit
  %repeats.0.ph = phi i32 [ %215, %213 ], [ 1, %.loopexit ]
  %benchmark.0.ph = phi i32 [ 1, %213 ], [ 0, %.loopexit ]
  br label %211

; <label>:211                                     ; preds = %211, %.outer110
  %212 = call i32 @php_getopt(i32 %argc, i8** %argv, %struct._opt_struct* getelementptr inbounds ([21 x %struct._opt_struct]* @OPTIONS, i64 0, i64 0), i8** @php_optarg, i32* @php_optind, i32 1, i32 2) nounwind, !dbg !1901
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !735), !dbg !1901
  switch i32 %212, label %211 [
    i32 -1, label %223
    i32 84, label %213
    i32 104, label %217
    i32 63, label %217
  ], !dbg !1901

; <label>:213                                     ; preds = %211
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !862), !dbg !1902
  %214 = load i8** @php_optarg, align 8, !dbg !1905, !tbaa !1649
  %215 = call i32 @atoi(i8* %214) nounwind, !dbg !1905
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !861), !dbg !1905
  %216 = call i32 @gettimeofday(%struct.timeval* %start, %struct.timezone* null) nounwind, !dbg !1906
  br label %.outer110, !dbg !1907

; <label>:217                                     ; preds = %211, %211
  call void @fcgi_shutdown() nounwind, !dbg !1908
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !850), !dbg !1909
  call void @php_output_startup() nounwind, !dbg !1910
  call void @php_output_activate() nounwind, !dbg !1911
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !1912, !tbaa !1650
  %218 = load i8** %argv, align 8, !dbg !1913, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1914) nounwind, !dbg !1915
  %219 = call i8* @strrchr(i8* %218, i32 47) nounwind readonly, !dbg !1916
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1917) nounwind, !dbg !1916
  %220 = icmp eq i8* %219, null, !dbg !1918
  %221 = getelementptr inbounds i8* %219, i64 1, !dbg !1919
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1917) nounwind, !dbg !1919
  %prog.0.i = select i1 %220, i8* getelementptr inbounds ([4 x i8]* @.str53, i64 0, i64 0), i8* %221, !dbg !1918
  %222 = call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([1026 x i8]* @.str54, i64 0, i64 0), i8* %prog.0.i, i8* %prog.0.i) nounwind, !dbg !1921
  call void @php_end_ob_buffers(i8 zeroext 1) nounwind, !dbg !1922
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !733), !dbg !1923
  br label %853, !dbg !1924

; <label>:223                                     ; preds = %211
  store i32 %1, i32* @php_optind, align 4, !dbg !1925, !tbaa !1663
  store i8* %2, i8** @php_optarg, align 8, !dbg !1926, !tbaa !1649
  %224 = bitcast %struct._fcgi_request* %request to i8*, !dbg !1927
  %225 = bitcast %struct.stat* %st.i to i8*, !dbg !1928
  %226 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 0, !dbg !1931
  %227 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 1, !dbg !1933
  %228 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 3, i32 0, i32 0, !dbg !1934
  %229 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 2, !dbg !1935
  %230 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 4, !dbg !1936
  %231 = getelementptr inbounds [1 x %struct._sigjmp_buf]* %__bailout5, i64 0, i64 0, !dbg !1937
  %232 = icmp ne i32 %max_requests.1, 0, !dbg !1938
  %233 = getelementptr inbounds %struct._zend_file_handle* %file_handle, i64 0, i32 3, !dbg !1939
  %234 = bitcast %union.anon.12* %233 to %struct.__sFILE**, !dbg !1939
  %235 = add nsw i32 %argc, -1, !dbg !1940
  %.neg52 = add i32 %argc, 1, !dbg !1943
  %236 = getelementptr inbounds %struct.stat* %st.i, i64 0, i32 2, !dbg !1945
  %237 = icmp eq i32 %benchmark.0.ph, 0, !dbg !1946
  br label %.outer, !dbg !1948

.outer:                                           ; preds = %835, %223
  %repeats.1.ph = phi i32 [ %repeats.0.ph, %223 ], [ %833, %835 ]
  %requests.0.ph = phi i32 [ 0, %223 ], [ %requests.0, %835 ]
  %no_headers.0.ph = phi i32 [ 0, %223 ], [ %no_headers.242, %835 ]
  %behavior.1.ph = phi i32 [ %behavior.0, %223 ], [ %behavior.346, %835 ]
  %exit_status.0.ph = phi i32 [ 0, %223 ], [ %.exit_status.1, %835 ]
  %free_query_string.0.ph = phi i32 [ 0, %223 ], [ %free_query_string.147, %835 ]
  br label %238

; <label>:238                                     ; preds = %836, %.outer
  %requests.0 = phi i32 [ %837, %836 ], [ %requests.0.ph, %.outer ]
  %script_file.0 = phi i8* [ %script_file.240, %836 ], [ null, %.outer ]
  %no_headers.0 = phi i32 [ %no_headers.242, %836 ], [ %no_headers.0.ph, %.outer ]
  %behavior.1 = phi i32 [ %behavior.346, %836 ], [ %behavior.1.ph, %.outer ]
  %exit_status.0 = phi i32 [ %.exit_status.1, %836 ], [ %exit_status.0.ph, %.outer ]
  %free_query_string.0 = phi i32 [ %free_query_string.147, %836 ], [ %free_query_string.0.ph, %.outer ]
  br i1 %151, label %239, label %.critedge8, !dbg !1948

; <label>:239                                     ; preds = %238
  %240 = call i32 @fcgi_accept_request(%struct._fcgi_request* %request) nounwind, !dbg !1949
  %241 = icmp sgt i32 %240, -1, !dbg !1949
  br i1 %241, label %.critedge8, label %.loopexit73, !dbg !1949

.critedge8:                                       ; preds = %239, %238
  store i8* %224, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !1927, !tbaa !1649
  call void @llvm.lifetime.start(i64 -1, i8* %225) nounwind, !dbg !1928
  call void @llvm.dbg.value(metadata !1950, i64 0, metadata !1951) nounwind, !dbg !1928
  call void @llvm.dbg.value(metadata !1952, i64 0, metadata !1953) nounwind, !dbg !1954
  %242 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1955
  %243 = icmp eq i32 %242, 0, !dbg !1955
  br i1 %243, label %248, label %244, !dbg !1955

; <label>:244                                     ; preds = %.critedge8
  %245 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !1956, !tbaa !1649
  %246 = bitcast i8* %245 to %struct._fcgi_request*, !dbg !1956
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1957) nounwind, !dbg !1956
  %247 = call i8* @fcgi_getenv(%struct._fcgi_request* %246, i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0), i32 15) nounwind, !dbg !1958
  br label %sapi_cgibin_getenv.exit.i, !dbg !1958

; <label>:248                                     ; preds = %.critedge8
  %249 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0)) nounwind, !dbg !1959
  br label %sapi_cgibin_getenv.exit.i, !dbg !1959

sapi_cgibin_getenv.exit.i:                        ; preds = %248, %244
  %.0.i.i = phi i8* [ %247, %244 ], [ %249, %248 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1960) nounwind, !dbg !1929
  call void @llvm.dbg.value(metadata !1961, i64 0, metadata !1962) nounwind, !dbg !1964
  call void @llvm.dbg.value(metadata !1952, i64 0, metadata !1965) nounwind, !dbg !1966
  %250 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1967
  %251 = icmp eq i32 %250, 0, !dbg !1967
  br i1 %251, label %256, label %252, !dbg !1967

; <label>:252                                     ; preds = %sapi_cgibin_getenv.exit.i
  %253 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !1968, !tbaa !1649
  %254 = bitcast i8* %253 to %struct._fcgi_request*, !dbg !1968
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1969) nounwind, !dbg !1968
  %255 = call i8* @fcgi_getenv(%struct._fcgi_request* %254, i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0), i32 15) nounwind, !dbg !1970
  br label %sapi_cgibin_getenv.exit23.i, !dbg !1970

; <label>:256                                     ; preds = %sapi_cgibin_getenv.exit.i
  %257 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0)) nounwind, !dbg !1971
  br label %sapi_cgibin_getenv.exit23.i, !dbg !1971

sapi_cgibin_getenv.exit23.i:                      ; preds = %256, %252
  %.0.i22.i = phi i8* [ %255, %252 ], [ %257, %256 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1972) nounwind, !dbg !1963
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1973) nounwind, !dbg !1974
  %258 = icmp ne i8* %.0.i.i, null, !dbg !1975
  %259 = icmp eq i8* %.0.i22.i, null, !dbg !1975
  %or.cond9.i = or i1 %258, %259, !dbg !1975
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1973) nounwind, !dbg !1976
  %script_path_translated.0.i = select i1 %or.cond9.i, i8* %.0.i.i, i8* %.0.i22.i, !dbg !1975
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !1978, !tbaa !1649
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 0), align 8, !dbg !1979, !tbaa !1649
  store i32 1000, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 24), align 8, !dbg !1980, !tbaa !1663
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !1981, !tbaa !1649
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !1982, !tbaa !1649
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 10), align 8, !dbg !1983, !tbaa !1649
  store i64 0, i64* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 5), align 8, !dbg !1984, !tbaa !1782
  store i32 200, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !1985, !tbaa !1663
  %260 = icmp eq i8* %script_path_translated.0.i, null, !dbg !1986
  br i1 %260, label %init_request_info.exit, label %261, !dbg !1986

; <label>:261                                     ; preds = %sapi_cgibin_getenv.exit23.i
  call void @llvm.dbg.value(metadata !1987, i64 0, metadata !1988) nounwind, !dbg !1990
  call void @llvm.dbg.value(metadata !1991, i64 0, metadata !1992) nounwind, !dbg !1993
  %262 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !1994
  %263 = icmp eq i32 %262, 0, !dbg !1994
  br i1 %263, label %268, label %264, !dbg !1994

; <label>:264                                     ; preds = %261
  %265 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !1995, !tbaa !1649
  %266 = bitcast i8* %265 to %struct._fcgi_request*, !dbg !1995
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1996) nounwind, !dbg !1995
  %267 = call i8* @fcgi_getenv(%struct._fcgi_request* %266, i8* getelementptr inbounds ([15 x i8]* @.str38, i64 0, i64 0), i32 14) nounwind, !dbg !1997
  br label %sapi_cgibin_getenv.exit25.i, !dbg !1997

; <label>:268                                     ; preds = %261
  %269 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8]* @.str38, i64 0, i64 0)) nounwind, !dbg !1998
  br label %sapi_cgibin_getenv.exit25.i, !dbg !1998

sapi_cgibin_getenv.exit25.i:                      ; preds = %268, %264
  %.0.i24.i = phi i8* [ %267, %264 ], [ %269, %268 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1999) nounwind, !dbg !1989
  call void @llvm.dbg.value(metadata !2000, i64 0, metadata !2001) nounwind, !dbg !2003
  call void @llvm.dbg.value(metadata !2004, i64 0, metadata !2005) nounwind, !dbg !2006
  %270 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2007
  %271 = icmp eq i32 %270, 0, !dbg !2007
  br i1 %271, label %276, label %272, !dbg !2007

; <label>:272                                     ; preds = %sapi_cgibin_getenv.exit25.i
  %273 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2008, !tbaa !1649
  %274 = bitcast i8* %273 to %struct._fcgi_request*, !dbg !2008
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2009) nounwind, !dbg !2008
  %275 = call i8* @fcgi_getenv(%struct._fcgi_request* %274, i8* getelementptr inbounds ([13 x i8]* @.str39, i64 0, i64 0), i32 12) nounwind, !dbg !2010
  br label %sapi_cgibin_getenv.exit27.i, !dbg !2010

; <label>:276                                     ; preds = %sapi_cgibin_getenv.exit25.i
  %277 = call i8* @getenv(i8* getelementptr inbounds ([13 x i8]* @.str39, i64 0, i64 0)) nounwind, !dbg !2011
  br label %sapi_cgibin_getenv.exit27.i, !dbg !2011

sapi_cgibin_getenv.exit27.i:                      ; preds = %276, %272
  %.0.i26.i = phi i8* [ %275, %272 ], [ %277, %276 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2012) nounwind, !dbg !2002
  call void @llvm.dbg.value(metadata !2013, i64 0, metadata !2014) nounwind, !dbg !2016
  call void @llvm.dbg.value(metadata !2017, i64 0, metadata !2018) nounwind, !dbg !2019
  %278 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2020
  %279 = icmp eq i32 %278, 0, !dbg !2020
  br i1 %279, label %284, label %280, !dbg !2020

; <label>:280                                     ; preds = %sapi_cgibin_getenv.exit27.i
  %281 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2021, !tbaa !1649
  %282 = bitcast i8* %281 to %struct._fcgi_request*, !dbg !2021
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2022) nounwind, !dbg !2021
  %283 = call i8* @fcgi_getenv(%struct._fcgi_request* %282, i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0), i32 9) nounwind, !dbg !2023
  br label %sapi_cgibin_getenv.exit29.i, !dbg !2023

; <label>:284                                     ; preds = %sapi_cgibin_getenv.exit27.i
  %285 = call i8* @getenv(i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0)) nounwind, !dbg !2024
  br label %sapi_cgibin_getenv.exit29.i, !dbg !2024

sapi_cgibin_getenv.exit29.i:                      ; preds = %284, %280
  %.0.i28.i = phi i8* [ %283, %280 ], [ %285, %284 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2025) nounwind, !dbg !2015
  call void @llvm.dbg.value(metadata !2026, i64 0, metadata !2027) nounwind, !dbg !2029
  call void @llvm.dbg.value(metadata !2030, i64 0, metadata !2031) nounwind, !dbg !2032
  %286 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2033
  %287 = icmp eq i32 %286, 0, !dbg !2033
  br i1 %287, label %292, label %288, !dbg !2033

; <label>:288                                     ; preds = %sapi_cgibin_getenv.exit29.i
  %289 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2034, !tbaa !1649
  %290 = bitcast i8* %289 to %struct._fcgi_request*, !dbg !2034
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2035) nounwind, !dbg !2034
  %291 = call i8* @fcgi_getenv(%struct._fcgi_request* %290, i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0), i32 11) nounwind, !dbg !2036
  br label %sapi_cgibin_getenv.exit31.i, !dbg !2036

; <label>:292                                     ; preds = %sapi_cgibin_getenv.exit29.i
  %293 = call i8* @getenv(i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0)) nounwind, !dbg !2037
  br label %sapi_cgibin_getenv.exit31.i, !dbg !2037

sapi_cgibin_getenv.exit31.i:                      ; preds = %292, %288
  %.0.i30.i = phi i8* [ %291, %288 ], [ %293, %292 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2038) nounwind, !dbg !2028
  call void @llvm.dbg.value(metadata !2039, i64 0, metadata !2040) nounwind, !dbg !2042
  call void @llvm.dbg.value(metadata !1952, i64 0, metadata !2043) nounwind, !dbg !2044
  %294 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2045
  %295 = icmp eq i32 %294, 0, !dbg !2045
  br i1 %295, label %300, label %296, !dbg !2045

; <label>:296                                     ; preds = %sapi_cgibin_getenv.exit31.i
  %297 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2046, !tbaa !1649
  %298 = bitcast i8* %297 to %struct._fcgi_request*, !dbg !2046
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2047) nounwind, !dbg !2046
  %299 = call i8* @fcgi_getenv(%struct._fcgi_request* %298, i8* getelementptr inbounds ([16 x i8]* @.str7, i64 0, i64 0), i32 15) nounwind, !dbg !2048
  br label %sapi_cgibin_getenv.exit33.i, !dbg !2048

; <label>:300                                     ; preds = %sapi_cgibin_getenv.exit31.i
  %301 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str7, i64 0, i64 0)) nounwind, !dbg !2049
  br label %sapi_cgibin_getenv.exit33.i, !dbg !2049

sapi_cgibin_getenv.exit33.i:                      ; preds = %300, %296
  %.0.i32.i = phi i8* [ %299, %296 ], [ %301, %300 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2050) nounwind, !dbg !2041
  %302 = icmp eq i8* %.0.i32.i, null, !dbg !2051
  %303 = icmp eq i8* %.0.i30.i, null, !dbg !2051
  %or.cond10.i = or i1 %302, %303, !dbg !2051
  %304 = icmp eq i8* %.0.i28.i, null, !dbg !2051
  %or.cond11.i = or i1 %or.cond10.i, %304, !dbg !2051
  br i1 %or.cond11.i, label %319, label %305, !dbg !2051

; <label>:305                                     ; preds = %sapi_cgibin_getenv.exit33.i
  %306 = call i32 @strncmp(i8* %.0.i32.i, i8* getelementptr inbounds ([14 x i8]* @.str42, i64 0, i64 0), i64 13) nounwind readonly, !dbg !2052
  %307 = icmp eq i32 %306, 0, !dbg !2052
  br i1 %307, label %308, label %319, !dbg !2052

; <label>:308                                     ; preds = %305
  %309 = call i64 @strlen(i8* %.0.i30.i) nounwind readonly, !dbg !2053
  %310 = call i32 @strncmp(i8* %.0.i28.i, i8* %.0.i30.i, i64 %309) nounwind readonly, !dbg !2053
  %311 = icmp eq i32 %310, 0, !dbg !2053
  br i1 %311, label %312, label %319, !dbg !2053

; <label>:312                                     ; preds = %308
  %313 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([15 x i8]* @.str43, i64 0, i64 0), i8* %.0.i28.i) nounwind, !dbg !2054
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2025) nounwind, !dbg !2054
  %314 = call i64 @strlen(i8* %.0.i30.i) nounwind readonly, !dbg !2056
  %315 = getelementptr inbounds i8* %313, i64 %314, !dbg !2056
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2025) nounwind, !dbg !2056
  %316 = load i8* %315, align 1, !dbg !2057, !tbaa !1650
  %317 = icmp eq i8 %316, 0, !dbg !2057
  %..i = select i1 %317, i8* null, i8* %315, !dbg !2057
  %318 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0), i8* %..i) nounwind, !dbg !2058
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2025) nounwind, !dbg !2058
  br label %319, !dbg !2059

; <label>:319                                     ; preds = %312, %308, %305, %sapi_cgibin_getenv.exit33.i
  %env_path_info.1.i = phi i8* [ %318, %312 ], [ %.0.i28.i, %308 ], [ %.0.i28.i, %305 ], [ %.0.i28.i, %sapi_cgibin_getenv.exit33.i ]
  %320 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 3), align 1, !dbg !2060, !tbaa !1650
  %321 = icmp eq i8 %320, 0, !dbg !2060
  br i1 %321, label %544, label %322, !dbg !2060

; <label>:322                                     ; preds = %319
  call void @llvm.dbg.declare(metadata !952, metadata !1096) nounwind, !dbg !2061
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2062) nounwind, !dbg !2063
  call void @llvm.dbg.value(metadata !2064, i64 0, metadata !2065) nounwind, !dbg !2067
  call void @llvm.dbg.value(metadata !2004, i64 0, metadata !2068) nounwind, !dbg !2069
  %323 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2070
  %324 = icmp eq i32 %323, 0, !dbg !2070
  br i1 %324, label %329, label %325, !dbg !2070

; <label>:325                                     ; preds = %322
  %326 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2071, !tbaa !1649
  %327 = bitcast i8* %326 to %struct._fcgi_request*, !dbg !2071
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2072) nounwind, !dbg !2071
  %328 = call i8* @fcgi_getenv(%struct._fcgi_request* %327, i8* getelementptr inbounds ([13 x i8]* @.str44, i64 0, i64 0), i32 12) nounwind, !dbg !2073
  br label %sapi_cgibin_getenv.exit35.i, !dbg !2073

; <label>:329                                     ; preds = %322
  %330 = call i8* @getenv(i8* getelementptr inbounds ([13 x i8]* @.str44, i64 0, i64 0)) nounwind, !dbg !2074
  br label %sapi_cgibin_getenv.exit35.i, !dbg !2074

sapi_cgibin_getenv.exit35.i:                      ; preds = %329, %325
  %.0.i34.i = phi i8* [ %328, %325 ], [ %330, %329 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2075) nounwind, !dbg !2066
  call void @llvm.dbg.value(metadata !2076, i64 0, metadata !2077) nounwind, !dbg !2079
  call void @llvm.dbg.value(metadata !2080, i64 0, metadata !2081) nounwind, !dbg !2082
  %331 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2083
  %332 = icmp eq i32 %331, 0, !dbg !2083
  br i1 %332, label %337, label %333, !dbg !2083

; <label>:333                                     ; preds = %sapi_cgibin_getenv.exit35.i
  %334 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2084, !tbaa !1649
  %335 = bitcast i8* %334 to %struct._fcgi_request*, !dbg !2084
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2085) nounwind, !dbg !2084
  %336 = call i8* @fcgi_getenv(%struct._fcgi_request* %335, i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0), i32 13) nounwind, !dbg !2086
  br label %sapi_cgibin_getenv.exit37.i, !dbg !2086

; <label>:337                                     ; preds = %sapi_cgibin_getenv.exit35.i
  %338 = call i8* @getenv(i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0)) nounwind, !dbg !2087
  br label %sapi_cgibin_getenv.exit37.i, !dbg !2087

sapi_cgibin_getenv.exit37.i:                      ; preds = %337, %333
  %.0.i36.i = phi i8* [ %336, %333 ], [ %338, %337 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2088) nounwind, !dbg !2078
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2089) nounwind, !dbg !2090
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2091) nounwind, !dbg !2092
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2093) nounwind, !dbg !2094
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2095) nounwind, !dbg !2096
  %339 = icmp eq i8* %.0.i36.i, null, !dbg !2097
  %340 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 26), align 8, !dbg !2097, !tbaa !1649
  %341 = icmp ne i8* %340, null, !dbg !2097
  %or.cond.i = and i1 %339, %341, !dbg !2097
  br i1 %or.cond.i, label %342, label %344, !dbg !2097

; <label>:342                                     ; preds = %sapi_cgibin_getenv.exit37.i
  %343 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0), i8* %340) nounwind, !dbg !2098
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2088) nounwind, !dbg !2098
  br label %344, !dbg !2100

; <label>:344                                     ; preds = %342, %sapi_cgibin_getenv.exit37.i
  %env_document_root.0.i = phi i8* [ %343, %342 ], [ %.0.i36.i, %sapi_cgibin_getenv.exit37.i ]
  %345 = icmp ne i8* %.0.i22.i, null, !dbg !2101
  %.not.i = xor i1 %345, true, !dbg !2101
  %346 = icmp eq i8* %.0.i34.i, null, !dbg !2101
  %or.cond12.i = or i1 %346, %.not.i, !dbg !2101
  %347 = icmp eq i8* %.0.i22.i, %script_path_translated.0.i, !dbg !2101
  %or.cond13.i = or i1 %or.cond12.i, %347, !dbg !2101
  br i1 %or.cond13.i, label %351, label %348, !dbg !2101

; <label>:348                                     ; preds = %344
  %349 = call i32 @strcmp(i8* %.0.i22.i, i8* %script_path_translated.0.i) nounwind readonly, !dbg !2102
  %350 = icmp eq i32 %349, 0, !dbg !2102
  %.14.i = select i1 %350, i8* %.0.i30.i, i8* %.0.i34.i, !dbg !2102
  %script_path_translated.0..i = select i1 %350, i8* %script_path_translated.0.i, i8* %.0.i22.i, !dbg !2102
  br label %351, !dbg !2102

; <label>:351                                     ; preds = %348, %344
  %env_script_name.0.i = phi i8* [ %.0.i30.i, %344 ], [ %.14.i, %348 ]
  %script_path_translated.1.i = phi i8* [ %script_path_translated.0.i, %344 ], [ %script_path_translated.0..i, %348 ]
  %352 = icmp eq i8* %script_path_translated.1.i, null, !dbg !2103
  br i1 %352, label %505, label %353, !dbg !2103

; <label>:353                                     ; preds = %351
  %354 = call i64 @strlen(i8* %script_path_translated.1.i) nounwind readonly, !dbg !2104
  %355 = trunc i64 %354 to i32, !dbg !2104
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2105) nounwind, !dbg !2104
  %356 = icmp sgt i32 %355, 0, !dbg !2104
  br i1 %356, label %357, label %505, !dbg !2104

; <label>:357                                     ; preds = %353
  %358 = add nsw i32 %355, -1, !dbg !2104
  %359 = sext i32 %358 to i64, !dbg !2104
  %360 = getelementptr inbounds i8* %script_path_translated.1.i, i64 %359, !dbg !2104
  %361 = load i8* %360, align 1, !dbg !2104, !tbaa !1650
  %362 = icmp eq i8 %361, 47, !dbg !2104
  br i1 %362, label %366, label %363, !dbg !2104

; <label>:363                                     ; preds = %357
  %364 = call i8* @tsrm_realpath(i8* %script_path_translated.1.i, i8* null) nounwind, !dbg !2106
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2062) nounwind, !dbg !2106
  %365 = icmp eq i8* %364, null, !dbg !2106
  br i1 %365, label %366, label %505, !dbg !2106

; <label>:366                                     ; preds = %363, %357
  %367 = call noalias i8* @_estrndup(i8* %script_path_translated.1.i, i32 %355) nounwind, !dbg !2107
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2108) nounwind, !dbg !2107
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2109) nounwind, !dbg !2110
  br label %.backedge.i, !dbg !2111

.backedge.i:                                      ; preds = %375, %.critedge.i, %366
  %368 = call i8* @strrchr(i8* %367, i32 47) nounwind readonly, !dbg !2112
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2113) nounwind, !dbg !2112
  %369 = icmp eq i8* %368, null, !dbg !2112
  br i1 %369, label %370, label %.critedge.i, !dbg !2112

; <label>:370                                     ; preds = %.backedge.i
  %371 = call i8* @strrchr(i8* %367, i32 92) nounwind readonly, !dbg !2114
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2113) nounwind, !dbg !2114
  %372 = icmp eq i8* %371, null, !dbg !2114
  br i1 %372, label %.thread.i, label %.critedge.i, !dbg !2114

.critedge.i:                                      ; preds = %370, %.backedge.i
  %ptr.0.i = phi i8* [ %368, %.backedge.i ], [ %371, %370 ]
  store i8 0, i8* %ptr.0.i, align 1, !dbg !2115, !tbaa !1650
  %373 = call i32 @stat(i8* %367, %struct.stat* %st.i) nounwind, !dbg !1945
  %374 = icmp eq i32 %373, 0, !dbg !1945
  br i1 %374, label %375, label %.backedge.i, !dbg !1945

; <label>:375                                     ; preds = %.critedge.i
  %376 = load i16* %236, align 8, !dbg !1945, !tbaa !2116
  %377 = and i16 %376, -4096, !dbg !1945
  %378 = icmp eq i16 %377, -32768, !dbg !1945
  br i1 %378, label %379, label %.backedge.i, !dbg !1945

; <label>:379                                     ; preds = %375
  %380 = icmp ne i8* %env_path_info.1.i, null, !dbg !2117
  br i1 %380, label %381, label %387, !dbg !2117

; <label>:381                                     ; preds = %379
  %382 = call i64 @strlen(i8* %367) nounwind readonly, !dbg !2118
  %383 = sub i64 %354, %382, !dbg !2118
  %384 = call i64 @strlen(i8* %env_path_info.1.i) nounwind readonly, !dbg !2119
  %sext.i = shl i64 %384, 32, !dbg !2119
  %phitmp7.i = ashr exact i64 %sext.i, 32, !dbg !2119
  %sext8.i = shl i64 %383, 32, !dbg !2120
  %385 = ashr exact i64 %sext8.i, 32, !dbg !2120
  %.sum.i = sub i64 %phitmp7.i, %385, !dbg !2120
  %386 = getelementptr inbounds i8* %env_path_info.1.i, i64 %.sum.i, !dbg !2120
  br label %387, !dbg !2120

; <label>:387                                     ; preds = %381, %379
  %388 = phi i8* [ %386, %381 ], [ null, %379 ], !dbg !2120
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2121) nounwind, !dbg !2120
  %389 = icmp eq i8* %env_path_info.1.i, %388, !dbg !2122
  br i1 %389, label %403, label %390, !dbg !2122

; <label>:390                                     ; preds = %387
  br i1 %380, label %391, label %401, !dbg !2123

; <label>:391                                     ; preds = %390
  %392 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([15 x i8]* @.str43, i64 0, i64 0), i8* %env_path_info.1.i) nounwind, !dbg !2124
  %393 = load i8* %388, align 1, !dbg !2125, !tbaa !1650
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2126) nounwind, !dbg !2125
  store i8 0, i8* %388, align 1, !dbg !2127, !tbaa !1650
  br i1 %303, label %.critedge15.i, label %394, !dbg !2128

; <label>:394                                     ; preds = %391
  %395 = call i32 @strcmp(i8* %.0.i30.i, i8* %env_path_info.1.i) nounwind readonly, !dbg !2129
  %396 = icmp eq i32 %395, 0, !dbg !2129
  br i1 %396, label %400, label %397, !dbg !2129

; <label>:397                                     ; preds = %394
  %398 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([17 x i8]* @.str46, i64 0, i64 0), i8* %.0.i30.i) nounwind, !dbg !2130
  br label %.critedge15.i, !dbg !2133

.critedge15.i:                                    ; preds = %397, %391
  %399 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0), i8* %env_path_info.1.i) nounwind, !dbg !2134
  br label %400, !dbg !2135

; <label>:400                                     ; preds = %.critedge15.i, %394
  %storemerge6.i = phi i8* [ %399, %.critedge15.i ], [ %.0.i30.i, %394 ]
  store i8* %storemerge6.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2136
  store i8 %393, i8* %388, align 1, !dbg !2138, !tbaa !1650
  br label %401, !dbg !2139

; <label>:401                                     ; preds = %400, %390
  %402 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0), i8* %388) nounwind, !dbg !2140
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2025) nounwind, !dbg !2140
  br label %403, !dbg !2141

; <label>:403                                     ; preds = %401, %387
  %env_path_info.2.i = phi i8* [ %402, %401 ], [ %env_path_info.1.i, %387 ]
  br i1 %258, label %404, label %.critedge16.i, !dbg !2142

; <label>:404                                     ; preds = %403
  %405 = call i32 @strcmp(i8* %.0.i.i, i8* %367) nounwind readonly, !dbg !2143
  %406 = icmp eq i32 %405, 0, !dbg !2143
  br i1 %406, label %410, label %407, !dbg !2143

; <label>:407                                     ; preds = %404
  %408 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str47, i64 0, i64 0), i8* %.0.i.i) nounwind, !dbg !2144
  br label %.critedge16.i, !dbg !2147

.critedge16.i:                                    ; preds = %407, %403
  %409 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0), i8* %367) nounwind, !dbg !2148
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1973) nounwind, !dbg !2148
  br label %410, !dbg !2149

; <label>:410                                     ; preds = %.critedge16.i, %404
  %script_path_translated.2.i = phi i8* [ %409, %.critedge16.i ], [ %script_path_translated.1.i, %404 ]
  %411 = icmp eq i8* %env_document_root.0.i, null, !dbg !2150
  br i1 %411, label %445, label %412, !dbg !2150

; <label>:412                                     ; preds = %410
  %413 = call i64 @strlen(i8* %env_document_root.0.i) nounwind readonly, !dbg !2151
  %414 = trunc i64 %413 to i32, !dbg !2151
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2152) nounwind, !dbg !2151
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !2153) nounwind, !dbg !2154
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2155) nounwind, !dbg !2156
  %415 = icmp eq i32 %414, 0, !dbg !2157
  br i1 %415, label %422, label %416, !dbg !2157

; <label>:416                                     ; preds = %412
  %417 = add nsw i32 %414, -1, !dbg !2157
  %418 = sext i32 %417 to i64, !dbg !2157
  %419 = getelementptr inbounds i8* %env_document_root.0.i, i64 %418, !dbg !2157
  %420 = load i8* %419, align 1, !dbg !2157, !tbaa !1650
  %421 = icmp eq i8 %420, 47, !dbg !2157
  %.17.i = select i1 %421, i32 %417, i32 %414, !dbg !2157
  br label %422, !dbg !2157

; <label>:422                                     ; preds = %416, %412
  %l.0.i = phi i32 [ 0, %412 ], [ %.17.i, %416 ]
  %423 = sext i32 %l.0.i to i64, !dbg !2158
  %424 = icmp ne i8* %env_path_info.2.i, null, !dbg !2158
  br i1 %424, label %425, label %427, !dbg !2158

; <label>:425                                     ; preds = %422
  %426 = call i64 @strlen(i8* %env_path_info.2.i) nounwind readonly, !dbg !2159
  br label %427, !dbg !2159

; <label>:427                                     ; preds = %425, %422
  %428 = phi i64 [ %426, %425 ], [ 0, %422 ], !dbg !2159
  %429 = add i64 %428, %423, !dbg !2159
  %430 = trunc i64 %429 to i32, !dbg !2159
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2153) nounwind, !dbg !2159
  %431 = add nsw i32 %430, 1, !dbg !2160
  %432 = sext i32 %431 to i64, !dbg !2160
  %433 = call noalias i8* @_emalloc(i64 %432) nounwind, !dbg !2160
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2155) nounwind, !dbg !2160
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %433, i8* %env_document_root.0.i, i64 %423, i32 1, i1 false) nounwind, !dbg !2161
  br i1 %424, label %434, label %438, !dbg !2162

; <label>:434                                     ; preds = %427
  %435 = getelementptr inbounds i8* %433, i64 %423, !dbg !2163
  %436 = sub nsw i32 %430, %l.0.i, !dbg !2163
  %437 = sext i32 %436 to i64, !dbg !2163
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %435, i8* %env_path_info.2.i, i64 %437, i32 1, i1 false) nounwind, !dbg !2163
  br label %438, !dbg !2165

; <label>:438                                     ; preds = %434, %427
  %439 = sext i32 %430 to i64, !dbg !2166
  %440 = getelementptr inbounds i8* %433, i64 %439, !dbg !2166
  store i8 0, i8* %440, align 1, !dbg !2166, !tbaa !1650
  br i1 %345, label %441, label %443, !dbg !2167

; <label>:441                                     ; preds = %438
  %442 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str48, i64 0, i64 0), i8* %.0.i22.i) nounwind, !dbg !2168
  br label %443, !dbg !2170

; <label>:443                                     ; preds = %441, %438
  %444 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0), i8* %433) nounwind, !dbg !2171
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1972) nounwind, !dbg !2171
  call void @_efree(i8* %433) nounwind, !dbg !2172
  br label %477, !dbg !2173

; <label>:445                                     ; preds = %410
  %446 = icmp eq i8* %env_script_name.0.i, null, !dbg !2174
  br i1 %446, label %477, label %447, !dbg !2174

; <label>:447                                     ; preds = %445
  %448 = call i8* @strstr(i8* %367, i8* %env_script_name.0.i) nounwind readonly, !dbg !2175
  %449 = icmp eq i8* %448, null, !dbg !2175
  br i1 %449, label %477, label %450, !dbg !2175

; <label>:450                                     ; preds = %447
  %451 = call i64 @strlen(i8* %367) nounwind readonly, !dbg !2176
  %452 = call i64 @strlen(i8* %env_script_name.0.i) nounwind readonly, !dbg !2177
  %453 = sub i64 %451, %452, !dbg !2177
  %454 = trunc i64 %453 to i32, !dbg !2177
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2178) nounwind, !dbg !2177
  %455 = sext i32 %454 to i64, !dbg !2179
  %456 = icmp ne i8* %env_path_info.2.i, null, !dbg !2179
  br i1 %456, label %457, label %459, !dbg !2179

; <label>:457                                     ; preds = %450
  %458 = call i64 @strlen(i8* %env_path_info.2.i) nounwind readonly, !dbg !2180
  br label %459, !dbg !2180

; <label>:459                                     ; preds = %457, %450
  %460 = phi i64 [ %458, %457 ], [ 0, %450 ], !dbg !2180
  %461 = add i64 %460, %455, !dbg !2180
  %462 = trunc i64 %461 to i32, !dbg !2180
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2181) nounwind, !dbg !2180
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2182) nounwind, !dbg !2183
  %463 = add nsw i32 %462, 1, !dbg !2184
  %464 = sext i32 %463 to i64, !dbg !2184
  %465 = call noalias i8* @_emalloc(i64 %464) nounwind, !dbg !2184
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2182) nounwind, !dbg !2184
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %465, i8* %367, i64 %455, i32 1, i1 false) nounwind, !dbg !2185
  br i1 %456, label %466, label %470, !dbg !2186

; <label>:466                                     ; preds = %459
  %467 = getelementptr inbounds i8* %465, i64 %455, !dbg !2187
  %468 = sub nsw i32 %462, %454, !dbg !2187
  %469 = sext i32 %468 to i64, !dbg !2187
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %467, i8* %env_path_info.2.i, i64 %469, i32 1, i1 false) nounwind, !dbg !2187
  br label %470, !dbg !2189

; <label>:470                                     ; preds = %466, %459
  %471 = sext i32 %462 to i64, !dbg !2190
  %472 = getelementptr inbounds i8* %465, i64 %471, !dbg !2190
  store i8 0, i8* %472, align 1, !dbg !2190, !tbaa !1650
  br i1 %345, label %473, label %475, !dbg !2191

; <label>:473                                     ; preds = %470
  %474 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str48, i64 0, i64 0), i8* %.0.i22.i) nounwind, !dbg !2192
  br label %475, !dbg !2194

; <label>:475                                     ; preds = %473, %470
  %476 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0), i8* %465) nounwind, !dbg !2195
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1972) nounwind, !dbg !2195
  call void @_efree(i8* %465) nounwind, !dbg !2196
  br label %477, !dbg !2197

; <label>:477                                     ; preds = %475, %447, %445, %443
  %478 = icmp eq i8* %ptr.0.i, null, !dbg !2198
  br i1 %478, label %.thread.i, label %491, !dbg !2198

.thread.i:                                        ; preds = %477, %370
  br i1 %258, label %479, label %481, !dbg !2199

; <label>:479                                     ; preds = %.thread.i
  %480 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str47, i64 0, i64 0), i8* %.0.i.i) nounwind, !dbg !2201
  br label %481, !dbg !2203

; <label>:481                                     ; preds = %479, %.thread.i
  call void @llvm.dbg.value(metadata !1950, i64 0, metadata !2204) nounwind, !dbg !2206
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2207) nounwind, !dbg !2208
  %482 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2209
  %483 = icmp eq i32 %482, 0, !dbg !2209
  br i1 %483, label %488, label %484, !dbg !2209

; <label>:484                                     ; preds = %481
  %485 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2210, !tbaa !1649
  %486 = bitcast i8* %485 to %struct._fcgi_request*, !dbg !2210
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2211) nounwind, !dbg !2210
  %487 = call i8* @fcgi_putenv(%struct._fcgi_request* %486, i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0), i32 15, i8* null) nounwind, !dbg !2212
  br label %_sapi_cgibin_putenv.exit.i, !dbg !2212

; <label>:488                                     ; preds = %481
  %489 = call i32 @unsetenv(i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0)) nounwind, !dbg !2213
  %490 = call i8* @getenv(i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0)) nounwind, !dbg !2215
  br label %_sapi_cgibin_putenv.exit.i, !dbg !2215

_sapi_cgibin_putenv.exit.i:                       ; preds = %488, %484
  %.0.i38.i = phi i8* [ %487, %484 ], [ %490, %488 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1973) nounwind, !dbg !2205
  store i32 404, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !2216, !tbaa !1663
  br label %491, !dbg !2217

; <label>:491                                     ; preds = %_sapi_cgibin_putenv.exit.i, %477
  %script_path_translated.4.i = phi i8* [ %script_path_translated.2.i, %477 ], [ %.0.i38.i, %_sapi_cgibin_putenv.exit.i ]
  %492 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2218, !tbaa !1649
  %493 = icmp eq i8* %492, null, !dbg !2218
  br i1 %493, label %494, label %502, !dbg !2218

; <label>:494                                     ; preds = %491
  br i1 %303, label %.critedge18.i, label %495, !dbg !2219

; <label>:495                                     ; preds = %494
  %496 = call i32 @strcmp(i8* %.0.i30.i, i8* %env_script_name.0.i) nounwind readonly, !dbg !2221
  %497 = icmp eq i32 %496, 0, !dbg !2221
  br i1 %497, label %501, label %498, !dbg !2221

; <label>:498                                     ; preds = %495
  %499 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([17 x i8]* @.str46, i64 0, i64 0), i8* %.0.i30.i) nounwind, !dbg !2222
  br label %.critedge18.i, !dbg !2225

.critedge18.i:                                    ; preds = %498, %494
  %500 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0), i8* %env_script_name.0.i) nounwind, !dbg !2226
  store i8* %500, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2226, !tbaa !1649
  br label %502, !dbg !2227

; <label>:501                                     ; preds = %495
  store i8* %.0.i30.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2228, !tbaa !1649
  br label %502

; <label>:502                                     ; preds = %501, %.critedge18.i, %491
  %503 = icmp eq i8* %367, null, !dbg !2230
  br i1 %503, label %548, label %504, !dbg !2230

; <label>:504                                     ; preds = %502
  call void @_efree(i8* %367) nounwind, !dbg !2231
  br label %548, !dbg !2233

; <label>:505                                     ; preds = %363, %353, %351
  %real_path.0.i = phi i8* [ %364, %363 ], [ null, %353 ], [ null, %351 ]
  br i1 %258, label %506, label %.critedge19.i, !dbg !2234

; <label>:506                                     ; preds = %505
  %507 = icmp eq i8* %script_path_translated.1.i, %.0.i.i, !dbg !2234
  br i1 %507, label %514, label %508, !dbg !2234

; <label>:508                                     ; preds = %506
  %509 = call i32 @strcmp(i8* %script_path_translated.1.i, i8* %.0.i.i) nounwind readonly, !dbg !2236
  %510 = icmp eq i32 %509, 0, !dbg !2236
  br i1 %510, label %514, label %511, !dbg !2236

; <label>:511                                     ; preds = %508
  %512 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str47, i64 0, i64 0), i8* %.0.i.i) nounwind, !dbg !2237
  br label %.critedge19.i, !dbg !2240

.critedge19.i:                                    ; preds = %511, %505
  %513 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0), i8* %script_path_translated.1.i) nounwind, !dbg !2241
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1973) nounwind, !dbg !2241
  br label %514, !dbg !2242

; <label>:514                                     ; preds = %.critedge19.i, %508, %506
  %script_path_translated.5.i = phi i8* [ %513, %.critedge19.i ], [ %script_path_translated.1.i, %508 ], [ %script_path_translated.1.i, %506 ]
  br i1 %346, label %_sapi_cgibin_putenv.exit42.i, label %515, !dbg !2243

; <label>:515                                     ; preds = %514
  %516 = icmp eq i8* %env_path_info.1.i, null, !dbg !2244
  br i1 %516, label %_sapi_cgibin_putenv.exit40.i, label %517, !dbg !2244

; <label>:517                                     ; preds = %515
  %518 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([15 x i8]* @.str43, i64 0, i64 0), i8* %env_path_info.1.i) nounwind, !dbg !2246
  call void @llvm.dbg.value(metadata !2013, i64 0, metadata !2248) nounwind, !dbg !2250
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2251) nounwind, !dbg !2252
  %519 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2253
  %520 = icmp eq i32 %519, 0, !dbg !2253
  br i1 %520, label %525, label %521, !dbg !2253

; <label>:521                                     ; preds = %517
  %522 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2254, !tbaa !1649
  %523 = bitcast i8* %522 to %struct._fcgi_request*, !dbg !2254
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2255) nounwind, !dbg !2254
  %524 = call i8* @fcgi_putenv(%struct._fcgi_request* %523, i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0), i32 9, i8* null) nounwind, !dbg !2256
  br label %_sapi_cgibin_putenv.exit40.i, !dbg !2256

; <label>:525                                     ; preds = %517
  %526 = call i32 @unsetenv(i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0)) nounwind, !dbg !2257
  br label %_sapi_cgibin_putenv.exit40.i, !dbg !2258

_sapi_cgibin_putenv.exit40.i:                     ; preds = %525, %521, %515
  br i1 %345, label %527, label %_sapi_cgibin_putenv.exit42.i, !dbg !2259

; <label>:527                                     ; preds = %_sapi_cgibin_putenv.exit40.i
  %528 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([21 x i8]* @.str48, i64 0, i64 0), i8* %.0.i22.i) nounwind, !dbg !2260
  call void @llvm.dbg.value(metadata !1961, i64 0, metadata !2262) nounwind, !dbg !2264
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !2265) nounwind, !dbg !2266
  %529 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2267
  %530 = icmp eq i32 %529, 0, !dbg !2267
  br i1 %530, label %535, label %531, !dbg !2267

; <label>:531                                     ; preds = %527
  %532 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2268, !tbaa !1649
  %533 = bitcast i8* %532 to %struct._fcgi_request*, !dbg !2268
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2269) nounwind, !dbg !2268
  %534 = call i8* @fcgi_putenv(%struct._fcgi_request* %533, i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0), i32 15, i8* null) nounwind, !dbg !2270
  br label %_sapi_cgibin_putenv.exit42.i, !dbg !2270

; <label>:535                                     ; preds = %527
  %536 = call i32 @unsetenv(i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0)) nounwind, !dbg !2271
  br label %_sapi_cgibin_putenv.exit42.i, !dbg !2272

_sapi_cgibin_putenv.exit42.i:                     ; preds = %535, %531, %_sapi_cgibin_putenv.exit40.i, %514
  %537 = icmp eq i8* %env_script_name.0.i, %.0.i30.i, !dbg !2273
  br i1 %537, label %543, label %538, !dbg !2273

; <label>:538                                     ; preds = %_sapi_cgibin_putenv.exit42.i
  br i1 %303, label %541, label %539, !dbg !2274

; <label>:539                                     ; preds = %538
  %540 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([17 x i8]* @.str46, i64 0, i64 0), i8* %.0.i30.i) nounwind, !dbg !2276
  br label %541, !dbg !2278

; <label>:541                                     ; preds = %539, %538
  %542 = call fastcc i8* @_sapi_cgibin_putenv(i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0), i8* %env_script_name.0.i) nounwind, !dbg !2279
  br label %543, !dbg !2280

; <label>:543                                     ; preds = %541, %_sapi_cgibin_putenv.exit42.i
  %storemerge4.i = phi i8* [ %542, %541 ], [ %env_script_name.0.i, %_sapi_cgibin_putenv.exit42.i ]
  store i8* %storemerge4.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2279
  call void @free(i8* %real_path.0.i) nounwind, !dbg !2281
  br label %548

; <label>:544                                     ; preds = %319
  %545 = icmp eq i8* %env_path_info.1.i, null, !dbg !2282
  %.env_path_info.1.i = select i1 %545, i8* %.0.i30.i, i8* %env_path_info.1.i
  store i8* %.env_path_info.1.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2284
  %546 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 5), align 1, !dbg !2286, !tbaa !1650
  %547 = icmp ne i8 %546, 0, !dbg !2286
  %or.cond20.i = or i1 %547, %259, !dbg !2286
  %script_path_translated.0.21.i = select i1 %or.cond20.i, i8* %script_path_translated.0.i, i8* %.0.i22.i, !dbg !2286
  br label %548, !dbg !2286

; <label>:548                                     ; preds = %544, %543, %504, %502
  %script_path_translated.6.i = phi i8* [ %script_path_translated.4.i, %504 ], [ %script_path_translated.4.i, %502 ], [ %script_path_translated.5.i, %543 ], [ %script_path_translated.0.21.i, %544 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2287) nounwind, !dbg !2289
  %549 = icmp eq i8* %script_path_translated.6.i, null, !dbg !2290
  br i1 %549, label %is_valid_path.exit.thread.i, label %550, !dbg !2290

; <label>:550                                     ; preds = %548
  %551 = call i8* @strstr(i8* %script_path_translated.6.i, i8* getelementptr inbounds ([3 x i8]* @.str52, i64 0, i64 0)) nounwind readonly, !dbg !2291
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2292) nounwind, !dbg !2291
  %552 = icmp eq i8* %551, null, !dbg !2293
  br i1 %552, label %.loopexit.i, label %553, !dbg !2293

; <label>:553                                     ; preds = %550
  %554 = icmp eq i8* %551, %script_path_translated.6.i, !dbg !2294
  br i1 %554, label %559, label %555, !dbg !2294

; <label>:555                                     ; preds = %553
  %556 = getelementptr inbounds i8* %551, i64 -1, !dbg !2294
  %557 = load i8* %556, align 1, !dbg !2294, !tbaa !1650
  %558 = icmp eq i8 %557, 47, !dbg !2294
  br i1 %558, label %559, label %.preheader.i.i, !dbg !2294

; <label>:559                                     ; preds = %555, %553
  %560 = getelementptr inbounds i8* %551, i64 2, !dbg !2294
  %561 = load i8* %560, align 1, !dbg !2294, !tbaa !1650
  switch i8 %561, label %.preheader.i.i [
    i8 0, label %is_valid_path.exit.thread.i
    i8 47, label %is_valid_path.exit.thread.i
  ], !dbg !2294

.preheader.i.i:                                   ; preds = %569, %565, %559, %555
  %p.0.i.i = phi i8* [ %551, %555 ], [ %551, %559 ], [ %563, %565 ], [ %563, %569 ]
  %562 = getelementptr inbounds i8* %p.0.i.i, i64 1, !dbg !2296
  %563 = call i8* @strstr(i8* %562, i8* getelementptr inbounds ([3 x i8]* @.str52, i64 0, i64 0)) nounwind readonly, !dbg !2296
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2292) nounwind, !dbg !2296
  %564 = icmp eq i8* %563, null, !dbg !2298
  br i1 %564, label %.loopexit.i, label %565, !dbg !2298

; <label>:565                                     ; preds = %.preheader.i.i
  %566 = getelementptr inbounds i8* %563, i64 -1, !dbg !2299
  %567 = load i8* %566, align 1, !dbg !2299, !tbaa !1650
  %568 = icmp eq i8 %567, 47, !dbg !2299
  br i1 %568, label %569, label %.preheader.i.i, !dbg !2299

; <label>:569                                     ; preds = %565
  %570 = getelementptr inbounds i8* %563, i64 2, !dbg !2299
  %571 = load i8* %570, align 1, !dbg !2299, !tbaa !1650
  switch i8 %571, label %.preheader.i.i [
    i8 0, label %is_valid_path.exit.thread.i
    i8 47, label %is_valid_path.exit.thread.i
  ], !dbg !2299

.loopexit.i:                                      ; preds = %.preheader.i.i, %550
  %572 = call noalias i8* @_estrdup(i8* %script_path_translated.6.i) nounwind, !dbg !2300
  store i8* %572, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2300, !tbaa !1649
  br label %is_valid_path.exit.thread.i, !dbg !2302

is_valid_path.exit.thread.i:                      ; preds = %.loopexit.i, %569, %569, %559, %559, %548
  call void @llvm.dbg.value(metadata !2303, i64 0, metadata !2304) nounwind, !dbg !2306
  call void @llvm.dbg.value(metadata !1991, i64 0, metadata !2307) nounwind, !dbg !2308
  %573 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2309
  %574 = icmp eq i32 %573, 0, !dbg !2309
  br i1 %574, label %579, label %575, !dbg !2309

; <label>:575                                     ; preds = %is_valid_path.exit.thread.i
  %576 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2310, !tbaa !1649
  %577 = bitcast i8* %576 to %struct._fcgi_request*, !dbg !2310
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2311) nounwind, !dbg !2310
  %578 = call i8* @fcgi_getenv(%struct._fcgi_request* %577, i8* getelementptr inbounds ([15 x i8]* @.str310, i64 0, i64 0), i32 14) nounwind, !dbg !2312
  br label %sapi_cgibin_getenv.exit45.i, !dbg !2312

; <label>:579                                     ; preds = %is_valid_path.exit.thread.i
  %580 = call i8* @getenv(i8* getelementptr inbounds ([15 x i8]* @.str310, i64 0, i64 0)) nounwind, !dbg !2313
  br label %sapi_cgibin_getenv.exit45.i, !dbg !2313

sapi_cgibin_getenv.exit45.i:                      ; preds = %579, %575
  %.0.i44.i = phi i8* [ %578, %575 ], [ %580, %579 ]
  store i8* %.0.i44.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 0), align 8, !dbg !2305, !tbaa !1649
  call void @llvm.dbg.value(metadata !2314, i64 0, metadata !2315) nounwind, !dbg !2317
  call void @llvm.dbg.value(metadata !2004, i64 0, metadata !2318) nounwind, !dbg !2319
  %581 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2320
  %582 = icmp eq i32 %581, 0, !dbg !2320
  br i1 %582, label %587, label %583, !dbg !2320

; <label>:583                                     ; preds = %sapi_cgibin_getenv.exit45.i
  %584 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2321, !tbaa !1649
  %585 = bitcast i8* %584 to %struct._fcgi_request*, !dbg !2321
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2322) nounwind, !dbg !2321
  %586 = call i8* @fcgi_getenv(%struct._fcgi_request* %585, i8* getelementptr inbounds ([13 x i8]* @.str49, i64 0, i64 0), i32 12) nounwind, !dbg !2323
  br label %sapi_cgibin_getenv.exit47.i, !dbg !2323

; <label>:587                                     ; preds = %sapi_cgibin_getenv.exit45.i
  %588 = call i8* @getenv(i8* getelementptr inbounds ([13 x i8]* @.str49, i64 0, i64 0)) nounwind, !dbg !2324
  br label %sapi_cgibin_getenv.exit47.i, !dbg !2324

sapi_cgibin_getenv.exit47.i:                      ; preds = %587, %583
  %.0.i46.i = phi i8* [ %586, %583 ], [ %588, %587 ]
  store i8* %.0.i46.i, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2316, !tbaa !1649
  %589 = icmp ne i8* %.0.i26.i, null, !dbg !2325
  %590 = select i1 %589, i8* %.0.i26.i, i8* getelementptr inbounds ([1 x i8]* @.str50, i64 0, i64 0), !dbg !2325
  store i8* %590, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 10), align 8, !dbg !2325, !tbaa !1649
  %591 = icmp eq i8* %.0.i24.i, null, !dbg !2326
  br i1 %591, label %594, label %592, !dbg !2326

; <label>:592                                     ; preds = %sapi_cgibin_getenv.exit47.i
  %593 = call i32 @atoi(i8* %.0.i24.i) nounwind, !dbg !2327
  %phitmp.i34 = sext i32 %593 to i64, !dbg !2327
  br label %594, !dbg !2327

; <label>:594                                     ; preds = %592, %sapi_cgibin_getenv.exit47.i
  %595 = phi i64 [ %phitmp.i34, %592 ], [ 0, %sapi_cgibin_getenv.exit47.i ]
  store i64 %595, i64* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 5), align 8, !dbg !2327, !tbaa !1782
  call void @llvm.dbg.value(metadata !2328, i64 0, metadata !2329) nounwind, !dbg !2331
  call void @llvm.dbg.value(metadata !2332, i64 0, metadata !2333) nounwind, !dbg !2334
  %596 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2335
  %597 = icmp eq i32 %596, 0, !dbg !2335
  br i1 %597, label %602, label %598, !dbg !2335

; <label>:598                                     ; preds = %594
  %599 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2336, !tbaa !1649
  %600 = bitcast i8* %599 to %struct._fcgi_request*, !dbg !2336
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2337) nounwind, !dbg !2336
  %601 = call i8* @fcgi_getenv(%struct._fcgi_request* %600, i8* getelementptr inbounds ([19 x i8]* @.str51, i64 0, i64 0), i32 18) nounwind, !dbg !2338
  br label %sapi_cgibin_getenv.exit49.i, !dbg !2338

; <label>:602                                     ; preds = %594
  %603 = call i8* @getenv(i8* getelementptr inbounds ([19 x i8]* @.str51, i64 0, i64 0)) nounwind, !dbg !2339
  br label %sapi_cgibin_getenv.exit49.i, !dbg !2339

sapi_cgibin_getenv.exit49.i:                      ; preds = %602, %598
  %.0.i48.i = phi i8* [ %601, %598 ], [ %603, %602 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2340) nounwind, !dbg !2330
  %604 = call i32 @php_handle_auth_data(i8* %.0.i48.i) nounwind, !dbg !2341
  br label %init_request_info.exit, !dbg !2342

init_request_info.exit:                           ; preds = %sapi_cgibin_getenv.exit49.i, %sapi_cgibin_getenv.exit23.i
  call void @llvm.lifetime.end(i64 -1, i8* %225) nounwind, !dbg !2343
  store i32 0, i32* getelementptr inbounds (%struct._zend_compiler_globals* @compiler_globals, i64 0, i32 29), align 8, !dbg !2344, !tbaa !1663
  br i1 %108, label %.thread36, label %605, !dbg !2345

; <label>:605                                     ; preds = %init_request_info.exit
  br i1 %151, label %.thread36, label %.preheader57, !dbg !2345

.preheader57:                                     ; preds = %658, %657, %645, %631, %617, %611, %608, %607, %.preheader57, %605
  %script_file.1 = phi i8* [ %script_file.0, %605 ], [ %script_file.1, %658 ], [ %script_file.1, %657 ], [ %script_file.1, %645 ], [ %script_file.1, %631 ], [ %619, %617 ], [ %script_file.1, %611 ], [ %script_file.1, %608 ], [ %script_file.1, %607 ], [ %script_file.1, %.preheader57 ]
  %no_headers.1 = phi i32 [ %no_headers.0, %605 ], [ %no_headers.1, %658 ], [ %no_headers.1, %657 ], [ 1, %645 ], [ 1, %631 ], [ 1, %617 ], [ %no_headers.1, %611 ], [ %no_headers.1, %608 ], [ %no_headers.1, %607 ], [ %no_headers.1, %.preheader57 ]
  %behavior.2 = phi i32 [ %behavior.1, %605 ], [ %behavior.2, %658 ], [ 5, %657 ], [ %behavior.2, %645 ], [ 4, %631 ], [ %behavior.2, %617 ], [ %behavior.2, %611 ], [ %behavior.2, %608 ], [ %behavior.2, %607 ], [ %behavior.2, %.preheader57 ]
  %606 = call i32 @php_getopt(i32 %argc, i8** %argv, %struct._opt_struct* getelementptr inbounds ([21 x %struct._opt_struct]* @OPTIONS, i64 0, i64 0), i8** @php_optarg, i32* @php_optind, i32 0, i32 2) nounwind, !dbg !2346
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !735), !dbg !2346
  switch i32 %606, label %.preheader57 [
    i32 -1, label %661
    i32 97, label %607
    i32 67, label %608
    i32 101, label %611
    i32 102, label %614
    i32 105, label %620
    i32 108, label %631
    i32 109, label %632
    i32 113, label %645
    i32 118, label %646
    i32 119, label %657
    i32 122, label %658
  ], !dbg !2346

; <label>:607                                     ; preds = %.preheader57
  %puts = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str, i64 0, i64 0)), !dbg !2347
  store i32 1, i32* getelementptr inbounds (%struct._zend_compiler_globals* @compiler_globals, i64 0, i32 29), align 8, !dbg !2350, !tbaa !1663
  br label %.preheader57, !dbg !2351

; <label>:608                                     ; preds = %.preheader57
  %609 = load i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 11), align 8, !dbg !2352, !tbaa !1663
  %610 = or i32 %609, 1, !dbg !2352
  store i32 %610, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 11), align 8, !dbg !2352, !tbaa !1663
  br label %.preheader57, !dbg !2353

; <label>:611                                     ; preds = %.preheader57
  %612 = load i32* getelementptr inbounds (%struct._zend_compiler_globals* @compiler_globals, i64 0, i32 36), align 4, !dbg !2354, !tbaa !1663
  %613 = or i32 %612, 1, !dbg !2354
  store i32 %613, i32* getelementptr inbounds (%struct._zend_compiler_globals* @compiler_globals, i64 0, i32 36), align 4, !dbg !2354, !tbaa !1663
  br label %.preheader57, !dbg !2355

; <label>:614                                     ; preds = %.preheader57
  %615 = icmp eq i8* %script_file.1, null, !dbg !2356
  br i1 %615, label %617, label %616, !dbg !2356

; <label>:616                                     ; preds = %614
  call void @_efree(i8* %script_file.1) nounwind, !dbg !2357
  br label %617, !dbg !2359

; <label>:617                                     ; preds = %616, %614
  %618 = load i8** @php_optarg, align 8, !dbg !2360, !tbaa !1649
  %619 = call noalias i8* @_estrdup(i8* %618) nounwind, !dbg !2360
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !853), !dbg !2360
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !850), !dbg !2361
  br label %.preheader57, !dbg !2362

; <label>:620                                     ; preds = %.preheader57
  %621 = icmp eq i8* %script_file.1, null, !dbg !2363
  br i1 %621, label %623, label %622, !dbg !2363

; <label>:622                                     ; preds = %620
  call void @_efree(i8* %script_file.1) nounwind, !dbg !2364
  br label %623, !dbg !2366

; <label>:623                                     ; preds = %622, %620
  %624 = call i32 @php_request_startup() nounwind, !dbg !2367
  %625 = icmp eq i32 %624, -1, !dbg !2367
  br i1 %625, label %626, label %627, !dbg !2367

; <label>:626                                     ; preds = %623
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2368, !tbaa !1649
  call void @php_module_shutdown() nounwind, !dbg !2370
  br label %.loopexit74, !dbg !2371

; <label>:627                                     ; preds = %623
  %628 = icmp eq i32 %no_headers.1, 0, !dbg !2372
  br i1 %628, label %630, label %629, !dbg !2372

; <label>:629                                     ; preds = %627
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !2373, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 12), align 1, !dbg !2375, !tbaa !1650
  br label %630, !dbg !2376

; <label>:630                                     ; preds = %629, %627
  call void @php_print_info(i32 -1) nounwind, !dbg !2377
  call void @php_request_shutdown(i8* null) nounwind, !dbg !2378
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !733), !dbg !2379
  br label %853, !dbg !2380

; <label>:631                                     ; preds = %.preheader57
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !850), !dbg !2381
  call void @llvm.dbg.value(metadata !2382, i64 0, metadata !849), !dbg !2383
  br label %.preheader57, !dbg !2384

; <label>:632                                     ; preds = %.preheader57
  %633 = icmp eq i8* %script_file.1, null, !dbg !2385
  br i1 %633, label %635, label %634, !dbg !2385

; <label>:634                                     ; preds = %632
  call void @_efree(i8* %script_file.1) nounwind, !dbg !2386
  br label %635, !dbg !2388

; <label>:635                                     ; preds = %634, %632
  call void @php_output_startup() nounwind, !dbg !2389
  call void @php_output_activate() nounwind, !dbg !2390
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !2391, !tbaa !1650
  %636 = call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([15 x i8]* @.str22, i64 0, i64 0)) nounwind, !dbg !2392
  %637 = bitcast %struct._hashtable* %sorted_registry.i to i8*, !dbg !2393
  call void @llvm.lifetime.start(i64 -1, i8* %637) nounwind, !dbg !2393
  %638 = bitcast %struct._zend_module_entry* %tmp.i to i8*, !dbg !2393
  call void @llvm.lifetime.start(i64 -1, i8* %638) nounwind, !dbg !2393
  call void @llvm.dbg.declare(metadata !952, metadata !1060) nounwind, !dbg !2393
  call void @llvm.dbg.declare(metadata !952, metadata !1062) nounwind, !dbg !2395
  %639 = call i32 @_zend_hash_init(%struct._hashtable* %sorted_registry.i, i32 50, i64 (i8*, i32)* null, void (i8*)* null, i8 zeroext 1) nounwind, !dbg !2396
  call void @zend_hash_copy(%struct._hashtable* %sorted_registry.i, %struct._hashtable* @module_registry, void (i8*)* null, i8* %638, i32 168) nounwind, !dbg !2397
  %640 = call i32 @zend_hash_sort(%struct._hashtable* %sorted_registry.i, void (i8*, i64, i64, i32 (i8*, i8*)*)* @zend_qsort, i32 (i8*, i8*)* @module_name_cmp, i32 0) nounwind, !dbg !2398
  call void @zend_hash_apply_with_argument(%struct._hashtable* %sorted_registry.i, i32 (i8*, i8*)* bitcast (i32 (%struct._zend_module_entry*, i8*)* @print_module_info to i32 (i8*, i8*)*), i8* null) nounwind, !dbg !2399
  call void @zend_hash_destroy(%struct._hashtable* %sorted_registry.i) nounwind, !dbg !2400
  call void @llvm.lifetime.end(i64 -1, i8* %637) nounwind, !dbg !2401
  call void @llvm.lifetime.end(i64 -1, i8* %638) nounwind, !dbg !2401
  %641 = call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([17 x i8]* @.str23, i64 0, i64 0)) nounwind, !dbg !2402
  %642 = bitcast %struct._zend_llist* %sorted_exts.i to i8*, !dbg !2403
  call void @llvm.lifetime.start(i64 -1, i8* %642) nounwind, !dbg !2403
  call void @llvm.dbg.declare(metadata !952, metadata !955) nounwind, !dbg !2403
  call void @zend_llist_copy(%struct._zend_llist* %sorted_exts.i, %struct._zend_llist* @zend_extensions) nounwind, !dbg !2405
  %643 = getelementptr inbounds %struct._zend_llist* %sorted_exts.i, i64 0, i32 4, !dbg !2406
  store void (i8*)* null, void (i8*)** %643, align 8, !dbg !2406, !tbaa !1649
  call void @zend_llist_sort(%struct._zend_llist* %sorted_exts.i, i32 (%struct._zend_llist_element**, %struct._zend_llist_element**)* @extension_name_cmp) nounwind, !dbg !2407
  call void @zend_llist_apply_with_argument(%struct._zend_llist* %sorted_exts.i, void (i8*, i8*)* bitcast (i32 (%struct._zend_extension*, i8*)* @print_extension_info to void (i8*, i8*)*), i8* null) nounwind, !dbg !2408
  call void @zend_llist_destroy(%struct._zend_llist* %sorted_exts.i) nounwind, !dbg !2409
  call void @llvm.lifetime.end(i64 -1, i8* %642) nounwind, !dbg !2410
  %644 = call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([2 x i8]* @.str24, i64 0, i64 0)) nounwind, !dbg !2411
  call void @php_end_ob_buffers(i8 zeroext 1) nounwind, !dbg !2412
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !733), !dbg !2413
  br label %853, !dbg !2414

; <label>:645                                     ; preds = %.preheader57
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !850), !dbg !2415
  br label %.preheader57, !dbg !2416

; <label>:646                                     ; preds = %.preheader57
  %647 = icmp eq i8* %script_file.1, null, !dbg !2417
  br i1 %647, label %649, label %648, !dbg !2417

; <label>:648                                     ; preds = %646
  call void @_efree(i8* %script_file.1) nounwind, !dbg !2418
  br label %649, !dbg !2420

; <label>:649                                     ; preds = %648, %646
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !850), !dbg !2421
  %650 = call i32 @php_request_startup() nounwind, !dbg !2422
  %651 = icmp eq i32 %650, -1, !dbg !2422
  br i1 %651, label %652, label %653, !dbg !2422

; <label>:652                                     ; preds = %649
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2423, !tbaa !1649
  call void @php_module_shutdown() nounwind, !dbg !2425
  br label %.loopexit74, !dbg !2426

; <label>:653                                     ; preds = %649
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !2427, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 12), align 1, !dbg !2429, !tbaa !1650
  %654 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @sapi_module, i64 0, i32 0), align 8, !dbg !2430, !tbaa !1649
  %655 = call i8* @get_zend_version() nounwind, !dbg !2431
  %656 = call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([68 x i8]* @.str25, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str26, i64 0, i64 0), i8* %654, i8* getelementptr inbounds ([12 x i8]* @.str27, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str28, i64 0, i64 0), i8* %655) nounwind, !dbg !2431
  call void @php_request_shutdown(i8* null) nounwind, !dbg !2432
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !733), !dbg !2433
  br label %853, !dbg !2434

; <label>:657                                     ; preds = %.preheader57
  call void @llvm.dbg.value(metadata !2435, i64 0, metadata !849), !dbg !2436
  br label %.preheader57, !dbg !2437

; <label>:658                                     ; preds = %.preheader57
  %659 = load i8** @php_optarg, align 8, !dbg !2438, !tbaa !1649
  %660 = call i32 @zend_load_extension(i8* %659) nounwind, !dbg !2438
  br label %.preheader57, !dbg !2439

; <label>:661                                     ; preds = %.preheader57
  %662 = icmp eq i8* %script_file.1, null, !dbg !2440
  br i1 %662, label %673, label %663, !dbg !2440

; <label>:663                                     ; preds = %661
  %664 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2441, !tbaa !1649
  %665 = icmp eq i8* %664, null, !dbg !2441
  br i1 %665, label %667, label %666, !dbg !2441

; <label>:666                                     ; preds = %663
  call void @_efree(i8* %664) nounwind, !dbg !2442
  br label %667, !dbg !2442

; <label>:667                                     ; preds = %666, %663
  store i8* %script_file.1, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2444, !tbaa !1649
  %668 = load i32* @php_optind, align 4, !dbg !1943, !tbaa !1663
  %669 = sub i32 %.neg52, %668, !dbg !1943
  store i32 %669, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 22), align 4, !dbg !1943, !tbaa !1663
  %670 = add nsw i32 %668, -1, !dbg !2445
  %671 = sext i32 %670 to i64, !dbg !2445
  %672 = getelementptr inbounds i8** %argv, i64 %671, !dbg !2445
  store i8** %672, i8*** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 23), align 8, !dbg !2445, !tbaa !1649
  store i8* %script_file.1, i8** %672, align 8, !dbg !2446, !tbaa !1649
  br label %690, !dbg !2447

; <label>:673                                     ; preds = %661
  %674 = load i32* @php_optind, align 4, !dbg !2448, !tbaa !1663
  %675 = icmp slt i32 %674, %argc, !dbg !2448
  br i1 %675, label %676, label %690, !dbg !2448

; <label>:676                                     ; preds = %673
  %677 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2449, !tbaa !1649
  %678 = icmp eq i8* %677, null, !dbg !2449
  br i1 %678, label %680, label %679, !dbg !2449

; <label>:679                                     ; preds = %676
  call void @_efree(i8* %677) nounwind, !dbg !2451
  %.pre = load i32* @php_optind, align 4, !dbg !2453, !tbaa !1663
  br label %680, !dbg !2451

; <label>:680                                     ; preds = %679, %676
  %681 = phi i32 [ %674, %676 ], [ %.pre, %679 ]
  %682 = sext i32 %681 to i64, !dbg !2453
  %683 = getelementptr inbounds i8** %argv, i64 %682, !dbg !2453
  %684 = load i8** %683, align 8, !dbg !2453, !tbaa !1649
  %685 = call noalias i8* @_estrdup(i8* %684) nounwind, !dbg !2453
  store i8* %685, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2453, !tbaa !1649
  %686 = load i32* @php_optind, align 4, !dbg !2454, !tbaa !1663
  %687 = sub nsw i32 %argc, %686, !dbg !2454
  store i32 %687, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 22), align 4, !dbg !2454, !tbaa !1663
  %688 = sext i32 %686 to i64, !dbg !2455
  %689 = getelementptr inbounds i8** %argv, i64 %688, !dbg !2455
  store i8** %689, i8*** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 23), align 8, !dbg !2455, !tbaa !1649
  br label %690, !dbg !2456

; <label>:690                                     ; preds = %680, %673, %667
  %691 = phi i32 [ %674, %673 ], [ %686, %680 ], [ %668, %667 ]
  %692 = icmp eq i32 %no_headers.1, 0, !dbg !2457
  br i1 %692, label %694, label %693, !dbg !2457

; <label>:693                                     ; preds = %690
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !2458, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 12), align 1, !dbg !2460, !tbaa !1650
  br label %694, !dbg !2461

; <label>:694                                     ; preds = %693, %690
  %695 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2462, !tbaa !1649
  %696 = icmp eq i8* %695, null, !dbg !2462
  %697 = icmp slt i32 %691, %argc, !dbg !2462
  %or.cond173 = and i1 %696, %697, !dbg !2462
  br i1 %or.cond173, label %.lr.ph, label %._crit_edge169, !dbg !2462

.lr.ph:                                           ; preds = %694
  call void @llvm.dbg.value(metadata !33, i64 0, metadata !737), !dbg !2463
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !736), !dbg !2464
  %698 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 37, i32 1), align 8, !dbg !2466, !tbaa !1649
  %699 = call i64 @strlen(i8* %698) nounwind readonly, !dbg !2466
  %sext = shl i64 %699, 32, !dbg !2467
  %700 = ashr exact i64 %sext, 32, !dbg !2467
  %701 = sext i32 %691 to i64
  br label %702, !dbg !2464

; <label>:702                                     ; preds = %715, %.lr.ph
  %indvars.iv = phi i64 [ %701, %.lr.ph ], [ %indvars.iv.next, %715 ]
  %len.067 = phi i32 [ 0, %.lr.ph ], [ %len.1, %715 ]
  %703 = trunc i64 %indvars.iv to i32, !dbg !2470
  %704 = icmp slt i32 %703, %235, !dbg !2470
  %705 = getelementptr inbounds i8** %argv, i64 %indvars.iv, !dbg !2467
  %706 = load i8** %705, align 8, !dbg !2467, !tbaa !1649
  %707 = call i64 @strlen(i8* %706) nounwind readonly, !dbg !2467
  br i1 %704, label %708, label %712, !dbg !2470

; <label>:708                                     ; preds = %702
  %709 = sext i32 %len.067 to i64, !dbg !2467
  %710 = add i64 %709, %700, !dbg !2467
  %711 = add i64 %710, %707, !dbg !2467
  br label %715, !dbg !2471

; <label>:712                                     ; preds = %702
  %713 = zext i32 %len.067 to i64, !dbg !2472
  %714 = add i64 %707, %713, !dbg !2472
  br label %715

; <label>:715                                     ; preds = %712, %708
  %len.1.in = phi i64 [ %711, %708 ], [ %714, %712 ]
  %len.1 = trunc i64 %len.1.in to i32, !dbg !2467
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !2464
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !2464
  %exitcond = icmp eq i32 %lftr.wideiv, %argc, !dbg !2464
  br i1 %exitcond, label %.lr.ph71, label %702, !dbg !2464

.lr.ph71:                                         ; preds = %715
  %phitmp = add i32 %len.1, 2, !dbg !2464
  %phitmp116 = sext i32 %phitmp to i64, !dbg !2464
  %716 = call noalias i8* @malloc(i64 %phitmp116), !dbg !2474
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !848), !dbg !2474
  store i8 0, i8* %716, align 1, !dbg !2475, !tbaa !1650
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !736), !dbg !2476
  %717 = sext i32 %691 to i64
  br label %718, !dbg !2476

; <label>:718                                     ; preds = %727, %.lr.ph71
  %indvars.iv128 = phi i64 [ %717, %.lr.ph71 ], [ %indvars.iv.next129, %727 ]
  %719 = getelementptr inbounds i8** %argv, i64 %indvars.iv128, !dbg !2477
  %720 = load i8** %719, align 8, !dbg !2477, !tbaa !1649
  %721 = call i64 @strlcat(i8* %716, i8* %720, i64 %phitmp116) nounwind, !dbg !2477
  %722 = trunc i64 %indvars.iv128 to i32, !dbg !1940
  %723 = icmp slt i32 %722, %235, !dbg !1940
  br i1 %723, label %724, label %727, !dbg !1940

; <label>:724                                     ; preds = %718
  %725 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 37, i32 1), align 8, !dbg !2478, !tbaa !1649
  %726 = call i64 @strlcat(i8* %716, i8* %725, i64 %phitmp116) nounwind, !dbg !2478
  br label %727, !dbg !2480

; <label>:727                                     ; preds = %724, %718
  %indvars.iv.next129 = add i64 %indvars.iv128, 1, !dbg !2476
  %lftr.wideiv130 = trunc i64 %indvars.iv.next129 to i32, !dbg !2476
  %exitcond131 = icmp eq i32 %lftr.wideiv130, %argc, !dbg !2476
  br i1 %exitcond131, label %._crit_edge72, label %718, !dbg !2476

._crit_edge72:                                    ; preds = %727
  store i8* %716, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2481, !tbaa !1649
  call void @llvm.dbg.value(metadata !1726, i64 0, metadata !731), !dbg !2482
  br label %._crit_edge169, !dbg !2483

._crit_edge169:                                   ; preds = %._crit_edge72, %694
  %free_query_string.1 = phi i32 [ 1, %._crit_edge72 ], [ %free_query_string.0, %694 ]
  %728 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2484, !tbaa !1649
  %.not28 = icmp eq i8* %728, null, !dbg !2484
  br i1 %.not28, label %730, label %.thread36, !dbg !2484

.thread36:                                        ; preds = %._crit_edge169, %605, %init_request_info.exit
  %free_query_string.148 = phi i32 [ %free_query_string.1, %._crit_edge169 ], [ %free_query_string.0, %init_request_info.exit ], [ %free_query_string.0, %605 ]
  %behavior.345 = phi i32 [ %behavior.2, %._crit_edge169 ], [ %behavior.1, %init_request_info.exit ], [ %behavior.1, %605 ]
  %no_headers.243 = phi i32 [ %no_headers.1, %._crit_edge169 ], [ %no_headers.0, %init_request_info.exit ], [ %no_headers.0, %605 ]
  %script_file.241 = phi i8* [ %script_file.1, %._crit_edge169 ], [ %script_file.0, %init_request_info.exit ], [ %script_file.0, %605 ]
  store i32 0, i32* %226, align 8, !dbg !1931, !tbaa !1650
  %729 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !1933, !tbaa !1649
  store i8* %729, i8** %227, align 8, !dbg !1933, !tbaa !1649
  br label %732, !dbg !2485

; <label>:730                                     ; preds = %._crit_edge169
  store i8* getelementptr inbounds ([2 x i8]* @.str2914, i64 0, i64 0), i8** %227, align 8, !dbg !2486, !tbaa !1649
  store i32 2, i32* %226, align 8, !dbg !2488, !tbaa !1650
  %731 = load %struct.__sFILE** @__stdinp, align 8, !dbg !2489, !tbaa !1649
  %.c = bitcast %struct.__sFILE* %731 to i8*, !dbg !2489
  br label %732

; <label>:732                                     ; preds = %730, %.thread36
  %storemerge = phi i8* [ %.c, %730 ], [ null, %.thread36 ]
  %free_query_string.147 = phi i32 [ %free_query_string.1, %730 ], [ %free_query_string.148, %.thread36 ]
  %behavior.344 = phi i32 [ %behavior.2, %730 ], [ %behavior.345, %.thread36 ]
  %no_headers.242 = phi i32 [ %no_headers.1, %730 ], [ %no_headers.243, %.thread36 ]
  %script_file.240 = phi i8* [ %script_file.1, %730 ], [ %script_file.241, %.thread36 ]
  store i8* %storemerge, i8** %228, align 8, !dbg !1934
  store i8* null, i8** %229, align 8, !dbg !1935, !tbaa !1649
  store i8 0, i8* %230, align 8, !dbg !1936, !tbaa !1650
  %733 = call i32 @php_request_startup() nounwind, !dbg !2490
  %734 = icmp eq i32 %733, -1, !dbg !2490
  br i1 %734, label %735, label %739, !dbg !2490

; <label>:735                                     ; preds = %732
  br i1 %151, label %736, label %738, !dbg !2491

; <label>:736                                     ; preds = %735
  %737 = call i32 @fcgi_finish_request(%struct._fcgi_request* %request, i32 1) nounwind, !dbg !2493
  br label %738, !dbg !2495

; <label>:738                                     ; preds = %736, %735
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2496, !tbaa !1649
  call void @php_module_shutdown() nounwind, !dbg !2497
  br label %.loopexit74, !dbg !2498

; <label>:739                                     ; preds = %732
  %740 = icmp eq i32 %no_headers.242, 0, !dbg !2499
  br i1 %740, label %742, label %741, !dbg !2499

; <label>:741                                     ; preds = %739
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 4), align 4, !dbg !2500, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 12), align 1, !dbg !2502, !tbaa !1650
  br label %742, !dbg !2503

; <label>:742                                     ; preds = %741, %739
  br i1 %108, label %746, label %743, !dbg !2504

; <label>:743                                     ; preds = %742
  %744 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2504, !tbaa !1649
  %745 = icmp ne i8* %744, null, !dbg !2504
  %or.cond = or i1 %151, %745, !dbg !2504
  br i1 %or.cond, label %746, label %773, !dbg !2504

; <label>:746                                     ; preds = %743, %742
  %747 = call i32 @php_fopen_primary_script(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2505
  %748 = icmp eq i32 %747, -1, !dbg !2505
  br i1 %748, label %749, label %773, !dbg !2505

; <label>:749                                     ; preds = %746
  %750 = load [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1937, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !917), !dbg !1937
  call void @llvm.dbg.declare(metadata !952, metadata !921), !dbg !1937
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !921), !dbg !1937
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !921), !dbg !1937
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !921), !dbg !1937
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !921), !dbg !1937
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !921), !dbg !1937
  store [1 x %struct._sigjmp_buf]* %__bailout5, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !1937, !tbaa !1649
  %751 = call i32 @sigsetjmp(%struct._sigjmp_buf* %231, i32 0) nounwind returns_twice, !dbg !1937
  %752 = icmp eq i32 %751, 0, !dbg !1937
  br i1 %752, label %753, label %761, !dbg !1937

; <label>:753                                     ; preds = %749
  %754 = call i32* @__error() nounwind, !dbg !2506
  %755 = load i32* %754, align 4, !dbg !2506, !tbaa !1663
  %756 = icmp eq i32 %755, 13, !dbg !2506
  br i1 %756, label %757, label %759, !dbg !2506

; <label>:757                                     ; preds = %753
  store i32 403, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !2507, !tbaa !1663
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !922), !dbg !2508
  %758 = call i32 @php_body_write(i8* getelementptr inbounds ([16 x i8]* @.str30, i64 0, i64 0), i32 15) nounwind, !dbg !2508
  br label %762, !dbg !2509

; <label>:759                                     ; preds = %753
  store i32 404, i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !2510, !tbaa !1663
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !927), !dbg !2511
  %760 = call i32 @php_body_write(i8* getelementptr inbounds ([26 x i8]* @.str31, i64 0, i64 0), i32 25) nounwind, !dbg !2511
  br label %762

; <label>:761                                     ; preds = %749
  store [1 x %struct._sigjmp_buf]* %750, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !2512, !tbaa !1649
  br label %762

; <label>:762                                     ; preds = %761, %759, %757
  store [1 x %struct._sigjmp_buf]* %750, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !2514, !tbaa !1649
  br i1 %151, label %._crit_edge170, label %763, !dbg !2515

; <label>:763                                     ; preds = %762
  %764 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2516, !tbaa !1649
  %765 = icmp eq i8* %764, null, !dbg !2516
  br i1 %765, label %767, label %766, !dbg !2516

; <label>:766                                     ; preds = %763
  call void @_efree(i8* %764) nounwind, !dbg !2517
  br label %767, !dbg !2517

; <label>:767                                     ; preds = %766, %763
  %768 = icmp ne i32 %free_query_string.147, 0, !dbg !2519
  %769 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2519, !tbaa !1649
  %770 = icmp ne i8* %769, null, !dbg !2519
  %or.cond11 = and i1 %768, %770, !dbg !2519
  br i1 %or.cond11, label %771, label %772, !dbg !2519

; <label>:771                                     ; preds = %767
  call void @free(i8* %769), !dbg !2520
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2522, !tbaa !1649
  br label %772, !dbg !2523

; <label>:772                                     ; preds = %771, %767
  call void @php_request_shutdown(i8* null) nounwind, !dbg !2524
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2525, !tbaa !1649
  call void @php_module_shutdown() nounwind, !dbg !2526
  call void @sapi_shutdown() nounwind, !dbg !2527
  br label %.loopexit74, !dbg !2528

; <label>:773                                     ; preds = %746, %743
  %774 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 2), align 2, !dbg !1939, !tbaa !1650
  %775 = icmp eq i8 %774, 0, !dbg !1939
  br i1 %775, label %799, label %776, !dbg !1939

; <label>:776                                     ; preds = %773
  %777 = load %struct.__sFILE** %234, align 8, !dbg !1939, !tbaa !1649
  %778 = icmp eq %struct.__sFILE* %777, null, !dbg !1939
  %779 = load %struct.__sFILE** @__stdinp, align 8, !dbg !1939, !tbaa !1649
  %780 = icmp eq %struct.__sFILE* %777, %779, !dbg !1939
  %or.cond32 = or i1 %778, %780, !dbg !1939
  br i1 %or.cond32, label %799, label %781, !dbg !1939

; <label>:781                                     ; preds = %776
  %782 = call i32 @fgetc(%struct.__sFILE* %777) nounwind, !dbg !2529
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !735), !dbg !2529
  %783 = icmp eq i32 %782, 35, !dbg !2530
  br i1 %783, label %.preheader55, label %797, !dbg !2530

.preheader55:                                     ; preds = %784, %781
  %c.0 = phi i32 [ %786, %784 ], [ 35, %781 ]
  switch i32 %c.0, label %784 [
    i32 13, label %787
    i32 10, label %.loopexit56
    i32 -1, label %.loopexit56
  ], !dbg !2531

; <label>:784                                     ; preds = %.preheader55
  %785 = load %struct.__sFILE** %234, align 8, !dbg !2532, !tbaa !1649
  %786 = call i32 @fgetc(%struct.__sFILE* %785) nounwind, !dbg !2532
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !735), !dbg !2532
  br label %.preheader55, !dbg !2534

; <label>:787                                     ; preds = %.preheader55
  %788 = load %struct.__sFILE** %234, align 8, !dbg !2535, !tbaa !1649
  %789 = call i32 @fgetc(%struct.__sFILE* %788) nounwind, !dbg !2535
  %790 = icmp eq i32 %789, 10, !dbg !2535
  br i1 %790, label %.loopexit56, label %791, !dbg !2535

; <label>:791                                     ; preds = %787
  %792 = load %struct.__sFILE** %234, align 8, !dbg !2536, !tbaa !1649
  %793 = call i64 @ftell(%struct.__sFILE* %792) nounwind, !dbg !2536
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !930), !dbg !2536
  %794 = load %struct.__sFILE** %234, align 8, !dbg !2537, !tbaa !1649
  %795 = add nsw i64 %793, -1, !dbg !2537
  %796 = call i32 @fseek(%struct.__sFILE* %794, i64 %795, i32 0) nounwind, !dbg !2537
  br label %.loopexit56, !dbg !2538

.loopexit56:                                      ; preds = %791, %787, %.preheader55, %.preheader55
  store i32 2, i32* getelementptr inbounds (%struct._zend_compiler_globals* @compiler_globals, i64 0, i32 30), align 4, !dbg !2539, !tbaa !1663
  br label %799, !dbg !2540

; <label>:797                                     ; preds = %781
  %798 = load %struct.__sFILE** %234, align 8, !dbg !2541, !tbaa !1649
  call void @rewind(%struct.__sFILE* %798) nounwind, !dbg !2541
  br label %799

; <label>:799                                     ; preds = %797, %.loopexit56, %776, %773
  switch i32 %behavior.344, label %._crit_edge170 [
    i32 1, label %800
    i32 4, label %802
    i32 5, label %811
    i32 2, label %815
  ], !dbg !2543

; <label>:800                                     ; preds = %799
  %801 = call i32 @php_execute_script(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2544
  br label %._crit_edge170, !dbg !2545

; <label>:802                                     ; preds = %799
  store i8 0, i8* getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 59), align 2, !dbg !2546, !tbaa !1650
  %803 = call i32 @php_lint_script(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2547
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !733), !dbg !2547
  %804 = icmp eq i32 %803, 0, !dbg !2548
  %805 = load i32 (i8*, ...)** @zend_printf, align 8, !dbg !2549, !tbaa !1649
  %806 = load i8** %227, align 8, !dbg !2549, !tbaa !1649
  br i1 %804, label %807, label %809, !dbg !2548

; <label>:807                                     ; preds = %802
  %808 = call i32 (i8*, ...)* %805(i8* getelementptr inbounds ([33 x i8]* @.str32, i64 0, i64 0), i8* %806) nounwind, !dbg !2549
  br label %._crit_edge170, !dbg !2551

; <label>:809                                     ; preds = %802
  %810 = call i32 (i8*, ...)* %805(i8* getelementptr inbounds ([19 x i8]* @.str33, i64 0, i64 0), i8* %806) nounwind, !dbg !2552
  br label %._crit_edge170

; <label>:811                                     ; preds = %799
  %812 = call i32 @open_file_for_scanning(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2554
  %813 = icmp eq i32 %812, 0, !dbg !2554
  br i1 %813, label %814, label %.loopexit74, !dbg !2554

; <label>:814                                     ; preds = %811
  call void @zend_strip() nounwind, !dbg !2555
  call void @zend_file_handle_dtor(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2557
  call void @php_end_ob_buffers(i8 zeroext 1) nounwind, !dbg !2558
  br label %.loopexit74, !dbg !2559

; <label>:815                                     ; preds = %799
  call void @llvm.dbg.declare(metadata !952, metadata !935), !dbg !2560
  %816 = call i32 @open_file_for_scanning(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2561
  %817 = icmp eq i32 %816, 0, !dbg !2561
  br i1 %817, label %818, label %.loopexit74, !dbg !2561

; <label>:818                                     ; preds = %815
  call void @php_get_highlight_struct(%struct._zend_syntax_highlighter_ini* %syntax_highlighter_ini) nounwind, !dbg !2562
  call void @zend_highlight(%struct._zend_syntax_highlighter_ini* %syntax_highlighter_ini) nounwind, !dbg !2564
  br i1 %151, label %._crit_edge170, label %819, !dbg !2565

; <label>:819                                     ; preds = %818
  call void @zend_file_handle_dtor(%struct._zend_file_handle* %file_handle) nounwind, !dbg !2566
  call void @php_end_ob_buffers(i8 zeroext 1) nounwind, !dbg !2567
  br label %.loopexit74, !dbg !2568

._crit_edge170:                                   ; preds = %818, %809, %807, %800, %799, %762
  %behavior.346 = phi i32 [ 4, %807 ], [ 4, %809 ], [ 1, %800 ], [ %behavior.344, %762 ], [ %behavior.344, %799 ], [ 2, %818 ]
  %exit_status.1 = phi i32 [ 0, %807 ], [ %803, %809 ], [ %exit_status.0, %800 ], [ %exit_status.0, %762 ], [ %exit_status.0, %799 ], [ %exit_status.0, %818 ]
  %820 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2569, !tbaa !1649
  %821 = icmp eq i8* %820, null, !dbg !2569
  br i1 %821, label %823, label %822, !dbg !2569

; <label>:822                                     ; preds = %._crit_edge170
  call void @_efree(i8* %820) nounwind, !dbg !2571
  br label %823, !dbg !2571

; <label>:823                                     ; preds = %822, %._crit_edge170
  call void @php_request_shutdown(i8* null) nounwind, !dbg !2573
  %824 = icmp eq i32 %exit_status.1, 0, !dbg !2574
  %825 = load i32* getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 16), align 8, !dbg !2575, !tbaa !1663
  %.exit_status.1 = select i1 %824, i32 %825, i32 %exit_status.1, !dbg !2574
  %826 = icmp ne i32 %free_query_string.147, 0, !dbg !2577
  %827 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2577, !tbaa !1649
  %828 = icmp ne i8* %827, null, !dbg !2577
  %or.cond16 = and i1 %826, %828, !dbg !2577
  br i1 %or.cond16, label %829, label %830, !dbg !2577

; <label>:829                                     ; preds = %823
  call void @free(i8* %827), !dbg !2578
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 1), align 8, !dbg !2580, !tbaa !1649
  br label %830, !dbg !2581

; <label>:830                                     ; preds = %829, %823
  br i1 %151, label %836, label %831, !dbg !2582

; <label>:831                                     ; preds = %830
  br i1 %237, label %.loopexit73, label %832, !dbg !1946

; <label>:832                                     ; preds = %831
  %833 = add nsw i32 %repeats.1.ph, -1, !dbg !2583
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !861), !dbg !2583
  %834 = icmp sgt i32 %833, 0, !dbg !2585
  br i1 %834, label %835, label %.loopexit73, !dbg !2585

; <label>:835                                     ; preds = %832
  call void @llvm.dbg.value(metadata !1731, i64 0, metadata !853), !dbg !2586
  store i32 %1, i32* @php_optind, align 4, !dbg !2588, !tbaa !1663
  store i8* %2, i8** @php_optarg, align 8, !dbg !2589, !tbaa !1649
  br label %.outer, !dbg !2590

; <label>:836                                     ; preds = %830
  %837 = add nsw i32 %requests.0, 1, !dbg !2591
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !856), !dbg !2591
  %838 = icmp eq i32 %837, %max_requests.1, !dbg !1938
  %or.cond33 = and i1 %232, %838, !dbg !1938
  br i1 %or.cond33, label %839, label %238, !dbg !1938

; <label>:839                                     ; preds = %836
  %840 = call i32 @fcgi_finish_request(%struct._fcgi_request* %request, i32 1) nounwind, !dbg !2592
  br i1 %141, label %841, label %842, !dbg !2594

; <label>:841                                     ; preds = %839
  call void @free(i8* %bindpath.0), !dbg !2595
  br label %842, !dbg !2597

; <label>:842                                     ; preds = %841, %839
  %843 = icmp eq i32 %max_requests.1, 1, !dbg !2598
  %.exit_status.1. = select i1 %843, i32 %.exit_status.1, i32 0, !dbg !2598
  br label %.loopexit73, !dbg !2598

.loopexit73:                                      ; preds = %842, %832, %831, %239
  %exit_status.3 = phi i32 [ %.exit_status.1., %842 ], [ %exit_status.0, %239 ], [ %.exit_status.1, %831 ], [ %.exit_status.1, %832 ]
  call void @fcgi_shutdown() nounwind, !dbg !2599
  %844 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 20), align 8, !dbg !2600, !tbaa !1649
  %845 = icmp eq i8* %844, null, !dbg !2600
  br i1 %845, label %847, label %846, !dbg !2600

; <label>:846                                     ; preds = %.loopexit73
  call void @free(i8* %844), !dbg !2601
  br label %847, !dbg !2603

; <label>:847                                     ; preds = %846, %.loopexit73
  %848 = load i8** getelementptr inbounds (%struct._sapi_module_struct* @cgi_sapi_module, i64 0, i32 34), align 8, !dbg !2604, !tbaa !1649
  %849 = icmp eq i8* %848, null, !dbg !2604
  br i1 %849, label %852, label %850, !dbg !2604

; <label>:850                                     ; preds = %847
  call void @free(i8* %848), !dbg !2605
  br label %852, !dbg !2607

; <label>:851                                     ; preds = %.loopexit
  store [1 x %struct._sigjmp_buf]* null, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !2608, !tbaa !1649
  call void @llvm.dbg.value(metadata !2610, i64 0, metadata !733), !dbg !2611
  br label %852

; <label>:852                                     ; preds = %851, %850, %847
  %benchmark.1 = phi i32 [ %benchmark.0.ph, %850 ], [ %benchmark.0.ph, %847 ], [ 0, %851 ]
  %exit_status.4 = phi i32 [ %exit_status.3, %850 ], [ %exit_status.3, %847 ], [ 255, %851 ]
  store [1 x %struct._sigjmp_buf]* null, [1 x %struct._sigjmp_buf]** getelementptr inbounds (%struct._zend_executor_globals* @executor_globals, i64 0, i32 13), align 8, !dbg !2613, !tbaa !1649
  br label %853, !dbg !2613

; <label>:853                                     ; preds = %852, %653, %635, %630, %217
  %benchmark.2 = phi i32 [ %benchmark.0.ph, %217 ], [ %benchmark.1, %852 ], [ %benchmark.0.ph, %653 ], [ %benchmark.0.ph, %635 ], [ %benchmark.0.ph, %630 ]
  %exit_status.5 = phi i32 [ 0, %217 ], [ %exit_status.4, %852 ], [ 0, %653 ], [ 0, %635 ], [ 0, %630 ]
  %854 = icmp eq i32 %benchmark.2, 0, !dbg !2614
  br i1 %854, label %.thread35, label %855, !dbg !2614

; <label>:855                                     ; preds = %853
  %856 = call i32 @gettimeofday(%struct.timeval* %end, %struct.timezone* null) nounwind, !dbg !2615
  %857 = getelementptr inbounds %struct.timeval* %end, i64 0, i32 0, !dbg !2616
  %858 = load i64* %857, align 8, !dbg !2616, !tbaa !1782
  %859 = getelementptr inbounds %struct.timeval* %start, i64 0, i32 0, !dbg !2616
  %860 = load i64* %859, align 8, !dbg !2616, !tbaa !1782
  %861 = sub nsw i64 %858, %860, !dbg !2616
  %862 = trunc i64 %861 to i32, !dbg !2616
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !947), !dbg !2616
  %863 = getelementptr inbounds %struct.timeval* %end, i64 0, i32 1, !dbg !2617
  %864 = load i64* %863, align 8, !dbg !2617, !tbaa !1782
  %865 = getelementptr inbounds %struct.timeval* %start, i64 0, i32 1, !dbg !2617
  %866 = load i64* %865, align 8, !dbg !2617, !tbaa !1782
  %867 = icmp slt i64 %864, %866, !dbg !2617
  br i1 %867, label %868, label %871, !dbg !2617

; <label>:868                                     ; preds = %855
  %869 = add nsw i32 %862, -1, !dbg !2618
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !947), !dbg !2618
  %870 = add nsw i64 %864, 1000000, !dbg !2620
  br label %871

; <label>:871                                     ; preds = %868, %855
  %sec.0 = phi i32 [ %869, %868 ], [ %862, %855 ]
  %.pn = phi i64 [ %870, %868 ], [ %864, %855 ]
  %usec.0.in = sub nsw i64 %.pn, %866, !dbg !2621
  %usec.0 = trunc i64 %usec.0.in to i32, !dbg !2621
  %872 = load %struct.__sFILE** @__stderrp, align 8, !dbg !2623, !tbaa !1649
  %873 = call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %872, i8* getelementptr inbounds ([28 x i8]* @.str34, i64 0, i64 0), i32 %sec.0, i32 %usec.0) nounwind, !dbg !2623
  br label %.thread35, !dbg !2624

.thread35:                                        ; preds = %871, %853, %205, %204, %187
  %exit_status.6 = phi i32 [ 0, %187 ], [ %exit_status.5, %871 ], [ %exit_status.5, %853 ], [ 0, %204 ], [ 0, %205 ]
  store i8* null, i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2625, !tbaa !1649
  call void @php_module_shutdown() nounwind, !dbg !2626
  call void @sapi_shutdown() nounwind, !dbg !2627
  br label %.loopexit74, !dbg !2628

.loopexit74:                                      ; preds = %.thread35, %819, %815, %814, %811, %772, %738, %652, %626, %168, %158, %145, %139, %112
  %.0 = phi i32 [ -1, %145 ], [ -1, %158 ], [ -1, %168 ], [ %exit_status.6, %.thread35 ], [ -1, %738 ], [ -1, %772 ], [ -1, %652 ], [ -1, %626 ], [ -1, %139 ], [ -1, %112 ], [ 0, %814 ], [ 0, %811 ], [ 0, %819 ], [ 0, %815 ]
  ret i32 %.0, !dbg !2629
}

declare void (i32)* @signal(i32, void (i32)*)

declare void @sapi_startup(%struct._sapi_module_struct*)

declare i8* @getenv(i8* nocapture) nounwind readonly

declare i32 @php_getopt(i32, i8**, %struct._opt_struct*, i8**, i32*, i32, i32)

declare void @free(i8* nocapture) nounwind

declare noalias i8* @strdup(i8* nocapture) nounwind

declare i8* @strchr(i8*, i32) nounwind readonly

declare noalias i8* @realloc(i8* nocapture, i64) nounwind

declare i32 @sigsetjmp(%struct._sigjmp_buf*, i32) returns_twice

declare i32 @php_body_write(i8*, i32)

declare i32 @fcgi_listen(i8*, i32)

declare i32 @atoi(i8* nocapture) nounwind readonly

declare void @fcgi_init_request(%struct._fcgi_request*, i32)

declare void @fcgi_set_mgmt_var(i8*, i64, i8*, i64)

declare i32 @setsid()

declare i32 @getpgrp()

declare void @perror(i8* nocapture) nounwind

declare i32 @fcgi_in_shutdown()

declare i32 @fork()

declare i32 @wait(i32*)

declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*)

declare void @fcgi_shutdown()

declare void @php_output_startup()

declare void @php_output_activate()

declare void @php_end_ob_buffers(i8 zeroext)

declare i32 @fcgi_accept_request(%struct._fcgi_request*)

declare void @_efree(i8*)

declare noalias i8* @_estrdup(i8*)

declare i32 @php_request_startup()

declare void @php_module_shutdown()

declare void @php_print_info(i32)

declare void @php_request_shutdown(i8*)

declare i32 @php_printf(i8*, ...)

declare i8* @get_zend_version()

declare i32 @zend_load_extension(i8*)

declare i64 @strlcat(i8*, i8*, i64)

declare i32 @fcgi_finish_request(%struct._fcgi_request*, i32)

declare i32 @php_fopen_primary_script(%struct._zend_file_handle*)

declare i32* @__error()

declare void @sapi_shutdown()

declare i32 @fgetc(%struct.__sFILE* nocapture) nounwind

declare i64 @ftell(%struct.__sFILE* nocapture) nounwind

declare i32 @fseek(%struct.__sFILE* nocapture, i64, i32) nounwind

declare void @rewind(%struct.__sFILE* nocapture) nounwind

declare i32 @php_execute_script(%struct._zend_file_handle*)

declare i32 @php_lint_script(%struct._zend_file_handle*)

declare i32 @open_file_for_scanning(%struct._zend_file_handle*)

declare void @zend_strip()

declare void @zend_file_handle_dtor(%struct._zend_file_handle*)

declare void @php_get_highlight_struct(%struct._zend_syntax_highlighter_ini*)

declare void @zend_highlight(%struct._zend_syntax_highlighter_ini*)

declare void @zend_llist_copy(%struct._zend_llist*, %struct._zend_llist*)

declare void @zend_llist_sort(%struct._zend_llist*, i32 (%struct._zend_llist_element**, %struct._zend_llist_element**)*)

define internal i32 @extension_name_cmp(%struct._zend_llist_element** nocapture %f, %struct._zend_llist_element** nocapture %s) nounwind uwtable readonly {
  tail call void @llvm.dbg.value(metadata !{%struct._zend_llist_element** %f}, i64 0, metadata !1055), !dbg !2630
  tail call void @llvm.dbg.value(metadata !{%struct._zend_llist_element** %s}, i64 0, metadata !1056), !dbg !2631
  %1 = load %struct._zend_llist_element** %f, align 8, !dbg !2632, !tbaa !1649
  %2 = getelementptr inbounds %struct._zend_llist_element* %1, i64 0, i32 2, i64 0, !dbg !2632
  %3 = bitcast i8* %2 to i8**, !dbg !2632
  %4 = load i8** %3, align 8, !dbg !2632, !tbaa !1649
  %5 = load %struct._zend_llist_element** %s, align 8, !dbg !2632, !tbaa !1649
  %6 = getelementptr inbounds %struct._zend_llist_element* %5, i64 0, i32 2, i64 0, !dbg !2632
  %7 = bitcast i8* %6 to i8**, !dbg !2632
  %8 = load i8** %7, align 8, !dbg !2632, !tbaa !1649
  %9 = tail call i32 @strcmp(i8* %4, i8* %8) nounwind readonly, !dbg !2632
  ret i32 %9, !dbg !2632
}

declare void @zend_llist_apply_with_argument(%struct._zend_llist*, void (i8*, i8*)*, i8*)

define internal i32 @print_extension_info(%struct._zend_extension* nocapture %ext, i8* nocapture %arg) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{%struct._zend_extension* %ext}, i64 0, metadata !1045), !dbg !2634
  tail call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !1046), !dbg !2635
  %1 = getelementptr inbounds %struct._zend_extension* %ext, i64 0, i32 0, !dbg !2636
  %2 = load i8** %1, align 8, !dbg !2636, !tbaa !1649
  %3 = tail call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i8* %2) nounwind, !dbg !2636
  ret i32 0, !dbg !2638
}

declare void @zend_llist_destroy(%struct._zend_llist*)

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

declare i32 @_zend_hash_init(%struct._hashtable*, i32, i64 (i8*, i32)*, void (i8*)*, i8 zeroext)

declare void @zend_hash_copy(%struct._hashtable*, %struct._hashtable*, void (i8*)*, i8*, i32)

declare i32 @zend_hash_sort(%struct._hashtable*, void (i8*, i64, i64, i32 (i8*, i8*)*)*, i32 (i8*, i8*)*, i32)

declare void @zend_qsort(i8*, i64, i64, i32 (i8*, i8*)*)

define internal i32 @module_name_cmp(i8* nocapture %a, i8* nocapture %b) nounwind uwtable readonly {
  tail call void @llvm.dbg.value(metadata !{i8* %a}, i64 0, metadata !1077), !dbg !2639
  tail call void @llvm.dbg.value(metadata !{i8* %b}, i64 0, metadata !1078), !dbg !2640
  %1 = bitcast i8* %a to %struct.bucket**, !dbg !2641
  %2 = load %struct.bucket** %1, align 8, !dbg !2641, !tbaa !1649
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1079), !dbg !2641
  %3 = bitcast i8* %b to %struct.bucket**, !dbg !2642
  %4 = load %struct.bucket** %3, align 8, !dbg !2642, !tbaa !1649
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1081), !dbg !2642
  %5 = getelementptr inbounds %struct.bucket* %2, i64 0, i32 2, !dbg !2643
  %6 = load i8** %5, align 8, !dbg !2643, !tbaa !1649
  %7 = getelementptr inbounds i8* %6, i64 32, !dbg !2643
  %8 = bitcast i8* %7 to i8**, !dbg !2643
  %9 = load i8** %8, align 8, !dbg !2643, !tbaa !1649
  %10 = getelementptr inbounds %struct.bucket* %4, i64 0, i32 2, !dbg !2643
  %11 = load i8** %10, align 8, !dbg !2643, !tbaa !1649
  %12 = getelementptr inbounds i8* %11, i64 32, !dbg !2643
  %13 = bitcast i8* %12 to i8**, !dbg !2643
  %14 = load i8** %13, align 8, !dbg !2643, !tbaa !1649
  %15 = tail call i32 @strcasecmp(i8* %9, i8* %14) nounwind readonly, !dbg !2643
  ret i32 %15, !dbg !2643
}

declare void @zend_hash_apply_with_argument(%struct._hashtable*, i32 (i8*, i8*)*, i8*)

define internal i32 @print_module_info(%struct._zend_module_entry* nocapture %module, i8* nocapture %arg) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{%struct._zend_module_entry* %module}, i64 0, metadata !1068), !dbg !2644
  tail call void @llvm.dbg.value(metadata !{i8* %arg}, i64 0, metadata !1069), !dbg !2645
  %1 = getelementptr inbounds %struct._zend_module_entry* %module, i64 0, i32 6, !dbg !2646
  %2 = load i8** %1, align 8, !dbg !2646, !tbaa !1649
  %3 = tail call i32 (i8*, ...)* @php_printf(i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i8* %2) nounwind, !dbg !2646
  ret i32 0, !dbg !2648
}

declare void @zend_hash_destroy(%struct._hashtable*)

declare i32 @strcasecmp(i8* nocapture, i8* nocapture) nounwind readonly

define internal i8* @sapi_cgibin_getenv(i8* %name, i64 %name_len) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !1194), !dbg !2649
  tail call void @llvm.dbg.value(metadata !{i64 %name_len}, i64 0, metadata !1195), !dbg !2650
  %1 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2651
  %2 = icmp eq i32 %1, 0, !dbg !2651
  br i1 %2, label %8, label %3, !dbg !2651

; <label>:3                                       ; preds = %0
  %4 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2652, !tbaa !1649
  %5 = bitcast i8* %4 to %struct._fcgi_request*, !dbg !2652
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1196), !dbg !2652
  %6 = trunc i64 %name_len to i32, !dbg !2653
  %7 = tail call i8* @fcgi_getenv(%struct._fcgi_request* %5, i8* %name, i32 %6) nounwind, !dbg !2653
  br label %10, !dbg !2653

; <label>:8                                       ; preds = %0
  %9 = tail call i8* @getenv(i8* %name) nounwind, !dbg !2654
  br label %10, !dbg !2654

; <label>:10                                      ; preds = %8, %3
  %.0 = phi i8* [ %7, %3 ], [ %9, %8 ]
  ret i8* %.0, !dbg !2655
}

declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

define internal fastcc i8* @_sapi_cgibin_putenv(i8* %name, i8* %value) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %name}, i64 0, metadata !1183), !dbg !2656
  tail call void @llvm.dbg.value(metadata !{i8* %value}, i64 0, metadata !1184), !dbg !2657
  %1 = icmp eq i8* %name, null, !dbg !2658
  br i1 %1, label %18, label %2, !dbg !2658

; <label>:2                                       ; preds = %0
  %3 = tail call i64 @strlen(i8* %name) nounwind readonly, !dbg !2659
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1185), !dbg !2659
  %4 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2660
  %5 = icmp eq i32 %4, 0, !dbg !2660
  br i1 %5, label %11, label %6, !dbg !2660

; <label>:6                                       ; preds = %2
  %7 = trunc i64 %3 to i32, !dbg !2659
  %8 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2661, !tbaa !1649
  %9 = bitcast i8* %8 to %struct._fcgi_request*, !dbg !2661
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1187), !dbg !2661
  %10 = tail call i8* @fcgi_putenv(%struct._fcgi_request* %9, i8* %name, i32 %7, i8* %value) nounwind, !dbg !2662
  br label %18, !dbg !2662

; <label>:11                                      ; preds = %2
  %12 = icmp eq i8* %value, null, !dbg !2663
  br i1 %12, label %.critedge, label %13, !dbg !2663

; <label>:13                                      ; preds = %11
  %14 = tail call i32 @setenv(i8* %name, i8* %value, i32 1) nounwind, !dbg !2664
  br label %16, !dbg !2666

.critedge:                                        ; preds = %11
  %15 = tail call i32 @unsetenv(i8* %name) nounwind, !dbg !2667
  br label %16, !dbg !2668

; <label>:16                                      ; preds = %.critedge, %13
  %17 = tail call i8* @getenv(i8* %name) nounwind, !dbg !2669
  br label %18, !dbg !2669

; <label>:18                                      ; preds = %16, %6, %0
  %.0 = phi i8* [ %10, %6 ], [ %17, %16 ], [ null, %0 ]
  ret i8* %.0, !dbg !2670
}

declare i8* @tsrm_realpath(i8*, i8*)

declare noalias i8* @_estrndup(i8*, i32)

declare i8* @strrchr(i8*, i32) nounwind readonly

declare noalias i8* @_emalloc(i64)

declare i8* @strstr(i8*, i8* nocapture) nounwind readonly

declare i32 @php_handle_auth_data(i8*)

declare i8* @fcgi_putenv(%struct._fcgi_request*, i8*, i32, i8*)

declare i32 @setenv(i8*, i8*, i32)

declare i32 @unsetenv(i8* nocapture) nounwind

declare i8* @fcgi_getenv(%struct._fcgi_request*, i8*, i32)

declare void @zif_dl(i32, %struct._zval_struct*, %struct._zval_struct**, %struct._zval_struct*, i32)

define internal i32 @php_cgi_startup(%struct._sapi_module_struct* %sapi_module) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{%struct._sapi_module_struct* %sapi_module}, i64 0, metadata !1487), !dbg !2671
  %1 = tail call i32 @php_module_startup(%struct._sapi_module_struct* %sapi_module, %struct._zend_module_entry* @cgi_module_entry, i32 1) nounwind, !dbg !2672
  %2 = icmp eq i32 %1, -1, !dbg !2672
  %. = sext i1 %2 to i32, !dbg !2674
  ret i32 %., !dbg !2676
}

declare i32 @php_module_shutdown_wrapper(%struct._sapi_module_struct*)

define internal i32 @sapi_cgi_activate() nounwind uwtable {
  %entry.i = alloca %struct._user_config_cache_entry*, align 8
  %1 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2677, !tbaa !1649
  %2 = icmp eq i8* %1, null, !dbg !2677
  br i1 %2, label %154, label %3, !dbg !2677

; <label>:3                                       ; preds = %0
  %4 = call i32 @php_ini_has_per_host_config() nounwind, !dbg !2678
  %5 = icmp eq i32 %4, 0, !dbg !2678
  br i1 %5, label %21, label %6, !dbg !2678

; <label>:6                                       ; preds = %3
  call void @llvm.dbg.value(metadata !2679, i64 0, metadata !2680) nounwind, !dbg !2683
  call void @llvm.dbg.value(metadata !2030, i64 0, metadata !2684) nounwind, !dbg !2685
  %7 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2686
  %8 = icmp eq i32 %7, 0, !dbg !2686
  br i1 %8, label %13, label %9, !dbg !2686

; <label>:9                                       ; preds = %6
  %10 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2687, !tbaa !1649
  %11 = bitcast i8* %10 to %struct._fcgi_request*, !dbg !2687
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2688) nounwind, !dbg !2687
  %12 = call i8* @fcgi_getenv(%struct._fcgi_request* %11, i8* getelementptr inbounds ([12 x i8]* @.str18, i64 0, i64 0), i32 11) nounwind, !dbg !2689
  br label %sapi_cgibin_getenv.exit, !dbg !2689

; <label>:13                                      ; preds = %6
  %14 = call i8* @getenv(i8* getelementptr inbounds ([12 x i8]* @.str18, i64 0, i64 0)) nounwind, !dbg !2690
  br label %sapi_cgibin_getenv.exit, !dbg !2690

sapi_cgibin_getenv.exit:                          ; preds = %13, %9
  %.0.i = phi i8* [ %12, %9 ], [ %14, %13 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1345), !dbg !2681
  %15 = icmp eq i8* %.0.i, null, !dbg !2691
  br i1 %15, label %21, label %16, !dbg !2691

; <label>:16                                      ; preds = %sapi_cgibin_getenv.exit
  %17 = call i64 @strlen(i8* %.0.i) nounwind readonly, !dbg !2692
  %18 = trunc i64 %17 to i32, !dbg !2692
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1348), !dbg !2692
  %19 = call noalias i8* @_estrndup(i8* %.0.i, i32 %18) nounwind, !dbg !2694
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1345), !dbg !2694
  call void @zend_str_tolower(i8* %19, i32 %18) nounwind, !dbg !2695
  %20 = add i32 %18, 1, !dbg !2696
  call void @php_ini_activate_per_host_config(i8* %19, i32 %20) nounwind, !dbg !2696
  call void @_efree(i8* %19) nounwind, !dbg !2697
  br label %21, !dbg !2698

; <label>:21                                      ; preds = %16, %sapi_cgibin_getenv.exit, %3
  %22 = call i32 @php_ini_has_per_dir_config() nounwind, !dbg !2699
  %23 = icmp eq i32 %22, 0, !dbg !2699
  br i1 %23, label %24, label %30, !dbg !2699

; <label>:24                                      ; preds = %21
  %25 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 73), align 8, !dbg !2699, !tbaa !1649
  %26 = icmp eq i8* %25, null, !dbg !2699
  br i1 %26, label %154, label %27, !dbg !2699

; <label>:27                                      ; preds = %24
  %28 = load i8* %25, align 1, !dbg !2699, !tbaa !1650
  %29 = icmp eq i8 %28, 0, !dbg !2699
  br i1 %29, label %154, label %30, !dbg !2699

; <label>:30                                      ; preds = %27, %21
  %31 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2700, !tbaa !1649
  %32 = call i64 @strlen(i8* %31) nounwind readonly, !dbg !2700
  %33 = trunc i64 %32 to i32, !dbg !2700
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1346), !dbg !2700
  %34 = and i64 %32, 4294967295, !dbg !2702
  %35 = getelementptr inbounds i8* %31, i64 %34, !dbg !2702
  %36 = load i8* %35, align 1, !dbg !2702, !tbaa !1650
  %37 = icmp eq i8 %36, 47, !dbg !2702
  br i1 %37, label %50, label %38, !dbg !2702

; <label>:38                                      ; preds = %30
  %39 = add i32 %33, 2, !dbg !2703
  %40 = zext i32 %39 to i64, !dbg !2703
  %41 = call noalias i8* @_emalloc(i64 %40) nounwind, !dbg !2703
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1342), !dbg !2703
  %42 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 8), align 8, !dbg !2705, !tbaa !1649
  %43 = add i32 %33, 1, !dbg !2705
  %44 = zext i32 %43 to i64, !dbg !2705
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 %44, i32 1, i1 false), !dbg !2705
  %45 = call i64 @zend_dirname(i8* %41, i64 %34) nounwind, !dbg !2706
  %46 = trunc i64 %45 to i32, !dbg !2706
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1346), !dbg !2706
  %47 = add i32 %46, 1, !dbg !2707
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1346), !dbg !2707
  %48 = and i64 %45, 4294967295, !dbg !2707
  %49 = getelementptr inbounds i8* %41, i64 %48, !dbg !2707
  store i8 47, i8* %49, align 1, !dbg !2707, !tbaa !1650
  br label %54, !dbg !2708

; <label>:50                                      ; preds = %30
  %51 = call noalias i8* @_estrndup(i8* %31, i32 %33) nounwind, !dbg !2709
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1342), !dbg !2709
  %52 = call i64 @zend_dirname(i8* %51, i64 %34) nounwind, !dbg !2711
  %53 = trunc i64 %52 to i32, !dbg !2711
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1346), !dbg !2711
  br label %54

; <label>:54                                      ; preds = %50, %38
  %path_len.0 = phi i32 [ %53, %50 ], [ %47, %38 ]
  %path.0 = phi i8* [ %51, %50 ], [ %41, %38 ]
  %55 = zext i32 %path_len.0 to i64, !dbg !2712
  %56 = getelementptr inbounds i8* %path.0, i64 %55, !dbg !2712
  store i8 0, i8* %56, align 1, !dbg !2712, !tbaa !1650
  call void @php_ini_activate_per_dir_config(i8* %path.0, i32 %path_len.0) nounwind, !dbg !2713
  %57 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 73), align 8, !dbg !2714, !tbaa !1649
  %58 = icmp eq i8* %57, null, !dbg !2714
  br i1 %58, label %153, label %59, !dbg !2714

; <label>:59                                      ; preds = %54
  %60 = load i8* %57, align 1, !dbg !2714, !tbaa !1650
  %61 = icmp eq i8 %60, 0, !dbg !2714
  br i1 %61, label %153, label %62, !dbg !2714

; <label>:62                                      ; preds = %59
  call void @llvm.dbg.value(metadata !2076, i64 0, metadata !2715) nounwind, !dbg !2718
  call void @llvm.dbg.value(metadata !2080, i64 0, metadata !2719) nounwind, !dbg !2720
  %63 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2721
  %64 = icmp eq i32 %63, 0, !dbg !2721
  br i1 %64, label %69, label %65, !dbg !2721

; <label>:65                                      ; preds = %62
  %66 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2722, !tbaa !1649
  %67 = bitcast i8* %66 to %struct._fcgi_request*, !dbg !2722
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2723) nounwind, !dbg !2722
  %68 = call i8* @fcgi_getenv(%struct._fcgi_request* %67, i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0), i32 13) nounwind, !dbg !2724
  br label %sapi_cgibin_getenv.exit2, !dbg !2724

; <label>:69                                      ; preds = %62
  %70 = call i8* @getenv(i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0)) nounwind, !dbg !2725
  br label %sapi_cgibin_getenv.exit2, !dbg !2725

sapi_cgibin_getenv.exit2:                         ; preds = %69, %65
  %.0.i1 = phi i8* [ %68, %65 ], [ %70, %69 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1344), !dbg !2716
  %71 = icmp eq i8* %.0.i1, null, !dbg !2726
  br i1 %71, label %153, label %72, !dbg !2726

; <label>:72                                      ; preds = %sapi_cgibin_getenv.exit2
  %73 = call i64 @strlen(i8* %.0.i1) nounwind readonly, !dbg !2727
  %74 = trunc i64 %73 to i32, !dbg !2727
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1347), !dbg !2727
  %75 = icmp eq i32 %74, 0, !dbg !2729
  br i1 %75, label %82, label %76, !dbg !2729

; <label>:76                                      ; preds = %72
  %77 = add i32 %74, -1, !dbg !2729
  %78 = zext i32 %77 to i64, !dbg !2729
  %79 = getelementptr inbounds i8* %.0.i1, i64 %78, !dbg !2729
  %80 = load i8* %79, align 1, !dbg !2729, !tbaa !1650
  %81 = icmp eq i8 %80, 47, !dbg !2729
  %. = select i1 %81, i32 %77, i32 %74, !dbg !2729
  br label %82, !dbg !2729

; <label>:82                                      ; preds = %76, %72
  %doc_root_len.0 = phi i32 [ 0, %72 ], [ %., %76 ]
  %83 = add i32 %doc_root_len.0, -1, !dbg !2730
  %84 = bitcast %struct._user_config_cache_entry** %entry.i to i8*, !dbg !2731
  call void @llvm.lifetime.start(i64 -1, i8* %84) nounwind, !dbg !2731
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2732) nounwind, !dbg !2731
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2733) nounwind, !dbg !2734
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2735) nounwind, !dbg !2736
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2737) nounwind, !dbg !2738
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2739) nounwind, !dbg !2740
  call void @llvm.dbg.declare(metadata !952, metadata !1368) nounwind, !dbg !2741
  %85 = call i64 @sapi_get_request_time() nounwind, !dbg !2742
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2743) nounwind, !dbg !2742
  %86 = add nsw i32 %path_len.0, 1, !dbg !2744
  %87 = bitcast %struct._user_config_cache_entry** %entry.i to i8**, !dbg !2744
  %88 = call i32 @zend_hash_find(%struct._hashtable* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 8), i8* %path.0, i32 %86, i8** %87) nounwind, !dbg !2744
  %89 = icmp eq i32 %88, -1, !dbg !2744
  br i1 %89, label %90, label %107, !dbg !2744

; <label>:90                                      ; preds = %82
  call void @llvm.dbg.value(metadata !2745, i64 0, metadata !2746) nounwind, !dbg !2749
  %91 = call noalias i8* @malloc(i64 16) nounwind, !dbg !2750
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2751) nounwind, !dbg !2750
  %92 = icmp eq i8* %91, null, !dbg !2752
  br i1 %92, label %93, label %__zend_malloc.exit.i, !dbg !2752

; <label>:93                                      ; preds = %90
  %94 = load %struct.__sFILE** @__stderrp, align 8, !dbg !2753, !tbaa !1649
  %95 = call i64 @fwrite(i8* getelementptr inbounds ([15 x i8]* @.str126, i64 0, i64 0), i64 14, i64 1, %struct.__sFILE* %94) nounwind, !dbg !2753
  call void @exit(i32 1) noreturn nounwind, !dbg !2754
  unreachable, !dbg !2754

__zend_malloc.exit.i:                             ; preds = %90
  %96 = bitcast i8* %91 to i64*, !dbg !2755
  store i64 0, i64* %96, align 8, !dbg !2755, !tbaa !1782
  call void @llvm.dbg.value(metadata !2756, i64 0, metadata !2757) nounwind, !dbg !2759
  %97 = call noalias i8* @malloc(i64 72) nounwind, !dbg !2760
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2761) nounwind, !dbg !2760
  %98 = icmp eq i8* %97, null, !dbg !2762
  br i1 %98, label %99, label %__zend_malloc.exit2.i, !dbg !2762

; <label>:99                                      ; preds = %__zend_malloc.exit.i
  %100 = load %struct.__sFILE** @__stderrp, align 8, !dbg !2763, !tbaa !1649
  %101 = call i64 @fwrite(i8* getelementptr inbounds ([15 x i8]* @.str126, i64 0, i64 0), i64 14, i64 1, %struct.__sFILE* %100) nounwind, !dbg !2763
  call void @exit(i32 1) noreturn nounwind, !dbg !2764
  unreachable, !dbg !2764

__zend_malloc.exit2.i:                            ; preds = %__zend_malloc.exit.i
  %102 = bitcast i8* %97 to %struct._hashtable*, !dbg !2758
  %103 = getelementptr inbounds i8* %91, i64 8, !dbg !2758
  %104 = bitcast i8* %103 to %struct._hashtable**, !dbg !2758
  store %struct._hashtable* %102, %struct._hashtable** %104, align 8, !dbg !2758, !tbaa !1649
  %105 = call i32 @_zend_hash_init(%struct._hashtable* %102, i32 0, i64 (i8*, i32)* null, void (i8*)* bitcast (void (%struct._zval_struct*)* @config_zval_dtor to void (i8*)*), i8 zeroext 1) nounwind, !dbg !2765
  %106 = call i32 @_zend_hash_add_or_update(%struct._hashtable* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 8), i8* %path.0, i32 %86, i8* %91, i32 16, i8** %87, i32 1) nounwind, !dbg !2766
  call void @free(i8* %91) nounwind, !dbg !2767
  br label %107, !dbg !2768

; <label>:107                                     ; preds = %__zend_malloc.exit2.i, %82
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2770
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2770
  %108 = load %struct._user_config_cache_entry** %entry.i, align 8, !dbg !2770, !tbaa !1649
  %109 = getelementptr inbounds %struct._user_config_cache_entry* %108, i64 0, i32 0, !dbg !2770
  %110 = load i64* %109, align 8, !dbg !2770, !tbaa !1782
  %111 = icmp sgt i64 %85, %110, !dbg !2770
  br i1 %111, label %112, label %php_cgi_ini_activate_user_config.exit, !dbg !2770

; <label>:112                                     ; preds = %107
  %113 = getelementptr inbounds %struct._user_config_cache_entry* %108, i64 0, i32 1, !dbg !2771
  %114 = load %struct._hashtable** %113, align 8, !dbg !2771, !tbaa !1649
  call void @zend_hash_clean(%struct._hashtable* %114) nounwind, !dbg !2771
  %115 = load i8* %path.0, align 1, !dbg !2772, !tbaa !1650
  %116 = icmp eq i8 %115, 47, !dbg !2772
  br i1 %116, label %121, label %117, !dbg !2772

; <label>:117                                     ; preds = %112
  %118 = call i8* @tsrm_realpath(i8* %path.0, i8* null) nounwind, !dbg !2773
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2775) nounwind, !dbg !2773
  %119 = call i64 @strlen(i8* %118) nounwind readonly, !dbg !2776
  %120 = trunc i64 %119 to i32, !dbg !2776
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2777) nounwind, !dbg !2776
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2732) nounwind, !dbg !2778
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2733) nounwind, !dbg !2779
  br label %121, !dbg !2780

; <label>:121                                     ; preds = %117, %112
  %.01.i = phi i32 [ %path_len.0, %112 ], [ %120, %117 ]
  %.0.i3 = phi i8* [ %path.0, %112 ], [ %118, %117 ]
  %122 = icmp sgt i32 %.01.i, %doc_root_len.0, !dbg !2781
  %doc_root..0.i = select i1 %122, i8* %.0.i1, i8* %.0.i3, !dbg !2782
  %.0.doc_root.i = select i1 %122, i8* %.0.i3, i8* %.0.i1, !dbg !2782
  %doc_root_len..01.i = select i1 %122, i32 %doc_root_len.0, i32 %.01.i, !dbg !2782
  %123 = sext i32 %doc_root_len..01.i to i64, !dbg !2784
  %124 = call i32 @strncmp(i8* %doc_root..0.i, i8* %.0.doc_root.i, i64 %123) nounwind readonly, !dbg !2784
  %125 = icmp eq i32 %124, 0, !dbg !2784
  br i1 %125, label %126, label %140, !dbg !2784

; <label>:126                                     ; preds = %121
  %127 = sext i32 %83 to i64, !dbg !2785
  %128 = getelementptr inbounds i8* %.0.doc_root.i, i64 %127, !dbg !2785
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2787) nounwind, !dbg !2785
  %129 = call i8* @strchr(i8* %128, i32 47) nounwind readonly, !dbg !2788
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2787) nounwind, !dbg !2788
  %130 = icmp eq i8* %129, null, !dbg !2788
  br i1 %130, label %.loopexit.i, label %.lr.ph.i, !dbg !2788

.lr.ph.i:                                         ; preds = %.lr.ph.i, %126
  %131 = phi i8* [ %138, %.lr.ph.i ], [ %129, %126 ]
  store i8 0, i8* %131, align 1, !dbg !2789, !tbaa !1650
  %132 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 73), align 8, !dbg !2791, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2791
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2791
  %133 = load %struct._user_config_cache_entry** %entry.i, align 8, !dbg !2791, !tbaa !1649
  %134 = getelementptr inbounds %struct._user_config_cache_entry* %133, i64 0, i32 1, !dbg !2791
  %135 = load %struct._hashtable** %134, align 8, !dbg !2791, !tbaa !1649
  %136 = call i32 @php_parse_user_ini_file(i8* %.0.i3, i8* %132, %struct._hashtable* %135) nounwind, !dbg !2791
  store i8 47, i8* %131, align 1, !dbg !2792, !tbaa !1650
  %137 = getelementptr inbounds i8* %131, i64 1, !dbg !2793
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2787) nounwind, !dbg !2793
  %138 = call i8* @strchr(i8* %137, i32 47) nounwind readonly, !dbg !2788
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2787) nounwind, !dbg !2788
  %139 = icmp eq i8* %138, null, !dbg !2788
  br i1 %139, label %.loopexit.i, label %.lr.ph.i, !dbg !2788

; <label>:140                                     ; preds = %121
  %141 = load i8** getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 73), align 8, !dbg !2794, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2794
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2794
  %142 = load %struct._user_config_cache_entry** %entry.i, align 8, !dbg !2794, !tbaa !1649
  %143 = getelementptr inbounds %struct._user_config_cache_entry* %142, i64 0, i32 1, !dbg !2794
  %144 = load %struct._hashtable** %143, align 8, !dbg !2794, !tbaa !1649
  %145 = call i32 @php_parse_user_ini_file(i8* %.0.i3, i8* %141, %struct._hashtable* %144) nounwind, !dbg !2794
  br label %.loopexit.i

.loopexit.i:                                      ; preds = %140, %.lr.ph.i, %126
  %146 = load i64* getelementptr inbounds (%struct._php_core_globals* @core_globals, i64 0, i32 74), align 8, !dbg !2796, !tbaa !1782
  %147 = add nsw i64 %146, %85, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2796
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1368), !dbg !2796
  %148 = load %struct._user_config_cache_entry** %entry.i, align 8, !dbg !2796, !tbaa !1649
  %149 = getelementptr inbounds %struct._user_config_cache_entry* %148, i64 0, i32 0, !dbg !2796
  store i64 %147, i64* %149, align 8, !dbg !2796, !tbaa !1782
  br label %php_cgi_ini_activate_user_config.exit, !dbg !2797

php_cgi_ini_activate_user_config.exit:            ; preds = %.loopexit.i, %107
  %150 = phi %struct._user_config_cache_entry* [ %148, %.loopexit.i ], [ %108, %107 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2798
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2798
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2769) nounwind, !dbg !2798
  %151 = getelementptr inbounds %struct._user_config_cache_entry* %150, i64 0, i32 1, !dbg !2798
  %152 = load %struct._hashtable** %151, align 8, !dbg !2798, !tbaa !1649
  call void @php_ini_activate_config(%struct._hashtable* %152, i32 2, i32 32) nounwind, !dbg !2798
  call void @llvm.lifetime.end(i64 -1, i8* %84) nounwind, !dbg !2799
  br label %153, !dbg !2800

; <label>:153                                     ; preds = %php_cgi_ini_activate_user_config.exit, %sapi_cgibin_getenv.exit2, %59, %54
  call void @_efree(i8* %path.0) nounwind, !dbg !2801
  br label %154, !dbg !2802

; <label>:154                                     ; preds = %153, %27, %24, %0
  %.0 = phi i32 [ -1, %0 ], [ 0, %27 ], [ 0, %24 ], [ 0, %153 ]
  ret i32 %.0, !dbg !2803
}

define internal i32 @sapi_cgi_deactivate() nounwind uwtable {
  %1 = load i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 12), align 4, !dbg !2804, !tbaa !1650
  %2 = icmp eq i8 %1, 0, !dbg !2804
  br i1 %2, label %15, label %3, !dbg !2804

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2806
  %5 = icmp eq i32 %4, 0, !dbg !2806
  br i1 %5, label %13, label %6, !dbg !2806

; <label>:6                                       ; preds = %3
  %.b = load i1* @parent.b, align 1
  br i1 %.b, label %7, label %15, !dbg !2808

; <label>:7                                       ; preds = %6
  %8 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2810, !tbaa !1649
  %9 = bitcast i8* %8 to %struct._fcgi_request*, !dbg !2810
  %10 = tail call i32 @fcgi_finish_request(%struct._fcgi_request* %9, i32 0) nounwind, !dbg !2810
  %11 = icmp eq i32 %10, 0, !dbg !2810
  br i1 %11, label %12, label %15, !dbg !2810

; <label>:12                                      ; preds = %7
  tail call void @php_handle_aborted_connection() nounwind, !dbg !2811
  br label %15, !dbg !2813

; <label>:13                                      ; preds = %3
  %14 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2814, !tbaa !1649
  tail call void @sapi_cgibin_flush(i8* %14), !dbg !2814
  br label %15

; <label>:15                                      ; preds = %13, %12, %7, %6, %0
  ret i32 0, !dbg !2816
}

define internal i32 @sapi_cgibin_ub_write(i8* %str, i32 %str_length) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %str}, i64 0, metadata !1320), !dbg !2817
  tail call void @llvm.dbg.value(metadata !{i32 %str_length}, i64 0, metadata !1321), !dbg !2818
  tail call void @llvm.dbg.value(metadata !{i8* %str}, i64 0, metadata !1322), !dbg !2819
  tail call void @llvm.dbg.value(metadata !{i32 %str_length}, i64 0, metadata !1324), !dbg !2820
  br label %1, !dbg !2821

; <label>:1                                       ; preds = %20, %0
  %ptr.0 = phi i8* [ %str, %0 ], [ %21, %20 ]
  %remaining.0 = phi i32 [ %str_length, %0 ], [ %24, %20 ]
  %2 = icmp eq i32 %remaining.0, 0, !dbg !2821
  br i1 %2, label %.loopexit, label %3, !dbg !2821

; <label>:3                                       ; preds = %1
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !2822) nounwind, !dbg !2825
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !2826) nounwind, !dbg !2827
  %4 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2828
  %5 = icmp eq i32 %4, 0, !dbg !2828
  br i1 %5, label %12, label %6, !dbg !2828

; <label>:6                                       ; preds = %3
  %7 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2829, !tbaa !1649
  %8 = bitcast i8* %7 to %struct._fcgi_request*, !dbg !2829
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !2830) nounwind, !dbg !2829
  %9 = tail call i32 @fcgi_write(%struct._fcgi_request* %8, i32 6, i8* %ptr.0, i32 %remaining.0) nounwind, !dbg !2831
  %10 = sext i32 %9 to i64, !dbg !2831
  %11 = icmp sgt i64 %10, 0, !dbg !2832
  %.2.i = select i1 %11, i64 %10, i64 0, !dbg !2832
  br label %sapi_cgibin_single_write.exit

; <label>:12                                      ; preds = %3
  %13 = zext i32 %remaining.0 to i64, !dbg !2833
  %14 = tail call i64 @write(i32 1, i8* %ptr.0, i64 %13) nounwind, !dbg !2833
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !2834) nounwind, !dbg !2833
  %15 = icmp sgt i64 %14, 0, !dbg !2835
  %..i = select i1 %15, i64 %14, i64 0, !dbg !2836
  br label %sapi_cgibin_single_write.exit

sapi_cgibin_single_write.exit:                    ; preds = %12, %6
  %16 = phi i64 [ %.2.i, %6 ], [ %..i, %12 ]
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1325), !dbg !2823
  %17 = icmp eq i64 %16, 0, !dbg !2837
  br i1 %17, label %18, label %20, !dbg !2837

; <label>:18                                      ; preds = %sapi_cgibin_single_write.exit
  tail call void @php_handle_aborted_connection() nounwind, !dbg !2838
  %19 = sub i32 %str_length, %remaining.0, !dbg !2840
  br label %.loopexit, !dbg !2840

; <label>:20                                      ; preds = %sapi_cgibin_single_write.exit
  %21 = getelementptr inbounds i8* %ptr.0, i64 %16, !dbg !2841
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1322), !dbg !2841
  %22 = zext i32 %remaining.0 to i64, !dbg !2842
  %23 = sub i64 %22, %16, !dbg !2842
  %24 = trunc i64 %23 to i32, !dbg !2842
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1324), !dbg !2842
  br label %1, !dbg !2843

.loopexit:                                        ; preds = %18, %1
  %.0 = phi i32 [ %19, %18 ], [ %str_length, %1 ]
  ret i32 %.0, !dbg !2844
}

define internal void @sapi_cgibin_flush(i8* %server_context) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %server_context}, i64 0, metadata !1311), !dbg !2845
  %1 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2846
  %2 = icmp eq i32 %1, 0, !dbg !2846
  br i1 %2, label %10, label %3, !dbg !2846

; <label>:3                                       ; preds = %0
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1312), !dbg !2847
  %.b = load i1* @parent.b, align 1
  %.b.not = xor i1 %.b, true, !dbg !2848
  %4 = icmp eq i8* %server_context, null, !dbg !2848
  %or.cond = or i1 %4, %.b.not, !dbg !2848
  br i1 %or.cond, label %15, label %5, !dbg !2848

; <label>:5                                       ; preds = %3
  %6 = bitcast i8* %server_context to %struct._fcgi_request*, !dbg !2847
  %7 = tail call i32 @fcgi_flush(%struct._fcgi_request* %6, i32 0) nounwind, !dbg !2849
  %8 = icmp eq i32 %7, 0, !dbg !2849
  br i1 %8, label %9, label %15, !dbg !2849

; <label>:9                                       ; preds = %5
  tail call void @php_handle_aborted_connection() nounwind, !dbg !2850
  br label %15, !dbg !2852

; <label>:10                                      ; preds = %0
  %11 = load %struct.__sFILE** @__stdoutp, align 8, !dbg !2853, !tbaa !1649
  %12 = tail call i32 @fflush(%struct.__sFILE* %11) nounwind, !dbg !2853
  %13 = icmp eq i32 %12, -1, !dbg !2853
  br i1 %13, label %14, label %15, !dbg !2853

; <label>:14                                      ; preds = %10
  tail call void @php_handle_aborted_connection() nounwind, !dbg !2854
  br label %15, !dbg !2856

; <label>:15                                      ; preds = %14, %10, %9, %5, %3
  ret void, !dbg !2857
}

declare void @zend_error(i32, i8*, ...)

define internal i32 @sapi_cgi_send_headers(%struct.sapi_headers_struct* %sapi_headers) nounwind uwtable {
  %buf = alloca [1024 x i8], align 16
  %pos = alloca %struct._zend_llist_element*, align 8
  call void @llvm.dbg.value(metadata !{%struct.sapi_headers_struct* %sapi_headers}, i64 0, metadata !1275), !dbg !2858
  call void @llvm.dbg.declare(metadata !952, metadata !1276), !dbg !2859
  call void @llvm.dbg.declare(metadata !952, metadata !1288), !dbg !2860
  call void @llvm.dbg.value(metadata !2861, i64 0, metadata !1290), !dbg !2862
  %1 = load i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !2863, !tbaa !1663
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1291), !dbg !2863
  %2 = load i8* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 12), align 1, !dbg !2864, !tbaa !1650
  %3 = icmp eq i8 %2, 1, !dbg !2864
  br i1 %3, label %114, label %4, !dbg !2864

; <label>:4                                       ; preds = %0
  %5 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 1), align 1, !dbg !2865, !tbaa !1650
  %6 = icmp ne i8 %5, 0, !dbg !2865
  %7 = icmp ne i32 %1, 200, !dbg !2865
  %or.cond = or i1 %6, %7, !dbg !2865
  br i1 %or.cond, label %8, label %.loopexit, !dbg !2865

; <label>:8                                       ; preds = %4
  call void @llvm.dbg.value(metadata !2861, i64 0, metadata !1294), !dbg !2866
  %9 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 0), align 8, !dbg !2867, !tbaa !1650
  %10 = icmp ne i8 %9, 0, !dbg !2867
  %11 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 4), align 8, !dbg !2867, !tbaa !1649
  %12 = icmp ne i8* %11, null, !dbg !2867
  %or.cond4 = and i1 %10, %12, !dbg !2867
  br i1 %or.cond4, label %13, label %24, !dbg !2867

; <label>:13                                      ; preds = %8
  %14 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0, !dbg !2868
  %15 = call i32 (i8*, i64, i8*, ...)* @ap_php_slprintf(i8* %14, i64 1024, i8* getelementptr inbounds ([5 x i8]* @.str81, i64 0, i64 0), i8* %11) nounwind, !dbg !2868
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1292), !dbg !2868
  %16 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 4), align 8, !dbg !2869, !tbaa !1649
  %17 = call i8* @strchr(i8* %16, i32 32) nounwind readonly, !dbg !2869
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1295), !dbg !2869
  %18 = icmp eq i8* %17, null, !dbg !2869
  br i1 %18, label %22, label %19, !dbg !2869

; <label>:19                                      ; preds = %13
  %20 = getelementptr inbounds i8* %17, i64 1, !dbg !2870
  %21 = call i32 @atoi(i8* %20) nounwind, !dbg !2870
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1291), !dbg !2870
  br label %22, !dbg !2872

; <label>:22                                      ; preds = %19, %13
  %response_status.0 = phi i32 [ %21, %19 ], [ %1, %13 ]
  %23 = icmp sgt i32 %15, 1024, !dbg !2873
  %. = select i1 %23, i32 1024, i32 %15, !dbg !2873
  br label %73, !dbg !2873

; <label>:24                                      ; preds = %8
  br i1 %12, label %25, label %41, !dbg !2874

; <label>:25                                      ; preds = %24
  %26 = call i8* @strchr(i8* %11, i32 32) nounwind readonly, !dbg !2875
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1297), !dbg !2875
  %27 = icmp eq i8* %26, null, !dbg !2875
  br i1 %27, label %41, label %28, !dbg !2875

; <label>:28                                      ; preds = %25
  %29 = ptrtoint i8* %26 to i64, !dbg !2875
  %30 = ptrtoint i8* %11 to i64, !dbg !2875
  %31 = sub i64 %29, %30, !dbg !2875
  %32 = icmp sgt i64 %31, 4, !dbg !2875
  br i1 %32, label %33, label %41, !dbg !2875

; <label>:33                                      ; preds = %28
  %34 = call i32 @strncasecmp(i8* %11, i8* getelementptr inbounds ([6 x i8]* @.str82, i64 0, i64 0), i64 5) nounwind readonly, !dbg !2876
  %35 = icmp eq i32 %34, 0, !dbg !2876
  br i1 %35, label %36, label %41, !dbg !2876

; <label>:36                                      ; preds = %33
  %37 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0, !dbg !2877
  %38 = call i32 (i8*, i64, i8*, ...)* @ap_php_slprintf(i8* %37, i64 1024, i8* getelementptr inbounds ([12 x i8]* @.str83, i64 0, i64 0), i8* %26) nounwind, !dbg !2877
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1292), !dbg !2877
  %39 = getelementptr inbounds i8* %26, i64 1, !dbg !2879
  %40 = call i32 @atoi(i8* %39) nounwind, !dbg !2879
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1291), !dbg !2879
  br label %73, !dbg !2880

; <label>:41                                      ; preds = %33, %28, %25, %24
  %42 = getelementptr inbounds %struct.sapi_headers_struct* %sapi_headers, i64 0, i32 0, !dbg !2881
  %43 = call i8* @zend_llist_get_first_ex(%struct._zend_llist* %42, %struct._zend_llist_element** %pos) nounwind, !dbg !2881
  br label %44, !dbg !2882

; <label>:44                                      ; preds = %57, %41
  %h.0.in = phi i8* [ %43, %41 ], [ %58, %57 ]
  %45 = icmp eq i8* %h.0.in, null, !dbg !2882
  br i1 %45, label %.thread.preheader, label %47, !dbg !2882

.thread.preheader:                                ; preds = %44
  %46 = load i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 2, i32 1), align 8, !dbg !2883, !tbaa !1663
  br label %.thread, !dbg !2885

; <label>:47                                      ; preds = %44
  %48 = getelementptr inbounds i8* %h.0.in, i64 8, !dbg !2886
  %49 = bitcast i8* %48 to i32*, !dbg !2886
  %50 = load i32* %49, align 4, !dbg !2886, !tbaa !1663
  %51 = icmp ugt i32 %50, 7, !dbg !2886
  br i1 %51, label %52, label %57, !dbg !2886

; <label>:52                                      ; preds = %47
  %53 = bitcast i8* %h.0.in to i8**, !dbg !2888
  %54 = load i8** %53, align 8, !dbg !2888, !tbaa !1649
  %55 = call i32 @strncasecmp(i8* %54, i8* getelementptr inbounds ([8 x i8]* @.str84, i64 0, i64 0), i64 7) nounwind readonly, !dbg !2888
  %56 = icmp eq i32 %55, 0, !dbg !2888
  br i1 %56, label %.loopexit, label %57, !dbg !2888

; <label>:57                                      ; preds = %52, %47
  %58 = call i8* @zend_llist_get_next_ex(%struct._zend_llist* %42, %struct._zend_llist_element** %pos) nounwind, !dbg !2889
  br label %44, !dbg !2890

.thread:                                          ; preds = %.thread, %.thread.preheader
  %err.0 = phi %struct._http_error* [ %63, %.thread ], [ getelementptr inbounds ([38 x %struct._http_error]* @http_error_codes, i64 0, i64 0), %.thread.preheader ]
  %59 = getelementptr inbounds %struct._http_error* %err.0, i64 0, i32 0, !dbg !2885
  %60 = load i32* %59, align 4, !dbg !2885, !tbaa !1663
  %61 = icmp eq i32 %60, 0, !dbg !2885
  %62 = icmp eq i32 %60, %46, !dbg !2883
  %or.cond6 = or i1 %61, %62, !dbg !2885
  %63 = getelementptr inbounds %struct._http_error* %err.0, i64 1, !dbg !2891
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1299), !dbg !2891
  br i1 %or.cond6, label %64, label %.thread, !dbg !2885

; <label>:64                                      ; preds = %.thread
  %65 = getelementptr inbounds %struct._http_error* %err.0, i64 0, i32 1, !dbg !2892
  %66 = load i8** %65, align 8, !dbg !2892, !tbaa !1649
  %67 = icmp eq i8* %66, null, !dbg !2892
  %68 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0, !dbg !2893
  br i1 %67, label %71, label %69, !dbg !2892

; <label>:69                                      ; preds = %64
  %70 = call i32 (i8*, i64, i8*, ...)* @ap_php_slprintf(i8* %68, i64 1024, i8* getelementptr inbounds ([16 x i8]* @.str85, i64 0, i64 0), i32 %46, i8* %66) nounwind, !dbg !2893
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1292), !dbg !2893
  br label %73, !dbg !2895

; <label>:71                                      ; preds = %64
  %72 = call i32 (i8*, i64, i8*, ...)* @ap_php_slprintf(i8* %68, i64 1024, i8* getelementptr inbounds ([13 x i8]* @.str86, i64 0, i64 0), i32 %46) nounwind, !dbg !2896
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1292), !dbg !2896
  br label %73

; <label>:73                                      ; preds = %71, %69, %36, %22
  %len.0.ph = phi i32 [ %38, %36 ], [ %70, %69 ], [ %72, %71 ], [ %., %22 ]
  %response_status.1.ph = phi i32 [ %40, %36 ], [ %1, %69 ], [ %1, %71 ], [ %response_status.0, %22 ]
  %74 = getelementptr inbounds [1024 x i8]* %buf, i64 0, i64 0, !dbg !2898
  %75 = call i32 @php_header_write(i8* %74, i32 %len.0.ph) nounwind, !dbg !2898
  call void @llvm.dbg.value(metadata !2900, i64 0, metadata !1290), !dbg !2901
  br label %.loopexit, !dbg !2902

.loopexit:                                        ; preds = %73, %52, %4
  %response_status.2 = phi i32 [ %response_status.1.ph, %73 ], [ %1, %4 ], [ %1, %52 ]
  %ignore_status.0 = phi i8 [ 1, %73 ], [ 0, %4 ], [ 0, %52 ]
  %76 = getelementptr inbounds %struct.sapi_headers_struct* %sapi_headers, i64 0, i32 0, !dbg !2903
  %77 = call i8* @zend_llist_get_first_ex(%struct._zend_llist* %76, %struct._zend_llist_element** %pos) nounwind, !dbg !2903
  %78 = icmp eq i32 %response_status.2, 304, !dbg !2904
  br label %.outer, !dbg !2907

.outer:                                           ; preds = %.loopexit12, %.loopexit
  %ignore_status.1.ph = phi i8 [ %ignore_status.0, %.loopexit ], [ %ignore_status.2, %.loopexit12 ]
  %h.1.in.ph = phi i8* [ %77, %.loopexit ], [ %111, %.loopexit12 ]
  br label %79

; <label>:79                                      ; preds = %105, %.outer
  %h.1.in = phi i8* [ %106, %105 ], [ %h.1.in.ph, %.outer ]
  %80 = icmp eq i8* %h.1.in, null, !dbg !2907
  br i1 %80, label %112, label %81, !dbg !2907

; <label>:81                                      ; preds = %79
  %82 = getelementptr inbounds i8* %h.1.in, i64 8, !dbg !2908
  %83 = bitcast i8* %82 to i32*, !dbg !2908
  %84 = load i32* %83, align 4, !dbg !2908, !tbaa !1663
  %85 = icmp eq i32 %84, 0, !dbg !2908
  br i1 %85, label %.loopexit12, label %86, !dbg !2908

; <label>:86                                      ; preds = %81
  %87 = icmp ugt i32 %84, 7, !dbg !2909
  br i1 %87, label %88, label %98, !dbg !2909

; <label>:88                                      ; preds = %86
  %89 = bitcast i8* %h.1.in to i8**, !dbg !2910
  %90 = load i8** %89, align 8, !dbg !2910, !tbaa !1649
  %91 = call i32 @strncasecmp(i8* %90, i8* getelementptr inbounds ([8 x i8]* @.str84, i64 0, i64 0), i64 7) nounwind readonly, !dbg !2910
  %92 = icmp eq i32 %91, 0, !dbg !2910
  br i1 %92, label %93, label %98, !dbg !2910

; <label>:93                                      ; preds = %88
  %94 = icmp eq i8 %ignore_status.1.ph, 0, !dbg !2911
  br i1 %94, label %95, label %.loopexit12, !dbg !2911

; <label>:95                                      ; preds = %93
  call void @llvm.dbg.value(metadata !2900, i64 0, metadata !1290), !dbg !2913
  %96 = call i32 @php_header_write(i8* %90, i32 %84) nounwind, !dbg !2915
  %97 = call i32 @php_header_write(i8* getelementptr inbounds ([3 x i8]* @.str87, i64 0, i64 0), i32 2) nounwind, !dbg !2916
  br label %.loopexit12, !dbg !2917

; <label>:98                                      ; preds = %88, %86
  %99 = icmp ugt i32 %84, 13, !dbg !2904
  %or.cond33 = and i1 %78, %99, !dbg !2904
  br i1 %or.cond33, label %100, label %._crit_edge, !dbg !2904

; <label>:100                                     ; preds = %98
  %101 = bitcast i8* %h.1.in to i8**, !dbg !2918
  %102 = load i8** %101, align 8, !dbg !2918, !tbaa !1649
  %103 = call i32 @strncasecmp(i8* %102, i8* getelementptr inbounds ([14 x i8]* @.str88, i64 0, i64 0), i64 13) nounwind readonly, !dbg !2918
  %104 = icmp eq i32 %103, 0, !dbg !2918
  br i1 %104, label %105, label %._crit_edge, !dbg !2918

; <label>:105                                     ; preds = %100
  %106 = call i8* @zend_llist_get_next_ex(%struct._zend_llist* %76, %struct._zend_llist_element** %pos) nounwind, !dbg !2919
  br label %79, !dbg !2921

._crit_edge:                                      ; preds = %100, %98
  %107 = bitcast i8* %h.1.in to i8**, !dbg !2922
  %108 = load i8** %107, align 8, !dbg !2922, !tbaa !1649
  %109 = call i32 @php_header_write(i8* %108, i32 %84) nounwind, !dbg !2922
  %110 = call i32 @php_header_write(i8* getelementptr inbounds ([3 x i8]* @.str87, i64 0, i64 0), i32 2) nounwind, !dbg !2924
  br label %.loopexit12

.loopexit12:                                      ; preds = %._crit_edge, %95, %93, %81
  %ignore_status.2 = phi i8 [ %ignore_status.1.ph, %93 ], [ 1, %95 ], [ %ignore_status.1.ph, %._crit_edge ], [ %ignore_status.1.ph, %81 ]
  %111 = call i8* @zend_llist_get_next_ex(%struct._zend_llist* %76, %struct._zend_llist_element** %pos) nounwind, !dbg !2925
  br label %.outer, !dbg !2926

; <label>:112                                     ; preds = %79
  %113 = call i32 @php_header_write(i8* getelementptr inbounds ([3 x i8]* @.str87, i64 0, i64 0), i32 2) nounwind, !dbg !2927
  br label %114, !dbg !2928

; <label>:114                                     ; preds = %112, %0
  ret i32 1, !dbg !2929
}

define internal i32 @sapi_cgi_read_post(i8* %buffer, i32 %count_bytes) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %buffer}, i64 0, metadata !1253), !dbg !2930
  tail call void @llvm.dbg.value(metadata !{i32 %count_bytes}, i64 0, metadata !1254), !dbg !2931
  tail call void @llvm.dbg.value(metadata !33, i64 0, metadata !1255), !dbg !2932
  %1 = load i64* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 5), align 8, !dbg !2933, !tbaa !1782
  %2 = trunc i64 %1 to i32, !dbg !2933
  %3 = load i32* getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 3), align 8, !dbg !2933, !tbaa !1663
  %4 = sub i32 %2, %3, !dbg !2933
  %5 = icmp ugt i32 %4, %count_bytes, !dbg !2933
  %count_bytes. = select i1 %5, i32 %count_bytes, i32 %4, !dbg !2933
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1254), !dbg !2933
  br label %6, !dbg !2934

; <label>:6                                       ; preds = %25, %0
  %read_bytes.0 = phi i32 [ 0, %0 ], [ %27, %25 ]
  %7 = icmp ult i32 %read_bytes.0, %count_bytes., !dbg !2934
  br i1 %7, label %8, label %28, !dbg !2934

; <label>:8                                       ; preds = %6
  %9 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2935
  %10 = icmp eq i32 %9, 0, !dbg !2935
  br i1 %10, label %18, label %11, !dbg !2935

; <label>:11                                      ; preds = %8
  %12 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2936, !tbaa !1649
  %13 = bitcast i8* %12 to %struct._fcgi_request*, !dbg !2936
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1258), !dbg !2936
  %14 = zext i32 %read_bytes.0 to i64, !dbg !2937
  %15 = getelementptr inbounds i8* %buffer, i64 %14, !dbg !2937
  %16 = sub i32 %count_bytes., %read_bytes.0, !dbg !2937
  %17 = tail call i32 @fcgi_read(%struct._fcgi_request* %13, i8* %15, i32 %16) nounwind, !dbg !2937
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1257), !dbg !2937
  br label %25, !dbg !2938

; <label>:18                                      ; preds = %8
  %19 = zext i32 %read_bytes.0 to i64, !dbg !2939
  %20 = getelementptr inbounds i8* %buffer, i64 %19, !dbg !2939
  %21 = sub i32 %count_bytes., %read_bytes.0, !dbg !2939
  %22 = zext i32 %21 to i64, !dbg !2939
  %23 = tail call i64 @read(i32 0, i8* %20, i64 %22) nounwind, !dbg !2939
  %24 = trunc i64 %23 to i32, !dbg !2939
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1257), !dbg !2939
  br label %25

; <label>:25                                      ; preds = %18, %11
  %tmp_read_bytes.0 = phi i32 [ %17, %11 ], [ %24, %18 ]
  %26 = icmp slt i32 %tmp_read_bytes.0, 1, !dbg !2941
  %27 = add i32 %tmp_read_bytes.0, %read_bytes.0, !dbg !2942
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1255), !dbg !2942
  br i1 %26, label %28, label %6, !dbg !2941

; <label>:28                                      ; preds = %25, %6
  ret i32 %read_bytes.0, !dbg !2943
}

define internal i8* @sapi_cgi_read_cookies() nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !2944, i64 0, metadata !2945) nounwind, !dbg !2948
  tail call void @llvm.dbg.value(metadata !2030, i64 0, metadata !2949) nounwind, !dbg !2950
  %1 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !2951
  %2 = icmp eq i32 %1, 0, !dbg !2951
  br i1 %2, label %7, label %3, !dbg !2951

; <label>:3                                       ; preds = %0
  %4 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2952, !tbaa !1649
  %5 = bitcast i8* %4 to %struct._fcgi_request*, !dbg !2952
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !2953) nounwind, !dbg !2952
  %6 = tail call i8* @fcgi_getenv(%struct._fcgi_request* %5, i8* getelementptr inbounds ([12 x i8]* @.str80, i64 0, i64 0), i32 11) nounwind, !dbg !2954
  br label %sapi_cgibin_getenv.exit, !dbg !2954

; <label>:7                                       ; preds = %0
  %8 = tail call i8* @getenv(i8* getelementptr inbounds ([12 x i8]* @.str80, i64 0, i64 0)) nounwind, !dbg !2955
  br label %sapi_cgibin_getenv.exit, !dbg !2955

sapi_cgibin_getenv.exit:                          ; preds = %7, %3
  %.0.i = phi i8* [ %6, %3 ], [ %8, %7 ]
  ret i8* %.0.i, !dbg !2946
}

define internal void @sapi_cgi_register_variables(%struct._zval_struct* %track_vars_array) nounwind uwtable {
  %php_self_len = alloca i32, align 4
  %php_self = alloca i8*, align 8
  call void @llvm.dbg.value(metadata !{%struct._zval_struct* %track_vars_array}, i64 0, metadata !1234), !dbg !2956
  call void @llvm.dbg.declare(metadata !952, metadata !1235), !dbg !2957
  call void @llvm.dbg.declare(metadata !952, metadata !1237), !dbg !2958
  %1 = load void (%struct._zval_struct*)** @php_import_environment_variables, align 8, !dbg !2959, !tbaa !1649
  call void %1(%struct._zval_struct* %track_vars_array) nounwind, !dbg !2959
  %2 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 3), align 1, !dbg !2960, !tbaa !1650
  %3 = icmp eq i8 %2, 0, !dbg !2960
  %4 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 1, i32 9), align 8, !dbg !2961, !tbaa !1649
  %5 = icmp ne i8* %4, null, !dbg !2962
  br i1 %3, label %47, label %6, !dbg !2960

; <label>:6                                       ; preds = %0
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1238), !dbg !2961
  br i1 %5, label %7, label %9, !dbg !2964

; <label>:7                                       ; preds = %6
  %8 = call i64 @strlen(i8* %4) nounwind readonly, !dbg !2965
  %phitmp = trunc i64 %8 to i32, !dbg !2965
  br label %9, !dbg !2965

; <label>:9                                       ; preds = %7, %6
  %10 = phi i32 [ %phitmp, %7 ], [ 0, %6 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1240), !dbg !2965
  call void @llvm.dbg.value(metadata !2013, i64 0, metadata !2966) nounwind, !dbg !2968
  call void @llvm.dbg.value(metadata !2017, i64 0, metadata !2969) nounwind, !dbg !2970
  %11 = call i32 @fcgi_is_fastcgi() nounwind, !dbg !2971
  %12 = icmp eq i32 %11, 0, !dbg !2971
  br i1 %12, label %17, label %13, !dbg !2971

; <label>:13                                      ; preds = %9
  %14 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !2972, !tbaa !1649
  %15 = bitcast i8* %14 to %struct._fcgi_request*, !dbg !2972
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !2973) nounwind, !dbg !2972
  %16 = call i8* @fcgi_getenv(%struct._fcgi_request* %15, i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0), i32 9) nounwind, !dbg !2974
  br label %sapi_cgibin_getenv.exit, !dbg !2974

; <label>:17                                      ; preds = %9
  %18 = call i8* @getenv(i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0)) nounwind, !dbg !2975
  br label %sapi_cgibin_getenv.exit, !dbg !2975

sapi_cgibin_getenv.exit:                          ; preds = %17, %13
  %.0.i = phi i8* [ %16, %13 ], [ %18, %17 ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1241), !dbg !2967
  %19 = icmp ne i8* %.0.i, null, !dbg !2976
  br i1 %19, label %20, label %22, !dbg !2976

; <label>:20                                      ; preds = %sapi_cgibin_getenv.exit
  %21 = call i64 @strlen(i8* %.0.i) nounwind readonly, !dbg !2977
  %phitmp1 = trunc i64 %21 to i32, !dbg !2977
  br label %22, !dbg !2977

; <label>:22                                      ; preds = %20, %sapi_cgibin_getenv.exit
  %23 = phi i32 [ %phitmp1, %20 ], [ 0, %sapi_cgibin_getenv.exit ]
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1242), !dbg !2977
  %24 = add i32 %23, %10, !dbg !2978
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2978
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2978
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2978
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2978
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2978
  store i32 %24, i32* %php_self_len, align 4, !dbg !2978, !tbaa !1663
  %25 = add i32 %24, 1, !dbg !2979
  %26 = zext i32 %25 to i64, !dbg !2979
  %27 = call noalias i8* @_emalloc(i64 %26) nounwind, !dbg !2979
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2979
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2979
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2979
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2979
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2979
  store i8* %27, i8** %php_self, align 8, !dbg !2979, !tbaa !1649
  br i1 %5, label %28, label %31, !dbg !2980

; <label>:28                                      ; preds = %22
  %29 = add i32 %10, 1, !dbg !2981
  %30 = zext i32 %29 to i64, !dbg !2981
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %4, i64 %30, i32 1, i1 false), !dbg !2981
  br label %31, !dbg !2983

; <label>:31                                      ; preds = %28, %22
  br i1 %19, label %32, label %37, !dbg !2984

; <label>:32                                      ; preds = %31
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2985
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2985
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2985
  %33 = zext i32 %10 to i64, !dbg !2985
  %34 = getelementptr inbounds i8* %27, i64 %33, !dbg !2985
  %35 = add i32 %23, 1, !dbg !2985
  %36 = zext i32 %35 to i64, !dbg !2985
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %.0.i, i64 %36, i32 1, i1 false), !dbg !2985
  br label %37, !dbg !2987

; <label>:37                                      ; preds = %32, %31
  %38 = load i32 (i32, i8*, i8**, i32, i32*)** getelementptr inbounds (%struct._sapi_module_struct* @sapi_module, i64 0, i32 31), align 8, !dbg !2988, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2988
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2988
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2988
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2988
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2988
  %39 = load i32* %php_self_len, align 4, !dbg !2988, !tbaa !1663
  %40 = call i32 %38(i32 5, i8* getelementptr inbounds ([9 x i8]* @.str79, i64 0, i64 0), i8** %php_self, i32 %39, i32* %php_self_len) nounwind, !dbg !2988
  %41 = icmp eq i32 %40, 0, !dbg !2988
  br i1 %41, label %45, label %42, !dbg !2988

; <label>:42                                      ; preds = %37
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2989
  %43 = load i8** %php_self, align 8, !dbg !2989, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2989
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2989
  %44 = load i32* %php_self_len, align 4, !dbg !2989, !tbaa !1663
  call void @php_register_variable_safe(i8* getelementptr inbounds ([9 x i8]* @.str79, i64 0, i64 0), i8* %43, i32 %44, %struct._zval_struct* %track_vars_array) nounwind, !dbg !2989
  br label %45, !dbg !2991

; <label>:45                                      ; preds = %42, %37
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2992
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2992
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2992
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2992
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2992
  %46 = load i8** %php_self, align 8, !dbg !2992, !tbaa !1649
  call void @_efree(i8* %46) nounwind, !dbg !2992
  br label %57, !dbg !2993

; <label>:47                                      ; preds = %0
  %48 = select i1 %5, i8* %4, i8* getelementptr inbounds ([1 x i8]* @.str50, i64 0, i64 0), !dbg !2962
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2962
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2962
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2962
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2962
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2962
  store i8* %48, i8** %php_self, align 8, !dbg !2962, !tbaa !1649
  %49 = call i64 @strlen(i8* %48) nounwind readonly, !dbg !2994
  %50 = trunc i64 %49 to i32, !dbg !2994
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2994
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2994
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2994
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2994
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2994
  store i32 %50, i32* %php_self_len, align 4, !dbg !2994, !tbaa !1663
  %51 = load i32 (i32, i8*, i8**, i32, i32*)** getelementptr inbounds (%struct._sapi_module_struct* @sapi_module, i64 0, i32 31), align 8, !dbg !2995, !tbaa !1649
  %52 = call i32 %51(i32 5, i8* getelementptr inbounds ([9 x i8]* @.str79, i64 0, i64 0), i8** %php_self, i32 %50, i32* %php_self_len) nounwind, !dbg !2995
  %53 = icmp eq i32 %52, 0, !dbg !2995
  br i1 %53, label %57, label %54, !dbg !2995

; <label>:54                                      ; preds = %47
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1237), !dbg !2996
  %55 = load i8** %php_self, align 8, !dbg !2996, !tbaa !1649
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2996
  call void @llvm.dbg.value(metadata !952, i64 0, metadata !1235), !dbg !2996
  %56 = load i32* %php_self_len, align 4, !dbg !2996, !tbaa !1663
  call void @php_register_variable_safe(i8* getelementptr inbounds ([9 x i8]* @.str79, i64 0, i64 0), i8* %55, i32 %56, %struct._zval_struct* %track_vars_array) nounwind, !dbg !2996
  br label %57, !dbg !2998

; <label>:57                                      ; preds = %54, %47, %45
  ret void, !dbg !2999
}

define internal void @sapi_cgi_log_message(i8* %message) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i8* %message}, i64 0, metadata !1224), !dbg !3000
  %1 = tail call i32 @fcgi_is_fastcgi() nounwind, !dbg !3001
  %2 = icmp eq i32 %1, 0, !dbg !3001
  %3 = load i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 6), align 2, !dbg !3001, !tbaa !1650
  %4 = icmp eq i8 %3, 0, !dbg !3001
  %or.cond = or i1 %2, %4, !dbg !3001
  br i1 %or.cond, label %23, label %5, !dbg !3001

; <label>:5                                       ; preds = %0
  %6 = load i8** getelementptr inbounds (%struct._sapi_globals_struct* @sapi_globals, i64 0, i32 0), align 8, !dbg !3002, !tbaa !1649
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1225), !dbg !3002
  %7 = icmp eq i8* %6, null, !dbg !3003
  br i1 %7, label %20, label %8, !dbg !3003

; <label>:8                                       ; preds = %5
  %9 = bitcast i8* %6 to %struct._fcgi_request*, !dbg !3002
  %10 = tail call i64 @strlen(i8* %message) nounwind readonly, !dbg !3004
  %11 = trunc i64 %10 to i32, !dbg !3004
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1228), !dbg !3004
  %12 = add nsw i32 %11, 2, !dbg !3005
  %13 = sext i32 %12 to i64, !dbg !3005
  %14 = tail call noalias i8* @malloc(i64 %13), !dbg !3005
  tail call void @llvm.dbg.value(metadata !952, i64 0, metadata !1230), !dbg !3005
  %15 = sext i32 %11 to i64, !dbg !3006
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %message, i64 %15, i32 1, i1 false), !dbg !3006
  %16 = getelementptr inbounds i8* %14, i64 %15, !dbg !3007
  %17 = bitcast i8* %16 to i16*, !dbg !3007
  store i16 10, i16* %17, align 1, !dbg !3007
  %18 = add nsw i32 %11, 1, !dbg !3008
  %19 = tail call i32 @fcgi_write(%struct._fcgi_request* %9, i32 7, i8* %14, i32 %18) nounwind, !dbg !3008
  tail call void @free(i8* %14), !dbg !3009
  br label %26, !dbg !3010

; <label>:20                                      ; preds = %5
  %21 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3011, !tbaa !1649
  %22 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %21, i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i8* %message) nounwind, !dbg !3011
  br label %26

; <label>:23                                      ; preds = %0
  %24 = load %struct.__sFILE** @__stderrp, align 8, !dbg !3013, !tbaa !1649
  %25 = tail call i32 (%struct.__sFILE*, i8*, ...)* @fprintf(%struct.__sFILE* %24, i8* getelementptr inbounds ([4 x i8]* @.str35, i64 0, i64 0), i8* %message) nounwind, !dbg !3013
  br label %26

; <label>:26                                      ; preds = %23, %20, %8
  ret void, !dbg !3015
}

declare i32 @fcgi_write(%struct._fcgi_request*, i32, i8*, i32)

declare i32 @fcgi_read(%struct._fcgi_request*, i8*, i32)

declare i64 @read(i32, i8* nocapture, i64)

declare i32 @ap_php_slprintf(i8*, i64, i8*, ...)

declare i32 @strncasecmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare i8* @zend_llist_get_first_ex(%struct._zend_llist*, %struct._zend_llist_element**)

declare i8* @zend_llist_get_next_ex(%struct._zend_llist*, %struct._zend_llist_element**)

declare i32 @php_header_write(i8*, i32)

declare i32 @fcgi_flush(%struct._fcgi_request*, i32)

declare void @php_handle_aborted_connection()

declare i32 @fflush(%struct.__sFILE* nocapture) nounwind

declare i64 @write(i32, i8* nocapture, i64)

declare i32 @php_ini_has_per_host_config()

declare void @zend_str_tolower(i8*, i32)

declare void @php_ini_activate_per_host_config(i8*, i32)

declare i32 @php_ini_has_per_dir_config()

declare i64 @zend_dirname(i8*, i64)

declare void @php_ini_activate_per_dir_config(i8*, i32)

declare i64 @sapi_get_request_time()

declare i32 @zend_hash_find(%struct._hashtable*, i8*, i32, i8**)

declare void @config_zval_dtor(%struct._zval_struct*)

declare i32 @_zend_hash_add_or_update(%struct._hashtable*, i8*, i32, i8*, i32, i8**, i32)

declare void @zend_hash_clean(%struct._hashtable*)

declare i32 @php_parse_user_ini_file(i8*, i8*, %struct._hashtable*)

declare void @php_ini_activate_config(%struct._hashtable*, i32, i32)

declare i32 @php_module_startup(%struct._sapi_module_struct*, %struct._zend_module_entry*, i32)

define internal i32 @zm_startup_cgi(i32 %type, i32 %module_number) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i32 %type}, i64 0, metadata !1500), !dbg !3016
  tail call void @llvm.dbg.value(metadata !{i32 %module_number}, i64 0, metadata !1501), !dbg !3016
  tail call void @llvm.dbg.value(metadata !3017, i64 0, metadata !3018) nounwind, !dbg !3021
  store i8 0, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 0), align 8, !dbg !3022, !tbaa !1650
  store i8 0, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 1), align 1, !dbg !3024, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 2), align 2, !dbg !3025, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 4), align 4, !dbg !3026, !tbaa !1650
  store i8* null, i8** getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 7), align 8, !dbg !3027, !tbaa !1649
  store i8 1, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 3), align 1, !dbg !3028, !tbaa !1650
  store i8 0, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 5), align 1, !dbg !3029, !tbaa !1650
  store i8 1, i8* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 6), align 2, !dbg !3030, !tbaa !1650
  %1 = tail call i32 @_zend_hash_init(%struct._hashtable* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 8), i32 0, i64 (i8*, i32)* null, void (i8*)* bitcast (void (%struct._user_config_cache_entry*)* @user_config_cache_entry_dtor to void (i8*)*), i8 zeroext 1) nounwind, !dbg !3031
  %2 = tail call i32 @zend_register_ini_entries(%struct._zend_ini_entry* getelementptr inbounds ([9 x %struct._zend_ini_entry]* @ini_entries, i64 0, i64 0), i32 %module_number) nounwind, !dbg !3032
  ret i32 0, !dbg !3033
}

define internal i32 @zm_shutdown_cgi(i32 %type, i32 %module_number) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{i32 %type}, i64 0, metadata !1495), !dbg !3034
  tail call void @llvm.dbg.value(metadata !{i32 %module_number}, i64 0, metadata !1496), !dbg !3034
  tail call void @zend_hash_destroy(%struct._hashtable* getelementptr inbounds (%struct._php_cgi_globals_struct* @php_cgi_globals, i64 0, i32 8)) nounwind, !dbg !3035
  tail call void @zend_unregister_ini_entries(i32 %module_number) nounwind, !dbg !3037
  ret i32 0, !dbg !3038
}

define internal void @zm_info_cgi(%struct._zend_module_entry* %zend_module) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{%struct._zend_module_entry* %zend_module}, i64 0, metadata !1491), !dbg !3039
  tail call void @display_ini_entries(%struct._zend_module_entry* %zend_module) nounwind, !dbg !3040
  ret void, !dbg !3042
}

declare void @display_ini_entries(%struct._zend_module_entry*)

declare void @zend_unregister_ini_entries(i32)

declare i32 @zend_register_ini_entries(%struct._zend_ini_entry*, i32)

declare i32 @OnUpdateBool(%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)

declare i32 @OnUpdateString(%struct._zend_ini_entry*, i8*, i32, i8*, i8*, i8*, i32)

define internal void @user_config_cache_entry_dtor(%struct._user_config_cache_entry* nocapture %entry) nounwind uwtable {
  tail call void @llvm.dbg.value(metadata !{%struct._user_config_cache_entry* %entry}, i64 0, metadata !1526), !dbg !3043
  %1 = getelementptr inbounds %struct._user_config_cache_entry* %entry, i64 0, i32 1, !dbg !3044
  %2 = load %struct._hashtable** %1, align 8, !dbg !3044, !tbaa !1649
  tail call void @zend_hash_destroy(%struct._hashtable* %2) nounwind, !dbg !3044
  %3 = load %struct._hashtable** %1, align 8, !dbg !3046, !tbaa !1649
  %4 = bitcast %struct._hashtable* %3 to i8*, !dbg !3046
  tail call void @free(i8* %4), !dbg !3046
  ret void, !dbg !3047
}

declare void @_zval_copy_ctor_func(%struct._zval_struct*)

declare void @_zval_dtor_func(%struct._zval_struct*)

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i64 @fwrite(i8* nocapture, i64, i64, %struct.__sFILE* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!llvm.dbg.cu = !{!0}

!0 = metadata !{i32 786449, i32 0, i32 12, metadata !"sapi/cgi/cgi_main.c", metadata !"/home/capsicum/wvd/php-5.3.2", metadata !"clang version 3.1 (tags/RELEASE_31/final)", i1 true, i1 true, metadata !"", i32 0, metadata !1, metadata !32, metadata !34, metadata !1536} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3, metadata !3, metadata !3, metadata !11, metadata !19, metadata !19}
!3 = metadata !{i32 786436, null, metadata !"", metadata !4, i32 36, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!4 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_stream.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"ZEND_HANDLE_FILENAME", i64 0} ; [ DW_TAG_enumerator ]
!7 = metadata !{i32 786472, metadata !"ZEND_HANDLE_FD", i64 1} ; [ DW_TAG_enumerator ]
!8 = metadata !{i32 786472, metadata !"ZEND_HANDLE_FP", i64 2} ; [ DW_TAG_enumerator ]
!9 = metadata !{i32 786472, metadata !"ZEND_HANDLE_STREAM", i64 3} ; [ DW_TAG_enumerator ]
!10 = metadata !{i32 786472, metadata !"ZEND_HANDLE_MAPPED", i64 4} ; [ DW_TAG_enumerator ]
!11 = metadata !{i32 786436, null, metadata !"", metadata !12, i32 170, i64 32, i64 32, i32 0, i32 0, null, metadata !13, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!12 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/main/SAPI.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !18}
!14 = metadata !{i32 786472, metadata !"SAPI_HEADER_REPLACE", i64 0} ; [ DW_TAG_enumerator ]
!15 = metadata !{i32 786472, metadata !"SAPI_HEADER_ADD", i64 1} ; [ DW_TAG_enumerator ]
!16 = metadata !{i32 786472, metadata !"SAPI_HEADER_DELETE", i64 2} ; [ DW_TAG_enumerator ]
!17 = metadata !{i32 786472, metadata !"SAPI_HEADER_DELETE_ALL", i64 3} ; [ DW_TAG_enumerator ]
!18 = metadata !{i32 786472, metadata !"SAPI_HEADER_SET_STATUS", i64 4} ; [ DW_TAG_enumerator ]
!19 = metadata !{i32 786436, null, metadata !"_fcgi_request_type", metadata !20, i32 35, i64 32, i64 32, i32 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_enumeration_type ]
!20 = metadata !{i32 786473, metadata !"sapi/cgi/fastcgi.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31}
!22 = metadata !{i32 786472, metadata !"FCGI_BEGIN_REQUEST", i64 1} ; [ DW_TAG_enumerator ]
!23 = metadata !{i32 786472, metadata !"FCGI_ABORT_REQUEST", i64 2} ; [ DW_TAG_enumerator ]
!24 = metadata !{i32 786472, metadata !"FCGI_END_REQUEST", i64 3} ; [ DW_TAG_enumerator ]
!25 = metadata !{i32 786472, metadata !"FCGI_PARAMS", i64 4} ; [ DW_TAG_enumerator ]
!26 = metadata !{i32 786472, metadata !"FCGI_STDIN", i64 5} ; [ DW_TAG_enumerator ]
!27 = metadata !{i32 786472, metadata !"FCGI_STDOUT", i64 6} ; [ DW_TAG_enumerator ]
!28 = metadata !{i32 786472, metadata !"FCGI_STDERR", i64 7} ; [ DW_TAG_enumerator ]
!29 = metadata !{i32 786472, metadata !"FCGI_DATA", i64 8} ; [ DW_TAG_enumerator ]
!30 = metadata !{i32 786472, metadata !"FCGI_GET_VALUES", i64 9} ; [ DW_TAG_enumerator ]
!31 = metadata !{i32 786472, metadata !"FCGI_GET_VALUES_RESULT", i64 10} ; [ DW_TAG_enumerator ]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !36, metadata !718, metadata !724, metadata !950, metadata !977, metadata !1047, metadata !1057, metadata !1063, metadata !1070, metadata !1082, metadata !1172, metadata !1178, metadata !1189, metadata !1199, metadata !1207, metadata !1216, metadata !1221, metadata !1231, metadata !1243, metadata !1248, metadata !1261, metadata !1308, metadata !1315, metadata !1326, metadata !1338, metadata !1339, metadata !1349, metadata !1376, metadata !1385, metadata !1488, metadata !1492, metadata !1497, metadata !1502, metadata !1521, metadata !1527, metadata !1532}
!36 = metadata !{i32 786478, i32 0, metadata !37, metadata !"cgi_php_import_environment_variables", metadata !"cgi_php_import_environment_variables", metadata !"", metadata !37, i32 590, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._zval_struct*)* @cgi_php_import_environment_variables, null, null, metadata !668, i32 591} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/sapi/cgi/cgi_main.c", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!38 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!39 = metadata !{null, metadata !40}
!40 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 786454, null, metadata !"zval", metadata !37, i32 286, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 786451, null, metadata !"_zval_struct", metadata !43, i32 316, i64 192, i64 64, i32 0, i32 0, null, metadata !44, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!43 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!44 = metadata !{metadata !45, metadata !665, metadata !666, metadata !667}
!45 = metadata !{i32 786445, metadata !42, metadata !"value", metadata !43, i32 318, i64 128, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_member ]
!46 = metadata !{i32 786454, null, metadata !"zvalue_value", metadata !43, i32 314, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ]
!47 = metadata !{i32 786455, null, metadata !"_zvalue_value", metadata !43, i32 305, i64 128, i64 64, i64 0, i32 0, null, metadata !48, i32 0, i32 0} ; [ DW_TAG_union_type ]
!48 = metadata !{metadata !49, metadata !51, metadata !53, metadata !61, metadata !107}
!49 = metadata !{i32 786445, metadata !47, metadata !"lval", metadata !43, i32 306, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ]
!50 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!51 = metadata !{i32 786445, metadata !47, metadata !"dval", metadata !43, i32 307, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_member ]
!52 = metadata !{i32 786468, null, metadata !"double", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!53 = metadata !{i32 786445, metadata !47, metadata !"str", metadata !43, i32 311, i64 128, i64 64, i64 0, i32 0, metadata !54} ; [ DW_TAG_member ]
!54 = metadata !{i32 786451, metadata !47, metadata !"", metadata !43, i32 308, i64 128, i64 64, i32 0, i32 0, null, metadata !55, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!55 = metadata !{metadata !56, metadata !59}
!56 = metadata !{i32 786445, metadata !54, metadata !"val", metadata !43, i32 309, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!57 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!58 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!59 = metadata !{i32 786445, metadata !54, metadata !"len", metadata !43, i32 310, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!60 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 786445, metadata !47, metadata !"ht", metadata !43, i32 312, i64 64, i64 64, i64 0, i32 0, metadata !62} ; [ DW_TAG_member ]
!62 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !63} ; [ DW_TAG_pointer_type ]
!63 = metadata !{i32 786454, null, metadata !"HashTable", metadata !43, i32 82, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 786451, null, metadata !"_hashtable", metadata !65, i32 66, i64 576, i64 64, i32 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!65 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_hash.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!66 = metadata !{metadata !67, metadata !70, metadata !71, metadata !72, metadata !74, metadata !93, metadata !94, metadata !95, metadata !97, metadata !102, metadata !105, metadata !106}
!67 = metadata !{i32 786445, metadata !64, metadata !"nTableSize", metadata !65, i32 67, i64 32, i64 32, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ]
!68 = metadata !{i32 786454, null, metadata !"uint", metadata !65, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!69 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!70 = metadata !{i32 786445, metadata !64, metadata !"nTableMask", metadata !65, i32 68, i64 32, i64 32, i64 32, i32 0, metadata !68} ; [ DW_TAG_member ]
!71 = metadata !{i32 786445, metadata !64, metadata !"nNumOfElements", metadata !65, i32 69, i64 32, i64 32, i64 64, i32 0, metadata !68} ; [ DW_TAG_member ]
!72 = metadata !{i32 786445, metadata !64, metadata !"nNextFreeElement", metadata !65, i32 70, i64 64, i64 64, i64 128, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!74 = metadata !{i32 786445, metadata !64, metadata !"pInternalPointer", metadata !65, i32 71, i64 64, i64 64, i64 192, i32 0, metadata !75} ; [ DW_TAG_member ]
!75 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_pointer_type ]
!76 = metadata !{i32 786454, null, metadata !"Bucket", metadata !65, i32 64, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ]
!77 = metadata !{i32 786451, null, metadata !"bucket", metadata !65, i32 54, i64 576, i64 64, i32 0, i32 0, null, metadata !78, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!78 = metadata !{metadata !79, metadata !80, metadata !81, metadata !83, metadata !84, metadata !86, metadata !87, metadata !88, metadata !89}
!79 = metadata !{i32 786445, metadata !77, metadata !"h", metadata !65, i32 55, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_member ]
!80 = metadata !{i32 786445, metadata !77, metadata !"nKeyLength", metadata !65, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !68} ; [ DW_TAG_member ]
!81 = metadata !{i32 786445, metadata !77, metadata !"pData", metadata !65, i32 57, i64 64, i64 64, i64 128, i32 0, metadata !82} ; [ DW_TAG_member ]
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!83 = metadata !{i32 786445, metadata !77, metadata !"pDataPtr", metadata !65, i32 58, i64 64, i64 64, i64 192, i32 0, metadata !82} ; [ DW_TAG_member ]
!84 = metadata !{i32 786445, metadata !77, metadata !"pListNext", metadata !65, i32 59, i64 64, i64 64, i64 256, i32 0, metadata !85} ; [ DW_TAG_member ]
!85 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !77} ; [ DW_TAG_pointer_type ]
!86 = metadata !{i32 786445, metadata !77, metadata !"pListLast", metadata !65, i32 60, i64 64, i64 64, i64 320, i32 0, metadata !85} ; [ DW_TAG_member ]
!87 = metadata !{i32 786445, metadata !77, metadata !"pNext", metadata !65, i32 61, i64 64, i64 64, i64 384, i32 0, metadata !85} ; [ DW_TAG_member ]
!88 = metadata !{i32 786445, metadata !77, metadata !"pLast", metadata !65, i32 62, i64 64, i64 64, i64 448, i32 0, metadata !85} ; [ DW_TAG_member ]
!89 = metadata !{i32 786445, metadata !77, metadata !"arKey", metadata !65, i32 63, i64 8, i64 8, i64 512, i32 0, metadata !90} ; [ DW_TAG_member ]
!90 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !58, metadata !91, i32 0, i32 0} ; [ DW_TAG_array_type ]
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786465, i64 0, i64 0}        ; [ DW_TAG_subrange_type ]
!93 = metadata !{i32 786445, metadata !64, metadata !"pListHead", metadata !65, i32 72, i64 64, i64 64, i64 256, i32 0, metadata !75} ; [ DW_TAG_member ]
!94 = metadata !{i32 786445, metadata !64, metadata !"pListTail", metadata !65, i32 73, i64 64, i64 64, i64 320, i32 0, metadata !75} ; [ DW_TAG_member ]
!95 = metadata !{i32 786445, metadata !64, metadata !"arBuckets", metadata !65, i32 74, i64 64, i64 64, i64 384, i32 0, metadata !96} ; [ DW_TAG_member ]
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !75} ; [ DW_TAG_pointer_type ]
!97 = metadata !{i32 786445, metadata !64, metadata !"pDestructor", metadata !65, i32 75, i64 64, i64 64, i64 448, i32 0, metadata !98} ; [ DW_TAG_member ]
!98 = metadata !{i32 786454, null, metadata !"dtor_func_t", metadata !65, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_typedef ]
!99 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !100} ; [ DW_TAG_pointer_type ]
!100 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!101 = metadata !{null, metadata !82}
!102 = metadata !{i32 786445, metadata !64, metadata !"persistent", metadata !65, i32 76, i64 8, i64 8, i64 512, i32 0, metadata !103} ; [ DW_TAG_member ]
!103 = metadata !{i32 786454, null, metadata !"zend_bool", metadata !65, i32 25, i64 0, i64 0, i64 0, i32 0, metadata !104} ; [ DW_TAG_typedef ]
!104 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!105 = metadata !{i32 786445, metadata !64, metadata !"nApplyCount", metadata !65, i32 77, i64 8, i64 8, i64 520, i32 0, metadata !104} ; [ DW_TAG_member ]
!106 = metadata !{i32 786445, metadata !64, metadata !"bApplyProtection", metadata !65, i32 78, i64 8, i64 8, i64 528, i32 0, metadata !103} ; [ DW_TAG_member ]
!107 = metadata !{i32 786445, metadata !47, metadata !"obj", metadata !43, i32 313, i64 128, i64 64, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ]
!108 = metadata !{i32 786454, null, metadata !"zend_object_value", metadata !43, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_typedef ]
!109 = metadata !{i32 786451, null, metadata !"_zend_object_value", metadata !110, i32 56, i64 128, i64 64, i32 0, i32 0, null, metadata !111, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!110 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_types.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!111 = metadata !{metadata !112, metadata !114}
!112 = metadata !{i32 786445, metadata !109, metadata !"handle", metadata !110, i32 57, i64 32, i64 32, i64 0, i32 0, metadata !113} ; [ DW_TAG_member ]
!113 = metadata !{i32 786454, null, metadata !"zend_object_handle", metadata !110, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!114 = metadata !{i32 786445, metadata !109, metadata !"handlers", metadata !110, i32 58, i64 64, i64 64, i64 64, i32 0, metadata !115} ; [ DW_TAG_member ]
!115 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !116} ; [ DW_TAG_pointer_type ]
!116 = metadata !{i32 786454, null, metadata !"zend_object_handlers", metadata !110, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !117} ; [ DW_TAG_typedef ]
!117 = metadata !{i32 786451, null, metadata !"_zend_object_handlers", metadata !118, i32 113, i64 1600, i64 64, i32 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!118 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_object_handlers.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!119 = metadata !{metadata !120, metadata !127, metadata !129, metadata !135, metadata !140, metadata !145, metadata !147, metadata !149, metadata !155, metadata !160, metadata !165, metadata !170, metadata !175, metadata !177, metadata !179, metadata !184, metadata !618, metadata !623, metadata !628, metadata !635, metadata !640, metadata !645, metadata !647, metadata !653, metadata !659}
!120 = metadata !{i32 786445, metadata !117, metadata !"add_ref", metadata !118, i32 115, i64 64, i64 64, i64 0, i32 0, metadata !121} ; [ DW_TAG_member ]
!121 = metadata !{i32 786454, null, metadata !"zend_object_add_ref_t", metadata !118, i32 94, i64 0, i64 0, i64 0, i32 0, metadata !122} ; [ DW_TAG_typedef ]
!122 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !123} ; [ DW_TAG_pointer_type ]
!123 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!124 = metadata !{null, metadata !125}
!125 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !126} ; [ DW_TAG_pointer_type ]
!126 = metadata !{i32 786454, null, metadata !"zval", metadata !118, i32 286, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!127 = metadata !{i32 786445, metadata !117, metadata !"del_ref", metadata !118, i32 116, i64 64, i64 64, i64 64, i32 0, metadata !128} ; [ DW_TAG_member ]
!128 = metadata !{i32 786454, null, metadata !"zend_object_del_ref_t", metadata !118, i32 95, i64 0, i64 0, i64 0, i32 0, metadata !122} ; [ DW_TAG_typedef ]
!129 = metadata !{i32 786445, metadata !117, metadata !"clone_obj", metadata !118, i32 117, i64 64, i64 64, i64 128, i32 0, metadata !130} ; [ DW_TAG_member ]
!130 = metadata !{i32 786454, null, metadata !"zend_object_clone_obj_t", metadata !118, i32 97, i64 0, i64 0, i64 0, i32 0, metadata !131} ; [ DW_TAG_typedef ]
!131 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !132} ; [ DW_TAG_pointer_type ]
!132 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!133 = metadata !{metadata !134, metadata !125}
!134 = metadata !{i32 786454, null, metadata !"zend_object_value", metadata !118, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_typedef ]
!135 = metadata !{i32 786445, metadata !117, metadata !"read_property", metadata !118, i32 119, i64 64, i64 64, i64 192, i32 0, metadata !136} ; [ DW_TAG_member ]
!136 = metadata !{i32 786454, null, metadata !"zend_object_read_property_t", metadata !118, i32 33, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_typedef ]
!137 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ]
!138 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!139 = metadata !{metadata !125, metadata !125, metadata !125, metadata !60}
!140 = metadata !{i32 786445, metadata !117, metadata !"write_property", metadata !118, i32 120, i64 64, i64 64, i64 256, i32 0, metadata !141} ; [ DW_TAG_member ]
!141 = metadata !{i32 786454, null, metadata !"zend_object_write_property_t", metadata !118, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !142} ; [ DW_TAG_typedef ]
!142 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !143} ; [ DW_TAG_pointer_type ]
!143 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !144, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!144 = metadata !{null, metadata !125, metadata !125, metadata !125}
!145 = metadata !{i32 786445, metadata !117, metadata !"read_dimension", metadata !118, i32 121, i64 64, i64 64, i64 320, i32 0, metadata !146} ; [ DW_TAG_member ]
!146 = metadata !{i32 786454, null, metadata !"zend_object_read_dimension_t", metadata !118, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !137} ; [ DW_TAG_typedef ]
!147 = metadata !{i32 786445, metadata !117, metadata !"write_dimension", metadata !118, i32 122, i64 64, i64 64, i64 384, i32 0, metadata !148} ; [ DW_TAG_member ]
!148 = metadata !{i32 786454, null, metadata !"zend_object_write_dimension_t", metadata !118, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !142} ; [ DW_TAG_typedef ]
!149 = metadata !{i32 786445, metadata !117, metadata !"get_property_ptr_ptr", metadata !118, i32 123, i64 64, i64 64, i64 448, i32 0, metadata !150} ; [ DW_TAG_member ]
!150 = metadata !{i32 786454, null, metadata !"zend_object_get_property_ptr_ptr_t", metadata !118, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !151} ; [ DW_TAG_typedef ]
!151 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !152} ; [ DW_TAG_pointer_type ]
!152 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !153, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!153 = metadata !{metadata !154, metadata !125, metadata !125}
!154 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !125} ; [ DW_TAG_pointer_type ]
!155 = metadata !{i32 786445, metadata !117, metadata !"get", metadata !118, i32 124, i64 64, i64 64, i64 512, i32 0, metadata !156} ; [ DW_TAG_member ]
!156 = metadata !{i32 786454, null, metadata !"zend_object_get_t", metadata !118, i32 61, i64 0, i64 0, i64 0, i32 0, metadata !157} ; [ DW_TAG_typedef ]
!157 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !158} ; [ DW_TAG_pointer_type ]
!158 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !159, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!159 = metadata !{metadata !125, metadata !125}
!160 = metadata !{i32 786445, metadata !117, metadata !"set", metadata !118, i32 125, i64 64, i64 64, i64 576, i32 0, metadata !161} ; [ DW_TAG_member ]
!161 = metadata !{i32 786454, null, metadata !"zend_object_set_t", metadata !118, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !162} ; [ DW_TAG_typedef ]
!162 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !163} ; [ DW_TAG_pointer_type ]
!163 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !164, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!164 = metadata !{null, metadata !154, metadata !125}
!165 = metadata !{i32 786445, metadata !117, metadata !"has_property", metadata !118, i32 126, i64 64, i64 64, i64 640, i32 0, metadata !166} ; [ DW_TAG_member ]
!166 = metadata !{i32 786454, null, metadata !"zend_object_has_property_t", metadata !118, i32 69, i64 0, i64 0, i64 0, i32 0, metadata !167} ; [ DW_TAG_typedef ]
!167 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !168} ; [ DW_TAG_pointer_type ]
!168 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !169, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!169 = metadata !{metadata !60, metadata !125, metadata !125, metadata !60}
!170 = metadata !{i32 786445, metadata !117, metadata !"unset_property", metadata !118, i32 127, i64 64, i64 64, i64 704, i32 0, metadata !171} ; [ DW_TAG_member ]
!171 = metadata !{i32 786454, null, metadata !"zend_object_unset_property_t", metadata !118, i32 75, i64 0, i64 0, i64 0, i32 0, metadata !172} ; [ DW_TAG_typedef ]
!172 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_pointer_type ]
!173 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !174, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!174 = metadata !{null, metadata !125, metadata !125}
!175 = metadata !{i32 786445, metadata !117, metadata !"has_dimension", metadata !118, i32 128, i64 64, i64 64, i64 768, i32 0, metadata !176} ; [ DW_TAG_member ]
!176 = metadata !{i32 786454, null, metadata !"zend_object_has_dimension_t", metadata !118, i32 72, i64 0, i64 0, i64 0, i32 0, metadata !167} ; [ DW_TAG_typedef ]
!177 = metadata !{i32 786445, metadata !117, metadata !"unset_dimension", metadata !118, i32 129, i64 64, i64 64, i64 832, i32 0, metadata !178} ; [ DW_TAG_member ]
!178 = metadata !{i32 786454, null, metadata !"zend_object_unset_dimension_t", metadata !118, i32 78, i64 0, i64 0, i64 0, i32 0, metadata !172} ; [ DW_TAG_typedef ]
!179 = metadata !{i32 786445, metadata !117, metadata !"get_properties", metadata !118, i32 130, i64 64, i64 64, i64 896, i32 0, metadata !180} ; [ DW_TAG_member ]
!180 = metadata !{i32 786454, null, metadata !"zend_object_get_properties_t", metadata !118, i32 81, i64 0, i64 0, i64 0, i32 0, metadata !181} ; [ DW_TAG_typedef ]
!181 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !182} ; [ DW_TAG_pointer_type ]
!182 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !183, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!183 = metadata !{metadata !62, metadata !125}
!184 = metadata !{i32 786445, metadata !117, metadata !"get_method", metadata !118, i32 131, i64 64, i64 64, i64 960, i32 0, metadata !185} ; [ DW_TAG_member ]
!185 = metadata !{i32 786454, null, metadata !"zend_object_get_method_t", metadata !118, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !186} ; [ DW_TAG_typedef ]
!186 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !187} ; [ DW_TAG_pointer_type ]
!187 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !188, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!188 = metadata !{metadata !189, metadata !154, metadata !57, metadata !60}
!189 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !190} ; [ DW_TAG_pointer_type ]
!190 = metadata !{i32 786455, null, metadata !"_zend_function", metadata !191, i32 266, i64 1856, i64 64, i64 0, i32 0, null, metadata !192, i32 0, i32 0} ; [ DW_TAG_union_type ]
!191 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_compile.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!192 = metadata !{metadata !193, metadata !195, metadata !441, metadata !602}
!193 = metadata !{i32 786445, metadata !190, metadata !"type", metadata !191, i32 267, i64 8, i64 8, i64 0, i32 0, metadata !194} ; [ DW_TAG_member ]
!194 = metadata !{i32 786454, null, metadata !"zend_uchar", metadata !191, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !104} ; [ DW_TAG_typedef ]
!195 = metadata !{i32 786445, metadata !190, metadata !"common", metadata !191, i32 280, i64 512, i64 64, i64 0, i32 0, metadata !196} ; [ DW_TAG_member ]
!196 = metadata !{i32 786451, metadata !190, metadata !"", metadata !191, i32 269, i64 512, i64 64, i32 0, i32 0, null, metadata !197, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!197 = metadata !{metadata !198, metadata !199, metadata !200, metadata !432, metadata !433, metadata !434, metadata !435, metadata !436, metadata !439, metadata !440}
!198 = metadata !{i32 786445, metadata !196, metadata !"type", metadata !191, i32 270, i64 8, i64 8, i64 0, i32 0, metadata !194} ; [ DW_TAG_member ]
!199 = metadata !{i32 786445, metadata !196, metadata !"function_name", metadata !191, i32 271, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!200 = metadata !{i32 786445, metadata !196, metadata !"scope", metadata !191, i32 272, i64 64, i64 64, i64 128, i32 0, metadata !201} ; [ DW_TAG_member ]
!201 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !202} ; [ DW_TAG_pointer_type ]
!202 = metadata !{i32 786454, null, metadata !"zend_class_entry", metadata !191, i32 287, i64 0, i64 0, i64 0, i32 0, metadata !203} ; [ DW_TAG_typedef ]
!203 = metadata !{i32 786451, null, metadata !"_zend_class_entry", metadata !43, i32 418, i64 5440, i64 64, i32 0, i32 0, null, metadata !204, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!204 = metadata !{metadata !205, metadata !206, metadata !207, metadata !209, metadata !211, metadata !212, metadata !213, metadata !214, metadata !215, metadata !216, metadata !217, metadata !218, metadata !219, metadata !220, metadata !249, metadata !250, metadata !251, metadata !252, metadata !253, metadata !254, metadata !255, metadata !256, metadata !257, metadata !258, metadata !259, metadata !260, metadata !261, metadata !307, metadata !313, metadata !317, metadata !321, metadata !325, metadata !335, metadata !344, metadata !346, metadata !347, metadata !348, metadata !349, metadata !350, metadata !351, metadata !352}
!205 = metadata !{i32 786445, metadata !203, metadata !"type", metadata !43, i32 419, i64 8, i64 8, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!206 = metadata !{i32 786445, metadata !203, metadata !"name", metadata !43, i32 420, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!207 = metadata !{i32 786445, metadata !203, metadata !"name_length", metadata !43, i32 421, i64 32, i64 32, i64 128, i32 0, metadata !208} ; [ DW_TAG_member ]
!208 = metadata !{i32 786454, null, metadata !"zend_uint", metadata !43, i32 27, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!209 = metadata !{i32 786445, metadata !203, metadata !"parent", metadata !43, i32 422, i64 64, i64 64, i64 192, i32 0, metadata !210} ; [ DW_TAG_member ]
!210 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !203} ; [ DW_TAG_pointer_type ]
!211 = metadata !{i32 786445, metadata !203, metadata !"refcount", metadata !43, i32 423, i64 32, i64 32, i64 256, i32 0, metadata !60} ; [ DW_TAG_member ]
!212 = metadata !{i32 786445, metadata !203, metadata !"constants_updated", metadata !43, i32 424, i64 8, i64 8, i64 288, i32 0, metadata !103} ; [ DW_TAG_member ]
!213 = metadata !{i32 786445, metadata !203, metadata !"ce_flags", metadata !43, i32 425, i64 32, i64 32, i64 320, i32 0, metadata !208} ; [ DW_TAG_member ]
!214 = metadata !{i32 786445, metadata !203, metadata !"function_table", metadata !43, i32 427, i64 576, i64 64, i64 384, i32 0, metadata !63} ; [ DW_TAG_member ]
!215 = metadata !{i32 786445, metadata !203, metadata !"default_properties", metadata !43, i32 428, i64 576, i64 64, i64 960, i32 0, metadata !63} ; [ DW_TAG_member ]
!216 = metadata !{i32 786445, metadata !203, metadata !"properties_info", metadata !43, i32 429, i64 576, i64 64, i64 1536, i32 0, metadata !63} ; [ DW_TAG_member ]
!217 = metadata !{i32 786445, metadata !203, metadata !"default_static_members", metadata !43, i32 430, i64 576, i64 64, i64 2112, i32 0, metadata !63} ; [ DW_TAG_member ]
!218 = metadata !{i32 786445, metadata !203, metadata !"static_members", metadata !43, i32 431, i64 64, i64 64, i64 2688, i32 0, metadata !62} ; [ DW_TAG_member ]
!219 = metadata !{i32 786445, metadata !203, metadata !"constants_table", metadata !43, i32 432, i64 576, i64 64, i64 2752, i32 0, metadata !63} ; [ DW_TAG_member ]
!220 = metadata !{i32 786445, metadata !203, metadata !"builtin_functions", metadata !43, i32 433, i64 64, i64 64, i64 3328, i32 0, metadata !221} ; [ DW_TAG_member ]
!221 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !222} ; [ DW_TAG_pointer_type ]
!222 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !223} ; [ DW_TAG_const_type ]
!223 = metadata !{i32 786451, null, metadata !"_zend_function_entry", metadata !224, i32 35, i64 256, i64 64, i32 0, i32 0, null, metadata !225, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!224 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_API.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!225 = metadata !{metadata !226, metadata !229, metadata !233, metadata !247, metadata !248}
!226 = metadata !{i32 786445, metadata !223, metadata !"fname", metadata !224, i32 36, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_member ]
!227 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !228} ; [ DW_TAG_pointer_type ]
!228 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !58} ; [ DW_TAG_const_type ]
!229 = metadata !{i32 786445, metadata !223, metadata !"handler", metadata !224, i32 37, i64 64, i64 64, i64 64, i32 0, metadata !230} ; [ DW_TAG_member ]
!230 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !231} ; [ DW_TAG_pointer_type ]
!231 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !232, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!232 = metadata !{null, metadata !60, metadata !125, metadata !154, metadata !125, metadata !60}
!233 = metadata !{i32 786445, metadata !223, metadata !"arg_info", metadata !224, i32 38, i64 64, i64 64, i64 128, i32 0, metadata !234} ; [ DW_TAG_member ]
!234 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ]
!235 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !236} ; [ DW_TAG_const_type ]
!236 = metadata !{i32 786451, null, metadata !"_zend_arg_info", metadata !191, i32 173, i64 320, i64 64, i32 0, i32 0, null, metadata !237, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!237 = metadata !{metadata !238, metadata !239, metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !245, metadata !246}
!238 = metadata !{i32 786445, metadata !236, metadata !"name", metadata !191, i32 174, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_member ]
!239 = metadata !{i32 786445, metadata !236, metadata !"name_len", metadata !191, i32 175, i64 32, i64 32, i64 64, i32 0, metadata !208} ; [ DW_TAG_member ]
!240 = metadata !{i32 786445, metadata !236, metadata !"class_name", metadata !191, i32 176, i64 64, i64 64, i64 128, i32 0, metadata !227} ; [ DW_TAG_member ]
!241 = metadata !{i32 786445, metadata !236, metadata !"class_name_len", metadata !191, i32 177, i64 32, i64 32, i64 192, i32 0, metadata !208} ; [ DW_TAG_member ]
!242 = metadata !{i32 786445, metadata !236, metadata !"array_type_hint", metadata !191, i32 178, i64 8, i64 8, i64 224, i32 0, metadata !103} ; [ DW_TAG_member ]
!243 = metadata !{i32 786445, metadata !236, metadata !"allow_null", metadata !191, i32 179, i64 8, i64 8, i64 232, i32 0, metadata !103} ; [ DW_TAG_member ]
!244 = metadata !{i32 786445, metadata !236, metadata !"pass_by_reference", metadata !191, i32 180, i64 8, i64 8, i64 240, i32 0, metadata !103} ; [ DW_TAG_member ]
!245 = metadata !{i32 786445, metadata !236, metadata !"return_reference", metadata !191, i32 181, i64 8, i64 8, i64 248, i32 0, metadata !103} ; [ DW_TAG_member ]
!246 = metadata !{i32 786445, metadata !236, metadata !"required_num_args", metadata !191, i32 182, i64 32, i64 32, i64 256, i32 0, metadata !60} ; [ DW_TAG_member ]
!247 = metadata !{i32 786445, metadata !223, metadata !"num_args", metadata !224, i32 39, i64 32, i64 32, i64 192, i32 0, metadata !208} ; [ DW_TAG_member ]
!248 = metadata !{i32 786445, metadata !223, metadata !"flags", metadata !224, i32 40, i64 32, i64 32, i64 224, i32 0, metadata !208} ; [ DW_TAG_member ]
!249 = metadata !{i32 786445, metadata !203, metadata !"constructor", metadata !43, i32 435, i64 64, i64 64, i64 3392, i32 0, metadata !189} ; [ DW_TAG_member ]
!250 = metadata !{i32 786445, metadata !203, metadata !"destructor", metadata !43, i32 436, i64 64, i64 64, i64 3456, i32 0, metadata !189} ; [ DW_TAG_member ]
!251 = metadata !{i32 786445, metadata !203, metadata !"clone", metadata !43, i32 437, i64 64, i64 64, i64 3520, i32 0, metadata !189} ; [ DW_TAG_member ]
!252 = metadata !{i32 786445, metadata !203, metadata !"__get", metadata !43, i32 438, i64 64, i64 64, i64 3584, i32 0, metadata !189} ; [ DW_TAG_member ]
!253 = metadata !{i32 786445, metadata !203, metadata !"__set", metadata !43, i32 439, i64 64, i64 64, i64 3648, i32 0, metadata !189} ; [ DW_TAG_member ]
!254 = metadata !{i32 786445, metadata !203, metadata !"__unset", metadata !43, i32 440, i64 64, i64 64, i64 3712, i32 0, metadata !189} ; [ DW_TAG_member ]
!255 = metadata !{i32 786445, metadata !203, metadata !"__isset", metadata !43, i32 441, i64 64, i64 64, i64 3776, i32 0, metadata !189} ; [ DW_TAG_member ]
!256 = metadata !{i32 786445, metadata !203, metadata !"__call", metadata !43, i32 442, i64 64, i64 64, i64 3840, i32 0, metadata !189} ; [ DW_TAG_member ]
!257 = metadata !{i32 786445, metadata !203, metadata !"__callstatic", metadata !43, i32 443, i64 64, i64 64, i64 3904, i32 0, metadata !189} ; [ DW_TAG_member ]
!258 = metadata !{i32 786445, metadata !203, metadata !"__tostring", metadata !43, i32 444, i64 64, i64 64, i64 3968, i32 0, metadata !189} ; [ DW_TAG_member ]
!259 = metadata !{i32 786445, metadata !203, metadata !"serialize_func", metadata !43, i32 445, i64 64, i64 64, i64 4032, i32 0, metadata !189} ; [ DW_TAG_member ]
!260 = metadata !{i32 786445, metadata !203, metadata !"unserialize_func", metadata !43, i32 446, i64 64, i64 64, i64 4096, i32 0, metadata !189} ; [ DW_TAG_member ]
!261 = metadata !{i32 786445, metadata !203, metadata !"iterator_funcs", metadata !43, i32 448, i64 448, i64 64, i64 4160, i32 0, metadata !262} ; [ DW_TAG_member ]
!262 = metadata !{i32 786454, null, metadata !"zend_class_iterator_funcs", metadata !43, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !263} ; [ DW_TAG_typedef ]
!263 = metadata !{i32 786451, null, metadata !"_zend_class_iterator_funcs", metadata !264, i32 60, i64 448, i64 64, i32 0, i32 0, null, metadata !265, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!264 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_iterators.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!265 = metadata !{metadata !266, metadata !301, metadata !302, metadata !303, metadata !304, metadata !305, metadata !306}
!266 = metadata !{i32 786445, metadata !263, metadata !"funcs", metadata !264, i32 61, i64 64, i64 64, i64 0, i32 0, metadata !267} ; [ DW_TAG_member ]
!267 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !268} ; [ DW_TAG_pointer_type ]
!268 = metadata !{i32 786454, null, metadata !"zend_object_iterator_funcs", metadata !264, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !269} ; [ DW_TAG_typedef ]
!269 = metadata !{i32 786451, null, metadata !"_zend_object_iterator_funcs", metadata !264, i32 31, i64 448, i64 64, i32 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!270 = metadata !{metadata !271, metadata !282, metadata !286, metadata !291, metadata !298, metadata !299, metadata !300}
!271 = metadata !{i32 786445, metadata !269, metadata !"dtor", metadata !264, i32 33, i64 64, i64 64, i64 0, i32 0, metadata !272} ; [ DW_TAG_member ]
!272 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !273} ; [ DW_TAG_pointer_type ]
!273 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !274, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!274 = metadata !{null, metadata !275}
!275 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !276} ; [ DW_TAG_pointer_type ]
!276 = metadata !{i32 786454, null, metadata !"zend_object_iterator", metadata !264, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !277} ; [ DW_TAG_typedef ]
!277 = metadata !{i32 786451, null, metadata !"_zend_object_iterator", metadata !264, i32 54, i64 192, i64 64, i32 0, i32 0, null, metadata !278, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!278 = metadata !{metadata !279, metadata !280, metadata !281}
!279 = metadata !{i32 786445, metadata !277, metadata !"data", metadata !264, i32 55, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ]
!280 = metadata !{i32 786445, metadata !277, metadata !"funcs", metadata !264, i32 56, i64 64, i64 64, i64 64, i32 0, metadata !267} ; [ DW_TAG_member ]
!281 = metadata !{i32 786445, metadata !277, metadata !"index", metadata !264, i32 57, i64 64, i64 64, i64 128, i32 0, metadata !73} ; [ DW_TAG_member ]
!282 = metadata !{i32 786445, metadata !269, metadata !"valid", metadata !264, i32 36, i64 64, i64 64, i64 64, i32 0, metadata !283} ; [ DW_TAG_member ]
!283 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !284} ; [ DW_TAG_pointer_type ]
!284 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !285, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!285 = metadata !{metadata !60, metadata !275}
!286 = metadata !{i32 786445, metadata !269, metadata !"get_current_data", metadata !264, i32 39, i64 64, i64 64, i64 128, i32 0, metadata !287} ; [ DW_TAG_member ]
!287 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !288} ; [ DW_TAG_pointer_type ]
!288 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !289, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!289 = metadata !{null, metadata !275, metadata !290}
!290 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !154} ; [ DW_TAG_pointer_type ]
!291 = metadata !{i32 786445, metadata !269, metadata !"get_current_key", metadata !264, i32 42, i64 64, i64 64, i64 192, i32 0, metadata !292} ; [ DW_TAG_member ]
!292 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !293} ; [ DW_TAG_pointer_type ]
!293 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !294, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!294 = metadata !{metadata !60, metadata !275, metadata !295, metadata !296, metadata !297}
!295 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!296 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !68} ; [ DW_TAG_pointer_type ]
!297 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !73} ; [ DW_TAG_pointer_type ]
!298 = metadata !{i32 786445, metadata !269, metadata !"move_forward", metadata !264, i32 45, i64 64, i64 64, i64 256, i32 0, metadata !272} ; [ DW_TAG_member ]
!299 = metadata !{i32 786445, metadata !269, metadata !"rewind", metadata !264, i32 48, i64 64, i64 64, i64 320, i32 0, metadata !272} ; [ DW_TAG_member ]
!300 = metadata !{i32 786445, metadata !269, metadata !"invalidate_current", metadata !264, i32 51, i64 64, i64 64, i64 384, i32 0, metadata !272} ; [ DW_TAG_member ]
!301 = metadata !{i32 786445, metadata !263, metadata !"zf_new_iterator", metadata !264, i32 62, i64 64, i64 64, i64 64, i32 0, metadata !189} ; [ DW_TAG_member ]
!302 = metadata !{i32 786445, metadata !263, metadata !"zf_valid", metadata !264, i32 63, i64 64, i64 64, i64 128, i32 0, metadata !189} ; [ DW_TAG_member ]
!303 = metadata !{i32 786445, metadata !263, metadata !"zf_current", metadata !264, i32 64, i64 64, i64 64, i64 192, i32 0, metadata !189} ; [ DW_TAG_member ]
!304 = metadata !{i32 786445, metadata !263, metadata !"zf_key", metadata !264, i32 65, i64 64, i64 64, i64 256, i32 0, metadata !189} ; [ DW_TAG_member ]
!305 = metadata !{i32 786445, metadata !263, metadata !"zf_next", metadata !264, i32 66, i64 64, i64 64, i64 320, i32 0, metadata !189} ; [ DW_TAG_member ]
!306 = metadata !{i32 786445, metadata !263, metadata !"zf_rewind", metadata !264, i32 67, i64 64, i64 64, i64 384, i32 0, metadata !189} ; [ DW_TAG_member ]
!307 = metadata !{i32 786445, metadata !203, metadata !"create_object", metadata !43, i32 451, i64 64, i64 64, i64 4608, i32 0, metadata !308} ; [ DW_TAG_member ]
!308 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !309} ; [ DW_TAG_pointer_type ]
!309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!310 = metadata !{metadata !134, metadata !311}
!311 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !312} ; [ DW_TAG_pointer_type ]
!312 = metadata !{i32 786454, null, metadata !"zend_class_entry", metadata !43, i32 287, i64 0, i64 0, i64 0, i32 0, metadata !203} ; [ DW_TAG_typedef ]
!313 = metadata !{i32 786445, metadata !203, metadata !"get_iterator", metadata !43, i32 452, i64 64, i64 64, i64 4672, i32 0, metadata !314} ; [ DW_TAG_member ]
!314 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !315} ; [ DW_TAG_pointer_type ]
!315 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !316, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!316 = metadata !{metadata !275, metadata !311, metadata !125, metadata !60}
!317 = metadata !{i32 786445, metadata !203, metadata !"interface_gets_implemented", metadata !43, i32 453, i64 64, i64 64, i64 4736, i32 0, metadata !318} ; [ DW_TAG_member ]
!318 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !319} ; [ DW_TAG_pointer_type ]
!319 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !320, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!320 = metadata !{metadata !60, metadata !311, metadata !311}
!321 = metadata !{i32 786445, metadata !203, metadata !"get_static_method", metadata !43, i32 454, i64 64, i64 64, i64 4800, i32 0, metadata !322} ; [ DW_TAG_member ]
!322 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !323} ; [ DW_TAG_pointer_type ]
!323 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !324, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!324 = metadata !{metadata !189, metadata !311, metadata !57, metadata !60}
!325 = metadata !{i32 786445, metadata !203, metadata !"serialize", metadata !43, i32 457, i64 64, i64 64, i64 4864, i32 0, metadata !326} ; [ DW_TAG_member ]
!326 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !327} ; [ DW_TAG_pointer_type ]
!327 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !328, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!328 = metadata !{metadata !60, metadata !125, metadata !329, metadata !331, metadata !332}
!329 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !330} ; [ DW_TAG_pointer_type ]
!330 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_pointer_type ]
!331 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !208} ; [ DW_TAG_pointer_type ]
!332 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !333} ; [ DW_TAG_pointer_type ]
!333 = metadata !{i32 786454, null, metadata !"zend_serialize_data", metadata !43, i32 415, i64 0, i64 0, i64 0, i32 0, metadata !334} ; [ DW_TAG_typedef ]
!334 = metadata !{i32 786451, null, metadata !"_zend_serialize_data", metadata !43, i32 412, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!335 = metadata !{i32 786445, metadata !203, metadata !"unserialize", metadata !43, i32 458, i64 64, i64 64, i64 4928, i32 0, metadata !336} ; [ DW_TAG_member ]
!336 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !337} ; [ DW_TAG_pointer_type ]
!337 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!338 = metadata !{metadata !60, metadata !154, metadata !311, metadata !339, metadata !208, metadata !341}
!339 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !340} ; [ DW_TAG_pointer_type ]
!340 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !104} ; [ DW_TAG_const_type ]
!341 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !342} ; [ DW_TAG_pointer_type ]
!342 = metadata !{i32 786454, null, metadata !"zend_unserialize_data", metadata !43, i32 416, i64 0, i64 0, i64 0, i32 0, metadata !343} ; [ DW_TAG_typedef ]
!343 = metadata !{i32 786451, null, metadata !"_zend_unserialize_data", metadata !43, i32 413, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!344 = metadata !{i32 786445, metadata !203, metadata !"interfaces", metadata !43, i32 460, i64 64, i64 64, i64 4992, i32 0, metadata !345} ; [ DW_TAG_member ]
!345 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !311} ; [ DW_TAG_pointer_type ]
!346 = metadata !{i32 786445, metadata !203, metadata !"num_interfaces", metadata !43, i32 461, i64 32, i64 32, i64 5056, i32 0, metadata !208} ; [ DW_TAG_member ]
!347 = metadata !{i32 786445, metadata !203, metadata !"filename", metadata !43, i32 463, i64 64, i64 64, i64 5120, i32 0, metadata !57} ; [ DW_TAG_member ]
!348 = metadata !{i32 786445, metadata !203, metadata !"line_start", metadata !43, i32 464, i64 32, i64 32, i64 5184, i32 0, metadata !208} ; [ DW_TAG_member ]
!349 = metadata !{i32 786445, metadata !203, metadata !"line_end", metadata !43, i32 465, i64 32, i64 32, i64 5216, i32 0, metadata !208} ; [ DW_TAG_member ]
!350 = metadata !{i32 786445, metadata !203, metadata !"doc_comment", metadata !43, i32 466, i64 64, i64 64, i64 5248, i32 0, metadata !57} ; [ DW_TAG_member ]
!351 = metadata !{i32 786445, metadata !203, metadata !"doc_comment_len", metadata !43, i32 467, i64 32, i64 32, i64 5312, i32 0, metadata !208} ; [ DW_TAG_member ]
!352 = metadata !{i32 786445, metadata !203, metadata !"module", metadata !43, i32 469, i64 64, i64 64, i64 5376, i32 0, metadata !353} ; [ DW_TAG_member ]
!353 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !354} ; [ DW_TAG_pointer_type ]
!354 = metadata !{i32 786451, null, metadata !"_zend_module_entry", metadata !355, i32 73, i64 1344, i64 64, i32 0, i32 0, null, metadata !356, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!355 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_modules.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!356 = metadata !{metadata !357, metadata !359, metadata !360, metadata !361, metadata !362, metadata !391, metadata !400, metadata !401, metadata !402, metadata !406, metadata !407, metadata !408, metadata !409, metadata !415, metadata !416, metadata !420, metadata !421, metadata !422, metadata !423, metadata !427, metadata !428, metadata !429, metadata !430, metadata !431}
!357 = metadata !{i32 786445, metadata !354, metadata !"size", metadata !355, i32 74, i64 16, i64 16, i64 0, i32 0, metadata !358} ; [ DW_TAG_member ]
!358 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!359 = metadata !{i32 786445, metadata !354, metadata !"zend_api", metadata !355, i32 75, i64 32, i64 32, i64 32, i32 0, metadata !69} ; [ DW_TAG_member ]
!360 = metadata !{i32 786445, metadata !354, metadata !"zend_debug", metadata !355, i32 76, i64 8, i64 8, i64 64, i32 0, metadata !104} ; [ DW_TAG_member ]
!361 = metadata !{i32 786445, metadata !354, metadata !"zts", metadata !355, i32 77, i64 8, i64 8, i64 72, i32 0, metadata !104} ; [ DW_TAG_member ]
!362 = metadata !{i32 786445, metadata !354, metadata !"ini_entry", metadata !355, i32 78, i64 64, i64 64, i64 128, i32 0, metadata !363} ; [ DW_TAG_member ]
!363 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !364} ; [ DW_TAG_pointer_type ]
!364 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !365} ; [ DW_TAG_const_type ]
!365 = metadata !{i32 786451, null, metadata !"_zend_ini_entry", metadata !366, i32 65, i64 832, i64 64, i32 0, i32 0, null, metadata !367, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!366 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_ini.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!367 = metadata !{metadata !368, metadata !369, metadata !370, metadata !371, metadata !372, metadata !378, metadata !379, metadata !380, metadata !381, metadata !382, metadata !383, metadata !384, metadata !385, metadata !386, metadata !387}
!368 = metadata !{i32 786445, metadata !365, metadata !"module_number", metadata !366, i32 66, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!369 = metadata !{i32 786445, metadata !365, metadata !"modifiable", metadata !366, i32 67, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!370 = metadata !{i32 786445, metadata !365, metadata !"name", metadata !366, i32 68, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!371 = metadata !{i32 786445, metadata !365, metadata !"name_length", metadata !366, i32 69, i64 32, i64 32, i64 128, i32 0, metadata !68} ; [ DW_TAG_member ]
!372 = metadata !{i32 786445, metadata !365, metadata !"on_modify", metadata !366, i32 70, i64 64, i64 64, i64 192, i32 0, metadata !373} ; [ DW_TAG_member ]
!373 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !374} ; [ DW_TAG_pointer_type ]
!374 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !375, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!375 = metadata !{metadata !60, metadata !376, metadata !57, metadata !68, metadata !82, metadata !82, metadata !82, metadata !60}
!376 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !377} ; [ DW_TAG_pointer_type ]
!377 = metadata !{i32 786454, null, metadata !"zend_ini_entry", metadata !366, i32 60, i64 0, i64 0, i64 0, i32 0, metadata !365} ; [ DW_TAG_typedef ]
!378 = metadata !{i32 786445, metadata !365, metadata !"mh_arg1", metadata !366, i32 71, i64 64, i64 64, i64 256, i32 0, metadata !82} ; [ DW_TAG_member ]
!379 = metadata !{i32 786445, metadata !365, metadata !"mh_arg2", metadata !366, i32 72, i64 64, i64 64, i64 320, i32 0, metadata !82} ; [ DW_TAG_member ]
!380 = metadata !{i32 786445, metadata !365, metadata !"mh_arg3", metadata !366, i32 73, i64 64, i64 64, i64 384, i32 0, metadata !82} ; [ DW_TAG_member ]
!381 = metadata !{i32 786445, metadata !365, metadata !"value", metadata !366, i32 75, i64 64, i64 64, i64 448, i32 0, metadata !57} ; [ DW_TAG_member ]
!382 = metadata !{i32 786445, metadata !365, metadata !"value_length", metadata !366, i32 76, i64 32, i64 32, i64 512, i32 0, metadata !68} ; [ DW_TAG_member ]
!383 = metadata !{i32 786445, metadata !365, metadata !"orig_value", metadata !366, i32 78, i64 64, i64 64, i64 576, i32 0, metadata !57} ; [ DW_TAG_member ]
!384 = metadata !{i32 786445, metadata !365, metadata !"orig_value_length", metadata !366, i32 79, i64 32, i64 32, i64 640, i32 0, metadata !68} ; [ DW_TAG_member ]
!385 = metadata !{i32 786445, metadata !365, metadata !"orig_modifiable", metadata !366, i32 80, i64 32, i64 32, i64 672, i32 0, metadata !60} ; [ DW_TAG_member ]
!386 = metadata !{i32 786445, metadata !365, metadata !"modified", metadata !366, i32 81, i64 32, i64 32, i64 704, i32 0, metadata !60} ; [ DW_TAG_member ]
!387 = metadata !{i32 786445, metadata !365, metadata !"displayer", metadata !366, i32 83, i64 64, i64 64, i64 768, i32 0, metadata !388} ; [ DW_TAG_member ]
!388 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !389} ; [ DW_TAG_pointer_type ]
!389 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !390, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!390 = metadata !{null, metadata !376, metadata !60}
!391 = metadata !{i32 786445, metadata !354, metadata !"deps", metadata !355, i32 79, i64 64, i64 64, i64 192, i32 0, metadata !392} ; [ DW_TAG_member ]
!392 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !393} ; [ DW_TAG_pointer_type ]
!393 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !394} ; [ DW_TAG_const_type ]
!394 = metadata !{i32 786451, null, metadata !"_zend_module_dep", metadata !355, i32 116, i64 256, i64 64, i32 0, i32 0, null, metadata !395, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!395 = metadata !{metadata !396, metadata !397, metadata !398, metadata !399}
!396 = metadata !{i32 786445, metadata !394, metadata !"name", metadata !355, i32 117, i64 64, i64 64, i64 0, i32 0, metadata !227} ; [ DW_TAG_member ]
!397 = metadata !{i32 786445, metadata !394, metadata !"rel", metadata !355, i32 118, i64 64, i64 64, i64 64, i32 0, metadata !227} ; [ DW_TAG_member ]
!398 = metadata !{i32 786445, metadata !394, metadata !"version", metadata !355, i32 119, i64 64, i64 64, i64 128, i32 0, metadata !227} ; [ DW_TAG_member ]
!399 = metadata !{i32 786445, metadata !394, metadata !"type", metadata !355, i32 120, i64 8, i64 8, i64 192, i32 0, metadata !104} ; [ DW_TAG_member ]
!400 = metadata !{i32 786445, metadata !354, metadata !"name", metadata !355, i32 80, i64 64, i64 64, i64 256, i32 0, metadata !227} ; [ DW_TAG_member ]
!401 = metadata !{i32 786445, metadata !354, metadata !"functions", metadata !355, i32 81, i64 64, i64 64, i64 320, i32 0, metadata !221} ; [ DW_TAG_member ]
!402 = metadata !{i32 786445, metadata !354, metadata !"module_startup_func", metadata !355, i32 82, i64 64, i64 64, i64 384, i32 0, metadata !403} ; [ DW_TAG_member ]
!403 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !404} ; [ DW_TAG_pointer_type ]
!404 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !405, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!405 = metadata !{metadata !60, metadata !60, metadata !60}
!406 = metadata !{i32 786445, metadata !354, metadata !"module_shutdown_func", metadata !355, i32 83, i64 64, i64 64, i64 448, i32 0, metadata !403} ; [ DW_TAG_member ]
!407 = metadata !{i32 786445, metadata !354, metadata !"request_startup_func", metadata !355, i32 84, i64 64, i64 64, i64 512, i32 0, metadata !403} ; [ DW_TAG_member ]
!408 = metadata !{i32 786445, metadata !354, metadata !"request_shutdown_func", metadata !355, i32 85, i64 64, i64 64, i64 576, i32 0, metadata !403} ; [ DW_TAG_member ]
!409 = metadata !{i32 786445, metadata !354, metadata !"info_func", metadata !355, i32 86, i64 64, i64 64, i64 640, i32 0, metadata !410} ; [ DW_TAG_member ]
!410 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !411} ; [ DW_TAG_pointer_type ]
!411 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !412, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!412 = metadata !{null, metadata !413}
!413 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !414} ; [ DW_TAG_pointer_type ]
!414 = metadata !{i32 786454, null, metadata !"zend_module_entry", metadata !355, i32 70, i64 0, i64 0, i64 0, i32 0, metadata !354} ; [ DW_TAG_typedef ]
!415 = metadata !{i32 786445, metadata !354, metadata !"version", metadata !355, i32 87, i64 64, i64 64, i64 704, i32 0, metadata !227} ; [ DW_TAG_member ]
!416 = metadata !{i32 786445, metadata !354, metadata !"globals_size", metadata !355, i32 88, i64 64, i64 64, i64 768, i32 0, metadata !417} ; [ DW_TAG_member ]
!417 = metadata !{i32 786454, null, metadata !"size_t", metadata !355, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !418} ; [ DW_TAG_typedef ]
!418 = metadata !{i32 786454, null, metadata !"__size_t", metadata !355, i32 82, i64 0, i64 0, i64 0, i32 0, metadata !419} ; [ DW_TAG_typedef ]
!419 = metadata !{i32 786454, null, metadata !"__uint64_t", metadata !355, i32 58, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ]
!420 = metadata !{i32 786445, metadata !354, metadata !"globals_ptr", metadata !355, i32 92, i64 64, i64 64, i64 832, i32 0, metadata !82} ; [ DW_TAG_member ]
!421 = metadata !{i32 786445, metadata !354, metadata !"globals_ctor", metadata !355, i32 94, i64 64, i64 64, i64 896, i32 0, metadata !99} ; [ DW_TAG_member ]
!422 = metadata !{i32 786445, metadata !354, metadata !"globals_dtor", metadata !355, i32 95, i64 64, i64 64, i64 960, i32 0, metadata !99} ; [ DW_TAG_member ]
!423 = metadata !{i32 786445, metadata !354, metadata !"post_deactivate_func", metadata !355, i32 96, i64 64, i64 64, i64 1024, i32 0, metadata !424} ; [ DW_TAG_member ]
!424 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !425} ; [ DW_TAG_pointer_type ]
!425 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !426, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!426 = metadata !{metadata !60}
!427 = metadata !{i32 786445, metadata !354, metadata !"module_started", metadata !355, i32 97, i64 32, i64 32, i64 1088, i32 0, metadata !60} ; [ DW_TAG_member ]
!428 = metadata !{i32 786445, metadata !354, metadata !"type", metadata !355, i32 98, i64 8, i64 8, i64 1120, i32 0, metadata !104} ; [ DW_TAG_member ]
!429 = metadata !{i32 786445, metadata !354, metadata !"handle", metadata !355, i32 99, i64 64, i64 64, i64 1152, i32 0, metadata !82} ; [ DW_TAG_member ]
!430 = metadata !{i32 786445, metadata !354, metadata !"module_number", metadata !355, i32 100, i64 32, i64 32, i64 1216, i32 0, metadata !60} ; [ DW_TAG_member ]
!431 = metadata !{i32 786445, metadata !354, metadata !"build_id", metadata !355, i32 101, i64 64, i64 64, i64 1280, i32 0, metadata !57} ; [ DW_TAG_member ]
!432 = metadata !{i32 786445, metadata !196, metadata !"fn_flags", metadata !191, i32 273, i64 32, i64 32, i64 192, i32 0, metadata !208} ; [ DW_TAG_member ]
!433 = metadata !{i32 786445, metadata !196, metadata !"prototype", metadata !191, i32 274, i64 64, i64 64, i64 256, i32 0, metadata !189} ; [ DW_TAG_member ]
!434 = metadata !{i32 786445, metadata !196, metadata !"num_args", metadata !191, i32 275, i64 32, i64 32, i64 320, i32 0, metadata !208} ; [ DW_TAG_member ]
!435 = metadata !{i32 786445, metadata !196, metadata !"required_num_args", metadata !191, i32 276, i64 32, i64 32, i64 352, i32 0, metadata !208} ; [ DW_TAG_member ]
!436 = metadata !{i32 786445, metadata !196, metadata !"arg_info", metadata !191, i32 277, i64 64, i64 64, i64 384, i32 0, metadata !437} ; [ DW_TAG_member ]
!437 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !438} ; [ DW_TAG_pointer_type ]
!438 = metadata !{i32 786454, null, metadata !"zend_arg_info", metadata !191, i32 183, i64 0, i64 0, i64 0, i32 0, metadata !236} ; [ DW_TAG_typedef ]
!439 = metadata !{i32 786445, metadata !196, metadata !"pass_rest_by_reference", metadata !191, i32 278, i64 8, i64 8, i64 448, i32 0, metadata !103} ; [ DW_TAG_member ]
!440 = metadata !{i32 786445, metadata !196, metadata !"return_reference", metadata !191, i32 279, i64 8, i64 8, i64 456, i32 0, metadata !104} ; [ DW_TAG_member ]
!441 = metadata !{i32 786445, metadata !190, metadata !"op_array", metadata !191, i32 282, i64 1856, i64 64, i64 0, i32 0, metadata !442} ; [ DW_TAG_member ]
!442 = metadata !{i32 786454, null, metadata !"zend_op_array", metadata !191, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !443} ; [ DW_TAG_typedef ]
!443 = metadata !{i32 786451, null, metadata !"_zend_op_array", metadata !191, i32 191, i64 1856, i64 64, i32 0, i32 0, null, metadata !444, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!444 = metadata !{metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453, metadata !454, metadata !455, metadata !456, metadata !457, metadata !556, metadata !557, metadata !558, metadata !566, metadata !567, metadata !568, metadata !569, metadata !578, metadata !579, metadata !580, metadata !587, metadata !588, metadata !589, metadata !590, metadata !591, metadata !592, metadata !593, metadata !594, metadata !595, metadata !596, metadata !597, metadata !598}
!445 = metadata !{i32 786445, metadata !443, metadata !"type", metadata !191, i32 193, i64 8, i64 8, i64 0, i32 0, metadata !194} ; [ DW_TAG_member ]
!446 = metadata !{i32 786445, metadata !443, metadata !"function_name", metadata !191, i32 194, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!447 = metadata !{i32 786445, metadata !443, metadata !"scope", metadata !191, i32 195, i64 64, i64 64, i64 128, i32 0, metadata !201} ; [ DW_TAG_member ]
!448 = metadata !{i32 786445, metadata !443, metadata !"fn_flags", metadata !191, i32 196, i64 32, i64 32, i64 192, i32 0, metadata !208} ; [ DW_TAG_member ]
!449 = metadata !{i32 786445, metadata !443, metadata !"prototype", metadata !191, i32 197, i64 64, i64 64, i64 256, i32 0, metadata !189} ; [ DW_TAG_member ]
!450 = metadata !{i32 786445, metadata !443, metadata !"num_args", metadata !191, i32 198, i64 32, i64 32, i64 320, i32 0, metadata !208} ; [ DW_TAG_member ]
!451 = metadata !{i32 786445, metadata !443, metadata !"required_num_args", metadata !191, i32 199, i64 32, i64 32, i64 352, i32 0, metadata !208} ; [ DW_TAG_member ]
!452 = metadata !{i32 786445, metadata !443, metadata !"arg_info", metadata !191, i32 200, i64 64, i64 64, i64 384, i32 0, metadata !437} ; [ DW_TAG_member ]
!453 = metadata !{i32 786445, metadata !443, metadata !"pass_rest_by_reference", metadata !191, i32 201, i64 8, i64 8, i64 448, i32 0, metadata !103} ; [ DW_TAG_member ]
!454 = metadata !{i32 786445, metadata !443, metadata !"return_reference", metadata !191, i32 202, i64 8, i64 8, i64 456, i32 0, metadata !104} ; [ DW_TAG_member ]
!455 = metadata !{i32 786445, metadata !443, metadata !"done_pass_two", metadata !191, i32 205, i64 8, i64 8, i64 464, i32 0, metadata !103} ; [ DW_TAG_member ]
!456 = metadata !{i32 786445, metadata !443, metadata !"refcount", metadata !191, i32 207, i64 64, i64 64, i64 512, i32 0, metadata !331} ; [ DW_TAG_member ]
!457 = metadata !{i32 786445, metadata !443, metadata !"opcodes", metadata !191, i32 209, i64 64, i64 64, i64 576, i32 0, metadata !458} ; [ DW_TAG_member ]
!458 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !459} ; [ DW_TAG_pointer_type ]
!459 = metadata !{i32 786454, null, metadata !"zend_op", metadata !191, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !460} ; [ DW_TAG_typedef ]
!460 = metadata !{i32 786451, null, metadata !"_zend_op", metadata !191, i32 81, i64 960, i64 64, i32 0, i32 0, null, metadata !461, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!461 = metadata !{metadata !462, metadata !533, metadata !551, metadata !552, metadata !553, metadata !554, metadata !555}
!462 = metadata !{i32 786445, metadata !460, metadata !"handler", metadata !191, i32 82, i64 64, i64 64, i64 0, i32 0, metadata !463} ; [ DW_TAG_member ]
!463 = metadata !{i32 786454, null, metadata !"opcode_handler_t", metadata !191, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !464} ; [ DW_TAG_typedef ]
!464 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !465} ; [ DW_TAG_pointer_type ]
!465 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !466, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!466 = metadata !{metadata !60, metadata !467}
!467 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !468} ; [ DW_TAG_pointer_type ]
!468 = metadata !{i32 786454, null, metadata !"zend_execute_data", metadata !191, i32 71, i64 0, i64 0, i64 0, i32 0, metadata !469} ; [ DW_TAG_typedef ]
!469 = metadata !{i32 786451, null, metadata !"_zend_execute_data", metadata !191, i32 308, i64 1216, i64 64, i32 0, i32 0, null, metadata !470, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!470 = metadata !{metadata !471, metadata !473, metadata !482, metadata !483, metadata !484, metadata !486, metadata !487, metadata !521, metadata !522, metadata !523, metadata !525, metadata !526, metadata !527, metadata !528, metadata !529, metadata !530, metadata !531, metadata !532}
!471 = metadata !{i32 786445, metadata !469, metadata !"opline", metadata !191, i32 309, i64 64, i64 64, i64 0, i32 0, metadata !472} ; [ DW_TAG_member ]
!472 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !460} ; [ DW_TAG_pointer_type ]
!473 = metadata !{i32 786445, metadata !469, metadata !"function_state", metadata !191, i32 310, i64 128, i64 64, i64 64, i32 0, metadata !474} ; [ DW_TAG_member ]
!474 = metadata !{i32 786454, null, metadata !"zend_function_state", metadata !191, i32 290, i64 0, i64 0, i64 0, i32 0, metadata !475} ; [ DW_TAG_typedef ]
!475 = metadata !{i32 786451, null, metadata !"_zend_function_state", metadata !191, i32 287, i64 128, i64 64, i32 0, i32 0, null, metadata !476, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!476 = metadata !{metadata !477, metadata !480}
!477 = metadata !{i32 786445, metadata !475, metadata !"function", metadata !191, i32 288, i64 64, i64 64, i64 0, i32 0, metadata !478} ; [ DW_TAG_member ]
!478 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_pointer_type ]
!479 = metadata !{i32 786454, null, metadata !"zend_function", metadata !191, i32 284, i64 0, i64 0, i64 0, i32 0, metadata !190} ; [ DW_TAG_typedef ]
!480 = metadata !{i32 786445, metadata !475, metadata !"arguments", metadata !191, i32 289, i64 64, i64 64, i64 64, i32 0, metadata !481} ; [ DW_TAG_member ]
!481 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_pointer_type ]
!482 = metadata !{i32 786445, metadata !469, metadata !"fbc", metadata !191, i32 311, i64 64, i64 64, i64 192, i32 0, metadata !478} ; [ DW_TAG_member ]
!483 = metadata !{i32 786445, metadata !469, metadata !"called_scope", metadata !191, i32 312, i64 64, i64 64, i64 256, i32 0, metadata !201} ; [ DW_TAG_member ]
!484 = metadata !{i32 786445, metadata !469, metadata !"op_array", metadata !191, i32 313, i64 64, i64 64, i64 320, i32 0, metadata !485} ; [ DW_TAG_member ]
!485 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !442} ; [ DW_TAG_pointer_type ]
!486 = metadata !{i32 786445, metadata !469, metadata !"object", metadata !191, i32 314, i64 64, i64 64, i64 384, i32 0, metadata !125} ; [ DW_TAG_member ]
!487 = metadata !{i32 786445, metadata !469, metadata !"Ts", metadata !191, i32 315, i64 64, i64 64, i64 448, i32 0, metadata !488} ; [ DW_TAG_member ]
!488 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !489} ; [ DW_TAG_pointer_type ]
!489 = metadata !{i32 786455, null, metadata !"_temp_variable", metadata !490, i32 30, i64 320, i64 64, i64 0, i32 0, null, metadata !491, i32 0, i32 0} ; [ DW_TAG_union_type ]
!490 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_execute.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!491 = metadata !{metadata !492, metadata !493, metadata !499, metadata !507, metadata !520}
!492 = metadata !{i32 786445, metadata !489, metadata !"tmp_var", metadata !490, i32 31, i64 192, i64 64, i64 0, i32 0, metadata !126} ; [ DW_TAG_member ]
!493 = metadata !{i32 786445, metadata !489, metadata !"var", metadata !490, i32 36, i64 192, i64 64, i64 0, i32 0, metadata !494} ; [ DW_TAG_member ]
!494 = metadata !{i32 786451, metadata !489, metadata !"", metadata !490, i32 32, i64 192, i64 64, i32 0, i32 0, null, metadata !495, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!495 = metadata !{metadata !496, metadata !497, metadata !498}
!496 = metadata !{i32 786445, metadata !494, metadata !"ptr_ptr", metadata !490, i32 33, i64 64, i64 64, i64 0, i32 0, metadata !154} ; [ DW_TAG_member ]
!497 = metadata !{i32 786445, metadata !494, metadata !"ptr", metadata !490, i32 34, i64 64, i64 64, i64 64, i32 0, metadata !125} ; [ DW_TAG_member ]
!498 = metadata !{i32 786445, metadata !494, metadata !"fcall_returned_reference", metadata !490, i32 35, i64 8, i64 8, i64 128, i32 0, metadata !103} ; [ DW_TAG_member ]
!499 = metadata !{i32 786445, metadata !489, metadata !"str_offset", metadata !490, i32 43, i64 320, i64 64, i64 0, i32 0, metadata !500} ; [ DW_TAG_member ]
!500 = metadata !{i32 786451, metadata !489, metadata !"", metadata !490, i32 37, i64 320, i64 64, i32 0, i32 0, null, metadata !501, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!501 = metadata !{metadata !502, metadata !503, metadata !504, metadata !505, metadata !506}
!502 = metadata !{i32 786445, metadata !500, metadata !"ptr_ptr", metadata !490, i32 38, i64 64, i64 64, i64 0, i32 0, metadata !154} ; [ DW_TAG_member ]
!503 = metadata !{i32 786445, metadata !500, metadata !"ptr", metadata !490, i32 39, i64 64, i64 64, i64 64, i32 0, metadata !125} ; [ DW_TAG_member ]
!504 = metadata !{i32 786445, metadata !500, metadata !"fcall_returned_reference", metadata !490, i32 40, i64 8, i64 8, i64 128, i32 0, metadata !103} ; [ DW_TAG_member ]
!505 = metadata !{i32 786445, metadata !500, metadata !"str", metadata !490, i32 41, i64 64, i64 64, i64 192, i32 0, metadata !125} ; [ DW_TAG_member ]
!506 = metadata !{i32 786445, metadata !500, metadata !"offset", metadata !490, i32 42, i64 32, i64 32, i64 256, i32 0, metadata !208} ; [ DW_TAG_member ]
!507 = metadata !{i32 786445, metadata !489, metadata !"fe", metadata !490, i32 49, i64 320, i64 64, i64 0, i32 0, metadata !508} ; [ DW_TAG_member ]
!508 = metadata !{i32 786451, metadata !489, metadata !"", metadata !490, i32 44, i64 320, i64 64, i32 0, i32 0, null, metadata !509, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!509 = metadata !{metadata !510, metadata !511, metadata !512, metadata !513}
!510 = metadata !{i32 786445, metadata !508, metadata !"ptr_ptr", metadata !490, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !154} ; [ DW_TAG_member ]
!511 = metadata !{i32 786445, metadata !508, metadata !"ptr", metadata !490, i32 46, i64 64, i64 64, i64 64, i32 0, metadata !125} ; [ DW_TAG_member ]
!512 = metadata !{i32 786445, metadata !508, metadata !"fcall_returned_reference", metadata !490, i32 47, i64 8, i64 8, i64 128, i32 0, metadata !103} ; [ DW_TAG_member ]
!513 = metadata !{i32 786445, metadata !508, metadata !"fe_pos", metadata !490, i32 48, i64 128, i64 64, i64 192, i32 0, metadata !514} ; [ DW_TAG_member ]
!514 = metadata !{i32 786454, null, metadata !"HashPointer", metadata !490, i32 189, i64 0, i64 0, i64 0, i32 0, metadata !515} ; [ DW_TAG_typedef ]
!515 = metadata !{i32 786451, null, metadata !"_HashPointer", metadata !65, i32 186, i64 128, i64 64, i32 0, i32 0, null, metadata !516, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!516 = metadata !{metadata !517, metadata !519}
!517 = metadata !{i32 786445, metadata !515, metadata !"pos", metadata !65, i32 187, i64 64, i64 64, i64 0, i32 0, metadata !518} ; [ DW_TAG_member ]
!518 = metadata !{i32 786454, null, metadata !"HashPosition", metadata !65, i32 94, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!519 = metadata !{i32 786445, metadata !515, metadata !"h", metadata !65, i32 188, i64 64, i64 64, i64 64, i32 0, metadata !73} ; [ DW_TAG_member ]
!520 = metadata !{i32 786445, metadata !489, metadata !"class_entry", metadata !490, i32 50, i64 64, i64 64, i64 0, i32 0, metadata !201} ; [ DW_TAG_member ]
!521 = metadata !{i32 786445, metadata !469, metadata !"CVs", metadata !191, i32 316, i64 64, i64 64, i64 512, i32 0, metadata !290} ; [ DW_TAG_member ]
!522 = metadata !{i32 786445, metadata !469, metadata !"symbol_table", metadata !191, i32 317, i64 64, i64 64, i64 576, i32 0, metadata !62} ; [ DW_TAG_member ]
!523 = metadata !{i32 786445, metadata !469, metadata !"prev_execute_data", metadata !191, i32 318, i64 64, i64 64, i64 640, i32 0, metadata !524} ; [ DW_TAG_member ]
!524 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !469} ; [ DW_TAG_pointer_type ]
!525 = metadata !{i32 786445, metadata !469, metadata !"old_error_reporting", metadata !191, i32 319, i64 64, i64 64, i64 704, i32 0, metadata !125} ; [ DW_TAG_member ]
!526 = metadata !{i32 786445, metadata !469, metadata !"nested", metadata !191, i32 320, i64 8, i64 8, i64 768, i32 0, metadata !103} ; [ DW_TAG_member ]
!527 = metadata !{i32 786445, metadata !469, metadata !"original_return_value", metadata !191, i32 321, i64 64, i64 64, i64 832, i32 0, metadata !154} ; [ DW_TAG_member ]
!528 = metadata !{i32 786445, metadata !469, metadata !"current_scope", metadata !191, i32 322, i64 64, i64 64, i64 896, i32 0, metadata !201} ; [ DW_TAG_member ]
!529 = metadata !{i32 786445, metadata !469, metadata !"current_called_scope", metadata !191, i32 323, i64 64, i64 64, i64 960, i32 0, metadata !201} ; [ DW_TAG_member ]
!530 = metadata !{i32 786445, metadata !469, metadata !"current_this", metadata !191, i32 324, i64 64, i64 64, i64 1024, i32 0, metadata !125} ; [ DW_TAG_member ]
!531 = metadata !{i32 786445, metadata !469, metadata !"current_object", metadata !191, i32 325, i64 64, i64 64, i64 1088, i32 0, metadata !125} ; [ DW_TAG_member ]
!532 = metadata !{i32 786445, metadata !469, metadata !"call_opline", metadata !191, i32 326, i64 64, i64 64, i64 1152, i32 0, metadata !472} ; [ DW_TAG_member ]
!533 = metadata !{i32 786445, metadata !460, metadata !"result", metadata !191, i32 83, i64 256, i64 64, i64 64, i32 0, metadata !534} ; [ DW_TAG_member ]
!534 = metadata !{i32 786454, null, metadata !"znode", metadata !191, i32 69, i64 0, i64 0, i64 0, i32 0, metadata !535} ; [ DW_TAG_typedef ]
!535 = metadata !{i32 786451, null, metadata !"_znode", metadata !191, i32 55, i64 256, i64 64, i32 0, i32 0, null, metadata !536, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!536 = metadata !{metadata !537, metadata !538}
!537 = metadata !{i32 786445, metadata !535, metadata !"op_type", metadata !191, i32 56, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!538 = metadata !{i32 786445, metadata !535, metadata !"u", metadata !191, i32 68, i64 192, i64 64, i64 64, i32 0, metadata !539} ; [ DW_TAG_member ]
!539 = metadata !{i32 786455, metadata !535, metadata !"", metadata !191, i32 57, i64 192, i64 64, i64 0, i32 0, null, metadata !540, i32 0, i32 0} ; [ DW_TAG_union_type ]
!540 = metadata !{metadata !541, metadata !542, metadata !543, metadata !544, metadata !545, metadata !546}
!541 = metadata !{i32 786445, metadata !539, metadata !"constant", metadata !191, i32 58, i64 192, i64 64, i64 0, i32 0, metadata !126} ; [ DW_TAG_member ]
!542 = metadata !{i32 786445, metadata !539, metadata !"var", metadata !191, i32 60, i64 32, i64 32, i64 0, i32 0, metadata !208} ; [ DW_TAG_member ]
!543 = metadata !{i32 786445, metadata !539, metadata !"opline_num", metadata !191, i32 61, i64 32, i64 32, i64 0, i32 0, metadata !208} ; [ DW_TAG_member ]
!544 = metadata !{i32 786445, metadata !539, metadata !"op_array", metadata !191, i32 62, i64 64, i64 64, i64 0, i32 0, metadata !485} ; [ DW_TAG_member ]
!545 = metadata !{i32 786445, metadata !539, metadata !"jmp_addr", metadata !191, i32 63, i64 64, i64 64, i64 0, i32 0, metadata !458} ; [ DW_TAG_member ]
!546 = metadata !{i32 786445, metadata !539, metadata !"EA", metadata !191, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !547} ; [ DW_TAG_member ]
!547 = metadata !{i32 786451, metadata !539, metadata !"", metadata !191, i32 64, i64 64, i64 32, i32 0, i32 0, null, metadata !548, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!548 = metadata !{metadata !549, metadata !550}
!549 = metadata !{i32 786445, metadata !547, metadata !"var", metadata !191, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !208} ; [ DW_TAG_member ]
!550 = metadata !{i32 786445, metadata !547, metadata !"type", metadata !191, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !208} ; [ DW_TAG_member ]
!551 = metadata !{i32 786445, metadata !460, metadata !"op1", metadata !191, i32 84, i64 256, i64 64, i64 320, i32 0, metadata !534} ; [ DW_TAG_member ]
!552 = metadata !{i32 786445, metadata !460, metadata !"op2", metadata !191, i32 85, i64 256, i64 64, i64 576, i32 0, metadata !534} ; [ DW_TAG_member ]
!553 = metadata !{i32 786445, metadata !460, metadata !"extended_value", metadata !191, i32 86, i64 64, i64 64, i64 832, i32 0, metadata !73} ; [ DW_TAG_member ]
!554 = metadata !{i32 786445, metadata !460, metadata !"lineno", metadata !191, i32 87, i64 32, i64 32, i64 896, i32 0, metadata !68} ; [ DW_TAG_member ]
!555 = metadata !{i32 786445, metadata !460, metadata !"opcode", metadata !191, i32 88, i64 8, i64 8, i64 928, i32 0, metadata !194} ; [ DW_TAG_member ]
!556 = metadata !{i32 786445, metadata !443, metadata !"last", metadata !191, i32 210, i64 32, i64 32, i64 640, i32 0, metadata !208} ; [ DW_TAG_member ]
!557 = metadata !{i32 786445, metadata !443, metadata !"size", metadata !191, i32 210, i64 32, i64 32, i64 672, i32 0, metadata !208} ; [ DW_TAG_member ]
!558 = metadata !{i32 786445, metadata !443, metadata !"vars", metadata !191, i32 212, i64 64, i64 64, i64 704, i32 0, metadata !559} ; [ DW_TAG_member ]
!559 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !560} ; [ DW_TAG_pointer_type ]
!560 = metadata !{i32 786454, null, metadata !"zend_compiled_variable", metadata !191, i32 189, i64 0, i64 0, i64 0, i32 0, metadata !561} ; [ DW_TAG_typedef ]
!561 = metadata !{i32 786451, null, metadata !"_zend_compiled_variable", metadata !191, i32 185, i64 192, i64 64, i32 0, i32 0, null, metadata !562, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!562 = metadata !{metadata !563, metadata !564, metadata !565}
!563 = metadata !{i32 786445, metadata !561, metadata !"name", metadata !191, i32 186, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!564 = metadata !{i32 786445, metadata !561, metadata !"name_len", metadata !191, i32 187, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!565 = metadata !{i32 786445, metadata !561, metadata !"hash_value", metadata !191, i32 188, i64 64, i64 64, i64 128, i32 0, metadata !73} ; [ DW_TAG_member ]
!566 = metadata !{i32 786445, metadata !443, metadata !"last_var", metadata !191, i32 213, i64 32, i64 32, i64 768, i32 0, metadata !60} ; [ DW_TAG_member ]
!567 = metadata !{i32 786445, metadata !443, metadata !"size_var", metadata !191, i32 213, i64 32, i64 32, i64 800, i32 0, metadata !60} ; [ DW_TAG_member ]
!568 = metadata !{i32 786445, metadata !443, metadata !"T", metadata !191, i32 215, i64 32, i64 32, i64 832, i32 0, metadata !208} ; [ DW_TAG_member ]
!569 = metadata !{i32 786445, metadata !443, metadata !"brk_cont_array", metadata !191, i32 217, i64 64, i64 64, i64 896, i32 0, metadata !570} ; [ DW_TAG_member ]
!570 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !571} ; [ DW_TAG_pointer_type ]
!571 = metadata !{i32 786454, null, metadata !"zend_brk_cont_element", metadata !191, i32 97, i64 0, i64 0, i64 0, i32 0, metadata !572} ; [ DW_TAG_typedef ]
!572 = metadata !{i32 786451, null, metadata !"_zend_brk_cont_element", metadata !191, i32 92, i64 128, i64 32, i32 0, i32 0, null, metadata !573, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!573 = metadata !{metadata !574, metadata !575, metadata !576, metadata !577}
!574 = metadata !{i32 786445, metadata !572, metadata !"start", metadata !191, i32 93, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!575 = metadata !{i32 786445, metadata !572, metadata !"cont", metadata !191, i32 94, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!576 = metadata !{i32 786445, metadata !572, metadata !"brk", metadata !191, i32 95, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!577 = metadata !{i32 786445, metadata !572, metadata !"parent", metadata !191, i32 96, i64 32, i64 32, i64 96, i32 0, metadata !60} ; [ DW_TAG_member ]
!578 = metadata !{i32 786445, metadata !443, metadata !"last_brk_cont", metadata !191, i32 218, i64 32, i64 32, i64 960, i32 0, metadata !60} ; [ DW_TAG_member ]
!579 = metadata !{i32 786445, metadata !443, metadata !"current_brk_cont", metadata !191, i32 219, i64 32, i64 32, i64 992, i32 0, metadata !60} ; [ DW_TAG_member ]
!580 = metadata !{i32 786445, metadata !443, metadata !"try_catch_array", metadata !191, i32 221, i64 64, i64 64, i64 1024, i32 0, metadata !581} ; [ DW_TAG_member ]
!581 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !582} ; [ DW_TAG_pointer_type ]
!582 = metadata !{i32 786454, null, metadata !"zend_try_catch_element", metadata !191, i32 107, i64 0, i64 0, i64 0, i32 0, metadata !583} ; [ DW_TAG_typedef ]
!583 = metadata !{i32 786451, null, metadata !"_zend_try_catch_element", metadata !191, i32 104, i64 64, i64 32, i32 0, i32 0, null, metadata !584, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!584 = metadata !{metadata !585, metadata !586}
!585 = metadata !{i32 786445, metadata !583, metadata !"try_op", metadata !191, i32 105, i64 32, i64 32, i64 0, i32 0, metadata !208} ; [ DW_TAG_member ]
!586 = metadata !{i32 786445, metadata !583, metadata !"catch_op", metadata !191, i32 106, i64 32, i64 32, i64 32, i32 0, metadata !208} ; [ DW_TAG_member ]
!587 = metadata !{i32 786445, metadata !443, metadata !"last_try_catch", metadata !191, i32 222, i64 32, i64 32, i64 1088, i32 0, metadata !60} ; [ DW_TAG_member ]
!588 = metadata !{i32 786445, metadata !443, metadata !"static_variables", metadata !191, i32 225, i64 64, i64 64, i64 1152, i32 0, metadata !62} ; [ DW_TAG_member ]
!589 = metadata !{i32 786445, metadata !443, metadata !"start_op", metadata !191, i32 227, i64 64, i64 64, i64 1216, i32 0, metadata !458} ; [ DW_TAG_member ]
!590 = metadata !{i32 786445, metadata !443, metadata !"backpatch_count", metadata !191, i32 228, i64 32, i64 32, i64 1280, i32 0, metadata !60} ; [ DW_TAG_member ]
!591 = metadata !{i32 786445, metadata !443, metadata !"this_var", metadata !191, i32 230, i64 32, i64 32, i64 1312, i32 0, metadata !208} ; [ DW_TAG_member ]
!592 = metadata !{i32 786445, metadata !443, metadata !"filename", metadata !191, i32 232, i64 64, i64 64, i64 1344, i32 0, metadata !57} ; [ DW_TAG_member ]
!593 = metadata !{i32 786445, metadata !443, metadata !"line_start", metadata !191, i32 233, i64 32, i64 32, i64 1408, i32 0, metadata !208} ; [ DW_TAG_member ]
!594 = metadata !{i32 786445, metadata !443, metadata !"line_end", metadata !191, i32 234, i64 32, i64 32, i64 1440, i32 0, metadata !208} ; [ DW_TAG_member ]
!595 = metadata !{i32 786445, metadata !443, metadata !"doc_comment", metadata !191, i32 235, i64 64, i64 64, i64 1472, i32 0, metadata !57} ; [ DW_TAG_member ]
!596 = metadata !{i32 786445, metadata !443, metadata !"doc_comment_len", metadata !191, i32 236, i64 32, i64 32, i64 1536, i32 0, metadata !208} ; [ DW_TAG_member ]
!597 = metadata !{i32 786445, metadata !443, metadata !"early_binding", metadata !191, i32 237, i64 32, i64 32, i64 1568, i32 0, metadata !208} ; [ DW_TAG_member ]
!598 = metadata !{i32 786445, metadata !443, metadata !"reserved", metadata !191, i32 239, i64 256, i64 64, i64 1600, i32 0, metadata !599} ; [ DW_TAG_member ]
!599 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 256, i64 64, i32 0, i32 0, metadata !82, metadata !600, i32 0, i32 0} ; [ DW_TAG_array_type ]
!600 = metadata !{metadata !601}
!601 = metadata !{i32 786465, i64 0, i64 3}       ; [ DW_TAG_subrange_type ]
!602 = metadata !{i32 786445, metadata !190, metadata !"internal_function", metadata !191, i32 283, i64 640, i64 64, i64 0, i32 0, metadata !603} ; [ DW_TAG_member ]
!603 = metadata !{i32 786454, null, metadata !"zend_internal_function", metadata !191, i32 262, i64 0, i64 0, i64 0, i32 0, metadata !604} ; [ DW_TAG_typedef ]
!604 = metadata !{i32 786451, null, metadata !"_zend_internal_function", metadata !191, i32 246, i64 640, i64 64, i32 0, i32 0, null, metadata !605, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!605 = metadata !{metadata !606, metadata !607, metadata !608, metadata !609, metadata !610, metadata !611, metadata !612, metadata !613, metadata !614, metadata !615, metadata !616, metadata !617}
!606 = metadata !{i32 786445, metadata !604, metadata !"type", metadata !191, i32 248, i64 8, i64 8, i64 0, i32 0, metadata !194} ; [ DW_TAG_member ]
!607 = metadata !{i32 786445, metadata !604, metadata !"function_name", metadata !191, i32 249, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!608 = metadata !{i32 786445, metadata !604, metadata !"scope", metadata !191, i32 250, i64 64, i64 64, i64 128, i32 0, metadata !201} ; [ DW_TAG_member ]
!609 = metadata !{i32 786445, metadata !604, metadata !"fn_flags", metadata !191, i32 251, i64 32, i64 32, i64 192, i32 0, metadata !208} ; [ DW_TAG_member ]
!610 = metadata !{i32 786445, metadata !604, metadata !"prototype", metadata !191, i32 252, i64 64, i64 64, i64 256, i32 0, metadata !189} ; [ DW_TAG_member ]
!611 = metadata !{i32 786445, metadata !604, metadata !"num_args", metadata !191, i32 253, i64 32, i64 32, i64 320, i32 0, metadata !208} ; [ DW_TAG_member ]
!612 = metadata !{i32 786445, metadata !604, metadata !"required_num_args", metadata !191, i32 254, i64 32, i64 32, i64 352, i32 0, metadata !208} ; [ DW_TAG_member ]
!613 = metadata !{i32 786445, metadata !604, metadata !"arg_info", metadata !191, i32 255, i64 64, i64 64, i64 384, i32 0, metadata !437} ; [ DW_TAG_member ]
!614 = metadata !{i32 786445, metadata !604, metadata !"pass_rest_by_reference", metadata !191, i32 256, i64 8, i64 8, i64 448, i32 0, metadata !103} ; [ DW_TAG_member ]
!615 = metadata !{i32 786445, metadata !604, metadata !"return_reference", metadata !191, i32 257, i64 8, i64 8, i64 456, i32 0, metadata !104} ; [ DW_TAG_member ]
!616 = metadata !{i32 786445, metadata !604, metadata !"handler", metadata !191, i32 260, i64 64, i64 64, i64 512, i32 0, metadata !230} ; [ DW_TAG_member ]
!617 = metadata !{i32 786445, metadata !604, metadata !"module", metadata !191, i32 261, i64 64, i64 64, i64 576, i32 0, metadata !353} ; [ DW_TAG_member ]
!618 = metadata !{i32 786445, metadata !117, metadata !"call_method", metadata !118, i32 132, i64 64, i64 64, i64 1024, i32 0, metadata !619} ; [ DW_TAG_member ]
!619 = metadata !{i32 786454, null, metadata !"zend_object_call_method_t", metadata !118, i32 89, i64 0, i64 0, i64 0, i32 0, metadata !620} ; [ DW_TAG_typedef ]
!620 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !621} ; [ DW_TAG_pointer_type ]
!621 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !622, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!622 = metadata !{metadata !60, metadata !57, metadata !60, metadata !125, metadata !154, metadata !125, metadata !60}
!623 = metadata !{i32 786445, metadata !117, metadata !"get_constructor", metadata !118, i32 133, i64 64, i64 64, i64 1088, i32 0, metadata !624} ; [ DW_TAG_member ]
!624 = metadata !{i32 786454, null, metadata !"zend_object_get_constructor_t", metadata !118, i32 91, i64 0, i64 0, i64 0, i32 0, metadata !625} ; [ DW_TAG_typedef ]
!625 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !626} ; [ DW_TAG_pointer_type ]
!626 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!627 = metadata !{metadata !189, metadata !125}
!628 = metadata !{i32 786445, metadata !117, metadata !"get_class_entry", metadata !118, i32 134, i64 64, i64 64, i64 1152, i32 0, metadata !629} ; [ DW_TAG_member ]
!629 = metadata !{i32 786454, null, metadata !"zend_object_get_class_entry_t", metadata !118, i32 99, i64 0, i64 0, i64 0, i32 0, metadata !630} ; [ DW_TAG_typedef ]
!630 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !631} ; [ DW_TAG_pointer_type ]
!631 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !632, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!632 = metadata !{metadata !201, metadata !633}
!633 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !634} ; [ DW_TAG_pointer_type ]
!634 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !126} ; [ DW_TAG_const_type ]
!635 = metadata !{i32 786445, metadata !117, metadata !"get_class_name", metadata !118, i32 135, i64 64, i64 64, i64 1216, i32 0, metadata !636} ; [ DW_TAG_member ]
!636 = metadata !{i32 786454, null, metadata !"zend_object_get_class_name_t", metadata !118, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !637} ; [ DW_TAG_typedef ]
!637 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !638} ; [ DW_TAG_pointer_type ]
!638 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !639, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!639 = metadata !{metadata !60, metadata !633, metadata !295, metadata !331, metadata !60}
!640 = metadata !{i32 786445, metadata !117, metadata !"compare_objects", metadata !118, i32 136, i64 64, i64 64, i64 1280, i32 0, metadata !641} ; [ DW_TAG_member ]
!641 = metadata !{i32 786454, null, metadata !"zend_object_compare_t", metadata !118, i32 101, i64 0, i64 0, i64 0, i32 0, metadata !642} ; [ DW_TAG_typedef ]
!642 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !643} ; [ DW_TAG_pointer_type ]
!643 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !644, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!644 = metadata !{metadata !60, metadata !125, metadata !125}
!645 = metadata !{i32 786445, metadata !117, metadata !"cast_object", metadata !118, i32 137, i64 64, i64 64, i64 1344, i32 0, metadata !646} ; [ DW_TAG_member ]
!646 = metadata !{i32 786454, null, metadata !"zend_object_cast_t", metadata !118, i32 105, i64 0, i64 0, i64 0, i32 0, metadata !167} ; [ DW_TAG_typedef ]
!647 = metadata !{i32 786445, metadata !117, metadata !"count_elements", metadata !118, i32 138, i64 64, i64 64, i64 1408, i32 0, metadata !648} ; [ DW_TAG_member ]
!648 = metadata !{i32 786454, null, metadata !"zend_object_count_elements_t", metadata !118, i32 109, i64 0, i64 0, i64 0, i32 0, metadata !649} ; [ DW_TAG_typedef ]
!649 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !650} ; [ DW_TAG_pointer_type ]
!650 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !651, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!651 = metadata !{metadata !60, metadata !125, metadata !652}
!652 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_pointer_type ]
!653 = metadata !{i32 786445, metadata !117, metadata !"get_debug_info", metadata !118, i32 139, i64 64, i64 64, i64 1472, i32 0, metadata !654} ; [ DW_TAG_member ]
!654 = metadata !{i32 786454, null, metadata !"zend_object_get_debug_info_t", metadata !118, i32 83, i64 0, i64 0, i64 0, i32 0, metadata !655} ; [ DW_TAG_typedef ]
!655 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !656} ; [ DW_TAG_pointer_type ]
!656 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !657, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!657 = metadata !{metadata !62, metadata !125, metadata !658}
!658 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!659 = metadata !{i32 786445, metadata !117, metadata !"get_closure", metadata !118, i32 140, i64 64, i64 64, i64 1536, i32 0, metadata !660} ; [ DW_TAG_member ]
!660 = metadata !{i32 786454, null, metadata !"zend_object_get_closure_t", metadata !118, i32 111, i64 0, i64 0, i64 0, i32 0, metadata !661} ; [ DW_TAG_typedef ]
!661 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !662} ; [ DW_TAG_pointer_type ]
!662 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !663, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!663 = metadata !{metadata !60, metadata !125, metadata !345, metadata !664, metadata !154}
!664 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !189} ; [ DW_TAG_pointer_type ]
!665 = metadata !{i32 786445, metadata !42, metadata !"refcount__gc", metadata !43, i32 319, i64 32, i64 32, i64 128, i32 0, metadata !208} ; [ DW_TAG_member ]
!666 = metadata !{i32 786445, metadata !42, metadata !"type", metadata !43, i32 320, i64 8, i64 8, i64 160, i32 0, metadata !194} ; [ DW_TAG_member ]
!667 = metadata !{i32 786445, metadata !42, metadata !"is_ref__gc", metadata !43, i32 321, i64 8, i64 8, i64 168, i32 0, metadata !194} ; [ DW_TAG_member ]
!668 = metadata !{metadata !669}
!669 = metadata !{metadata !670, metadata !671, metadata !708, metadata !709, metadata !710, metadata !711, metadata !712, metadata !713, metadata !714, metadata !715}
!670 = metadata !{i32 786689, metadata !36, metadata !"array_ptr", metadata !37, i32 16777806, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!671 = metadata !{i32 786688, metadata !672, metadata !"request", metadata !37, i32 618, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!672 = metadata !{i32 786443, metadata !673, i32 617, i32 25, metadata !37, i32 3} ; [ DW_TAG_lexical_block ]
!673 = metadata !{i32 786443, metadata !36, i32 591, i32 1, metadata !37, i32 0} ; [ DW_TAG_lexical_block ]
!674 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !675} ; [ DW_TAG_pointer_type ]
!675 = metadata !{i32 786454, null, metadata !"fcgi_request", metadata !37, i32 113, i64 0, i64 0, i64 0, i32 0, metadata !676} ; [ DW_TAG_typedef ]
!676 = metadata !{i32 786451, null, metadata !"_fcgi_request", metadata !20, i32 94, i64 66112, i64 64, i32 0, i32 0, null, metadata !677, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!677 = metadata !{metadata !678, metadata !679, metadata !680, metadata !681, metadata !682, metadata !683, metadata !684, metadata !685, metadata !698, metadata !699, metadata !703, metadata !707}
!678 = metadata !{i32 786445, metadata !676, metadata !"listen_socket", metadata !20, i32 95, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!679 = metadata !{i32 786445, metadata !676, metadata !"fd", metadata !20, i32 99, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!680 = metadata !{i32 786445, metadata !676, metadata !"id", metadata !20, i32 100, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!681 = metadata !{i32 786445, metadata !676, metadata !"keep", metadata !20, i32 101, i64 32, i64 32, i64 96, i32 0, metadata !60} ; [ DW_TAG_member ]
!682 = metadata !{i32 786445, metadata !676, metadata !"closed", metadata !20, i32 102, i64 32, i64 32, i64 128, i32 0, metadata !60} ; [ DW_TAG_member ]
!683 = metadata !{i32 786445, metadata !676, metadata !"in_len", metadata !20, i32 104, i64 32, i64 32, i64 160, i32 0, metadata !60} ; [ DW_TAG_member ]
!684 = metadata !{i32 786445, metadata !676, metadata !"in_pad", metadata !20, i32 105, i64 32, i64 32, i64 192, i32 0, metadata !60} ; [ DW_TAG_member ]
!685 = metadata !{i32 786445, metadata !676, metadata !"out_hdr", metadata !20, i32 107, i64 64, i64 64, i64 256, i32 0, metadata !686} ; [ DW_TAG_member ]
!686 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !687} ; [ DW_TAG_pointer_type ]
!687 = metadata !{i32 786454, null, metadata !"fcgi_header", metadata !20, i32 64, i64 0, i64 0, i64 0, i32 0, metadata !688} ; [ DW_TAG_typedef ]
!688 = metadata !{i32 786451, null, metadata !"_fcgi_header", metadata !20, i32 55, i64 64, i64 8, i32 0, i32 0, null, metadata !689, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!689 = metadata !{metadata !690, metadata !691, metadata !692, metadata !693, metadata !694, metadata !695, metadata !696, metadata !697}
!690 = metadata !{i32 786445, metadata !688, metadata !"version", metadata !20, i32 56, i64 8, i64 8, i64 0, i32 0, metadata !104} ; [ DW_TAG_member ]
!691 = metadata !{i32 786445, metadata !688, metadata !"type", metadata !20, i32 57, i64 8, i64 8, i64 8, i32 0, metadata !104} ; [ DW_TAG_member ]
!692 = metadata !{i32 786445, metadata !688, metadata !"requestIdB1", metadata !20, i32 58, i64 8, i64 8, i64 16, i32 0, metadata !104} ; [ DW_TAG_member ]
!693 = metadata !{i32 786445, metadata !688, metadata !"requestIdB0", metadata !20, i32 59, i64 8, i64 8, i64 24, i32 0, metadata !104} ; [ DW_TAG_member ]
!694 = metadata !{i32 786445, metadata !688, metadata !"contentLengthB1", metadata !20, i32 60, i64 8, i64 8, i64 32, i32 0, metadata !104} ; [ DW_TAG_member ]
!695 = metadata !{i32 786445, metadata !688, metadata !"contentLengthB0", metadata !20, i32 61, i64 8, i64 8, i64 40, i32 0, metadata !104} ; [ DW_TAG_member ]
!696 = metadata !{i32 786445, metadata !688, metadata !"paddingLength", metadata !20, i32 62, i64 8, i64 8, i64 48, i32 0, metadata !104} ; [ DW_TAG_member ]
!697 = metadata !{i32 786445, metadata !688, metadata !"reserved", metadata !20, i32 63, i64 8, i64 8, i64 56, i32 0, metadata !104} ; [ DW_TAG_member ]
!698 = metadata !{i32 786445, metadata !676, metadata !"out_pos", metadata !20, i32 108, i64 64, i64 64, i64 320, i32 0, metadata !330} ; [ DW_TAG_member ]
!699 = metadata !{i32 786445, metadata !676, metadata !"out_buf", metadata !20, i32 109, i64 65536, i64 8, i64 384, i32 0, metadata !700} ; [ DW_TAG_member ]
!700 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 65536, i64 8, i32 0, i32 0, metadata !104, metadata !701, i32 0, i32 0} ; [ DW_TAG_array_type ]
!701 = metadata !{metadata !702}
!702 = metadata !{i32 786465, i64 0, i64 8191}    ; [ DW_TAG_subrange_type ]
!703 = metadata !{i32 786445, metadata !676, metadata !"reserved", metadata !20, i32 110, i64 128, i64 8, i64 65920, i32 0, metadata !704} ; [ DW_TAG_member ]
!704 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 128, i64 8, i32 0, i32 0, metadata !104, metadata !705, i32 0, i32 0} ; [ DW_TAG_array_type ]
!705 = metadata !{metadata !706}
!706 = metadata !{i32 786465, i64 0, i64 15}      ; [ DW_TAG_subrange_type ]
!707 = metadata !{i32 786445, metadata !676, metadata !"env", metadata !20, i32 112, i64 64, i64 64, i64 66048, i32 0, metadata !62} ; [ DW_TAG_member ]
!708 = metadata !{i32 786688, metadata !672, metadata !"pos", metadata !37, i32 619, metadata !518, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!709 = metadata !{i32 786688, metadata !672, metadata !"magic_quotes_gpc", metadata !37, i32 620, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!710 = metadata !{i32 786688, metadata !672, metadata !"var", metadata !37, i32 621, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!711 = metadata !{i32 786688, metadata !672, metadata !"val", metadata !37, i32 621, metadata !295, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!712 = metadata !{i32 786688, metadata !672, metadata !"var_len", metadata !37, i32 622, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!713 = metadata !{i32 786688, metadata !672, metadata !"idx", metadata !37, i32 623, metadata !73, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!714 = metadata !{i32 786688, metadata !672, metadata !"filter_arg", metadata !37, i32 624, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!715 = metadata !{i32 786688, metadata !716, metadata !"new_val_len", metadata !37, i32 633, metadata !69, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!716 = metadata !{i32 786443, metadata !717, i32 632, i32 5, metadata !37, i32 5} ; [ DW_TAG_lexical_block ]
!717 = metadata !{i32 786443, metadata !672, i32 628, i32 3, metadata !37, i32 4} ; [ DW_TAG_lexical_block ]
!718 = metadata !{i32 786478, i32 0, metadata !37, metadata !"fastcgi_cleanup", metadata !"fastcgi_cleanup", metadata !"", metadata !37, i32 1362, metadata !719, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32)* @fastcgi_cleanup, null, null, metadata !721, i32 1363} ; [ DW_TAG_subprogram ]
!719 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !720, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!720 = metadata !{null, metadata !60}
!721 = metadata !{metadata !722}
!722 = metadata !{metadata !723}
!723 = metadata !{i32 786689, metadata !718, metadata !"signal", metadata !37, i32 16778578, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!724 = metadata !{i32 786478, i32 0, metadata !37, metadata !"main", metadata !"main", metadata !"", metadata !37, i32 1462, metadata !725, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !727, i32 1463} ; [ DW_TAG_subprogram ]
!725 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !726, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!726 = metadata !{metadata !60, metadata !60, metadata !295}
!727 = metadata !{metadata !728}
!728 = metadata !{metadata !729, metadata !730, metadata !731, metadata !733, metadata !734, metadata !735, metadata !736, metadata !737, metadata !738, metadata !848, metadata !849, metadata !850, metadata !851, metadata !852, metadata !853, metadata !854, metadata !855, metadata !856, metadata !857, metadata !858, metadata !859, metadata !860, metadata !861, metadata !862, metadata !863, metadata !873, metadata !874, metadata !875, metadata !879, metadata !880, metadata !894, metadata !895, metadata !899, metadata !902, metadata !904, metadata !908, metadata !910, metadata !911, metadata !917, metadata !921, metadata !922, metadata !927, metadata !930, metadata !935, metadata !947, metadata !949}
!729 = metadata !{i32 786689, metadata !724, metadata !"argc", metadata !37, i32 16778678, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!730 = metadata !{i32 786689, metadata !724, metadata !"argv", metadata !37, i32 33555894, metadata !295, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!731 = metadata !{i32 786688, metadata !732, metadata !"free_query_string", metadata !37, i32 1464, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!732 = metadata !{i32 786443, metadata !724, i32 1463, i32 1, metadata !37, i32 10} ; [ DW_TAG_lexical_block ]
!733 = metadata !{i32 786688, metadata !732, metadata !"exit_status", metadata !37, i32 1465, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!734 = metadata !{i32 786688, metadata !732, metadata !"cgi", metadata !37, i32 1466, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!735 = metadata !{i32 786688, metadata !732, metadata !"c", metadata !37, i32 1466, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!736 = metadata !{i32 786688, metadata !732, metadata !"i", metadata !37, i32 1466, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!737 = metadata !{i32 786688, metadata !732, metadata !"len", metadata !37, i32 1466, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!738 = metadata !{i32 786688, metadata !732, metadata !"file_handle", metadata !37, i32 1467, metadata !739, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!739 = metadata !{i32 786454, null, metadata !"zend_file_handle", metadata !37, i32 72, i64 0, i64 0, i64 0, i32 0, metadata !740} ; [ DW_TAG_typedef ]
!740 = metadata !{i32 786451, null, metadata !"_zend_file_handle", metadata !4, i32 62, i64 960, i64 64, i32 0, i32 0, null, metadata !741, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!741 = metadata !{metadata !742, metadata !744, metadata !745, metadata !746, metadata !847}
!742 = metadata !{i32 786445, metadata !740, metadata !"type", metadata !4, i32 63, i64 32, i64 32, i64 0, i32 0, metadata !743} ; [ DW_TAG_member ]
!743 = metadata !{i32 786454, null, metadata !"zend_stream_type", metadata !4, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !3} ; [ DW_TAG_typedef ]
!744 = metadata !{i32 786445, metadata !740, metadata !"filename", metadata !4, i32 64, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!745 = metadata !{i32 786445, metadata !740, metadata !"opened_path", metadata !4, i32 65, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ]
!746 = metadata !{i32 786445, metadata !740, metadata !"handle", metadata !4, i32 70, i64 704, i64 64, i64 192, i32 0, metadata !747} ; [ DW_TAG_member ]
!747 = metadata !{i32 786455, metadata !740, metadata !"", metadata !4, i32 66, i64 704, i64 64, i64 0, i32 0, null, metadata !748, i32 0, i32 0} ; [ DW_TAG_union_type ]
!748 = metadata !{metadata !749, metadata !750, metadata !819}
!749 = metadata !{i32 786445, metadata !747, metadata !"fd", metadata !4, i32 67, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!750 = metadata !{i32 786445, metadata !747, metadata !"fp", metadata !4, i32 68, i64 64, i64 64, i64 0, i32 0, metadata !751} ; [ DW_TAG_member ]
!751 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !752} ; [ DW_TAG_pointer_type ]
!752 = metadata !{i32 786454, null, metadata !"FILE", metadata !4, i32 147, i64 0, i64 0, i64 0, i32 0, metadata !753} ; [ DW_TAG_typedef ]
!753 = metadata !{i32 786451, null, metadata !"__sFILE", metadata !754, i32 110, i64 2432, i64 64, i32 0, i32 0, null, metadata !755, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!754 = metadata !{i32 786473, metadata !"/usr/include/stdio.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!755 = metadata !{metadata !756, metadata !757, metadata !758, metadata !759, metadata !761, metadata !762, metadata !767, metadata !768, metadata !769, metadata !773, metadata !777, metadata !784, metadata !788, metadata !789, metadata !790, metadata !791, metadata !795, metadata !797, metadata !798, metadata !799, metadata !800, metadata !804, metadata !807, metadata !808, metadata !809}
!756 = metadata !{i32 786445, metadata !753, metadata !"_p", metadata !754, i32 111, i64 64, i64 64, i64 0, i32 0, metadata !330} ; [ DW_TAG_member ]
!757 = metadata !{i32 786445, metadata !753, metadata !"_r", metadata !754, i32 112, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!758 = metadata !{i32 786445, metadata !753, metadata !"_w", metadata !754, i32 113, i64 32, i64 32, i64 96, i32 0, metadata !60} ; [ DW_TAG_member ]
!759 = metadata !{i32 786445, metadata !753, metadata !"_flags", metadata !754, i32 114, i64 16, i64 16, i64 128, i32 0, metadata !760} ; [ DW_TAG_member ]
!760 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!761 = metadata !{i32 786445, metadata !753, metadata !"_file", metadata !754, i32 115, i64 16, i64 16, i64 144, i32 0, metadata !760} ; [ DW_TAG_member ]
!762 = metadata !{i32 786445, metadata !753, metadata !"_bf", metadata !754, i32 116, i64 128, i64 64, i64 192, i32 0, metadata !763} ; [ DW_TAG_member ]
!763 = metadata !{i32 786451, null, metadata !"__sbuf", metadata !754, i32 77, i64 128, i64 64, i32 0, i32 0, null, metadata !764, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!764 = metadata !{metadata !765, metadata !766}
!765 = metadata !{i32 786445, metadata !763, metadata !"_base", metadata !754, i32 78, i64 64, i64 64, i64 0, i32 0, metadata !330} ; [ DW_TAG_member ]
!766 = metadata !{i32 786445, metadata !763, metadata !"_size", metadata !754, i32 79, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!767 = metadata !{i32 786445, metadata !753, metadata !"_lbfsize", metadata !754, i32 117, i64 32, i64 32, i64 320, i32 0, metadata !60} ; [ DW_TAG_member ]
!768 = metadata !{i32 786445, metadata !753, metadata !"_cookie", metadata !754, i32 120, i64 64, i64 64, i64 384, i32 0, metadata !82} ; [ DW_TAG_member ]
!769 = metadata !{i32 786445, metadata !753, metadata !"_close", metadata !754, i32 121, i64 64, i64 64, i64 448, i32 0, metadata !770} ; [ DW_TAG_member ]
!770 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !771} ; [ DW_TAG_pointer_type ]
!771 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !772, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!772 = metadata !{metadata !60, metadata !82}
!773 = metadata !{i32 786445, metadata !753, metadata !"_read", metadata !754, i32 122, i64 64, i64 64, i64 512, i32 0, metadata !774} ; [ DW_TAG_member ]
!774 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !775} ; [ DW_TAG_pointer_type ]
!775 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !776, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!776 = metadata !{metadata !60, metadata !82, metadata !57, metadata !60}
!777 = metadata !{i32 786445, metadata !753, metadata !"_seek", metadata !754, i32 123, i64 64, i64 64, i64 576, i32 0, metadata !778} ; [ DW_TAG_member ]
!778 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !779} ; [ DW_TAG_pointer_type ]
!779 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !780, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!780 = metadata !{metadata !781, metadata !82, metadata !781, metadata !60}
!781 = metadata !{i32 786454, null, metadata !"fpos_t", metadata !754, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !782} ; [ DW_TAG_typedef ]
!782 = metadata !{i32 786454, null, metadata !"__off_t", metadata !754, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !783} ; [ DW_TAG_typedef ]
!783 = metadata !{i32 786454, null, metadata !"__int64_t", metadata !754, i32 57, i64 0, i64 0, i64 0, i32 0, metadata !50} ; [ DW_TAG_typedef ]
!784 = metadata !{i32 786445, metadata !753, metadata !"_write", metadata !754, i32 124, i64 64, i64 64, i64 640, i32 0, metadata !785} ; [ DW_TAG_member ]
!785 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !786} ; [ DW_TAG_pointer_type ]
!786 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !787, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!787 = metadata !{metadata !60, metadata !82, metadata !227, metadata !60}
!788 = metadata !{i32 786445, metadata !753, metadata !"_ub", metadata !754, i32 127, i64 128, i64 64, i64 704, i32 0, metadata !763} ; [ DW_TAG_member ]
!789 = metadata !{i32 786445, metadata !753, metadata !"_up", metadata !754, i32 128, i64 64, i64 64, i64 832, i32 0, metadata !330} ; [ DW_TAG_member ]
!790 = metadata !{i32 786445, metadata !753, metadata !"_ur", metadata !754, i32 129, i64 32, i64 32, i64 896, i32 0, metadata !60} ; [ DW_TAG_member ]
!791 = metadata !{i32 786445, metadata !753, metadata !"_ubuf", metadata !754, i32 132, i64 24, i64 8, i64 928, i32 0, metadata !792} ; [ DW_TAG_member ]
!792 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24, i64 8, i32 0, i32 0, metadata !104, metadata !793, i32 0, i32 0} ; [ DW_TAG_array_type ]
!793 = metadata !{metadata !794}
!794 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!795 = metadata !{i32 786445, metadata !753, metadata !"_nbuf", metadata !754, i32 133, i64 8, i64 8, i64 952, i32 0, metadata !796} ; [ DW_TAG_member ]
!796 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !104, metadata !91, i32 0, i32 0} ; [ DW_TAG_array_type ]
!797 = metadata !{i32 786445, metadata !753, metadata !"_lb", metadata !754, i32 136, i64 128, i64 64, i64 960, i32 0, metadata !763} ; [ DW_TAG_member ]
!798 = metadata !{i32 786445, metadata !753, metadata !"_blksize", metadata !754, i32 139, i64 32, i64 32, i64 1088, i32 0, metadata !60} ; [ DW_TAG_member ]
!799 = metadata !{i32 786445, metadata !753, metadata !"_offset", metadata !754, i32 140, i64 64, i64 64, i64 1152, i32 0, metadata !781} ; [ DW_TAG_member ]
!800 = metadata !{i32 786445, metadata !753, metadata !"_fl_mutex", metadata !754, i32 142, i64 64, i64 64, i64 1216, i32 0, metadata !801} ; [ DW_TAG_member ]
!801 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !802} ; [ DW_TAG_pointer_type ]
!802 = metadata !{i32 786451, null, metadata !"pthread_mutex", metadata !803, i32 48, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!803 = metadata !{i32 786473, metadata !"/usr/include/sys/_pthreadtypes.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!804 = metadata !{i32 786445, metadata !753, metadata !"_fl_owner", metadata !754, i32 143, i64 64, i64 64, i64 1280, i32 0, metadata !805} ; [ DW_TAG_member ]
!805 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !806} ; [ DW_TAG_pointer_type ]
!806 = metadata !{i32 786451, null, metadata !"pthread", metadata !803, i32 44, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!807 = metadata !{i32 786445, metadata !753, metadata !"_fl_count", metadata !754, i32 144, i64 32, i64 32, i64 1344, i32 0, metadata !60} ; [ DW_TAG_member ]
!808 = metadata !{i32 786445, metadata !753, metadata !"_orientation", metadata !754, i32 145, i64 32, i64 32, i64 1376, i32 0, metadata !60} ; [ DW_TAG_member ]
!809 = metadata !{i32 786445, metadata !753, metadata !"_mbstate", metadata !754, i32 146, i64 1024, i64 64, i64 1408, i32 0, metadata !810} ; [ DW_TAG_member ]
!810 = metadata !{i32 786454, null, metadata !"__mbstate_t", metadata !754, i32 104, i64 0, i64 0, i64 0, i32 0, metadata !811} ; [ DW_TAG_typedef ]
!811 = metadata !{i32 786455, null, metadata !"", metadata !812, i32 101, i64 1024, i64 64, i64 0, i32 0, null, metadata !813, i32 0, i32 0} ; [ DW_TAG_union_type ]
!812 = metadata !{i32 786473, metadata !"/usr/include/sys/_types.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!813 = metadata !{metadata !814, metadata !818}
!814 = metadata !{i32 786445, metadata !811, metadata !"__mbstate8", metadata !812, i32 102, i64 1024, i64 8, i64 0, i32 0, metadata !815} ; [ DW_TAG_member ]
!815 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1024, i64 8, i32 0, i32 0, metadata !58, metadata !816, i32 0, i32 0} ; [ DW_TAG_array_type ]
!816 = metadata !{metadata !817}
!817 = metadata !{i32 786465, i64 0, i64 127}     ; [ DW_TAG_subrange_type ]
!818 = metadata !{i32 786445, metadata !811, metadata !"_mbstateL", metadata !812, i32 103, i64 64, i64 64, i64 0, i32 0, metadata !783} ; [ DW_TAG_member ]
!819 = metadata !{i32 786445, metadata !747, metadata !"stream", metadata !4, i32 69, i64 704, i64 64, i64 0, i32 0, metadata !820} ; [ DW_TAG_member ]
!820 = metadata !{i32 786454, null, metadata !"zend_stream", metadata !4, i32 60, i64 0, i64 0, i64 0, i32 0, metadata !821} ; [ DW_TAG_typedef ]
!821 = metadata !{i32 786451, null, metadata !"_zend_stream", metadata !4, i32 53, i64 704, i64 64, i32 0, i32 0, null, metadata !822, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!822 = metadata !{metadata !823, metadata !824, metadata !825, metadata !836, metadata !841, metadata !846}
!823 = metadata !{i32 786445, metadata !821, metadata !"handle", metadata !4, i32 54, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ]
!824 = metadata !{i32 786445, metadata !821, metadata !"isatty", metadata !4, i32 55, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!825 = metadata !{i32 786445, metadata !821, metadata !"mmap", metadata !4, i32 56, i64 384, i64 64, i64 128, i32 0, metadata !826} ; [ DW_TAG_member ]
!826 = metadata !{i32 786454, null, metadata !"zend_mmap", metadata !4, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !827} ; [ DW_TAG_typedef ]
!827 = metadata !{i32 786451, null, metadata !"_zend_mmap", metadata !4, i32 44, i64 384, i64 64, i32 0, i32 0, null, metadata !828, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!828 = metadata !{metadata !829, metadata !830, metadata !831, metadata !832, metadata !833, metadata !834}
!829 = metadata !{i32 786445, metadata !827, metadata !"len", metadata !4, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !417} ; [ DW_TAG_member ]
!830 = metadata !{i32 786445, metadata !827, metadata !"pos", metadata !4, i32 46, i64 64, i64 64, i64 64, i32 0, metadata !417} ; [ DW_TAG_member ]
!831 = metadata !{i32 786445, metadata !827, metadata !"map", metadata !4, i32 47, i64 64, i64 64, i64 128, i32 0, metadata !82} ; [ DW_TAG_member ]
!832 = metadata !{i32 786445, metadata !827, metadata !"buf", metadata !4, i32 48, i64 64, i64 64, i64 192, i32 0, metadata !57} ; [ DW_TAG_member ]
!833 = metadata !{i32 786445, metadata !827, metadata !"old_handle", metadata !4, i32 49, i64 64, i64 64, i64 256, i32 0, metadata !82} ; [ DW_TAG_member ]
!834 = metadata !{i32 786445, metadata !827, metadata !"old_closer", metadata !4, i32 50, i64 64, i64 64, i64 320, i32 0, metadata !835} ; [ DW_TAG_member ]
!835 = metadata !{i32 786454, null, metadata !"zend_stream_closer_t", metadata !4, i32 32, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_typedef ]
!836 = metadata !{i32 786445, metadata !821, metadata !"reader", metadata !4, i32 57, i64 64, i64 64, i64 512, i32 0, metadata !837} ; [ DW_TAG_member ]
!837 = metadata !{i32 786454, null, metadata !"zend_stream_reader_t", metadata !4, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !838} ; [ DW_TAG_typedef ]
!838 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !839} ; [ DW_TAG_pointer_type ]
!839 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !840, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!840 = metadata !{metadata !417, metadata !82, metadata !57, metadata !417}
!841 = metadata !{i32 786445, metadata !821, metadata !"fsizer", metadata !4, i32 58, i64 64, i64 64, i64 576, i32 0, metadata !842} ; [ DW_TAG_member ]
!842 = metadata !{i32 786454, null, metadata !"zend_stream_fsizer_t", metadata !4, i32 30, i64 0, i64 0, i64 0, i32 0, metadata !843} ; [ DW_TAG_typedef ]
!843 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !844} ; [ DW_TAG_pointer_type ]
!844 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !845, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!845 = metadata !{metadata !417, metadata !82}
!846 = metadata !{i32 786445, metadata !821, metadata !"closer", metadata !4, i32 59, i64 64, i64 64, i64 640, i32 0, metadata !835} ; [ DW_TAG_member ]
!847 = metadata !{i32 786445, metadata !740, metadata !"free_filename", metadata !4, i32 71, i64 8, i64 8, i64 896, i32 0, metadata !103} ; [ DW_TAG_member ]
!848 = metadata !{i32 786688, metadata !732, metadata !"s", metadata !37, i32 1468, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!849 = metadata !{i32 786688, metadata !732, metadata !"behavior", metadata !37, i32 1471, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!850 = metadata !{i32 786688, metadata !732, metadata !"no_headers", metadata !37, i32 1472, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!851 = metadata !{i32 786688, metadata !732, metadata !"orig_optind", metadata !37, i32 1473, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!852 = metadata !{i32 786688, metadata !732, metadata !"orig_optarg", metadata !37, i32 1474, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!853 = metadata !{i32 786688, metadata !732, metadata !"script_file", metadata !37, i32 1475, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!854 = metadata !{i32 786688, metadata !732, metadata !"ini_entries_len", metadata !37, i32 1476, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!855 = metadata !{i32 786688, metadata !732, metadata !"max_requests", metadata !37, i32 1483, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!856 = metadata !{i32 786688, metadata !732, metadata !"requests", metadata !37, i32 1484, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!857 = metadata !{i32 786688, metadata !732, metadata !"fastcgi", metadata !37, i32 1485, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!858 = metadata !{i32 786688, metadata !732, metadata !"bindpath", metadata !37, i32 1486, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!859 = metadata !{i32 786688, metadata !732, metadata !"fcgi_fd", metadata !37, i32 1487, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!860 = metadata !{i32 786688, metadata !732, metadata !"request", metadata !37, i32 1488, metadata !675, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!861 = metadata !{i32 786688, metadata !732, metadata !"repeats", metadata !37, i32 1489, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!862 = metadata !{i32 786688, metadata !732, metadata !"benchmark", metadata !37, i32 1490, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!863 = metadata !{i32 786688, metadata !732, metadata !"start", metadata !37, i32 1492, metadata !864, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!864 = metadata !{i32 786451, null, metadata !"timeval", metadata !865, i32 47, i64 128, i64 64, i32 0, i32 0, null, metadata !866, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!865 = metadata !{i32 786473, metadata !"/usr/include/sys/_timeval.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!866 = metadata !{metadata !867, metadata !870}
!867 = metadata !{i32 786445, metadata !864, metadata !"tv_sec", metadata !865, i32 48, i64 64, i64 64, i64 0, i32 0, metadata !868} ; [ DW_TAG_member ]
!868 = metadata !{i32 786454, null, metadata !"time_t", metadata !865, i32 255, i64 0, i64 0, i64 0, i32 0, metadata !869} ; [ DW_TAG_typedef ]
!869 = metadata !{i32 786454, null, metadata !"__time_t", metadata !865, i32 84, i64 0, i64 0, i64 0, i32 0, metadata !783} ; [ DW_TAG_typedef ]
!870 = metadata !{i32 786445, metadata !864, metadata !"tv_usec", metadata !865, i32 49, i64 64, i64 64, i64 64, i32 0, metadata !871} ; [ DW_TAG_member ]
!871 = metadata !{i32 786454, null, metadata !"suseconds_t", metadata !865, i32 250, i64 0, i64 0, i64 0, i32 0, metadata !872} ; [ DW_TAG_typedef ]
!872 = metadata !{i32 786454, null, metadata !"__suseconds_t", metadata !865, i32 61, i64 0, i64 0, i64 0, i32 0, metadata !50} ; [ DW_TAG_typedef ]
!873 = metadata !{i32 786688, metadata !732, metadata !"end", metadata !37, i32 1492, metadata !864, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!874 = metadata !{i32 786688, metadata !732, metadata !"status", metadata !37, i32 1497, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!875 = metadata !{i32 786688, metadata !876, metadata !"len", metadata !37, i32 1561, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!876 = metadata !{i32 786443, metadata !877, i32 1559, i32 14, metadata !37, i32 16} ; [ DW_TAG_lexical_block ]
!877 = metadata !{i32 786443, metadata !878, i32 1549, i32 14, metadata !37, i32 14} ; [ DW_TAG_lexical_block ]
!878 = metadata !{i32 786443, metadata !732, i32 1548, i32 86, metadata !37, i32 13} ; [ DW_TAG_lexical_block ]
!879 = metadata !{i32 786688, metadata !876, metadata !"val", metadata !37, i32 1562, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!880 = metadata !{i32 786688, metadata !881, metadata !"__orig_bailout", metadata !37, i32 1637, metadata !884, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!881 = metadata !{i32 786443, metadata !882, i32 1637, i32 4, metadata !37, i32 26} ; [ DW_TAG_lexical_block ]
!882 = metadata !{i32 786443, metadata !883, i32 1636, i32 5, metadata !37, i32 25} ; [ DW_TAG_lexical_block ]
!883 = metadata !{i32 786443, metadata !732, i32 1624, i32 35, metadata !37, i32 24} ; [ DW_TAG_lexical_block ]
!884 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !885} ; [ DW_TAG_pointer_type ]
!885 = metadata !{i32 786454, null, metadata !"sigjmp_buf", metadata !37, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !886} ; [ DW_TAG_typedef ]
!886 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 768, i64 64, i32 0, i32 0, metadata !887, metadata !91, i32 0, i32 0} ; [ DW_TAG_array_type ]
!887 = metadata !{i32 786451, null, metadata !"_sigjmp_buf", metadata !888, i32 45, i64 768, i64 64, i32 0, i32 0, null, metadata !889, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!888 = metadata !{i32 786473, metadata !"/usr/include/machine/setjmp.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!889 = metadata !{metadata !890}
!890 = metadata !{i32 786445, metadata !887, metadata !"_sjb", metadata !888, i32 45, i64 768, i64 64, i64 0, i32 0, metadata !891} ; [ DW_TAG_member ]
!891 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 768, i64 64, i32 0, i32 0, metadata !50, metadata !892, i32 0, i32 0} ; [ DW_TAG_array_type ]
!892 = metadata !{metadata !893}
!893 = metadata !{i32 786465, i64 0, i64 11}      ; [ DW_TAG_subrange_type ]
!894 = metadata !{i32 786688, metadata !881, metadata !"__bailout", metadata !37, i32 1637, metadata !885, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!895 = metadata !{i32 786688, metadata !896, metadata !"__str", metadata !37, i32 1639, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!896 = metadata !{i32 786443, metadata !897, i32 1639, i32 5, metadata !37, i32 29} ; [ DW_TAG_lexical_block ]
!897 = metadata !{i32 786443, metadata !898, i32 1637, i32 13, metadata !37, i32 28} ; [ DW_TAG_lexical_block ]
!898 = metadata !{i32 786443, metadata !881, i32 1637, i32 4, metadata !37, i32 27} ; [ DW_TAG_lexical_block ]
!899 = metadata !{i32 786688, metadata !900, metadata !"children_str", metadata !37, i32 1694, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!900 = metadata !{i32 786443, metadata !901, i32 1693, i32 35, metadata !37, i32 37} ; [ DW_TAG_lexical_block ]
!901 = metadata !{i32 786443, metadata !732, i32 1674, i32 15, metadata !37, i32 34} ; [ DW_TAG_lexical_block ]
!902 = metadata !{i32 786688, metadata !903, metadata !"running", metadata !37, i32 1709, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!903 = metadata !{i32 786443, metadata !901, i32 1708, i32 16, metadata !37, i32 40} ; [ DW_TAG_lexical_block ]
!904 = metadata !{i32 786688, metadata !903, metadata !"pid", metadata !37, i32 1710, metadata !905, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!905 = metadata !{i32 786454, null, metadata !"pid_t", metadata !37, i32 226, i64 0, i64 0, i64 0, i32 0, metadata !906} ; [ DW_TAG_typedef ]
!906 = metadata !{i32 786454, null, metadata !"__pid_t", metadata !37, i32 55, i64 0, i64 0, i64 0, i32 0, metadata !907} ; [ DW_TAG_typedef ]
!907 = metadata !{i32 786454, null, metadata !"__int32_t", metadata !37, i32 55, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!908 = metadata !{i32 786688, metadata !909, metadata !"__orig_bailout", metadata !37, i32 1796, metadata !884, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!909 = metadata !{i32 786443, metadata !732, i32 1796, i32 2, metadata !37, i32 52} ; [ DW_TAG_lexical_block ]
!910 = metadata !{i32 786688, metadata !909, metadata !"__bailout", metadata !37, i32 1796, metadata !885, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!911 = metadata !{i32 786688, metadata !912, metadata !"slen", metadata !37, i32 1981, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!912 = metadata !{i32 786443, metadata !913, i32 1980, i32 62, metadata !37, i32 74} ; [ DW_TAG_lexical_block ]
!913 = metadata !{i32 786443, metadata !914, i32 1838, i32 26, metadata !37, i32 58} ; [ DW_TAG_lexical_block ]
!914 = metadata !{i32 786443, metadata !915, i32 1833, i32 58, metadata !37, i32 57} ; [ DW_TAG_lexical_block ]
!915 = metadata !{i32 786443, metadata !916, i32 1796, i32 17, metadata !37, i32 54} ; [ DW_TAG_lexical_block ]
!916 = metadata !{i32 786443, metadata !909, i32 1796, i32 2, metadata !37, i32 53} ; [ DW_TAG_lexical_block ]
!917 = metadata !{i32 786688, metadata !918, metadata !"__orig_bailout", metadata !37, i32 2045, metadata !884, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!918 = metadata !{i32 786443, metadata !919, i32 2045, i32 6, metadata !37, i32 89} ; [ DW_TAG_lexical_block ]
!919 = metadata !{i32 786443, metadata !920, i32 2044, i32 70, metadata !37, i32 88} ; [ DW_TAG_lexical_block ]
!920 = metadata !{i32 786443, metadata !914, i32 2043, i32 60, metadata !37, i32 87} ; [ DW_TAG_lexical_block ]
!921 = metadata !{i32 786688, metadata !918, metadata !"__bailout", metadata !37, i32 2045, metadata !885, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!922 = metadata !{i32 786688, metadata !923, metadata !"__str", metadata !37, i32 2048, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!923 = metadata !{i32 786443, metadata !924, i32 2048, i32 8, metadata !37, i32 93} ; [ DW_TAG_lexical_block ]
!924 = metadata !{i32 786443, metadata !925, i32 2046, i32 28, metadata !37, i32 92} ; [ DW_TAG_lexical_block ]
!925 = metadata !{i32 786443, metadata !926, i32 2045, i32 15, metadata !37, i32 91} ; [ DW_TAG_lexical_block ]
!926 = metadata !{i32 786443, metadata !918, i32 2045, i32 6, metadata !37, i32 90} ; [ DW_TAG_lexical_block ]
!927 = metadata !{i32 786688, metadata !928, metadata !"__str", metadata !37, i32 2051, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!928 = metadata !{i32 786443, metadata !929, i32 2051, i32 8, metadata !37, i32 95} ; [ DW_TAG_lexical_block ]
!929 = metadata !{i32 786443, metadata !925, i32 2049, i32 14, metadata !37, i32 94} ; [ DW_TAG_lexical_block ]
!930 = metadata !{i32 786688, metadata !931, metadata !"pos", metadata !37, i32 2090, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!931 = metadata !{i32 786443, metadata !932, i32 2089, i32 49, metadata !37, i32 105} ; [ DW_TAG_lexical_block ]
!932 = metadata !{i32 786443, metadata !933, i32 2088, i32 21, metadata !37, i32 104} ; [ DW_TAG_lexical_block ]
!933 = metadata !{i32 786443, metadata !934, i32 2083, i32 19, metadata !37, i32 102} ; [ DW_TAG_lexical_block ]
!934 = metadata !{i32 786443, metadata !914, i32 2080, i32 95, metadata !37, i32 101} ; [ DW_TAG_lexical_block ]
!935 = metadata !{i32 786688, metadata !936, metadata !"syntax_highlighter_ini", metadata !37, i32 2123, metadata !938, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!936 = metadata !{i32 786443, metadata !937, i32 2122, i32 6, metadata !37, i32 111} ; [ DW_TAG_lexical_block ]
!937 = metadata !{i32 786443, metadata !914, i32 2100, i32 22, metadata !37, i32 107} ; [ DW_TAG_lexical_block ]
!938 = metadata !{i32 786454, null, metadata !"zend_syntax_highlighter_ini", metadata !37, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !939} ; [ DW_TAG_typedef ]
!939 = metadata !{i32 786451, null, metadata !"_zend_syntax_highlighter_ini", metadata !940, i32 33, i64 320, i64 64, i32 0, i32 0, null, metadata !941, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!940 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_highlight.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!941 = metadata !{metadata !942, metadata !943, metadata !944, metadata !945, metadata !946}
!942 = metadata !{i32 786445, metadata !939, metadata !"highlight_html", metadata !940, i32 34, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!943 = metadata !{i32 786445, metadata !939, metadata !"highlight_comment", metadata !940, i32 35, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!944 = metadata !{i32 786445, metadata !939, metadata !"highlight_default", metadata !940, i32 36, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ]
!945 = metadata !{i32 786445, metadata !939, metadata !"highlight_string", metadata !940, i32 37, i64 64, i64 64, i64 192, i32 0, metadata !57} ; [ DW_TAG_member ]
!946 = metadata !{i32 786445, metadata !939, metadata !"highlight_keyword", metadata !940, i32 38, i64 64, i64 64, i64 256, i32 0, metadata !57} ; [ DW_TAG_member ]
!947 = metadata !{i32 786688, metadata !948, metadata !"sec", metadata !37, i32 2206, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!948 = metadata !{i32 786443, metadata !732, i32 2205, i32 17, metadata !37, i32 128} ; [ DW_TAG_lexical_block ]
!949 = metadata !{i32 786688, metadata !948, metadata !"usec", metadata !37, i32 2208, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!950 = metadata !{i32 786478, i32 0, metadata !37, metadata !"print_extensions", metadata !"print_extensions", metadata !"", metadata !37, i32 255, metadata !951, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !953, i32 256} ; [ DW_TAG_subprogram ]
!951 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !952, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!952 = metadata !{null}
!953 = metadata !{metadata !954}
!954 = metadata !{metadata !955}
!955 = metadata !{i32 786688, metadata !956, metadata !"sorted_exts", metadata !37, i32 257, metadata !957, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!956 = metadata !{i32 786443, metadata !950, i32 256, i32 1, metadata !37, i32 131} ; [ DW_TAG_lexical_block ]
!957 = metadata !{i32 786454, null, metadata !"zend_llist", metadata !37, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !958} ; [ DW_TAG_typedef ]
!958 = metadata !{i32 786451, null, metadata !"_zend_llist", metadata !959, i32 37, i64 448, i64 64, i32 0, i32 0, null, metadata !960, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!959 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_llist.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!960 = metadata !{metadata !961, metadata !970, metadata !971, metadata !972, metadata !973, metadata !975, metadata !976}
!961 = metadata !{i32 786445, metadata !958, metadata !"head", metadata !959, i32 38, i64 64, i64 64, i64 0, i32 0, metadata !962} ; [ DW_TAG_member ]
!962 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !963} ; [ DW_TAG_pointer_type ]
!963 = metadata !{i32 786454, null, metadata !"zend_llist_element", metadata !959, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !964} ; [ DW_TAG_typedef ]
!964 = metadata !{i32 786451, null, metadata !"_zend_llist_element", metadata !959, i32 25, i64 192, i64 64, i32 0, i32 0, null, metadata !965, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!965 = metadata !{metadata !966, metadata !968, metadata !969}
!966 = metadata !{i32 786445, metadata !964, metadata !"next", metadata !959, i32 26, i64 64, i64 64, i64 0, i32 0, metadata !967} ; [ DW_TAG_member ]
!967 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !964} ; [ DW_TAG_pointer_type ]
!968 = metadata !{i32 786445, metadata !964, metadata !"prev", metadata !959, i32 27, i64 64, i64 64, i64 64, i32 0, metadata !967} ; [ DW_TAG_member ]
!969 = metadata !{i32 786445, metadata !964, metadata !"data", metadata !959, i32 28, i64 8, i64 8, i64 128, i32 0, metadata !90} ; [ DW_TAG_member ]
!970 = metadata !{i32 786445, metadata !958, metadata !"tail", metadata !959, i32 39, i64 64, i64 64, i64 64, i32 0, metadata !962} ; [ DW_TAG_member ]
!971 = metadata !{i32 786445, metadata !958, metadata !"count", metadata !959, i32 40, i64 64, i64 64, i64 128, i32 0, metadata !417} ; [ DW_TAG_member ]
!972 = metadata !{i32 786445, metadata !958, metadata !"size", metadata !959, i32 41, i64 64, i64 64, i64 192, i32 0, metadata !417} ; [ DW_TAG_member ]
!973 = metadata !{i32 786445, metadata !958, metadata !"dtor", metadata !959, i32 42, i64 64, i64 64, i64 256, i32 0, metadata !974} ; [ DW_TAG_member ]
!974 = metadata !{i32 786454, null, metadata !"llist_dtor_func_t", metadata !959, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !99} ; [ DW_TAG_typedef ]
!975 = metadata !{i32 786445, metadata !958, metadata !"persistent", metadata !959, i32 43, i64 8, i64 8, i64 320, i32 0, metadata !104} ; [ DW_TAG_member ]
!976 = metadata !{i32 786445, metadata !958, metadata !"traverse_ptr", metadata !959, i32 44, i64 64, i64 64, i64 384, i32 0, metadata !962} ; [ DW_TAG_member ]
!977 = metadata !{i32 786478, i32 0, metadata !37, metadata !"print_extension_info", metadata !"print_extension_info", metadata !"", metadata !37, i32 243, metadata !978, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct._zend_extension*, i8*)* @print_extension_info, null, null, metadata !1043, i32 244} ; [ DW_TAG_subprogram ]
!978 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !979, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!979 = metadata !{metadata !60, metadata !980, metadata !82}
!980 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !981} ; [ DW_TAG_pointer_type ]
!981 = metadata !{i32 786454, null, metadata !"zend_extension", metadata !37, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !982} ; [ DW_TAG_typedef ]
!982 = metadata !{i32 786451, null, metadata !"_zend_extension", metadata !983, i32 59, i64 1664, i64 64, i32 0, i32 0, null, metadata !984, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!983 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_extensions.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!984 = metadata !{metadata !985, metadata !986, metadata !987, metadata !988, metadata !989, metadata !990, metadata !997, metadata !1002, metadata !1005, metadata !1007, metadata !1012, metadata !1017, metadata !1019, metadata !1021, metadata !1023, metadata !1025, metadata !1027, metadata !1031, metadata !1035, metadata !1036, metadata !1037, metadata !1038, metadata !1039, metadata !1040, metadata !1041, metadata !1042}
!985 = metadata !{i32 786445, metadata !982, metadata !"name", metadata !983, i32 60, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!986 = metadata !{i32 786445, metadata !982, metadata !"version", metadata !983, i32 61, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!987 = metadata !{i32 786445, metadata !982, metadata !"author", metadata !983, i32 62, i64 64, i64 64, i64 128, i32 0, metadata !57} ; [ DW_TAG_member ]
!988 = metadata !{i32 786445, metadata !982, metadata !"URL", metadata !983, i32 63, i64 64, i64 64, i64 192, i32 0, metadata !57} ; [ DW_TAG_member ]
!989 = metadata !{i32 786445, metadata !982, metadata !"copyright", metadata !983, i32 64, i64 64, i64 64, i64 256, i32 0, metadata !57} ; [ DW_TAG_member ]
!990 = metadata !{i32 786445, metadata !982, metadata !"startup", metadata !983, i32 66, i64 64, i64 64, i64 320, i32 0, metadata !991} ; [ DW_TAG_member ]
!991 = metadata !{i32 786454, null, metadata !"startup_func_t", metadata !983, i32 43, i64 0, i64 0, i64 0, i32 0, metadata !992} ; [ DW_TAG_typedef ]
!992 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !993} ; [ DW_TAG_pointer_type ]
!993 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !994, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!994 = metadata !{metadata !60, metadata !995}
!995 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !996} ; [ DW_TAG_pointer_type ]
!996 = metadata !{i32 786454, null, metadata !"zend_extension", metadata !983, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !982} ; [ DW_TAG_typedef ]
!997 = metadata !{i32 786445, metadata !982, metadata !"shutdown", metadata !983, i32 67, i64 64, i64 64, i64 384, i32 0, metadata !998} ; [ DW_TAG_member ]
!998 = metadata !{i32 786454, null, metadata !"shutdown_func_t", metadata !983, i32 44, i64 0, i64 0, i64 0, i32 0, metadata !999} ; [ DW_TAG_typedef ]
!999 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1000} ; [ DW_TAG_pointer_type ]
!1000 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1001, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1001 = metadata !{null, metadata !995}
!1002 = metadata !{i32 786445, metadata !982, metadata !"activate", metadata !983, i32 68, i64 64, i64 64, i64 448, i32 0, metadata !1003} ; [ DW_TAG_member ]
!1003 = metadata !{i32 786454, null, metadata !"activate_func_t", metadata !983, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !1004} ; [ DW_TAG_typedef ]
!1004 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !951} ; [ DW_TAG_pointer_type ]
!1005 = metadata !{i32 786445, metadata !982, metadata !"deactivate", metadata !983, i32 69, i64 64, i64 64, i64 512, i32 0, metadata !1006} ; [ DW_TAG_member ]
!1006 = metadata !{i32 786454, null, metadata !"deactivate_func_t", metadata !983, i32 46, i64 0, i64 0, i64 0, i32 0, metadata !1004} ; [ DW_TAG_typedef ]
!1007 = metadata !{i32 786445, metadata !982, metadata !"message_handler", metadata !983, i32 71, i64 64, i64 64, i64 576, i32 0, metadata !1008} ; [ DW_TAG_member ]
!1008 = metadata !{i32 786454, null, metadata !"message_handler_func_t", metadata !983, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !1009} ; [ DW_TAG_typedef ]
!1009 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1010} ; [ DW_TAG_pointer_type ]
!1010 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1011, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1011 = metadata !{null, metadata !60, metadata !82}
!1012 = metadata !{i32 786445, metadata !982, metadata !"op_array_handler", metadata !983, i32 73, i64 64, i64 64, i64 640, i32 0, metadata !1013} ; [ DW_TAG_member ]
!1013 = metadata !{i32 786454, null, metadata !"op_array_handler_func_t", metadata !983, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1014 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1015} ; [ DW_TAG_pointer_type ]
!1015 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1016, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1016 = metadata !{null, metadata !485}
!1017 = metadata !{i32 786445, metadata !982, metadata !"statement_handler", metadata !983, i32 75, i64 64, i64 64, i64 704, i32 0, metadata !1018} ; [ DW_TAG_member ]
!1018 = metadata !{i32 786454, null, metadata !"statement_handler_func_t", metadata !983, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1019 = metadata !{i32 786445, metadata !982, metadata !"fcall_begin_handler", metadata !983, i32 76, i64 64, i64 64, i64 768, i32 0, metadata !1020} ; [ DW_TAG_member ]
!1020 = metadata !{i32 786454, null, metadata !"fcall_begin_handler_func_t", metadata !983, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1021 = metadata !{i32 786445, metadata !982, metadata !"fcall_end_handler", metadata !983, i32 77, i64 64, i64 64, i64 832, i32 0, metadata !1022} ; [ DW_TAG_member ]
!1022 = metadata !{i32 786454, null, metadata !"fcall_end_handler_func_t", metadata !983, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1023 = metadata !{i32 786445, metadata !982, metadata !"op_array_ctor", metadata !983, i32 79, i64 64, i64 64, i64 896, i32 0, metadata !1024} ; [ DW_TAG_member ]
!1024 = metadata !{i32 786454, null, metadata !"op_array_ctor_func_t", metadata !983, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1025 = metadata !{i32 786445, metadata !982, metadata !"op_array_dtor", metadata !983, i32 80, i64 64, i64 64, i64 960, i32 0, metadata !1026} ; [ DW_TAG_member ]
!1026 = metadata !{i32 786454, null, metadata !"op_array_dtor_func_t", metadata !983, i32 57, i64 0, i64 0, i64 0, i32 0, metadata !1014} ; [ DW_TAG_typedef ]
!1027 = metadata !{i32 786445, metadata !982, metadata !"api_no_check", metadata !983, i32 82, i64 64, i64 64, i64 1024, i32 0, metadata !1028} ; [ DW_TAG_member ]
!1028 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1029} ; [ DW_TAG_pointer_type ]
!1029 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1030, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1030 = metadata !{metadata !60, metadata !60}
!1031 = metadata !{i32 786445, metadata !982, metadata !"build_id_check", metadata !983, i32 83, i64 64, i64 64, i64 1088, i32 0, metadata !1032} ; [ DW_TAG_member ]
!1032 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1033} ; [ DW_TAG_pointer_type ]
!1033 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1034, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1034 = metadata !{metadata !60, metadata !227}
!1035 = metadata !{i32 786445, metadata !982, metadata !"reserved3", metadata !983, i32 84, i64 64, i64 64, i64 1152, i32 0, metadata !82} ; [ DW_TAG_member ]
!1036 = metadata !{i32 786445, metadata !982, metadata !"reserved4", metadata !983, i32 85, i64 64, i64 64, i64 1216, i32 0, metadata !82} ; [ DW_TAG_member ]
!1037 = metadata !{i32 786445, metadata !982, metadata !"reserved5", metadata !983, i32 86, i64 64, i64 64, i64 1280, i32 0, metadata !82} ; [ DW_TAG_member ]
!1038 = metadata !{i32 786445, metadata !982, metadata !"reserved6", metadata !983, i32 87, i64 64, i64 64, i64 1344, i32 0, metadata !82} ; [ DW_TAG_member ]
!1039 = metadata !{i32 786445, metadata !982, metadata !"reserved7", metadata !983, i32 88, i64 64, i64 64, i64 1408, i32 0, metadata !82} ; [ DW_TAG_member ]
!1040 = metadata !{i32 786445, metadata !982, metadata !"reserved8", metadata !983, i32 89, i64 64, i64 64, i64 1472, i32 0, metadata !82} ; [ DW_TAG_member ]
!1041 = metadata !{i32 786445, metadata !982, metadata !"handle", metadata !983, i32 91, i64 64, i64 64, i64 1536, i32 0, metadata !82} ; [ DW_TAG_member ]
!1042 = metadata !{i32 786445, metadata !982, metadata !"resource_number", metadata !983, i32 92, i64 32, i64 32, i64 1600, i32 0, metadata !60} ; [ DW_TAG_member ]
!1043 = metadata !{metadata !1044}
!1044 = metadata !{metadata !1045, metadata !1046}
!1045 = metadata !{i32 786689, metadata !977, metadata !"ext", metadata !37, i32 16777459, metadata !980, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1046 = metadata !{i32 786689, metadata !977, metadata !"arg", metadata !37, i32 33554675, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1047 = metadata !{i32 786478, i32 0, metadata !37, metadata !"extension_name_cmp", metadata !"extension_name_cmp", metadata !"", metadata !37, i32 249, metadata !1048, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct._zend_llist_element**, %struct._zend_llist_element**)* @extension_name_cmp, null, null, metadata !1053, i32 250} ; [ DW_TAG_subprogram ]
!1048 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1049, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1049 = metadata !{metadata !60, metadata !1050, metadata !1050}
!1050 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1051} ; [ DW_TAG_pointer_type ]
!1051 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1052} ; [ DW_TAG_pointer_type ]
!1052 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !963} ; [ DW_TAG_const_type ]
!1053 = metadata !{metadata !1054}
!1054 = metadata !{metadata !1055, metadata !1056}
!1055 = metadata !{i32 786689, metadata !1047, metadata !"f", metadata !37, i32 16777465, metadata !1050, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1056 = metadata !{i32 786689, metadata !1047, metadata !"s", metadata !37, i32 33554681, metadata !1050, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1057 = metadata !{i32 786478, i32 0, metadata !37, metadata !"print_modules", metadata !"print_modules", metadata !"", metadata !37, i32 231, metadata !951, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1058, i32 232} ; [ DW_TAG_subprogram ]
!1058 = metadata !{metadata !1059}
!1059 = metadata !{metadata !1060, metadata !1062}
!1060 = metadata !{i32 786688, metadata !1061, metadata !"sorted_registry", metadata !37, i32 233, metadata !63, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1061 = metadata !{i32 786443, metadata !1057, i32 232, i32 1, metadata !37, i32 134} ; [ DW_TAG_lexical_block ]
!1062 = metadata !{i32 786688, metadata !1061, metadata !"tmp", metadata !37, i32 234, metadata !414, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1063 = metadata !{i32 786478, i32 0, metadata !37, metadata !"print_module_info", metadata !"print_module_info", metadata !"", metadata !37, i32 216, metadata !1064, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct._zend_module_entry*, i8*)* @print_module_info, null, null, metadata !1066, i32 217} ; [ DW_TAG_subprogram ]
!1064 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1065, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1065 = metadata !{metadata !60, metadata !413, metadata !82}
!1066 = metadata !{metadata !1067}
!1067 = metadata !{metadata !1068, metadata !1069}
!1068 = metadata !{i32 786689, metadata !1063, metadata !"module", metadata !37, i32 16777432, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1069 = metadata !{i32 786689, metadata !1063, metadata !"arg", metadata !37, i32 33554648, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1070 = metadata !{i32 786478, i32 0, metadata !37, metadata !"module_name_cmp", metadata !"module_name_cmp", metadata !"", metadata !37, i32 222, metadata !1071, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @module_name_cmp, null, null, metadata !1075, i32 223} ; [ DW_TAG_subprogram ]
!1071 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1072, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1072 = metadata !{metadata !60, metadata !1073, metadata !1073}
!1073 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1074} ; [ DW_TAG_pointer_type ]
!1074 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ]
!1075 = metadata !{metadata !1076}
!1076 = metadata !{metadata !1077, metadata !1078, metadata !1079, metadata !1081}
!1077 = metadata !{i32 786689, metadata !1070, metadata !"a", metadata !37, i32 16777438, metadata !1073, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1078 = metadata !{i32 786689, metadata !1070, metadata !"b", metadata !37, i32 33554654, metadata !1073, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1079 = metadata !{i32 786688, metadata !1080, metadata !"f", metadata !37, i32 224, metadata !75, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1080 = metadata !{i32 786443, metadata !1070, i32 223, i32 1, metadata !37, i32 136} ; [ DW_TAG_lexical_block ]
!1081 = metadata !{i32 786688, metadata !1080, metadata !"s", metadata !37, i32 225, metadata !75, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1082 = metadata !{i32 786478, i32 0, metadata !37, metadata !"init_request_info", metadata !"init_request_info", metadata !"", metadata !37, i32 1066, metadata !951, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1083, i32 1067} ; [ DW_TAG_subprogram ]
!1083 = metadata !{metadata !1084}
!1084 = metadata !{metadata !1085, metadata !1087, metadata !1088, metadata !1089, metadata !1091, metadata !1092, metadata !1093, metadata !1094, metadata !1095, metadata !1096, metadata !1144, metadata !1145, metadata !1146, metadata !1147, metadata !1148, metadata !1149, metadata !1150, metadata !1151, metadata !1152, metadata !1154, metadata !1155, metadata !1156, metadata !1159, metadata !1160, metadata !1161, metadata !1164, metadata !1166, metadata !1167, metadata !1168, metadata !1170, metadata !1171}
!1085 = metadata !{i32 786688, metadata !1086, metadata !"env_script_filename", metadata !37, i32 1068, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1086 = metadata !{i32 786443, metadata !1082, i32 1067, i32 1, metadata !37, i32 137} ; [ DW_TAG_lexical_block ]
!1087 = metadata !{i32 786688, metadata !1086, metadata !"env_path_translated", metadata !37, i32 1069, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1088 = metadata !{i32 786688, metadata !1086, metadata !"script_path_translated", metadata !37, i32 1070, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1089 = metadata !{i32 786688, metadata !1090, metadata !"auth", metadata !37, i32 1094, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1090 = metadata !{i32 786443, metadata !1086, i32 1093, i32 30, metadata !37, i32 139} ; [ DW_TAG_lexical_block ]
!1091 = metadata !{i32 786688, metadata !1090, metadata !"content_length", metadata !37, i32 1095, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1092 = metadata !{i32 786688, metadata !1090, metadata !"content_type", metadata !37, i32 1096, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1093 = metadata !{i32 786688, metadata !1090, metadata !"env_path_info", metadata !37, i32 1097, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1094 = metadata !{i32 786688, metadata !1090, metadata !"env_script_name", metadata !37, i32 1098, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1095 = metadata !{i32 786688, metadata !1090, metadata !"env_server_software", metadata !37, i32 1101, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1096 = metadata !{i32 786688, metadata !1097, metadata !"st", metadata !37, i32 1117, metadata !1098, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1097 = metadata !{i32 786443, metadata !1090, i32 1116, i32 27, metadata !37, i32 142} ; [ DW_TAG_lexical_block ]
!1098 = metadata !{i32 786451, null, metadata !"stat", metadata !1099, i32 122, i64 960, i64 64, i32 0, i32 0, null, metadata !1100, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1099 = metadata !{i32 786473, metadata !"/usr/include/sys/stat.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1100 = metadata !{metadata !1101, metadata !1105, metadata !1108, metadata !1112, metadata !1115, metadata !1118, metadata !1121, metadata !1122, metadata !1128, metadata !1129, metadata !1130, metadata !1132, metadata !1135, metadata !1138, metadata !1141, metadata !1142, metadata !1143}
!1101 = metadata !{i32 786445, metadata !1098, metadata !"st_dev", metadata !1099, i32 123, i64 32, i64 32, i64 0, i32 0, metadata !1102} ; [ DW_TAG_member ]
!1102 = metadata !{i32 786454, null, metadata !"__dev_t", metadata !1099, i32 93, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1103 = metadata !{i32 786454, null, metadata !"__uint32_t", metadata !1104, i32 56, i64 0, i64 0, i64 0, i32 0, metadata !69} ; [ DW_TAG_typedef ]
!1104 = metadata !{i32 786473, metadata !"/usr/include/sys/signal.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1105 = metadata !{i32 786445, metadata !1098, metadata !"st_ino", metadata !1099, i32 124, i64 32, i64 32, i64 32, i32 0, metadata !1106} ; [ DW_TAG_member ]
!1106 = metadata !{i32 786454, null, metadata !"ino_t", metadata !1099, i32 191, i64 0, i64 0, i64 0, i32 0, metadata !1107} ; [ DW_TAG_typedef ]
!1107 = metadata !{i32 786454, null, metadata !"__ino_t", metadata !1099, i32 47, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1108 = metadata !{i32 786445, metadata !1098, metadata !"st_mode", metadata !1099, i32 125, i64 16, i64 16, i64 64, i32 0, metadata !1109} ; [ DW_TAG_member ]
!1109 = metadata !{i32 786454, null, metadata !"mode_t", metadata !1099, i32 206, i64 0, i64 0, i64 0, i32 0, metadata !1110} ; [ DW_TAG_typedef ]
!1110 = metadata !{i32 786454, null, metadata !"__mode_t", metadata !1099, i32 50, i64 0, i64 0, i64 0, i32 0, metadata !1111} ; [ DW_TAG_typedef ]
!1111 = metadata !{i32 786454, null, metadata !"__uint16_t", metadata !1099, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !358} ; [ DW_TAG_typedef ]
!1112 = metadata !{i32 786445, metadata !1098, metadata !"st_nlink", metadata !1099, i32 126, i64 16, i64 16, i64 80, i32 0, metadata !1113} ; [ DW_TAG_member ]
!1113 = metadata !{i32 786454, null, metadata !"nlink_t", metadata !1099, i32 216, i64 0, i64 0, i64 0, i32 0, metadata !1114} ; [ DW_TAG_typedef ]
!1114 = metadata !{i32 786454, null, metadata !"__nlink_t", metadata !1099, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !1111} ; [ DW_TAG_typedef ]
!1115 = metadata !{i32 786445, metadata !1098, metadata !"st_uid", metadata !1099, i32 127, i64 32, i64 32, i64 96, i32 0, metadata !1116} ; [ DW_TAG_member ]
!1116 = metadata !{i32 786454, null, metadata !"uid_t", metadata !1099, i32 272, i64 0, i64 0, i64 0, i32 0, metadata !1117} ; [ DW_TAG_typedef ]
!1117 = metadata !{i32 786454, null, metadata !"__uid_t", metadata !1104, i32 64, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1118 = metadata !{i32 786445, metadata !1098, metadata !"st_gid", metadata !1099, i32 128, i64 32, i64 32, i64 128, i32 0, metadata !1119} ; [ DW_TAG_member ]
!1119 = metadata !{i32 786454, null, metadata !"gid_t", metadata !1099, i32 171, i64 0, i64 0, i64 0, i32 0, metadata !1120} ; [ DW_TAG_typedef ]
!1120 = metadata !{i32 786454, null, metadata !"__gid_t", metadata !1099, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1121 = metadata !{i32 786445, metadata !1098, metadata !"st_rdev", metadata !1099, i32 129, i64 32, i64 32, i64 160, i32 0, metadata !1102} ; [ DW_TAG_member ]
!1122 = metadata !{i32 786445, metadata !1098, metadata !"st_atim", metadata !1099, i32 130, i64 128, i64 64, i64 192, i32 0, metadata !1123} ; [ DW_TAG_member ]
!1123 = metadata !{i32 786451, null, metadata !"timespec", metadata !1124, i32 44, i64 128, i64 64, i32 0, i32 0, null, metadata !1125, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1124 = metadata !{i32 786473, metadata !"/usr/include/sys/_timespec.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1125 = metadata !{metadata !1126, metadata !1127}
!1126 = metadata !{i32 786445, metadata !1123, metadata !"tv_sec", metadata !1124, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !868} ; [ DW_TAG_member ]
!1127 = metadata !{i32 786445, metadata !1123, metadata !"tv_nsec", metadata !1124, i32 46, i64 64, i64 64, i64 64, i32 0, metadata !50} ; [ DW_TAG_member ]
!1128 = metadata !{i32 786445, metadata !1098, metadata !"st_mtim", metadata !1099, i32 131, i64 128, i64 64, i64 320, i32 0, metadata !1123} ; [ DW_TAG_member ]
!1129 = metadata !{i32 786445, metadata !1098, metadata !"st_ctim", metadata !1099, i32 132, i64 128, i64 64, i64 448, i32 0, metadata !1123} ; [ DW_TAG_member ]
!1130 = metadata !{i32 786445, metadata !1098, metadata !"st_size", metadata !1099, i32 133, i64 64, i64 64, i64 576, i32 0, metadata !1131} ; [ DW_TAG_member ]
!1131 = metadata !{i32 786454, null, metadata !"off_t", metadata !1099, i32 221, i64 0, i64 0, i64 0, i32 0, metadata !782} ; [ DW_TAG_typedef ]
!1132 = metadata !{i32 786445, metadata !1098, metadata !"st_blocks", metadata !1099, i32 134, i64 64, i64 64, i64 640, i32 0, metadata !1133} ; [ DW_TAG_member ]
!1133 = metadata !{i32 786454, null, metadata !"blkcnt_t", metadata !1099, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !1134} ; [ DW_TAG_typedef ]
!1134 = metadata !{i32 786454, null, metadata !"__blkcnt_t", metadata !1099, i32 39, i64 0, i64 0, i64 0, i32 0, metadata !783} ; [ DW_TAG_typedef ]
!1135 = metadata !{i32 786445, metadata !1098, metadata !"st_blksize", metadata !1099, i32 135, i64 32, i64 32, i64 704, i32 0, metadata !1136} ; [ DW_TAG_member ]
!1136 = metadata !{i32 786454, null, metadata !"blksize_t", metadata !1099, i32 123, i64 0, i64 0, i64 0, i32 0, metadata !1137} ; [ DW_TAG_typedef ]
!1137 = metadata !{i32 786454, null, metadata !"__blksize_t", metadata !1099, i32 38, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1138 = metadata !{i32 786445, metadata !1098, metadata !"st_flags", metadata !1099, i32 136, i64 32, i64 32, i64 736, i32 0, metadata !1139} ; [ DW_TAG_member ]
!1139 = metadata !{i32 786454, null, metadata !"fflags_t", metadata !1099, i32 158, i64 0, i64 0, i64 0, i32 0, metadata !1140} ; [ DW_TAG_typedef ]
!1140 = metadata !{i32 786454, null, metadata !"__fflags_t", metadata !1099, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !1103} ; [ DW_TAG_typedef ]
!1141 = metadata !{i32 786445, metadata !1098, metadata !"st_gen", metadata !1099, i32 137, i64 32, i64 32, i64 768, i32 0, metadata !1103} ; [ DW_TAG_member ]
!1142 = metadata !{i32 786445, metadata !1098, metadata !"st_lspare", metadata !1099, i32 138, i64 32, i64 32, i64 800, i32 0, metadata !907} ; [ DW_TAG_member ]
!1143 = metadata !{i32 786445, metadata !1098, metadata !"st_birthtim", metadata !1099, i32 139, i64 128, i64 64, i64 832, i32 0, metadata !1123} ; [ DW_TAG_member ]
!1144 = metadata !{i32 786688, metadata !1097, metadata !"real_path", metadata !37, i32 1118, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1145 = metadata !{i32 786688, metadata !1097, metadata !"env_redirect_url", metadata !37, i32 1119, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1146 = metadata !{i32 786688, metadata !1097, metadata !"env_document_root", metadata !37, i32 1120, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1147 = metadata !{i32 786688, metadata !1097, metadata !"orig_path_translated", metadata !37, i32 1121, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1148 = metadata !{i32 786688, metadata !1097, metadata !"orig_path_info", metadata !37, i32 1122, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1149 = metadata !{i32 786688, metadata !1097, metadata !"orig_script_name", metadata !37, i32 1123, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1150 = metadata !{i32 786688, metadata !1097, metadata !"orig_script_filename", metadata !37, i32 1124, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1151 = metadata !{i32 786688, metadata !1097, metadata !"script_path_translated_len", metadata !37, i32 1125, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1152 = metadata !{i32 786688, metadata !1153, metadata !"pt", metadata !37, i32 1165, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1153 = metadata !{i32 786443, metadata !1097, i32 1164, i32 6, metadata !37, i32 145} ; [ DW_TAG_lexical_block ]
!1154 = metadata !{i32 786688, metadata !1153, metadata !"len", metadata !37, i32 1166, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1155 = metadata !{i32 786688, metadata !1153, metadata !"ptr", metadata !37, i32 1167, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1156 = metadata !{i32 786688, metadata !1157, metadata !"slen", metadata !37, i32 1187, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1157 = metadata !{i32 786443, metadata !1158, i32 1171, i32 53, metadata !37, i32 147} ; [ DW_TAG_lexical_block ]
!1158 = metadata !{i32 786443, metadata !1153, i32 1169, i32 67, metadata !37, i32 146} ; [ DW_TAG_lexical_block ]
!1159 = metadata !{i32 786688, metadata !1157, metadata !"pilen", metadata !37, i32 1188, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1160 = metadata !{i32 786688, metadata !1157, metadata !"path_info", metadata !37, i32 1189, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1161 = metadata !{i32 786688, metadata !1162, metadata !"old", metadata !37, i32 1193, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1162 = metadata !{i32 786443, metadata !1163, i32 1192, i32 28, metadata !37, i32 149} ; [ DW_TAG_lexical_block ]
!1163 = metadata !{i32 786443, metadata !1157, i32 1191, i32 40, metadata !37, i32 148} ; [ DW_TAG_lexical_block ]
!1164 = metadata !{i32 786688, metadata !1165, metadata !"l", metadata !37, i32 1224, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1165 = metadata !{i32 786443, metadata !1157, i32 1223, i32 30, metadata !37, i32 155} ; [ DW_TAG_lexical_block ]
!1166 = metadata !{i32 786688, metadata !1165, metadata !"path_translated_len", metadata !37, i32 1225, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1167 = metadata !{i32 786688, metadata !1165, metadata !"path_translated", metadata !37, i32 1226, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1168 = metadata !{i32 786688, metadata !1169, metadata !"ptlen", metadata !37, i32 1254, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1169 = metadata !{i32 786443, metadata !1157, i32 1252, i32 9, metadata !37, i32 159} ; [ DW_TAG_lexical_block ]
!1170 = metadata !{i32 786688, metadata !1169, metadata !"path_translated_len", metadata !37, i32 1255, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1171 = metadata !{i32 786688, metadata !1169, metadata !"path_translated", metadata !37, i32 1256, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1172 = metadata !{i32 786478, i32 0, metadata !37, metadata !"is_valid_path", metadata !"is_valid_path", metadata !"", metadata !37, i32 970, metadata !1033, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1173, i32 971} ; [ DW_TAG_subprogram ]
!1173 = metadata !{metadata !1174}
!1174 = metadata !{metadata !1175, metadata !1176}
!1175 = metadata !{i32 786689, metadata !1172, metadata !"path", metadata !37, i32 16778186, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1176 = metadata !{i32 786688, metadata !1177, metadata !"p", metadata !37, i32 972, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1177 = metadata !{i32 786443, metadata !1172, i32 971, i32 1, metadata !37, i32 183} ; [ DW_TAG_lexical_block ]
!1178 = metadata !{i32 786478, i32 0, metadata !37, metadata !"_sapi_cgibin_putenv", metadata !"_sapi_cgibin_putenv", metadata !"", metadata !37, i32 525, metadata !1179, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*)* @_sapi_cgibin_putenv, null, null, metadata !1181, i32 526} ; [ DW_TAG_subprogram ]
!1179 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1180, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1180 = metadata !{metadata !57, metadata !57, metadata !57}
!1181 = metadata !{metadata !1182}
!1182 = metadata !{metadata !1183, metadata !1184, metadata !1185, metadata !1187}
!1183 = metadata !{i32 786689, metadata !1178, metadata !"name", metadata !37, i32 16777741, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1184 = metadata !{i32 786689, metadata !1178, metadata !"value", metadata !37, i32 33554957, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1185 = metadata !{i32 786688, metadata !1186, metadata !"name_len", metadata !37, i32 527, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1186 = metadata !{i32 786443, metadata !1178, i32 526, i32 1, metadata !37, i32 190} ; [ DW_TAG_lexical_block ]
!1187 = metadata !{i32 786688, metadata !1188, metadata !"request", metadata !37, i32 543, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1188 = metadata !{i32 786443, metadata !1186, i32 542, i32 25, metadata !37, i32 192} ; [ DW_TAG_lexical_block ]
!1189 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgibin_getenv", metadata !"sapi_cgibin_getenv", metadata !"", metadata !37, i32 510, metadata !1190, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i64)* @sapi_cgibin_getenv, null, null, metadata !1192, i32 511} ; [ DW_TAG_subprogram ]
!1190 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1191, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1191 = metadata !{metadata !57, metadata !57, metadata !417}
!1192 = metadata !{metadata !1193}
!1193 = metadata !{metadata !1194, metadata !1195, metadata !1196}
!1194 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1195 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1196 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1197 = metadata !{i32 786443, metadata !1198, i32 516, i32 25, metadata !37, i32 196} ; [ DW_TAG_lexical_block ]
!1198 = metadata !{i32 786443, metadata !1189, i32 511, i32 1, metadata !37, i32 195} ; [ DW_TAG_lexical_block ]
!1199 = metadata !{i32 786478, i32 0, metadata !37, metadata !"php_cgi_usage", metadata !"php_cgi_usage", metadata !"", metadata !37, i32 930, metadata !1200, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1202, i32 931} ; [ DW_TAG_subprogram ]
!1200 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1201, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1201 = metadata !{null, metadata !57}
!1202 = metadata !{metadata !1203}
!1203 = metadata !{metadata !1204, metadata !1205}
!1204 = metadata !{i32 786689, metadata !1199, metadata !"argv0", metadata !37, i32 16778146, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1205 = metadata !{i32 786688, metadata !1206, metadata !"prog", metadata !37, i32 932, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1206 = metadata !{i32 786443, metadata !1199, i32 931, i32 1, metadata !37, i32 197} ; [ DW_TAG_lexical_block ]
!1207 = metadata !{i32 786478, i32 0, metadata !1208, metadata !"__sbistype", metadata !"__sbistype", metadata !"", metadata !1208, i32 117, metadata !1209, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1212, i32 118} ; [ DW_TAG_subprogram ]
!1208 = metadata !{i32 786473, metadata !"/usr/include/_ctype.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1209 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1210, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1210 = metadata !{metadata !60, metadata !1211, metadata !73}
!1211 = metadata !{i32 786454, null, metadata !"__ct_rune_t", metadata !1208, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!1212 = metadata !{metadata !1213}
!1213 = metadata !{metadata !1214, metadata !1215}
!1214 = metadata !{i32 786689, metadata !1207, metadata !"_c", metadata !1208, i32 16777333, metadata !1211, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1215 = metadata !{i32 786689, metadata !1207, metadata !"_f", metadata !1208, i32 33554549, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1216 = metadata !{i32 786478, i32 0, metadata !1208, metadata !"__sbmaskrune", metadata !"__sbmaskrune", metadata !"", metadata !1208, i32 104, metadata !1209, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1217, i32 105} ; [ DW_TAG_subprogram ]
!1217 = metadata !{metadata !1218}
!1218 = metadata !{metadata !1219, metadata !1220}
!1219 = metadata !{i32 786689, metadata !1216, metadata !"_c", metadata !1208, i32 16777320, metadata !1211, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1220 = metadata !{i32 786689, metadata !1216, metadata !"_f", metadata !1208, i32 33554536, metadata !73, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1221 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_log_message", metadata !"sapi_cgi_log_message", metadata !"", metadata !37, i32 683, metadata !1200, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @sapi_cgi_log_message, null, null, metadata !1222, i32 684} ; [ DW_TAG_subprogram ]
!1222 = metadata !{metadata !1223}
!1223 = metadata !{metadata !1224, metadata !1225, metadata !1228, metadata !1230}
!1224 = metadata !{i32 786689, metadata !1221, metadata !"message", metadata !37, i32 16777899, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1225 = metadata !{i32 786688, metadata !1226, metadata !"request", metadata !37, i32 688, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1226 = metadata !{i32 786443, metadata !1227, i32 687, i32 47, metadata !37, i32 203} ; [ DW_TAG_lexical_block ]
!1227 = metadata !{i32 786443, metadata !1221, i32 684, i32 1, metadata !37, i32 202} ; [ DW_TAG_lexical_block ]
!1228 = metadata !{i32 786688, metadata !1229, metadata !"len", metadata !37, i32 692, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1229 = metadata !{i32 786443, metadata !1226, i32 691, i32 16, metadata !37, i32 204} ; [ DW_TAG_lexical_block ]
!1230 = metadata !{i32 786688, metadata !1229, metadata !"buf", metadata !37, i32 693, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1231 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_register_variables", metadata !"sapi_cgi_register_variables", metadata !"", metadata !37, i32 643, metadata !38, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._zval_struct*)* @sapi_cgi_register_variables, null, null, metadata !1232, i32 644} ; [ DW_TAG_subprogram ]
!1232 = metadata !{metadata !1233}
!1233 = metadata !{metadata !1234, metadata !1235, metadata !1237, metadata !1238, metadata !1240, metadata !1241, metadata !1242}
!1234 = metadata !{i32 786689, metadata !1231, metadata !"track_vars_array", metadata !37, i32 16777859, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1235 = metadata !{i32 786688, metadata !1236, metadata !"php_self_len", metadata !37, i32 645, metadata !69, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1236 = metadata !{i32 786443, metadata !1231, i32 644, i32 1, metadata !37, i32 207} ; [ DW_TAG_lexical_block ]
!1237 = metadata !{i32 786688, metadata !1236, metadata !"php_self", metadata !37, i32 646, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1238 = metadata !{i32 786688, metadata !1239, metadata !"script_name", metadata !37, i32 654, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1239 = metadata !{i32 786443, metadata !1236, i32 653, i32 26, metadata !37, i32 208} ; [ DW_TAG_lexical_block ]
!1240 = metadata !{i32 786688, metadata !1239, metadata !"script_name_len", metadata !37, i32 655, metadata !69, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1241 = metadata !{i32 786688, metadata !1239, metadata !"path_info", metadata !37, i32 656, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1242 = metadata !{i32 786688, metadata !1239, metadata !"path_info_len", metadata !37, i32 657, metadata !69, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1243 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_read_cookies", metadata !"sapi_cgi_read_cookies", metadata !"", metadata !37, i32 585, metadata !1244, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* ()* @sapi_cgi_read_cookies, null, null, metadata !1246, i32 586} ; [ DW_TAG_subprogram ]
!1244 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1245, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1245 = metadata !{metadata !57}
!1246 = metadata !{metadata !1247}
!1247 = metadata !{i32 786468}                    ; [ DW_TAG_base_type ]
!1248 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_read_post", metadata !"sapi_cgi_read_post", metadata !"", metadata !37, i32 489, metadata !1249, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @sapi_cgi_read_post, null, null, metadata !1251, i32 490} ; [ DW_TAG_subprogram ]
!1249 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1250, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1250 = metadata !{metadata !60, metadata !57, metadata !68}
!1251 = metadata !{metadata !1252}
!1252 = metadata !{metadata !1253, metadata !1254, metadata !1255, metadata !1257, metadata !1258}
!1253 = metadata !{i32 786689, metadata !1248, metadata !"buffer", metadata !37, i32 16777705, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1254 = metadata !{i32 786689, metadata !1248, metadata !"count_bytes", metadata !37, i32 33554921, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1255 = metadata !{i32 786688, metadata !1256, metadata !"read_bytes", metadata !37, i32 491, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1256 = metadata !{i32 786443, metadata !1248, i32 490, i32 1, metadata !37, i32 215} ; [ DW_TAG_lexical_block ]
!1257 = metadata !{i32 786688, metadata !1256, metadata !"tmp_read_bytes", metadata !37, i32 492, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1258 = metadata !{i32 786688, metadata !1259, metadata !"request", metadata !37, i32 497, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1259 = metadata !{i32 786443, metadata !1260, i32 496, i32 26, metadata !37, i32 217} ; [ DW_TAG_lexical_block ]
!1260 = metadata !{i32 786443, metadata !1256, i32 495, i32 35, metadata !37, i32 216} ; [ DW_TAG_lexical_block ]
!1261 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_send_headers", metadata !"sapi_cgi_send_headers", metadata !"", metadata !37, i32 383, metadata !1262, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.sapi_headers_struct*)* @sapi_cgi_send_headers, null, null, metadata !1273, i32 384} ; [ DW_TAG_subprogram ]
!1262 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1263, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1263 = metadata !{metadata !60, metadata !1264}
!1264 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1265} ; [ DW_TAG_pointer_type ]
!1265 = metadata !{i32 786454, null, metadata !"sapi_headers_struct", metadata !12, i32 63, i64 0, i64 0, i64 0, i32 0, metadata !1266} ; [ DW_TAG_typedef ]
!1266 = metadata !{i32 786451, null, metadata !"", metadata !12, i32 57, i64 640, i64 64, i32 0, i32 0, null, metadata !1267, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1267 = metadata !{metadata !1268, metadata !1269, metadata !1270, metadata !1271, metadata !1272}
!1268 = metadata !{i32 786445, metadata !1266, metadata !"headers", metadata !12, i32 58, i64 448, i64 64, i64 0, i32 0, metadata !957} ; [ DW_TAG_member ]
!1269 = metadata !{i32 786445, metadata !1266, metadata !"http_response_code", metadata !12, i32 59, i64 32, i64 32, i64 448, i32 0, metadata !60} ; [ DW_TAG_member ]
!1270 = metadata !{i32 786445, metadata !1266, metadata !"send_default_content_type", metadata !12, i32 60, i64 8, i64 8, i64 480, i32 0, metadata !104} ; [ DW_TAG_member ]
!1271 = metadata !{i32 786445, metadata !1266, metadata !"mimetype", metadata !12, i32 61, i64 64, i64 64, i64 512, i32 0, metadata !57} ; [ DW_TAG_member ]
!1272 = metadata !{i32 786445, metadata !1266, metadata !"http_status_line", metadata !12, i32 62, i64 64, i64 64, i64 576, i32 0, metadata !57} ; [ DW_TAG_member ]
!1273 = metadata !{metadata !1274}
!1274 = metadata !{metadata !1275, metadata !1276, metadata !1281, metadata !1288, metadata !1290, metadata !1291, metadata !1292, metadata !1294, metadata !1295, metadata !1297, metadata !1299}
!1275 = metadata !{i32 786689, metadata !1261, metadata !"sapi_headers", metadata !37, i32 16777599, metadata !1264, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1276 = metadata !{i32 786688, metadata !1277, metadata !"buf", metadata !37, i32 385, metadata !1278, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1277 = metadata !{i32 786443, metadata !1261, i32 384, i32 1, metadata !37, i32 220} ; [ DW_TAG_lexical_block ]
!1278 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 8, i32 0, i32 0, metadata !58, metadata !1279, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1279 = metadata !{metadata !1280}
!1280 = metadata !{i32 786465, i64 0, i64 1023}   ; [ DW_TAG_subrange_type ]
!1281 = metadata !{i32 786688, metadata !1277, metadata !"h", metadata !37, i32 386, metadata !1282, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1282 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1283} ; [ DW_TAG_pointer_type ]
!1283 = metadata !{i32 786454, null, metadata !"sapi_header_struct", metadata !12, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !1284} ; [ DW_TAG_typedef ]
!1284 = metadata !{i32 786451, null, metadata !"", metadata !12, i32 51, i64 128, i64 64, i32 0, i32 0, null, metadata !1285, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1285 = metadata !{metadata !1286, metadata !1287}
!1286 = metadata !{i32 786445, metadata !1284, metadata !"header", metadata !12, i32 52, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!1287 = metadata !{i32 786445, metadata !1284, metadata !"header_len", metadata !12, i32 53, i64 32, i64 32, i64 64, i32 0, metadata !68} ; [ DW_TAG_member ]
!1288 = metadata !{i32 786688, metadata !1277, metadata !"pos", metadata !37, i32 387, metadata !1289, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1289 = metadata !{i32 786454, null, metadata !"zend_llist_position", metadata !37, i32 47, i64 0, i64 0, i64 0, i32 0, metadata !962} ; [ DW_TAG_typedef ]
!1290 = metadata !{i32 786688, metadata !1277, metadata !"ignore_status", metadata !37, i32 388, metadata !103, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1291 = metadata !{i32 786688, metadata !1277, metadata !"response_status", metadata !37, i32 389, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1292 = metadata !{i32 786688, metadata !1293, metadata !"len", metadata !37, i32 397, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1293 = metadata !{i32 786443, metadata !1277, i32 396, i32 2, metadata !37, i32 222} ; [ DW_TAG_lexical_block ]
!1294 = metadata !{i32 786688, metadata !1293, metadata !"has_status", metadata !37, i32 398, metadata !103, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1295 = metadata !{i32 786688, metadata !1296, metadata !"s", metadata !37, i32 401, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1296 = metadata !{i32 786443, metadata !1293, i32 400, i32 67, metadata !37, i32 223} ; [ DW_TAG_lexical_block ]
!1297 = metadata !{i32 786688, metadata !1298, metadata !"s", metadata !37, i32 412, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1298 = metadata !{i32 786443, metadata !1293, i32 411, i32 10, metadata !37, i32 226} ; [ DW_TAG_lexical_block ]
!1299 = metadata !{i32 786688, metadata !1300, metadata !"err", metadata !37, i32 433, metadata !1302, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1300 = metadata !{i32 786443, metadata !1301, i32 432, i32 22, metadata !37, i32 231} ; [ DW_TAG_lexical_block ]
!1301 = metadata !{i32 786443, metadata !1298, i32 421, i32 11, metadata !37, i32 228} ; [ DW_TAG_lexical_block ]
!1302 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1303} ; [ DW_TAG_pointer_type ]
!1303 = metadata !{i32 786454, null, metadata !"http_error", metadata !37, i32 340, i64 0, i64 0, i64 0, i32 0, metadata !1304} ; [ DW_TAG_typedef ]
!1304 = metadata !{i32 786451, null, metadata !"_http_error", metadata !37, i32 337, i64 128, i64 64, i32 0, i32 0, null, metadata !1305, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1305 = metadata !{metadata !1306, metadata !1307}
!1306 = metadata !{i32 786445, metadata !1304, metadata !"code", metadata !37, i32 338, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1307 = metadata !{i32 786445, metadata !1304, metadata !"msg", metadata !37, i32 339, i64 64, i64 64, i64 64, i32 0, metadata !227} ; [ DW_TAG_member ]
!1308 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgibin_flush", metadata !"sapi_cgibin_flush", metadata !"", metadata !37, i32 317, metadata !100, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i8*)* @sapi_cgibin_flush, null, null, metadata !1309, i32 318} ; [ DW_TAG_subprogram ]
!1309 = metadata !{metadata !1310}
!1310 = metadata !{metadata !1311, metadata !1312}
!1311 = metadata !{i32 786689, metadata !1308, metadata !"server_context", metadata !37, i32 16777533, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1312 = metadata !{i32 786688, metadata !1313, metadata !"request", metadata !37, i32 320, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1313 = metadata !{i32 786443, metadata !1314, i32 319, i32 25, metadata !37, i32 244} ; [ DW_TAG_lexical_block ]
!1314 = metadata !{i32 786443, metadata !1308, i32 318, i32 1, metadata !37, i32 243} ; [ DW_TAG_lexical_block ]
!1315 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgibin_ub_write", metadata !"sapi_cgibin_ub_write", metadata !"", metadata !37, i32 297, metadata !1316, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32)* @sapi_cgibin_ub_write, null, null, metadata !1318, i32 298} ; [ DW_TAG_subprogram ]
!1316 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1317, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1317 = metadata !{metadata !60, metadata !227, metadata !68}
!1318 = metadata !{metadata !1319}
!1319 = metadata !{metadata !1320, metadata !1321, metadata !1322, metadata !1324, metadata !1325}
!1320 = metadata !{i32 786689, metadata !1315, metadata !"str", metadata !37, i32 16777513, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1321 = metadata !{i32 786689, metadata !1315, metadata !"str_length", metadata !37, i32 33554729, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1322 = metadata !{i32 786688, metadata !1323, metadata !"ptr", metadata !37, i32 299, metadata !227, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1323 = metadata !{i32 786443, metadata !1315, i32 298, i32 1, metadata !37, i32 247} ; [ DW_TAG_lexical_block ]
!1324 = metadata !{i32 786688, metadata !1323, metadata !"remaining", metadata !37, i32 300, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1325 = metadata !{i32 786688, metadata !1323, metadata !"ret", metadata !37, i32 301, metadata !417, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1326 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgibin_single_write", metadata !"sapi_cgibin_single_write", metadata !"", metadata !37, i32 270, metadata !1327, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1329, i32 271} ; [ DW_TAG_subprogram ]
!1327 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1328, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1328 = metadata !{metadata !417, metadata !227, metadata !68}
!1329 = metadata !{metadata !1330}
!1330 = metadata !{metadata !1331, metadata !1332, metadata !1333, metadata !1335, metadata !1337}
!1331 = metadata !{i32 786689, metadata !1326, metadata !"str", metadata !37, i32 16777486, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1332 = metadata !{i32 786689, metadata !1326, metadata !"str_length", metadata !37, i32 33554702, metadata !68, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1333 = metadata !{i32 786688, metadata !1334, metadata !"ret", metadata !37, i32 273, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1334 = metadata !{i32 786443, metadata !1326, i32 271, i32 1, metadata !37, i32 250} ; [ DW_TAG_lexical_block ]
!1335 = metadata !{i32 786688, metadata !1336, metadata !"request", metadata !37, i32 279, metadata !674, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1336 = metadata !{i32 786443, metadata !1334, i32 278, i32 25, metadata !37, i32 251} ; [ DW_TAG_lexical_block ]
!1337 = metadata !{i32 786688, metadata !1336, metadata !"ret", metadata !37, i32 280, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1338 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_deactivate", metadata !"sapi_cgi_deactivate", metadata !"", metadata !37, i32 852, metadata !425, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @sapi_cgi_deactivate, null, null, metadata !1246, i32 853} ; [ DW_TAG_subprogram ]
!1339 = metadata !{i32 786478, i32 0, metadata !37, metadata !"sapi_cgi_activate", metadata !"sapi_cgi_activate", metadata !"", metadata !37, i32 781, metadata !425, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @sapi_cgi_activate, null, null, metadata !1340, i32 782} ; [ DW_TAG_subprogram ]
!1340 = metadata !{metadata !1341}
!1341 = metadata !{metadata !1342, metadata !1344, metadata !1345, metadata !1346, metadata !1347, metadata !1348}
!1342 = metadata !{i32 786688, metadata !1343, metadata !"path", metadata !37, i32 783, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1343 = metadata !{i32 786443, metadata !1339, i32 782, i32 1, metadata !37, i32 258} ; [ DW_TAG_lexical_block ]
!1344 = metadata !{i32 786688, metadata !1343, metadata !"doc_root", metadata !37, i32 783, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1345 = metadata !{i32 786688, metadata !1343, metadata !"server_name", metadata !37, i32 783, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1346 = metadata !{i32 786688, metadata !1343, metadata !"path_len", metadata !37, i32 784, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1347 = metadata !{i32 786688, metadata !1343, metadata !"doc_root_len", metadata !37, i32 784, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1348 = metadata !{i32 786688, metadata !1343, metadata !"server_name_len", metadata !37, i32 784, metadata !68, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1349 = metadata !{i32 786478, i32 0, metadata !37, metadata !"php_cgi_ini_activate_user_config", metadata !"php_cgi_ini_activate_user_config", metadata !"", metadata !37, i32 710, metadata !1350, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1352, i32 711} ; [ DW_TAG_subprogram ]
!1350 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1351, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1351 = metadata !{null, metadata !57, metadata !60, metadata !227, metadata !60, metadata !60}
!1352 = metadata !{metadata !1353}
!1353 = metadata !{metadata !1354, metadata !1355, metadata !1356, metadata !1357, metadata !1358, metadata !1359, metadata !1361, metadata !1368, metadata !1369, metadata !1370, metadata !1372, metadata !1373, metadata !1374, metadata !1375}
!1354 = metadata !{i32 786689, metadata !1349, metadata !"path", metadata !37, i32 16777926, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1355 = metadata !{i32 786689, metadata !1349, metadata !"path_len", metadata !37, i32 33555142, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1356 = metadata !{i32 786689, metadata !1349, metadata !"doc_root", metadata !37, i32 50332358, metadata !227, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1357 = metadata !{i32 786689, metadata !1349, metadata !"doc_root_len", metadata !37, i32 67109574, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1358 = metadata !{i32 786689, metadata !1349, metadata !"start", metadata !37, i32 83886790, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1359 = metadata !{i32 786688, metadata !1360, metadata !"ptr", metadata !37, i32 712, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1360 = metadata !{i32 786443, metadata !1349, i32 711, i32 1, metadata !37, i32 268} ; [ DW_TAG_lexical_block ]
!1361 = metadata !{i32 786688, metadata !1360, metadata !"new_entry", metadata !37, i32 713, metadata !1362, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1362 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1363} ; [ DW_TAG_pointer_type ]
!1363 = metadata !{i32 786454, null, metadata !"user_config_cache_entry", metadata !37, i32 186, i64 0, i64 0, i64 0, i32 0, metadata !1364} ; [ DW_TAG_typedef ]
!1364 = metadata !{i32 786451, null, metadata !"_user_config_cache_entry", metadata !37, i32 183, i64 128, i64 64, i32 0, i32 0, null, metadata !1365, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1365 = metadata !{metadata !1366, metadata !1367}
!1366 = metadata !{i32 786445, metadata !1364, metadata !"expires", metadata !37, i32 184, i64 64, i64 64, i64 0, i32 0, metadata !868} ; [ DW_TAG_member ]
!1367 = metadata !{i32 786445, metadata !1364, metadata !"user_config", metadata !37, i32 185, i64 64, i64 64, i64 64, i32 0, metadata !62} ; [ DW_TAG_member ]
!1368 = metadata !{i32 786688, metadata !1360, metadata !"entry", metadata !37, i32 713, metadata !1362, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1369 = metadata !{i32 786688, metadata !1360, metadata !"request_time", metadata !37, i32 714, metadata !868, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1370 = metadata !{i32 786688, metadata !1371, metadata !"real_path", metadata !37, i32 728, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1371 = metadata !{i32 786443, metadata !1360, i32 727, i32 37, metadata !37, i32 270} ; [ DW_TAG_lexical_block ]
!1372 = metadata !{i32 786688, metadata !1371, metadata !"real_path_len", metadata !37, i32 729, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1373 = metadata !{i32 786688, metadata !1371, metadata !"s1", metadata !37, i32 730, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1374 = metadata !{i32 786688, metadata !1371, metadata !"s2", metadata !37, i32 730, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1375 = metadata !{i32 786688, metadata !1371, metadata !"s_len", metadata !37, i32 731, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1376 = metadata !{i32 786478, i32 0, metadata !1377, metadata !"__zend_malloc", metadata !"__zend_malloc", metadata !"", metadata !1377, i32 93, metadata !1378, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1380, i32 94} ; [ DW_TAG_subprogram ]
!1377 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_alloc.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1378 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1379, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1379 = metadata !{metadata !82, metadata !417}
!1380 = metadata !{metadata !1381}
!1381 = metadata !{metadata !1382, metadata !1383}
!1382 = metadata !{i32 786689, metadata !1376, metadata !"len", metadata !1377, i32 16777309, metadata !417, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1383 = metadata !{i32 786688, metadata !1384, metadata !"tmp", metadata !1377, i32 95, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!1384 = metadata !{i32 786443, metadata !1376, i32 94, i32 1, metadata !1377, i32 277} ; [ DW_TAG_lexical_block ]
!1385 = metadata !{i32 786478, i32 0, metadata !37, metadata !"php_cgi_startup", metadata !"php_cgi_startup", metadata !"", metadata !37, i32 874, metadata !1386, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct._sapi_module_struct*)* @php_cgi_startup, null, null, metadata !1485, i32 875} ; [ DW_TAG_subprogram ]
!1386 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1387, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1387 = metadata !{metadata !60, metadata !1388}
!1388 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1389} ; [ DW_TAG_pointer_type ]
!1389 = metadata !{i32 786454, null, metadata !"sapi_module_struct", metadata !37, i32 67, i64 0, i64 0, i64 0, i32 0, metadata !1390} ; [ DW_TAG_typedef ]
!1390 = metadata !{i32 786451, null, metadata !"_sapi_module_struct", metadata !12, i32 215, i64 2368, i64 64, i32 0, i32 0, null, metadata !1391, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1391 = metadata !{metadata !1392, metadata !1393, metadata !1394, metadata !1399, metadata !1400, metadata !1401, metadata !1402, metadata !1406, metadata !1407, metadata !1412, metadata !1414, metadata !1418, metadata !1423, metadata !1425, metadata !1429, metadata !1431, metadata !1433, metadata !1434, metadata !1436, metadata !1440, metadata !1441, metadata !1442, metadata !1443, metadata !1444, metadata !1445, metadata !1449, metadata !1450, metadata !1451, metadata !1455, metadata !1456, metadata !1461, metadata !1466, metadata !1471, metadata !1475, metadata !1476, metadata !1477, metadata !1481}
!1392 = metadata !{i32 786445, metadata !1390, metadata !"name", metadata !12, i32 216, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!1393 = metadata !{i32 786445, metadata !1390, metadata !"pretty_name", metadata !12, i32 217, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!1394 = metadata !{i32 786445, metadata !1390, metadata !"startup", metadata !12, i32 219, i64 64, i64 64, i64 128, i32 0, metadata !1395} ; [ DW_TAG_member ]
!1395 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1396} ; [ DW_TAG_pointer_type ]
!1396 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1397, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1397 = metadata !{metadata !60, metadata !1398}
!1398 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1390} ; [ DW_TAG_pointer_type ]
!1399 = metadata !{i32 786445, metadata !1390, metadata !"shutdown", metadata !12, i32 220, i64 64, i64 64, i64 192, i32 0, metadata !1395} ; [ DW_TAG_member ]
!1400 = metadata !{i32 786445, metadata !1390, metadata !"activate", metadata !12, i32 222, i64 64, i64 64, i64 256, i32 0, metadata !424} ; [ DW_TAG_member ]
!1401 = metadata !{i32 786445, metadata !1390, metadata !"deactivate", metadata !12, i32 223, i64 64, i64 64, i64 320, i32 0, metadata !424} ; [ DW_TAG_member ]
!1402 = metadata !{i32 786445, metadata !1390, metadata !"ub_write", metadata !12, i32 225, i64 64, i64 64, i64 384, i32 0, metadata !1403} ; [ DW_TAG_member ]
!1403 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1404} ; [ DW_TAG_pointer_type ]
!1404 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1405, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1405 = metadata !{metadata !60, metadata !227, metadata !69}
!1406 = metadata !{i32 786445, metadata !1390, metadata !"flush", metadata !12, i32 226, i64 64, i64 64, i64 448, i32 0, metadata !99} ; [ DW_TAG_member ]
!1407 = metadata !{i32 786445, metadata !1390, metadata !"get_stat", metadata !12, i32 227, i64 64, i64 64, i64 512, i32 0, metadata !1408} ; [ DW_TAG_member ]
!1408 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1409} ; [ DW_TAG_pointer_type ]
!1409 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1410, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1410 = metadata !{metadata !1411}
!1411 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1098} ; [ DW_TAG_pointer_type ]
!1412 = metadata !{i32 786445, metadata !1390, metadata !"getenv", metadata !12, i32 228, i64 64, i64 64, i64 576, i32 0, metadata !1413} ; [ DW_TAG_member ]
!1413 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1190} ; [ DW_TAG_pointer_type ]
!1414 = metadata !{i32 786445, metadata !1390, metadata !"sapi_error", metadata !12, i32 230, i64 64, i64 64, i64 640, i32 0, metadata !1415} ; [ DW_TAG_member ]
!1415 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1416} ; [ DW_TAG_pointer_type ]
!1416 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1417, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1417 = metadata !{null, metadata !60, metadata !227}
!1418 = metadata !{i32 786445, metadata !1390, metadata !"header_handler", metadata !12, i32 232, i64 64, i64 64, i64 704, i32 0, metadata !1419} ; [ DW_TAG_member ]
!1419 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1420} ; [ DW_TAG_pointer_type ]
!1420 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1421, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1421 = metadata !{metadata !60, metadata !1282, metadata !1422, metadata !1264}
!1422 = metadata !{i32 786454, null, metadata !"sapi_header_op_enum", metadata !12, i32 176, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!1423 = metadata !{i32 786445, metadata !1390, metadata !"send_headers", metadata !12, i32 233, i64 64, i64 64, i64 768, i32 0, metadata !1424} ; [ DW_TAG_member ]
!1424 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1262} ; [ DW_TAG_pointer_type ]
!1425 = metadata !{i32 786445, metadata !1390, metadata !"send_header", metadata !12, i32 234, i64 64, i64 64, i64 832, i32 0, metadata !1426} ; [ DW_TAG_member ]
!1426 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1427} ; [ DW_TAG_pointer_type ]
!1427 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1428, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1428 = metadata !{null, metadata !1282, metadata !82}
!1429 = metadata !{i32 786445, metadata !1390, metadata !"read_post", metadata !12, i32 236, i64 64, i64 64, i64 896, i32 0, metadata !1430} ; [ DW_TAG_member ]
!1430 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1249} ; [ DW_TAG_pointer_type ]
!1431 = metadata !{i32 786445, metadata !1390, metadata !"read_cookies", metadata !12, i32 237, i64 64, i64 64, i64 960, i32 0, metadata !1432} ; [ DW_TAG_member ]
!1432 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1244} ; [ DW_TAG_pointer_type ]
!1433 = metadata !{i32 786445, metadata !1390, metadata !"register_server_variables", metadata !12, i32 239, i64 64, i64 64, i64 1024, i32 0, metadata !122} ; [ DW_TAG_member ]
!1434 = metadata !{i32 786445, metadata !1390, metadata !"log_message", metadata !12, i32 240, i64 64, i64 64, i64 1088, i32 0, metadata !1435} ; [ DW_TAG_member ]
!1435 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1200} ; [ DW_TAG_pointer_type ]
!1436 = metadata !{i32 786445, metadata !1390, metadata !"get_request_time", metadata !12, i32 241, i64 64, i64 64, i64 1152, i32 0, metadata !1437} ; [ DW_TAG_member ]
!1437 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1438} ; [ DW_TAG_pointer_type ]
!1438 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1439, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1439 = metadata !{metadata !868}
!1440 = metadata !{i32 786445, metadata !1390, metadata !"terminate_process", metadata !12, i32 242, i64 64, i64 64, i64 1216, i32 0, metadata !1004} ; [ DW_TAG_member ]
!1441 = metadata !{i32 786445, metadata !1390, metadata !"php_ini_path_override", metadata !12, i32 244, i64 64, i64 64, i64 1280, i32 0, metadata !57} ; [ DW_TAG_member ]
!1442 = metadata !{i32 786445, metadata !1390, metadata !"block_interruptions", metadata !12, i32 246, i64 64, i64 64, i64 1344, i32 0, metadata !1004} ; [ DW_TAG_member ]
!1443 = metadata !{i32 786445, metadata !1390, metadata !"unblock_interruptions", metadata !12, i32 247, i64 64, i64 64, i64 1408, i32 0, metadata !1004} ; [ DW_TAG_member ]
!1444 = metadata !{i32 786445, metadata !1390, metadata !"default_post_reader", metadata !12, i32 249, i64 64, i64 64, i64 1472, i32 0, metadata !1004} ; [ DW_TAG_member ]
!1445 = metadata !{i32 786445, metadata !1390, metadata !"treat_data", metadata !12, i32 250, i64 64, i64 64, i64 1536, i32 0, metadata !1446} ; [ DW_TAG_member ]
!1446 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1447} ; [ DW_TAG_pointer_type ]
!1447 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1448, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1448 = metadata !{null, metadata !60, metadata !57, metadata !40}
!1449 = metadata !{i32 786445, metadata !1390, metadata !"executable_location", metadata !12, i32 251, i64 64, i64 64, i64 1600, i32 0, metadata !57} ; [ DW_TAG_member ]
!1450 = metadata !{i32 786445, metadata !1390, metadata !"php_ini_ignore", metadata !12, i32 253, i64 32, i64 32, i64 1664, i32 0, metadata !60} ; [ DW_TAG_member ]
!1451 = metadata !{i32 786445, metadata !1390, metadata !"get_fd", metadata !12, i32 255, i64 64, i64 64, i64 1728, i32 0, metadata !1452} ; [ DW_TAG_member ]
!1452 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1453} ; [ DW_TAG_pointer_type ]
!1453 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1454, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1454 = metadata !{metadata !60, metadata !658}
!1455 = metadata !{i32 786445, metadata !1390, metadata !"force_http_10", metadata !12, i32 257, i64 64, i64 64, i64 1792, i32 0, metadata !424} ; [ DW_TAG_member ]
!1456 = metadata !{i32 786445, metadata !1390, metadata !"get_target_uid", metadata !12, i32 259, i64 64, i64 64, i64 1856, i32 0, metadata !1457} ; [ DW_TAG_member ]
!1457 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1458} ; [ DW_TAG_pointer_type ]
!1458 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1459, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1459 = metadata !{metadata !60, metadata !1460}
!1460 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1116} ; [ DW_TAG_pointer_type ]
!1461 = metadata !{i32 786445, metadata !1390, metadata !"get_target_gid", metadata !12, i32 260, i64 64, i64 64, i64 1920, i32 0, metadata !1462} ; [ DW_TAG_member ]
!1462 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1463} ; [ DW_TAG_pointer_type ]
!1463 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1464, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1464 = metadata !{metadata !60, metadata !1465}
!1465 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1119} ; [ DW_TAG_pointer_type ]
!1466 = metadata !{i32 786445, metadata !1390, metadata !"input_filter", metadata !12, i32 262, i64 64, i64 64, i64 1984, i32 0, metadata !1467} ; [ DW_TAG_member ]
!1467 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1468} ; [ DW_TAG_pointer_type ]
!1468 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1469, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1469 = metadata !{metadata !69, metadata !60, metadata !57, metadata !295, metadata !69, metadata !1470}
!1470 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ]
!1471 = metadata !{i32 786445, metadata !1390, metadata !"ini_defaults", metadata !12, i32 264, i64 64, i64 64, i64 2048, i32 0, metadata !1472} ; [ DW_TAG_member ]
!1472 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1473} ; [ DW_TAG_pointer_type ]
!1473 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1474, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1474 = metadata !{null, metadata !62}
!1475 = metadata !{i32 786445, metadata !1390, metadata !"phpinfo_as_text", metadata !12, i32 265, i64 32, i64 32, i64 2112, i32 0, metadata !60} ; [ DW_TAG_member ]
!1476 = metadata !{i32 786445, metadata !1390, metadata !"ini_entries", metadata !12, i32 267, i64 64, i64 64, i64 2176, i32 0, metadata !57} ; [ DW_TAG_member ]
!1477 = metadata !{i32 786445, metadata !1390, metadata !"additional_functions", metadata !12, i32 268, i64 64, i64 64, i64 2240, i32 0, metadata !1478} ; [ DW_TAG_member ]
!1478 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1479} ; [ DW_TAG_pointer_type ]
!1479 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1480} ; [ DW_TAG_const_type ]
!1480 = metadata !{i32 786454, null, metadata !"zend_function_entry", metadata !37, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !223} ; [ DW_TAG_typedef ]
!1481 = metadata !{i32 786445, metadata !1390, metadata !"input_filter_init", metadata !12, i32 269, i64 64, i64 64, i64 2304, i32 0, metadata !1482} ; [ DW_TAG_member ]
!1482 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1483} ; [ DW_TAG_pointer_type ]
!1483 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1484, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1484 = metadata !{metadata !69}
!1485 = metadata !{metadata !1486}
!1486 = metadata !{metadata !1487}
!1487 = metadata !{i32 786689, metadata !1385, metadata !"sapi_module", metadata !37, i32 16778090, metadata !1388, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1488 = metadata !{i32 786478, i32 0, metadata !37, metadata !"zm_info_cgi", metadata !"zm_info_cgi", metadata !"", metadata !37, i32 1441, metadata !411, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._zend_module_entry*)* @zm_info_cgi, null, null, metadata !1489, i32 1442} ; [ DW_TAG_subprogram ]
!1489 = metadata !{metadata !1490}
!1490 = metadata !{metadata !1491}
!1491 = metadata !{i32 786689, metadata !1488, metadata !"zend_module", metadata !37, i32 16778657, metadata !413, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1492 = metadata !{i32 786478, i32 0, metadata !37, metadata !"zm_shutdown_cgi", metadata !"zm_shutdown_cgi", metadata !"", metadata !37, i32 1430, metadata !404, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @zm_shutdown_cgi, null, null, metadata !1493, i32 1431} ; [ DW_TAG_subprogram ]
!1493 = metadata !{metadata !1494}
!1494 = metadata !{metadata !1495, metadata !1496}
!1495 = metadata !{i32 786689, metadata !1492, metadata !"type", metadata !37, i32 16778646, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1496 = metadata !{i32 786689, metadata !1492, metadata !"module_number", metadata !37, i32 33555862, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1497 = metadata !{i32 786478, i32 0, metadata !37, metadata !"zm_startup_cgi", metadata !"zm_startup_cgi", metadata !"", metadata !37, i32 1416, metadata !404, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32)* @zm_startup_cgi, null, null, metadata !1498, i32 1417} ; [ DW_TAG_subprogram ]
!1498 = metadata !{metadata !1499}
!1499 = metadata !{metadata !1500, metadata !1501}
!1500 = metadata !{i32 786689, metadata !1497, metadata !"type", metadata !37, i32 16778632, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1501 = metadata !{i32 786689, metadata !1497, metadata !"module_number", metadata !37, i32 33555848, metadata !60, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1502 = metadata !{i32 786478, i32 0, metadata !37, metadata !"php_cgi_globals_ctor", metadata !"php_cgi_globals_ctor", metadata !"", metadata !37, i32 1397, metadata !1503, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1518, i32 1398} ; [ DW_TAG_subprogram ]
!1503 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1504, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1504 = metadata !{null, metadata !1505}
!1505 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1506} ; [ DW_TAG_pointer_type ]
!1506 = metadata !{i32 786454, null, metadata !"php_cgi_globals_struct", metadata !37, i32 172, i64 0, i64 0, i64 0, i32 0, metadata !1507} ; [ DW_TAG_typedef ]
!1507 = metadata !{i32 786451, null, metadata !"_php_cgi_globals_struct", metadata !37, i32 159, i64 704, i64 64, i32 0, i32 0, null, metadata !1508, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1508 = metadata !{metadata !1509, metadata !1510, metadata !1511, metadata !1512, metadata !1513, metadata !1514, metadata !1515, metadata !1516, metadata !1517}
!1509 = metadata !{i32 786445, metadata !1507, metadata !"rfc2616_headers", metadata !37, i32 160, i64 8, i64 8, i64 0, i32 0, metadata !103} ; [ DW_TAG_member ]
!1510 = metadata !{i32 786445, metadata !1507, metadata !"nph", metadata !37, i32 161, i64 8, i64 8, i64 8, i32 0, metadata !103} ; [ DW_TAG_member ]
!1511 = metadata !{i32 786445, metadata !1507, metadata !"check_shebang_line", metadata !37, i32 162, i64 8, i64 8, i64 16, i32 0, metadata !103} ; [ DW_TAG_member ]
!1512 = metadata !{i32 786445, metadata !1507, metadata !"fix_pathinfo", metadata !37, i32 163, i64 8, i64 8, i64 24, i32 0, metadata !103} ; [ DW_TAG_member ]
!1513 = metadata !{i32 786445, metadata !1507, metadata !"force_redirect", metadata !37, i32 164, i64 8, i64 8, i64 32, i32 0, metadata !103} ; [ DW_TAG_member ]
!1514 = metadata !{i32 786445, metadata !1507, metadata !"discard_path", metadata !37, i32 165, i64 8, i64 8, i64 40, i32 0, metadata !103} ; [ DW_TAG_member ]
!1515 = metadata !{i32 786445, metadata !1507, metadata !"fcgi_logging", metadata !37, i32 166, i64 8, i64 8, i64 48, i32 0, metadata !103} ; [ DW_TAG_member ]
!1516 = metadata !{i32 786445, metadata !1507, metadata !"redirect_status_env", metadata !37, i32 167, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!1517 = metadata !{i32 786445, metadata !1507, metadata !"user_config_cache", metadata !37, i32 171, i64 576, i64 64, i64 128, i32 0, metadata !63} ; [ DW_TAG_member ]
!1518 = metadata !{metadata !1519}
!1519 = metadata !{metadata !1520}
!1520 = metadata !{i32 786689, metadata !1502, metadata !"php_cgi_globals", metadata !37, i32 16778613, metadata !1505, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1521 = metadata !{i32 786478, i32 0, metadata !37, metadata !"user_config_cache_entry_dtor", metadata !"user_config_cache_entry_dtor", metadata !"", metadata !37, i32 188, metadata !1522, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct._user_config_cache_entry*)* @user_config_cache_entry_dtor, null, null, metadata !1524, i32 189} ; [ DW_TAG_subprogram ]
!1522 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1523, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1523 = metadata !{null, metadata !1362}
!1524 = metadata !{metadata !1525}
!1525 = metadata !{metadata !1526}
!1526 = metadata !{i32 786689, metadata !1521, metadata !"entry", metadata !37, i32 16777404, metadata !1362, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1527 = metadata !{i32 786478, i32 0, metadata !1528, metadata !"_zval_copy_ctor", metadata !"_zval_copy_ctor", metadata !"", metadata !1528, i32 40, metadata !38, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1529, i32 41} ; [ DW_TAG_subprogram ]
!1528 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/Zend/zend_variables.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1529 = metadata !{metadata !1530}
!1530 = metadata !{metadata !1531}
!1531 = metadata !{i32 786689, metadata !1527, metadata !"zvalue", metadata !1528, i32 16777256, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1532 = metadata !{i32 786478, i32 0, metadata !1528, metadata !"_zval_dtor", metadata !"_zval_dtor", metadata !"", metadata !1528, i32 30, metadata !38, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !1533, i32 31} ; [ DW_TAG_subprogram ]
!1533 = metadata !{metadata !1534}
!1534 = metadata !{metadata !1535}
!1535 = metadata !{i32 786689, metadata !1532, metadata !"zvalue", metadata !1528, i32 16777246, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!1536 = metadata !{metadata !1537}
!1537 = metadata !{metadata !1538, metadata !1604, metadata !1605, metadata !1606, metadata !1607, metadata !1608, metadata !1609, metadata !1610, metadata !1611, metadata !1615, metadata !1618, metadata !1630, metadata !1631, metadata !1636, metadata !1637, metadata !1642, metadata !1643, metadata !1644, metadata !1645, metadata !1646}
!1538 = metadata !{i32 786484, i32 0, null, metadata !"act", metadata !"act", metadata !"", metadata !37, i32 96, metadata !1539, i32 0, i32 1, %struct.sigaction* @act} ; [ DW_TAG_variable ]
!1539 = metadata !{i32 786451, null, metadata !"sigaction", metadata !1104, i32 296, i64 256, i64 64, i32 0, i32 0, null, metadata !1540, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1540 = metadata !{metadata !1541, metadata !1595, metadata !1596}
!1541 = metadata !{i32 786445, metadata !1539, metadata !"__sigaction_u", metadata !1104, i32 300, i64 64, i64 64, i64 0, i32 0, metadata !1542} ; [ DW_TAG_member ]
!1542 = metadata !{i32 786455, metadata !1539, metadata !"", metadata !1104, i32 297, i64 64, i64 64, i64 0, i32 0, null, metadata !1543, i32 0, i32 0} ; [ DW_TAG_union_type ]
!1543 = metadata !{metadata !1544, metadata !1546}
!1544 = metadata !{i32 786445, metadata !1542, metadata !"__sa_handler", metadata !1104, i32 298, i64 64, i64 64, i64 0, i32 0, metadata !1545} ; [ DW_TAG_member ]
!1545 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !719} ; [ DW_TAG_pointer_type ]
!1546 = metadata !{i32 786445, metadata !1542, metadata !"__sa_sigaction", metadata !1104, i32 299, i64 64, i64 64, i64 0, i32 0, metadata !1547} ; [ DW_TAG_member ]
!1547 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1548} ; [ DW_TAG_pointer_type ]
!1548 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1549, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!1549 = metadata !{null, metadata !60, metadata !1550, metadata !82}
!1550 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1551} ; [ DW_TAG_pointer_type ]
!1551 = metadata !{i32 786451, null, metadata !"__siginfo", metadata !1104, i32 193, i64 640, i64 64, i32 0, i32 0, null, metadata !1552, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1552 = metadata !{metadata !1553, metadata !1554, metadata !1555, metadata !1556, metadata !1557, metadata !1558, metadata !1559, metadata !1560, metadata !1567}
!1553 = metadata !{i32 786445, metadata !1551, metadata !"si_signo", metadata !1104, i32 194, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1554 = metadata !{i32 786445, metadata !1551, metadata !"si_errno", metadata !1104, i32 195, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!1555 = metadata !{i32 786445, metadata !1551, metadata !"si_code", metadata !1104, i32 202, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!1556 = metadata !{i32 786445, metadata !1551, metadata !"si_pid", metadata !1104, i32 203, i64 32, i64 32, i64 96, i32 0, metadata !906} ; [ DW_TAG_member ]
!1557 = metadata !{i32 786445, metadata !1551, metadata !"si_uid", metadata !1104, i32 204, i64 32, i64 32, i64 128, i32 0, metadata !1117} ; [ DW_TAG_member ]
!1558 = metadata !{i32 786445, metadata !1551, metadata !"si_status", metadata !1104, i32 205, i64 32, i64 32, i64 160, i32 0, metadata !60} ; [ DW_TAG_member ]
!1559 = metadata !{i32 786445, metadata !1551, metadata !"si_addr", metadata !1104, i32 206, i64 64, i64 64, i64 192, i32 0, metadata !82} ; [ DW_TAG_member ]
!1560 = metadata !{i32 786445, metadata !1551, metadata !"si_value", metadata !1104, i32 207, i64 64, i64 64, i64 256, i32 0, metadata !1561} ; [ DW_TAG_member ]
!1561 = metadata !{i32 786455, null, metadata !"sigval", metadata !1104, i32 151, i64 64, i64 64, i64 0, i32 0, null, metadata !1562, i32 0, i32 0} ; [ DW_TAG_union_type ]
!1562 = metadata !{metadata !1563, metadata !1564, metadata !1565, metadata !1566}
!1563 = metadata !{i32 786445, metadata !1561, metadata !"sival_int", metadata !1104, i32 153, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1564 = metadata !{i32 786445, metadata !1561, metadata !"sival_ptr", metadata !1104, i32 154, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ]
!1565 = metadata !{i32 786445, metadata !1561, metadata !"sigval_int", metadata !1104, i32 156, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1566 = metadata !{i32 786445, metadata !1561, metadata !"sigval_ptr", metadata !1104, i32 157, i64 64, i64 64, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ]
!1567 = metadata !{i32 786445, metadata !1551, metadata !"_reason", metadata !1104, i32 226, i64 320, i64 64, i64 320, i32 0, metadata !1568} ; [ DW_TAG_member ]
!1568 = metadata !{i32 786455, metadata !1551, metadata !"", metadata !1104, i32 208, i64 320, i64 64, i64 0, i32 0, null, metadata !1569, i32 0, i32 0} ; [ DW_TAG_union_type ]
!1569 = metadata !{metadata !1570, metadata !1574, metadata !1579, metadata !1583, metadata !1587}
!1570 = metadata !{i32 786445, metadata !1568, metadata !"_fault", metadata !1104, i32 211, i64 32, i64 32, i64 0, i32 0, metadata !1571} ; [ DW_TAG_member ]
!1571 = metadata !{i32 786451, metadata !1568, metadata !"", metadata !1104, i32 209, i64 32, i64 32, i32 0, i32 0, null, metadata !1572, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1572 = metadata !{metadata !1573}
!1573 = metadata !{i32 786445, metadata !1571, metadata !"_trapno", metadata !1104, i32 210, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1574 = metadata !{i32 786445, metadata !1568, metadata !"_timer", metadata !1104, i32 215, i64 64, i64 32, i64 0, i32 0, metadata !1575} ; [ DW_TAG_member ]
!1575 = metadata !{i32 786451, metadata !1568, metadata !"", metadata !1104, i32 212, i64 64, i64 32, i32 0, i32 0, null, metadata !1576, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1576 = metadata !{metadata !1577, metadata !1578}
!1577 = metadata !{i32 786445, metadata !1575, metadata !"_timerid", metadata !1104, i32 213, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1578 = metadata !{i32 786445, metadata !1575, metadata !"_overrun", metadata !1104, i32 214, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!1579 = metadata !{i32 786445, metadata !1568, metadata !"_mesgq", metadata !1104, i32 218, i64 32, i64 32, i64 0, i32 0, metadata !1580} ; [ DW_TAG_member ]
!1580 = metadata !{i32 786451, metadata !1568, metadata !"", metadata !1104, i32 216, i64 32, i64 32, i32 0, i32 0, null, metadata !1581, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1581 = metadata !{metadata !1582}
!1582 = metadata !{i32 786445, metadata !1580, metadata !"_mqd", metadata !1104, i32 217, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!1583 = metadata !{i32 786445, metadata !1568, metadata !"_poll", metadata !1104, i32 221, i64 64, i64 64, i64 0, i32 0, metadata !1584} ; [ DW_TAG_member ]
!1584 = metadata !{i32 786451, metadata !1568, metadata !"", metadata !1104, i32 219, i64 64, i64 64, i32 0, i32 0, null, metadata !1585, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1585 = metadata !{metadata !1586}
!1586 = metadata !{i32 786445, metadata !1584, metadata !"_band", metadata !1104, i32 220, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ]
!1587 = metadata !{i32 786445, metadata !1568, metadata !"__spare__", metadata !1104, i32 225, i64 320, i64 64, i64 0, i32 0, metadata !1588} ; [ DW_TAG_member ]
!1588 = metadata !{i32 786451, metadata !1568, metadata !"", metadata !1104, i32 222, i64 320, i64 64, i32 0, i32 0, null, metadata !1589, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1589 = metadata !{metadata !1590, metadata !1591}
!1590 = metadata !{i32 786445, metadata !1588, metadata !"__spare1__", metadata !1104, i32 223, i64 64, i64 64, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ]
!1591 = metadata !{i32 786445, metadata !1588, metadata !"__spare2__", metadata !1104, i32 224, i64 224, i64 32, i64 64, i32 0, metadata !1592} ; [ DW_TAG_member ]
!1592 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 224, i64 32, i32 0, i32 0, metadata !60, metadata !1593, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1593 = metadata !{metadata !1594}
!1594 = metadata !{i32 786465, i64 0, i64 6}      ; [ DW_TAG_subrange_type ]
!1595 = metadata !{i32 786445, metadata !1539, metadata !"sa_flags", metadata !1104, i32 301, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!1596 = metadata !{i32 786445, metadata !1539, metadata !"sa_mask", metadata !1104, i32 302, i64 128, i64 32, i64 96, i32 0, metadata !1597} ; [ DW_TAG_member ]
!1597 = metadata !{i32 786454, null, metadata !"sigset_t", metadata !1104, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !1598} ; [ DW_TAG_typedef ]
!1598 = metadata !{i32 786454, null, metadata !"__sigset_t", metadata !1104, i32 53, i64 0, i64 0, i64 0, i32 0, metadata !1599} ; [ DW_TAG_typedef ]
!1599 = metadata !{i32 786451, null, metadata !"__sigset", metadata !1600, i32 51, i64 128, i64 32, i32 0, i32 0, null, metadata !1601, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1600 = metadata !{i32 786473, metadata !"/usr/include/sys/_sigset.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1601 = metadata !{metadata !1602}
!1602 = metadata !{i32 786445, metadata !1599, metadata !"__bits", metadata !1600, i32 52, i64 128, i64 32, i64 0, i32 0, metadata !1603} ; [ DW_TAG_member ]
!1603 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 128, i64 32, i32 0, i32 0, metadata !1103, metadata !600, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1604 = metadata !{i32 786484, i32 0, null, metadata !"old_term", metadata !"old_term", metadata !"", metadata !37, i32 96, metadata !1539, i32 0, i32 1, %struct.sigaction* @old_term} ; [ DW_TAG_variable ]
!1605 = metadata !{i32 786484, i32 0, null, metadata !"old_quit", metadata !"old_quit", metadata !"", metadata !37, i32 96, metadata !1539, i32 0, i32 1, %struct.sigaction* @old_quit} ; [ DW_TAG_variable ]
!1606 = metadata !{i32 786484, i32 0, null, metadata !"old_int", metadata !"old_int", metadata !"", metadata !37, i32 96, metadata !1539, i32 0, i32 1, %struct.sigaction* @old_int} ; [ DW_TAG_variable ]
!1607 = metadata !{i32 786484, i32 0, null, metadata !"php_php_import_environment_variables", metadata !"php_php_import_environment_variables", metadata !"", metadata !37, i32 99, metadata !122, i32 1, i32 1, void (%struct._zval_struct*)** @php_php_import_environment_variables} ; [ DW_TAG_variable ]
!1608 = metadata !{i32 786484, i32 0, null, metadata !"pgroup", metadata !"pgroup", metadata !"", metadata !37, i32 122, metadata !905, i32 1, i32 1, i32* @pgroup} ; [ DW_TAG_variable ]
!1609 = metadata !{i32 786484, i32 0, null, metadata !"php_cgi_globals", metadata !"php_cgi_globals", metadata !"", metadata !37, i32 199, metadata !1506, i32 1, i32 1, %struct._php_cgi_globals_struct* @php_cgi_globals} ; [ DW_TAG_variable ]
!1610 = metadata !{i32 786484, i32 0, null, metadata !"children", metadata !"children", metadata !"", metadata !37, i32 106, metadata !60, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!1611 = metadata !{i32 786484, i32 0, null, metadata !"additional_functions", metadata !"additional_functions", metadata !"", metadata !37, i32 923, metadata !1612, i32 1, i32 1, [2 x %struct._zend_function_entry]* @additional_functions} ; [ DW_TAG_variable ]
!1612 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 64, i32 0, i32 0, metadata !1479, metadata !1613, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1613 = metadata !{metadata !1614}
!1614 = metadata !{i32 786465, i64 0, i64 1}      ; [ DW_TAG_subrange_type ]
!1615 = metadata !{i32 786484, i32 0, null, metadata !"arginfo_dl", metadata !"arginfo_dl", metadata !"", metadata !37, i32 918, metadata !1616, i32 1, i32 1, <{ { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] }, { i8*, i32, i8*, i32, i8, i8, i8, i8, i32, [4 x i8] } }>* @arginfo_dl} ; [ DW_TAG_variable ]
!1616 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 640, i64 64, i32 0, i32 0, metadata !1617, metadata !1613, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1617 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !438} ; [ DW_TAG_const_type ]
!1618 = metadata !{i32 786484, i32 0, null, metadata !"OPTIONS", metadata !"OPTIONS", metadata !"", metadata !37, i32 135, metadata !1619, i32 1, i32 1, [21 x %struct._opt_struct]* @OPTIONS} ; [ DW_TAG_variable ]
!1619 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2688, i64 64, i32 0, i32 0, metadata !1620, metadata !1628, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1620 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1621} ; [ DW_TAG_const_type ]
!1621 = metadata !{i32 786454, null, metadata !"opt_struct", metadata !37, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !1622} ; [ DW_TAG_typedef ]
!1622 = metadata !{i32 786451, null, metadata !"_opt_struct", metadata !1623, i32 36, i64 128, i64 64, i32 0, i32 0, null, metadata !1624, i32 0, i32 0} ; [ DW_TAG_structure_type ]
!1623 = metadata !{i32 786473, metadata !"/home/capsicum/wvd/php-5.3.2/main/php_getopt.h", metadata !"/home/capsicum/wvd/php-5.3.2", null} ; [ DW_TAG_file_type ]
!1624 = metadata !{metadata !1625, metadata !1626, metadata !1627}
!1625 = metadata !{i32 786445, metadata !1622, metadata !"opt_char", metadata !1623, i32 37, i64 8, i64 8, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!1626 = metadata !{i32 786445, metadata !1622, metadata !"need_param", metadata !1623, i32 38, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!1627 = metadata !{i32 786445, metadata !1622, metadata !"opt_name", metadata !1623, i32 39, i64 64, i64 64, i64 64, i32 0, metadata !57} ; [ DW_TAG_member ]
!1628 = metadata !{metadata !1629}
!1629 = metadata !{i32 786465, i64 0, i64 20}     ; [ DW_TAG_subrange_type ]
!1630 = metadata !{i32 786484, i32 0, null, metadata !"cgi_sapi_module", metadata !"cgi_sapi_module", metadata !"", metadata !37, i32 884, metadata !1389, i32 1, i32 1, %struct._sapi_module_struct* @cgi_sapi_module} ; [ DW_TAG_variable ]
!1631 = metadata !{i32 786484, i32 0, null, metadata !"http_error_codes", metadata !"http_error_codes", metadata !"", metadata !37, i32 342, metadata !1632, i32 1, i32 1, [38 x %struct._http_error]* @http_error_codes} ; [ DW_TAG_variable ]
!1632 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 4864, i64 64, i32 0, i32 0, metadata !1633, metadata !1634, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1633 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1303} ; [ DW_TAG_const_type ]
!1634 = metadata !{metadata !1635}
!1635 = metadata !{i32 786465, i64 0, i64 37}     ; [ DW_TAG_subrange_type ]
!1636 = metadata !{i32 786484, i32 0, null, metadata !"cgi_module_entry", metadata !"cgi_module_entry", metadata !"", metadata !37, i32 1447, metadata !414, i32 1, i32 1, %struct._zend_module_entry* @cgi_module_entry} ; [ DW_TAG_variable ]
!1637 = metadata !{i32 786484, i32 0, null, metadata !"ini_entries", metadata !"ini_entries", metadata !"", metadata !37, i32 1381, metadata !1638, i32 1, i32 1, [9 x %struct._zend_ini_entry]* @ini_entries} ; [ DW_TAG_variable ]
!1638 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 7488, i64 64, i32 0, i32 0, metadata !1639, metadata !1640, i32 0, i32 0} ; [ DW_TAG_array_type ]
!1639 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !377} ; [ DW_TAG_const_type ]
!1640 = metadata !{metadata !1641}
!1641 = metadata !{i32 786465, i64 0, i64 8}      ; [ DW_TAG_subrange_type ]
!1642 = metadata !{i32 786484, i32 0, null, metadata !"php_optarg", metadata !"php_optarg", metadata !"", metadata !37, i32 131, metadata !57, i32 1, i32 1, i8** @php_optarg} ; [ DW_TAG_variable ]
!1643 = metadata !{i32 786484, i32 0, null, metadata !"php_optind", metadata !"php_optind", metadata !"", metadata !37, i32 132, metadata !60, i32 1, i32 1, i32* @php_optind} ; [ DW_TAG_variable ]
!1644 = metadata !{i32 786484, i32 0, null, metadata !"exit_signal", metadata !"exit_signal", metadata !"", metadata !37, i32 114, metadata !60, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!1645 = metadata !{i32 786484, i32 0, null, metadata !"parent_waiting", metadata !"parent_waiting", metadata !"", metadata !37, i32 117, metadata !60, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!1646 = metadata !{i32 786484, i32 0, null, metadata !"parent", metadata !"parent", metadata !"", metadata !37, i32 111, metadata !60, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!1647 = metadata !{i32 590, i32 49, metadata !36, null}
!1648 = metadata !{i32 592, i32 2, metadata !673, null}
!1649 = metadata !{metadata !"any pointer", metadata !1650}
!1650 = metadata !{metadata !"omnipotent char", metadata !1651}
!1651 = metadata !{metadata !"Simple C/C++ TBAA"}
!1652 = metadata !{i32 595, i32 3, metadata !673, null}
!1653 = metadata !{i32 786689, metadata !1532, metadata !"zvalue", metadata !1528, i32 16777246, metadata !40, i32 0, metadata !1654} ; [ DW_TAG_arg_variable ]
!1654 = metadata !{i32 597, i32 3, metadata !1655, null}
!1655 = metadata !{i32 786443, metadata !673, i32 596, i32 4, metadata !37, i32 1} ; [ DW_TAG_lexical_block ]
!1656 = metadata !{i32 30, i32 37, metadata !1532, metadata !1654}
!1657 = metadata !{i32 32, i32 2, metadata !1658, metadata !1654}
!1658 = metadata !{i32 786443, metadata !1532, i32 31, i32 1, metadata !1528, i32 288} ; [ DW_TAG_lexical_block ]
!1659 = metadata !{i32 35, i32 2, metadata !1658, metadata !1654}
!1660 = metadata !{i32 36, i32 1, metadata !1658, metadata !1654}
!1661 = metadata !{i32 598, i32 3, metadata !1655, null}
!1662 = metadata !{i32 599, i32 3, metadata !1655, null}
!1663 = metadata !{metadata !"int", metadata !1650}
!1664 = metadata !{i32 786689, metadata !1527, metadata !"zvalue", metadata !1528, i32 16777256, metadata !40, i32 0, metadata !1665} ; [ DW_TAG_arg_variable ]
!1665 = metadata !{i32 600, i32 3, metadata !1655, null}
!1666 = metadata !{i32 40, i32 42, metadata !1527, metadata !1665}
!1667 = metadata !{i32 42, i32 2, metadata !1668, metadata !1665}
!1668 = metadata !{i32 786443, metadata !1527, i32 41, i32 1, metadata !1528, i32 286} ; [ DW_TAG_lexical_block ]
!1669 = metadata !{i32 45, i32 2, metadata !1668, metadata !1665}
!1670 = metadata !{i32 46, i32 1, metadata !1668, metadata !1665}
!1671 = metadata !{i32 602, i32 9, metadata !673, null}
!1672 = metadata !{i32 605, i32 3, metadata !673, null}
!1673 = metadata !{i32 786689, metadata !1532, metadata !"zvalue", metadata !1528, i32 16777246, metadata !40, i32 0, metadata !1674} ; [ DW_TAG_arg_variable ]
!1674 = metadata !{i32 607, i32 3, metadata !1675, null}
!1675 = metadata !{i32 786443, metadata !673, i32 606, i32 4, metadata !37, i32 2} ; [ DW_TAG_lexical_block ]
!1676 = metadata !{i32 30, i32 37, metadata !1532, metadata !1674}
!1677 = metadata !{i32 32, i32 2, metadata !1658, metadata !1674}
!1678 = metadata !{i32 35, i32 2, metadata !1658, metadata !1674}
!1679 = metadata !{i32 36, i32 1, metadata !1658, metadata !1674}
!1680 = metadata !{i32 608, i32 3, metadata !1675, null}
!1681 = metadata !{i32 609, i32 3, metadata !1675, null}
!1682 = metadata !{i32 786689, metadata !1527, metadata !"zvalue", metadata !1528, i32 16777256, metadata !40, i32 0, metadata !1683} ; [ DW_TAG_arg_variable ]
!1683 = metadata !{i32 610, i32 3, metadata !1675, null}
!1684 = metadata !{i32 40, i32 42, metadata !1527, metadata !1683}
!1685 = metadata !{i32 42, i32 2, metadata !1668, metadata !1683}
!1686 = metadata !{i32 45, i32 2, metadata !1668, metadata !1683}
!1687 = metadata !{i32 46, i32 1, metadata !1668, metadata !1683}
!1688 = metadata !{i32 615, i32 2, metadata !673, null}
!1689 = metadata !{i32 617, i32 6, metadata !673, null}
!1690 = metadata !{i32 618, i32 61, metadata !672, null}
!1691 = metadata !{i32 619, i32 16, metadata !672, null}
!1692 = metadata !{i32 620, i32 46, metadata !672, null}
!1693 = metadata !{i32 621, i32 9, metadata !672, null}
!1694 = metadata !{i32 621, i32 16, metadata !672, null}
!1695 = metadata !{i32 622, i32 8, metadata !672, null}
!1696 = metadata !{i32 623, i32 9, metadata !672, null}
!1697 = metadata !{i32 624, i32 90, metadata !672, null}
!1698 = metadata !{i32 627, i32 3, metadata !672, null}
!1699 = metadata !{i32 628, i32 8, metadata !717, null}
!1700 = metadata !{i32 630, i32 4, metadata !717, null}
!1701 = metadata !{i32 629, i32 4, metadata !717, null}
!1702 = metadata !{i32 633, i32 17, metadata !716, null}
!1703 = metadata !{i32 635, i32 8, metadata !716, null}
!1704 = metadata !{i32 635, i32 55, metadata !716, null}
!1705 = metadata !{i32 636, i32 5, metadata !1706, null}
!1706 = metadata !{i32 786443, metadata !716, i32 635, i32 94, metadata !37, i32 6} ; [ DW_TAG_lexical_block ]
!1707 = metadata !{i32 637, i32 4, metadata !1706, null}
!1708 = metadata !{i32 631, i32 4, metadata !717, null}
!1709 = metadata !{i32 639, i32 3, metadata !672, null}
!1710 = metadata !{i32 640, i32 2, metadata !672, null}
!1711 = metadata !{i32 641, i32 1, metadata !673, null}
!1712 = metadata !{i32 1362, i32 26, metadata !718, null}
!1713 = metadata !{i32 1368, i32 2, metadata !1714, null}
!1714 = metadata !{i32 786443, metadata !718, i32 1363, i32 1, metadata !37, i32 7} ; [ DW_TAG_lexical_block ]
!1715 = metadata !{i32 1371, i32 2, metadata !1714, null}
!1716 = metadata !{i32 1373, i32 2, metadata !1714, null}
!1717 = metadata !{i32 1378, i32 1, metadata !1714, null}
!1718 = metadata !{i32 1376, i32 3, metadata !1719, null}
!1719 = metadata !{i32 786443, metadata !1714, i32 1375, i32 9, metadata !37, i32 9} ; [ DW_TAG_lexical_block ]
!1720 = metadata !{i32 1462, i32 14, metadata !724, null}
!1721 = metadata !{i32 1462, i32 26, metadata !724, null}
!1722 = metadata !{i32 1464, i32 27, metadata !732, null}
!1723 = metadata !{i32 1465, i32 27, metadata !732, null}
!1724 = metadata !{i32 1466, i32 24, metadata !732, null}
!1725 = metadata !{i32 1467, i32 19, metadata !732, null}
!1726 = metadata !{i32 1}
!1727 = metadata !{i32 1471, i32 34, metadata !732, null}
!1728 = metadata !{i32 1472, i32 20, metadata !732, null}
!1729 = metadata !{i32 1473, i32 30, metadata !732, null}
!1730 = metadata !{i32 1474, i32 32, metadata !732, null}
!1731 = metadata !{i8* null}
!1732 = metadata !{i32 1475, i32 26, metadata !732, null}
!1733 = metadata !{i32 1476, i32 25, metadata !732, null}
!1734 = metadata !{i32 500}
!1735 = metadata !{i32 1483, i32 24, metadata !732, null}
!1736 = metadata !{i32 1484, i32 18, metadata !732, null}
!1737 = metadata !{i32 1485, i32 16, metadata !732, null}
!1738 = metadata !{i32 1486, i32 23, metadata !732, null}
!1739 = metadata !{i32 1487, i32 17, metadata !732, null}
!1740 = metadata !{i32 1488, i32 15, metadata !732, null}
!1741 = metadata !{i32 1489, i32 17, metadata !732, null}
!1742 = metadata !{i32 1490, i32 19, metadata !732, null}
!1743 = metadata !{i32 1492, i32 17, metadata !732, null}
!1744 = metadata !{i32 1492, i32 24, metadata !732, null}
!1745 = metadata !{i32 1497, i32 6, metadata !732, null}
!1746 = metadata !{i32 1497, i32 16, metadata !732, null}
!1747 = metadata !{i32 1512, i32 2, metadata !732, null}
!1748 = metadata !{i32 1526, i32 2, metadata !732, null}
!1749 = metadata !{i32 1527, i32 2, metadata !732, null}
!1750 = metadata !{i32 1536, i32 2, metadata !732, null}
!1751 = metadata !{i32 1539, i32 7, metadata !1752, null}
!1752 = metadata !{i32 786443, metadata !732, i32 1536, i32 16, metadata !37, i32 11} ; [ DW_TAG_lexical_block ]
!1753 = metadata !{i32 1540, i32 4, metadata !1752, null}
!1754 = metadata !{i32 1541, i32 4, metadata !1752, null}
!1755 = metadata !{i32 1542, i32 4, metadata !1752, null}
!1756 = metadata !{i32 1544, i32 4, metadata !1757, null}
!1757 = metadata !{i32 786443, metadata !1752, i32 1543, i32 5, metadata !37, i32 12} ; [ DW_TAG_lexical_block ]
!1758 = metadata !{i32 1545, i32 3, metadata !1757, null}
!1759 = metadata !{i32 1548, i32 14, metadata !732, null}
!1760 = metadata !{i32 1551, i32 5, metadata !877, null}
!1761 = metadata !{i32 1552, i32 6, metadata !1762, null}
!1762 = metadata !{i32 786443, metadata !877, i32 1551, i32 48, metadata !37, i32 15} ; [ DW_TAG_lexical_block ]
!1763 = metadata !{i32 1553, i32 5, metadata !1762, null}
!1764 = metadata !{i32 1554, i32 45, metadata !877, null}
!1765 = metadata !{i32 1555, i32 5, metadata !877, null}
!1766 = metadata !{i32 1557, i32 5, metadata !877, null}
!1767 = metadata !{i32 1558, i32 5, metadata !877, null}
!1768 = metadata !{i32 1561, i32 15, metadata !876, null}
!1769 = metadata !{i32 1564, i32 16, metadata !876, null}
!1770 = metadata !{i32 1565, i32 6, metadata !1771, null}
!1771 = metadata !{i32 786443, metadata !876, i32 1564, i32 42, metadata !37, i32 17} ; [ DW_TAG_lexical_block ]
!1772 = metadata !{i32 1566, i32 11, metadata !1771, null}
!1773 = metadata !{i64 1280}
!1774 = metadata !{i32 786689, metadata !1207, metadata !"_f", metadata !1208, i32 33554549, metadata !73, i32 0, metadata !1772} ; [ DW_TAG_arg_variable ]
!1775 = metadata !{i32 117, i32 42, metadata !1207, metadata !1772}
!1776 = metadata !{i32 786689, metadata !1216, metadata !"_f", metadata !1208, i32 33554536, metadata !73, i32 0, metadata !1777} ; [ DW_TAG_arg_variable ]
!1777 = metadata !{i32 119, i32 12, metadata !1778, metadata !1772}
!1778 = metadata !{i32 786443, metadata !1207, i32 118, i32 1, metadata !1208, i32 200} ; [ DW_TAG_lexical_block ]
!1779 = metadata !{i32 104, i32 44, metadata !1216, metadata !1777}
!1780 = metadata !{i32 106, i32 2, metadata !1781, metadata !1777}
!1781 = metadata !{i32 786443, metadata !1216, i32 105, i32 1, metadata !1208, i32 201} ; [ DW_TAG_lexical_block ]
!1782 = metadata !{metadata !"long", metadata !1650}
!1783 = metadata !{i32 1567, i32 37, metadata !1784, null}
!1784 = metadata !{i32 786443, metadata !1771, i32 1566, i32 73, metadata !37, i32 18} ; [ DW_TAG_lexical_block ]
!1785 = metadata !{i32 1568, i32 7, metadata !1784, null}
!1786 = metadata !{i32 1569, i32 7, metadata !1784, null}
!1787 = metadata !{i32 1570, i32 7, metadata !1784, null}
!1788 = metadata !{i32 1571, i32 7, metadata !1784, null}
!1789 = metadata !{i32 1572, i32 7, metadata !1784, null}
!1790 = metadata !{i32 1573, i32 7, metadata !1784, null}
!1791 = metadata !{i32 1574, i32 7, metadata !1784, null}
!1792 = metadata !{i32 1575, i32 7, metadata !1784, null}
!1793 = metadata !{i32 1576, i32 6, metadata !1784, null}
!1794 = metadata !{i32 1577, i32 37, metadata !1795, null}
!1795 = metadata !{i32 786443, metadata !1771, i32 1576, i32 13, metadata !37, i32 19} ; [ DW_TAG_lexical_block ]
!1796 = metadata !{i32 1578, i32 7, metadata !1795, null}
!1797 = metadata !{i32 1579, i32 7, metadata !1795, null}
!1798 = metadata !{i32 1580, i32 7, metadata !1795, null}
!1799 = metadata !{i32 1583, i32 36, metadata !1800, null}
!1800 = metadata !{i32 786443, metadata !876, i32 1582, i32 12, metadata !37, i32 20} ; [ DW_TAG_lexical_block ]
!1801 = metadata !{i32 1584, i32 6, metadata !1800, null}
!1802 = metadata !{i32 1585, i32 6, metadata !1800, null}
!1803 = metadata !{i32 1586, i32 6, metadata !1800, null}
!1804 = metadata !{i32 1594, i32 5, metadata !877, null}
!1805 = metadata !{i32 1595, i32 17, metadata !1806, null}
!1806 = metadata !{i32 786443, metadata !877, i32 1594, i32 19, metadata !37, i32 21} ; [ DW_TAG_lexical_block ]
!1807 = metadata !{i32 1596, i32 5, metadata !1806, null}
!1808 = metadata !{i32 2}
!1809 = metadata !{i32 1599, i32 5, metadata !877, null}
!1810 = metadata !{i32 1600, i32 5, metadata !877, null}
!1811 = metadata !{i32 1603, i32 2, metadata !732, null}
!1812 = metadata !{i32 1604, i32 2, metadata !732, null}
!1813 = metadata !{i32 1610, i32 2, metadata !732, null}
!1814 = metadata !{i32 1611, i32 2, metadata !732, null}
!1815 = metadata !{i32 1612, i32 3, metadata !1816, null}
!1816 = metadata !{i32 786443, metadata !732, i32 1611, i32 37, metadata !37, i32 22} ; [ DW_TAG_lexical_block ]
!1817 = metadata !{i32 1613, i32 2, metadata !1816, null}
!1818 = metadata !{i32 1616, i32 6, metadata !732, null}
!1819 = metadata !{i32 1624, i32 2, metadata !732, null}
!1820 = metadata !{i32 1631, i32 8, metadata !883, null}
!1821 = metadata !{i32 1632, i32 5, metadata !883, null}
!1822 = metadata !{i32 1635, i32 36, metadata !883, null}
!1823 = metadata !{i32 1637, i32 4, metadata !881, null}
!1824 = metadata !{i32 1638, i32 5, metadata !897, null}
!1825 = metadata !{i32 1639, i32 5, metadata !896, null}
!1826 = metadata !{i32 1648, i32 6, metadata !898, null}
!1827 = metadata !{i32 1648, i32 6, metadata !1828, null}
!1828 = metadata !{i32 786443, metadata !881, i32 1648, i32 6, metadata !37, i32 30} ; [ DW_TAG_lexical_block ]
!1829 = metadata !{i32 1649, i32 6, metadata !881, null}
!1830 = metadata !{i32 1659, i32 4, metadata !882, null}
!1831 = metadata !{i32 1663, i32 2, metadata !732, null}
!1832 = metadata !{i32 1664, i32 13, metadata !1833, null}
!1833 = metadata !{i32 786443, metadata !732, i32 1663, i32 16, metadata !37, i32 32} ; [ DW_TAG_lexical_block ]
!1834 = metadata !{i32 1665, i32 3, metadata !1833, null}
!1835 = metadata !{i32 1666, i32 4, metadata !1836, null}
!1836 = metadata !{i32 786443, metadata !1833, i32 1665, i32 20, metadata !37, i32 33} ; [ DW_TAG_lexical_block ]
!1837 = metadata !{i32 1670, i32 4, metadata !1836, null}
!1838 = metadata !{i32 1672, i32 13, metadata !1833, null}
!1839 = metadata !{i32 1673, i32 2, metadata !1833, null}
!1840 = metadata !{i32 1674, i32 2, metadata !732, null}
!1841 = metadata !{i32 1676, i32 7, metadata !901, null}
!1842 = metadata !{i32 1677, i32 24, metadata !1843, null}
!1843 = metadata !{i32 786443, metadata !901, i32 1676, i32 40, metadata !37, i32 35} ; [ DW_TAG_lexical_block ]
!1844 = metadata !{i32 1678, i32 4, metadata !1843, null}
!1845 = metadata !{i32 1679, i32 5, metadata !1846, null}
!1846 = metadata !{i32 786443, metadata !1843, i32 1678, i32 26, metadata !37, i32 36} ; [ DW_TAG_lexical_block ]
!1847 = metadata !{i32 1680, i32 5, metadata !1846, null}
!1848 = metadata !{i32 1685, i32 3, metadata !901, null}
!1849 = metadata !{i32 1686, i32 3, metadata !901, null}
!1850 = metadata !{i32 1689, i32 3, metadata !901, null}
!1851 = metadata !{i32 1693, i32 6, metadata !901, null}
!1852 = metadata !{i32 1694, i32 25, metadata !900, null}
!1853 = metadata !{i32 1695, i32 14, metadata !900, null}
!1854 = metadata !{i32 1696, i32 3, metadata !900, null}
!1855 = metadata !{i32 1697, i32 4, metadata !1856, null}
!1856 = metadata !{i32 786443, metadata !900, i32 1696, i32 21, metadata !37, i32 38} ; [ DW_TAG_lexical_block ]
!1857 = metadata !{i32 1698, i32 4, metadata !1856, null}
!1858 = metadata !{i32 1704, i32 3, metadata !1859, null}
!1859 = metadata !{i32 786443, metadata !901, i32 1703, i32 9, metadata !37, i32 39} ; [ DW_TAG_lexical_block ]
!1860 = metadata !{i32 1705, i32 3, metadata !1859, null}
!1861 = metadata !{i32 1708, i32 2, metadata !901, null}
!1862 = metadata !{i32 1700, i32 81, metadata !900, null}
!1863 = metadata !{i32 1702, i32 81, metadata !900, null}
!1864 = metadata !{i32 1709, i32 18, metadata !903, null}
!1865 = metadata !{i32 1713, i32 3, metadata !903, null}
!1866 = metadata !{i32 1714, i32 12, metadata !903, null}
!1867 = metadata !{i32 1720, i32 3, metadata !903, null}
!1868 = metadata !{i32 1721, i32 3, metadata !903, null}
!1869 = metadata !{i32 1722, i32 7, metadata !903, null}
!1870 = metadata !{i32 1723, i32 4, metadata !903, null}
!1871 = metadata !{i32 1724, i32 4, metadata !903, null}
!1872 = metadata !{i32 1726, i32 4, metadata !1873, null}
!1873 = metadata !{i32 786443, metadata !903, i32 1725, i32 5, metadata !37, i32 41} ; [ DW_TAG_lexical_block ]
!1874 = metadata !{i32 1727, i32 4, metadata !1873, null}
!1875 = metadata !{i32 1730, i32 7, metadata !903, null}
!1876 = metadata !{i32 1734, i32 3, metadata !903, null}
!1877 = metadata !{i32 1739, i32 11, metadata !1878, null}
!1878 = metadata !{i32 786443, metadata !1879, i32 1735, i32 7, metadata !37, i32 44} ; [ DW_TAG_lexical_block ]
!1879 = metadata !{i32 786443, metadata !903, i32 1734, i32 18, metadata !37, i32 43} ; [ DW_TAG_lexical_block ]
!1880 = metadata !{i32 1740, i32 5, metadata !1878, null}
!1881 = metadata !{i32 1749, i32 6, metadata !1882, null}
!1882 = metadata !{i32 786443, metadata !1878, i32 1740, i32 18, metadata !37, i32 45} ; [ DW_TAG_lexical_block ]
!1883 = metadata !{i32 1750, i32 6, metadata !1882, null}
!1884 = metadata !{i32 1751, i32 6, metadata !1882, null}
!1885 = metadata !{i32 1752, i32 6, metadata !1882, null}
!1886 = metadata !{i32 1754, i32 6, metadata !1882, null}
!1887 = metadata !{i32 1755, i32 6, metadata !1882, null}
!1888 = metadata !{i32 1759, i32 6, metadata !1882, null}
!1889 = metadata !{i32 1760, i32 6, metadata !1882, null}
!1890 = metadata !{i32 1762, i32 4, metadata !1878, null}
!1891 = metadata !{i32 1769, i32 5, metadata !1892, null}
!1892 = metadata !{i32 786443, metadata !1879, i32 1764, i32 16, metadata !37, i32 46} ; [ DW_TAG_lexical_block ]
!1893 = metadata !{i32 1770, i32 10, metadata !1894, null}
!1894 = metadata !{i32 786443, metadata !1892, i32 1769, i32 15, metadata !37, i32 47} ; [ DW_TAG_lexical_block ]
!1895 = metadata !{i32 1773, i32 13, metadata !1894, null}
!1896 = metadata !{i32 1771, i32 7, metadata !1897, null}
!1897 = metadata !{i32 786443, metadata !1894, i32 1770, i32 30, metadata !37, i32 48} ; [ DW_TAG_lexical_block ]
!1898 = metadata !{i32 1777, i32 5, metadata !1892, null}
!1899 = metadata !{[1 x %struct._sigjmp_buf]* null}
!1900 = metadata !{i32 1796, i32 2, metadata !909, null}
!1901 = metadata !{i32 1797, i32 15, metadata !915, null}
!1902 = metadata !{i32 1800, i32 6, metadata !1903, null}
!1903 = metadata !{i32 786443, metadata !1904, i32 1798, i32 15, metadata !37, i32 56} ; [ DW_TAG_lexical_block ]
!1904 = metadata !{i32 786443, metadata !915, i32 1797, i32 87, metadata !37, i32 55} ; [ DW_TAG_lexical_block ]
!1905 = metadata !{i32 1801, i32 16, metadata !1903, null}
!1906 = metadata !{i32 1803, i32 6, metadata !1903, null}
!1907 = metadata !{i32 1807, i32 6, metadata !1903, null}
!1908 = metadata !{i32 1810, i32 6, metadata !1903, null}
!1909 = metadata !{i32 1811, i32 6, metadata !1903, null}
!1910 = metadata !{i32 1812, i32 6, metadata !1903, null}
!1911 = metadata !{i32 1813, i32 6, metadata !1903, null}
!1912 = metadata !{i32 1814, i32 6, metadata !1903, null}
!1913 = metadata !{i32 1815, i32 6, metadata !1903, null}
!1914 = metadata !{i32 786689, metadata !1199, metadata !"argv0", metadata !37, i32 16778146, metadata !57, i32 0, metadata !1913} ; [ DW_TAG_arg_variable ]
!1915 = metadata !{i32 930, i32 33, metadata !1199, metadata !1913}
!1916 = metadata !{i32 934, i32 9, metadata !1206, metadata !1913}
!1917 = metadata !{i32 786688, metadata !1206, metadata !"prog", metadata !37, i32 932, metadata !57, i32 0, metadata !1913} ; [ DW_TAG_auto_variable ]
!1918 = metadata !{i32 935, i32 2, metadata !1206, metadata !1913}
!1919 = metadata !{i32 936, i32 3, metadata !1920, metadata !1913}
!1920 = metadata !{i32 786443, metadata !1206, i32 935, i32 12, metadata !37, i32 198} ; [ DW_TAG_lexical_block ]
!1921 = metadata !{i32 941, i32 2, metadata !1206, metadata !1913}
!1922 = metadata !{i32 1816, i32 6, metadata !1903, null}
!1923 = metadata !{i32 1817, i32 6, metadata !1903, null}
!1924 = metadata !{i32 1818, i32 6, metadata !1903, null}
!1925 = metadata !{i32 1821, i32 3, metadata !915, null}
!1926 = metadata !{i32 1822, i32 3, metadata !915, null}
!1927 = metadata !{i32 1834, i32 4, metadata !914, null}
!1928 = metadata !{i32 510, i32 39, metadata !1189, metadata !1929}
!1929 = metadata !{i32 1068, i32 30, metadata !1086, metadata !1930}
!1930 = metadata !{i32 1835, i32 4, metadata !914, null}
!1931 = metadata !{i32 2011, i32 5, metadata !1932, null}
!1932 = metadata !{i32 786443, metadata !914, i32 2010, i32 60, metadata !37, i32 82} ; [ DW_TAG_lexical_block ]
!1933 = metadata !{i32 2012, i32 5, metadata !1932, null}
!1934 = metadata !{i32 2013, i32 5, metadata !1932, null}
!1935 = metadata !{i32 2020, i32 4, metadata !914, null}
!1936 = metadata !{i32 2021, i32 4, metadata !914, null}
!1937 = metadata !{i32 2045, i32 6, metadata !918, null}
!1938 = metadata !{i32 2179, i32 4, metadata !914, null}
!1939 = metadata !{i32 2080, i32 4, metadata !914, null}
!1940 = metadata !{i32 1996, i32 7, metadata !1941, null}
!1941 = metadata !{i32 786443, metadata !1942, i32 1994, i32 42, metadata !37, i32 80} ; [ DW_TAG_lexical_block ]
!1942 = metadata !{i32 786443, metadata !912, i32 1994, i32 6, metadata !37, i32 79} ; [ DW_TAG_lexical_block ]
!1943 = metadata !{i32 1954, i32 6, metadata !1944, null}
!1944 = metadata !{i32 786443, metadata !913, i32 1948, i32 22, metadata !37, i32 69} ; [ DW_TAG_lexical_block ]
!1945 = metadata !{i32 1171, i32 10, metadata !1158, metadata !1930}
!1946 = metadata !{i32 2165, i32 5, metadata !1947, null}
!1947 = metadata !{i32 786443, metadata !914, i32 2164, i32 18, metadata !37, i32 118} ; [ DW_TAG_lexical_block ]
!1948 = metadata !{i32 1833, i32 3, metadata !915, null}
!1949 = metadata !{i32 1833, i32 22, metadata !915, null}
!1950 = metadata !{i8* getelementptr inbounds ([16 x i8]* @.str36, i64 0, i64 0)}
!1951 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !1929} ; [ DW_TAG_arg_variable ]
!1952 = metadata !{i64 15}
!1953 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !1929} ; [ DW_TAG_arg_variable ]
!1954 = metadata !{i32 510, i32 52, metadata !1189, metadata !1929}
!1955 = metadata !{i32 516, i32 6, metadata !1198, metadata !1929}
!1956 = metadata !{i32 517, i32 61, metadata !1197, metadata !1929}
!1957 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !1929} ; [ DW_TAG_auto_variable ]
!1958 = metadata !{i32 518, i32 10, metadata !1197, metadata !1929}
!1959 = metadata !{i32 522, i32 9, metadata !1198, metadata !1929}
!1960 = metadata !{i32 786688, metadata !1086, metadata !"env_script_filename", metadata !37, i32 1068, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!1961 = metadata !{i8* getelementptr inbounds ([16 x i8]* @.str37, i64 0, i64 0)}
!1962 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !1963} ; [ DW_TAG_arg_variable ]
!1963 = metadata !{i32 1069, i32 30, metadata !1086, metadata !1930}
!1964 = metadata !{i32 510, i32 39, metadata !1189, metadata !1963}
!1965 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !1963} ; [ DW_TAG_arg_variable ]
!1966 = metadata !{i32 510, i32 52, metadata !1189, metadata !1963}
!1967 = metadata !{i32 516, i32 6, metadata !1198, metadata !1963}
!1968 = metadata !{i32 517, i32 61, metadata !1197, metadata !1963}
!1969 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !1963} ; [ DW_TAG_auto_variable ]
!1970 = metadata !{i32 518, i32 10, metadata !1197, metadata !1963}
!1971 = metadata !{i32 522, i32 9, metadata !1198, metadata !1963}
!1972 = metadata !{i32 786688, metadata !1086, metadata !"env_path_translated", metadata !37, i32 1069, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!1973 = metadata !{i32 786688, metadata !1086, metadata !"script_path_translated", metadata !37, i32 1070, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!1974 = metadata !{i32 1070, i32 52, metadata !1086, metadata !1930}
!1975 = metadata !{i32 1075, i32 2, metadata !1086, metadata !1930}
!1976 = metadata !{i32 1076, i32 3, metadata !1977, metadata !1930}
!1977 = metadata !{i32 786443, metadata !1086, i32 1075, i32 54, metadata !37, i32 138} ; [ DW_TAG_lexical_block ]
!1978 = metadata !{i32 1080, i32 2, metadata !1086, metadata !1930}
!1979 = metadata !{i32 1081, i32 2, metadata !1086, metadata !1930}
!1980 = metadata !{i32 1082, i32 2, metadata !1086, metadata !1930}
!1981 = metadata !{i32 1083, i32 2, metadata !1086, metadata !1930}
!1982 = metadata !{i32 1084, i32 2, metadata !1086, metadata !1930}
!1983 = metadata !{i32 1085, i32 2, metadata !1086, metadata !1930}
!1984 = metadata !{i32 1086, i32 2, metadata !1086, metadata !1930}
!1985 = metadata !{i32 1087, i32 2, metadata !1086, metadata !1930}
!1986 = metadata !{i32 1093, i32 2, metadata !1086, metadata !1930}
!1987 = metadata !{i8* getelementptr inbounds ([15 x i8]* @.str38, i64 0, i64 0)}
!1988 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !1989} ; [ DW_TAG_arg_variable ]
!1989 = metadata !{i32 1095, i32 26, metadata !1090, metadata !1930}
!1990 = metadata !{i32 510, i32 39, metadata !1189, metadata !1989}
!1991 = metadata !{i64 14}
!1992 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !1989} ; [ DW_TAG_arg_variable ]
!1993 = metadata !{i32 510, i32 52, metadata !1189, metadata !1989}
!1994 = metadata !{i32 516, i32 6, metadata !1198, metadata !1989}
!1995 = metadata !{i32 517, i32 61, metadata !1197, metadata !1989}
!1996 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !1989} ; [ DW_TAG_auto_variable ]
!1997 = metadata !{i32 518, i32 10, metadata !1197, metadata !1989}
!1998 = metadata !{i32 522, i32 9, metadata !1198, metadata !1989}
!1999 = metadata !{i32 786688, metadata !1090, metadata !"content_length", metadata !37, i32 1095, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2000 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str39, i64 0, i64 0)}
!2001 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2002} ; [ DW_TAG_arg_variable ]
!2002 = metadata !{i32 1096, i32 24, metadata !1090, metadata !1930}
!2003 = metadata !{i32 510, i32 39, metadata !1189, metadata !2002}
!2004 = metadata !{i64 12}
!2005 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2002} ; [ DW_TAG_arg_variable ]
!2006 = metadata !{i32 510, i32 52, metadata !1189, metadata !2002}
!2007 = metadata !{i32 516, i32 6, metadata !1198, metadata !2002}
!2008 = metadata !{i32 517, i32 61, metadata !1197, metadata !2002}
!2009 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2002} ; [ DW_TAG_auto_variable ]
!2010 = metadata !{i32 518, i32 10, metadata !1197, metadata !2002}
!2011 = metadata !{i32 522, i32 9, metadata !1198, metadata !2002}
!2012 = metadata !{i32 786688, metadata !1090, metadata !"content_type", metadata !37, i32 1096, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2013 = metadata !{i8* getelementptr inbounds ([10 x i8]* @.str40, i64 0, i64 0)}
!2014 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2015} ; [ DW_TAG_arg_variable ]
!2015 = metadata !{i32 1097, i32 25, metadata !1090, metadata !1930}
!2016 = metadata !{i32 510, i32 39, metadata !1189, metadata !2015}
!2017 = metadata !{i64 9}
!2018 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2015} ; [ DW_TAG_arg_variable ]
!2019 = metadata !{i32 510, i32 52, metadata !1189, metadata !2015}
!2020 = metadata !{i32 516, i32 6, metadata !1198, metadata !2015}
!2021 = metadata !{i32 517, i32 61, metadata !1197, metadata !2015}
!2022 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2015} ; [ DW_TAG_auto_variable ]
!2023 = metadata !{i32 518, i32 10, metadata !1197, metadata !2015}
!2024 = metadata !{i32 522, i32 9, metadata !1198, metadata !2015}
!2025 = metadata !{i32 786688, metadata !1090, metadata !"env_path_info", metadata !37, i32 1097, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2026 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str41, i64 0, i64 0)}
!2027 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2028} ; [ DW_TAG_arg_variable ]
!2028 = metadata !{i32 1098, i32 27, metadata !1090, metadata !1930}
!2029 = metadata !{i32 510, i32 39, metadata !1189, metadata !2028}
!2030 = metadata !{i64 11}
!2031 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2028} ; [ DW_TAG_arg_variable ]
!2032 = metadata !{i32 510, i32 52, metadata !1189, metadata !2028}
!2033 = metadata !{i32 516, i32 6, metadata !1198, metadata !2028}
!2034 = metadata !{i32 517, i32 61, metadata !1197, metadata !2028}
!2035 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2028} ; [ DW_TAG_auto_variable ]
!2036 = metadata !{i32 518, i32 10, metadata !1197, metadata !2028}
!2037 = metadata !{i32 522, i32 9, metadata !1198, metadata !2028}
!2038 = metadata !{i32 786688, metadata !1090, metadata !"env_script_name", metadata !37, i32 1098, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2039 = metadata !{i8* getelementptr inbounds ([16 x i8]* @.str7, i64 0, i64 0)}
!2040 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2041} ; [ DW_TAG_arg_variable ]
!2041 = metadata !{i32 1101, i32 31, metadata !1090, metadata !1930}
!2042 = metadata !{i32 510, i32 39, metadata !1189, metadata !2041}
!2043 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2041} ; [ DW_TAG_arg_variable ]
!2044 = metadata !{i32 510, i32 52, metadata !1189, metadata !2041}
!2045 = metadata !{i32 516, i32 6, metadata !1198, metadata !2041}
!2046 = metadata !{i32 517, i32 61, metadata !1197, metadata !2041}
!2047 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2041} ; [ DW_TAG_auto_variable ]
!2048 = metadata !{i32 518, i32 10, metadata !1197, metadata !2041}
!2049 = metadata !{i32 522, i32 9, metadata !1198, metadata !2041}
!2050 = metadata !{i32 786688, metadata !1090, metadata !"env_server_software", metadata !37, i32 1101, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2051 = metadata !{i32 1102, i32 3, metadata !1090, metadata !1930}
!2052 = metadata !{i32 1105, i32 4, metadata !1090, metadata !1930}
!2053 = metadata !{i32 1106, i32 44, metadata !1090, metadata !1930}
!2054 = metadata !{i32 1108, i32 20, metadata !2055, metadata !1930}
!2055 = metadata !{i32 786443, metadata !1090, i32 1107, i32 5, metadata !37, i32 140} ; [ DW_TAG_lexical_block ]
!2056 = metadata !{i32 1109, i32 21, metadata !2055, metadata !1930}
!2057 = metadata !{i32 1110, i32 4, metadata !2055, metadata !1930}
!2058 = metadata !{i32 1113, i32 20, metadata !2055, metadata !1930}
!2059 = metadata !{i32 1114, i32 3, metadata !2055, metadata !1930}
!2060 = metadata !{i32 1116, i32 3, metadata !1090, metadata !1930}
!2061 = metadata !{i32 1117, i32 16, metadata !1097, metadata !1930}
!2062 = metadata !{i32 786688, metadata !1097, metadata !"real_path", metadata !37, i32 1118, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2063 = metadata !{i32 1118, i32 26, metadata !1097, metadata !1930}
!2064 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str44, i64 0, i64 0)}
!2065 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2066} ; [ DW_TAG_arg_variable ]
!2066 = metadata !{i32 1119, i32 29, metadata !1097, metadata !1930}
!2067 = metadata !{i32 510, i32 39, metadata !1189, metadata !2066}
!2068 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2066} ; [ DW_TAG_arg_variable ]
!2069 = metadata !{i32 510, i32 52, metadata !1189, metadata !2066}
!2070 = metadata !{i32 516, i32 6, metadata !1198, metadata !2066}
!2071 = metadata !{i32 517, i32 61, metadata !1197, metadata !2066}
!2072 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2066} ; [ DW_TAG_auto_variable ]
!2073 = metadata !{i32 518, i32 10, metadata !1197, metadata !2066}
!2074 = metadata !{i32 522, i32 9, metadata !1198, metadata !2066}
!2075 = metadata !{i32 786688, metadata !1097, metadata !"env_redirect_url", metadata !37, i32 1119, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2076 = metadata !{i8* getelementptr inbounds ([14 x i8]* @.str45, i64 0, i64 0)}
!2077 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2078} ; [ DW_TAG_arg_variable ]
!2078 = metadata !{i32 1120, i32 30, metadata !1097, metadata !1930}
!2079 = metadata !{i32 510, i32 39, metadata !1189, metadata !2078}
!2080 = metadata !{i64 13}
!2081 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2078} ; [ DW_TAG_arg_variable ]
!2082 = metadata !{i32 510, i32 52, metadata !1189, metadata !2078}
!2083 = metadata !{i32 516, i32 6, metadata !1198, metadata !2078}
!2084 = metadata !{i32 517, i32 61, metadata !1197, metadata !2078}
!2085 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2078} ; [ DW_TAG_auto_variable ]
!2086 = metadata !{i32 518, i32 10, metadata !1197, metadata !2078}
!2087 = metadata !{i32 522, i32 9, metadata !1198, metadata !2078}
!2088 = metadata !{i32 786688, metadata !1097, metadata !"env_document_root", metadata !37, i32 1120, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2089 = metadata !{i32 786688, metadata !1097, metadata !"orig_path_translated", metadata !37, i32 1121, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2090 = metadata !{i32 1121, i32 52, metadata !1097, metadata !1930}
!2091 = metadata !{i32 786688, metadata !1097, metadata !"orig_path_info", metadata !37, i32 1122, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2092 = metadata !{i32 1122, i32 40, metadata !1097, metadata !1930}
!2093 = metadata !{i32 786688, metadata !1097, metadata !"orig_script_name", metadata !37, i32 1123, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2094 = metadata !{i32 1123, i32 44, metadata !1097, metadata !1930}
!2095 = metadata !{i32 786688, metadata !1097, metadata !"orig_script_filename", metadata !37, i32 1124, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2096 = metadata !{i32 1124, i32 52, metadata !1097, metadata !1930}
!2097 = metadata !{i32 1127, i32 4, metadata !1097, metadata !1930}
!2098 = metadata !{i32 1128, i32 25, metadata !2099, metadata !1930}
!2099 = metadata !{i32 786443, metadata !1097, i32 1127, i32 44, metadata !37, i32 143} ; [ DW_TAG_lexical_block ]
!2100 = metadata !{i32 1131, i32 4, metadata !2099, metadata !1930}
!2101 = metadata !{i32 1133, i32 4, metadata !1097, metadata !1930}
!2102 = metadata !{i32 1135, i32 9, metadata !1097, metadata !1930}
!2103 = metadata !{i32 1157, i32 4, metadata !1097, metadata !1930}
!2104 = metadata !{i32 1158, i32 35, metadata !1097, metadata !1930}
!2105 = metadata !{i32 786688, metadata !1097, metadata !"script_path_translated_len", metadata !37, i32 1125, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2106 = metadata !{i32 1163, i32 18, metadata !1097, metadata !1930}
!2107 = metadata !{i32 1165, i32 16, metadata !1153, metadata !1930}
!2108 = metadata !{i32 786688, metadata !1153, metadata !"pt", metadata !37, i32 1165, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2109 = metadata !{i32 786688, metadata !1153, metadata !"len", metadata !37, i32 1166, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2110 = metadata !{i32 1166, i32 41, metadata !1153, metadata !1930}
!2111 = metadata !{i32 1169, i32 5, metadata !1153, metadata !1930}
!2112 = metadata !{i32 1169, i32 19, metadata !1153, metadata !1930}
!2113 = metadata !{i32 786688, metadata !1153, metadata !"ptr", metadata !37, i32 1167, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2114 = metadata !{i32 1169, i32 47, metadata !1153, metadata !1930}
!2115 = metadata !{i32 1170, i32 6, metadata !1158, metadata !1930}
!2116 = metadata !{metadata !"short", metadata !1650}
!2117 = metadata !{i32 1188, i32 60, metadata !1157, metadata !1930}
!2118 = metadata !{i32 1187, i32 24, metadata !1157, metadata !1930}
!2119 = metadata !{i32 1188, i32 35, metadata !1157, metadata !1930}
!2120 = metadata !{i32 1189, i32 76, metadata !1157, metadata !1930}
!2121 = metadata !{i32 786688, metadata !1157, metadata !"path_info", metadata !37, i32 1189, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2122 = metadata !{i32 1191, i32 7, metadata !1157, metadata !1930}
!2123 = metadata !{i32 1192, i32 8, metadata !1163, metadata !1930}
!2124 = metadata !{i32 1195, i32 9, metadata !1162, metadata !1930}
!2125 = metadata !{i32 1196, i32 9, metadata !1162, metadata !1930}
!2126 = metadata !{i32 786688, metadata !1162, metadata !"old", metadata !37, i32 1193, metadata !58, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2127 = metadata !{i32 1197, i32 9, metadata !1162, metadata !1930}
!2128 = metadata !{i32 1198, i32 9, metadata !1162, metadata !1930}
!2129 = metadata !{i32 1199, i32 10, metadata !1162, metadata !1930}
!2130 = metadata !{i32 1201, i32 11, metadata !2131, metadata !1930}
!2131 = metadata !{i32 786443, metadata !2132, i32 1200, i32 32, metadata !37, i32 151} ; [ DW_TAG_lexical_block ]
!2132 = metadata !{i32 786443, metadata !1162, i32 1199, i32 56, metadata !37, i32 150} ; [ DW_TAG_lexical_block ]
!2133 = metadata !{i32 1202, i32 10, metadata !2131, metadata !1930}
!2134 = metadata !{i32 1203, i32 41, metadata !2132, metadata !1930}
!2135 = metadata !{i32 1204, i32 9, metadata !2132, metadata !1930}
!2136 = metadata !{i32 1205, i32 10, metadata !2137, metadata !1930}
!2137 = metadata !{i32 786443, metadata !1162, i32 1204, i32 16, metadata !37, i32 152} ; [ DW_TAG_lexical_block ]
!2138 = metadata !{i32 1207, i32 9, metadata !1162, metadata !1930}
!2139 = metadata !{i32 1208, i32 8, metadata !1162, metadata !1930}
!2140 = metadata !{i32 1209, i32 24, metadata !1163, metadata !1930}
!2141 = metadata !{i32 1210, i32 7, metadata !1163, metadata !1930}
!2142 = metadata !{i32 1211, i32 7, metadata !1157, metadata !1930}
!2143 = metadata !{i32 1212, i32 8, metadata !1157, metadata !1930}
!2144 = metadata !{i32 1214, i32 9, metadata !2145, metadata !1930}
!2145 = metadata !{i32 786443, metadata !2146, i32 1213, i32 34, metadata !37, i32 154} ; [ DW_TAG_lexical_block ]
!2146 = metadata !{i32 786443, metadata !1157, i32 1212, i32 47, metadata !37, i32 153} ; [ DW_TAG_lexical_block ]
!2147 = metadata !{i32 1215, i32 8, metadata !2145, metadata !1930}
!2148 = metadata !{i32 1216, i32 33, metadata !2146, metadata !1930}
!2149 = metadata !{i32 1217, i32 7, metadata !2146, metadata !1930}
!2150 = metadata !{i32 1223, i32 7, metadata !1157, metadata !1930}
!2151 = metadata !{i32 1224, i32 16, metadata !1165, metadata !1930}
!2152 = metadata !{i32 786688, metadata !1165, metadata !"l", metadata !37, i32 1224, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2153 = metadata !{i32 786688, metadata !1165, metadata !"path_translated_len", metadata !37, i32 1225, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2154 = metadata !{i32 1225, i32 35, metadata !1165, metadata !1930}
!2155 = metadata !{i32 786688, metadata !1165, metadata !"path_translated", metadata !37, i32 1226, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2156 = metadata !{i32 1226, i32 36, metadata !1165, metadata !1930}
!2157 = metadata !{i32 1228, i32 8, metadata !1165, metadata !1930}
!2158 = metadata !{i32 1238, i32 8, metadata !1165, metadata !1930}
!2159 = metadata !{i32 1238, i32 51, metadata !1165, metadata !1930}
!2160 = metadata !{i32 1239, i32 35, metadata !1165, metadata !1930}
!2161 = metadata !{i32 1240, i32 8, metadata !1165, metadata !1930}
!2162 = metadata !{i32 1241, i32 8, metadata !1165, metadata !1930}
!2163 = metadata !{i32 1242, i32 9, metadata !2164, metadata !1930}
!2164 = metadata !{i32 786443, metadata !1165, i32 1241, i32 27, metadata !37, i32 157} ; [ DW_TAG_lexical_block ]
!2165 = metadata !{i32 1243, i32 8, metadata !2164, metadata !1930}
!2166 = metadata !{i32 1244, i32 8, metadata !1165, metadata !1930}
!2167 = metadata !{i32 1245, i32 8, metadata !1165, metadata !1930}
!2168 = metadata !{i32 1246, i32 9, metadata !2169, metadata !1930}
!2169 = metadata !{i32 786443, metadata !1165, i32 1245, i32 34, metadata !37, i32 158} ; [ DW_TAG_lexical_block ]
!2170 = metadata !{i32 1247, i32 8, metadata !2169, metadata !1930}
!2171 = metadata !{i32 1248, i32 30, metadata !1165, metadata !1930}
!2172 = metadata !{i32 1249, i32 8, metadata !1165, metadata !1930}
!2173 = metadata !{i32 1250, i32 7, metadata !1165, metadata !1930}
!2174 = metadata !{i32 1250, i32 14, metadata !1157, metadata !1930}
!2175 = metadata !{i32 1251, i32 10, metadata !1157, metadata !1930}
!2176 = metadata !{i32 1254, i32 20, metadata !1169, metadata !1930}
!2177 = metadata !{i32 1254, i32 33, metadata !1169, metadata !1930}
!2178 = metadata !{i32 786688, metadata !1169, metadata !"ptlen", metadata !37, i32 1254, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2179 = metadata !{i32 1255, i32 85, metadata !1169, metadata !1930}
!2180 = metadata !{i32 1255, i32 59, metadata !1169, metadata !1930}
!2181 = metadata !{i32 786688, metadata !1169, metadata !"path_translated_len", metadata !37, i32 1255, metadata !60, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2182 = metadata !{i32 786688, metadata !1169, metadata !"path_translated", metadata !37, i32 1256, metadata !57, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2183 = metadata !{i32 1256, i32 36, metadata !1169, metadata !1930}
!2184 = metadata !{i32 1258, i32 35, metadata !1169, metadata !1930}
!2185 = metadata !{i32 1259, i32 8, metadata !1169, metadata !1930}
!2186 = metadata !{i32 1260, i32 8, metadata !1169, metadata !1930}
!2187 = metadata !{i32 1261, i32 9, metadata !2188, metadata !1930}
!2188 = metadata !{i32 786443, metadata !1169, i32 1260, i32 27, metadata !37, i32 160} ; [ DW_TAG_lexical_block ]
!2189 = metadata !{i32 1262, i32 8, metadata !2188, metadata !1930}
!2190 = metadata !{i32 1263, i32 8, metadata !1169, metadata !1930}
!2191 = metadata !{i32 1264, i32 8, metadata !1169, metadata !1930}
!2192 = metadata !{i32 1265, i32 9, metadata !2193, metadata !1930}
!2193 = metadata !{i32 786443, metadata !1169, i32 1264, i32 34, metadata !37, i32 161} ; [ DW_TAG_lexical_block ]
!2194 = metadata !{i32 1266, i32 8, metadata !2193, metadata !1930}
!2195 = metadata !{i32 1267, i32 30, metadata !1169, metadata !1930}
!2196 = metadata !{i32 1268, i32 8, metadata !1169, metadata !1930}
!2197 = metadata !{i32 1269, i32 7, metadata !1169, metadata !1930}
!2198 = metadata !{i32 1273, i32 5, metadata !1153, metadata !1930}
!2199 = metadata !{i32 1279, i32 6, metadata !2200, metadata !1930}
!2200 = metadata !{i32 786443, metadata !1153, i32 1273, i32 15, metadata !37, i32 162} ; [ DW_TAG_lexical_block ]
!2201 = metadata !{i32 1280, i32 7, metadata !2202, metadata !1930}
!2202 = metadata !{i32 786443, metadata !2200, i32 1279, i32 32, metadata !37, i32 163} ; [ DW_TAG_lexical_block ]
!2203 = metadata !{i32 1281, i32 6, metadata !2202, metadata !1930}
!2204 = metadata !{i32 786689, metadata !1178, metadata !"name", metadata !37, i32 16777741, metadata !57, i32 0, metadata !2205} ; [ DW_TAG_arg_variable ]
!2205 = metadata !{i32 1282, i32 31, metadata !2200, metadata !1930}
!2206 = metadata !{i32 525, i32 40, metadata !1178, metadata !2205}
!2207 = metadata !{i32 786689, metadata !1178, metadata !"value", metadata !37, i32 33554957, metadata !57, i32 0, metadata !2205} ; [ DW_TAG_arg_variable ]
!2208 = metadata !{i32 525, i32 52, metadata !1178, metadata !2205}
!2209 = metadata !{i32 542, i32 6, metadata !1186, metadata !2205}
!2210 = metadata !{i32 543, i32 61, metadata !1188, metadata !2205}
!2211 = metadata !{i32 786688, metadata !1188, metadata !"request", metadata !37, i32 543, metadata !674, i32 0, metadata !2205} ; [ DW_TAG_auto_variable ]
!2212 = metadata !{i32 544, i32 10, metadata !1188, metadata !2205}
!2213 = metadata !{i32 554, i32 3, metadata !2214, metadata !2205}
!2214 = metadata !{i32 786443, metadata !1186, i32 553, i32 14, metadata !37, i32 194} ; [ DW_TAG_lexical_block ]
!2215 = metadata !{i32 582, i32 9, metadata !1186, metadata !2205}
!2216 = metadata !{i32 1283, i32 6, metadata !2200, metadata !1930}
!2217 = metadata !{i32 1284, i32 5, metadata !2200, metadata !1930}
!2218 = metadata !{i32 1285, i32 5, metadata !1153, metadata !1930}
!2219 = metadata !{i32 1286, i32 6, metadata !2220, metadata !1930}
!2220 = metadata !{i32 786443, metadata !1153, i32 1285, i32 40, metadata !37, i32 164} ; [ DW_TAG_lexical_block ]
!2221 = metadata !{i32 1287, i32 7, metadata !2220, metadata !1930}
!2222 = metadata !{i32 1289, i32 8, metadata !2223, metadata !1930}
!2223 = metadata !{i32 786443, metadata !2224, i32 1288, i32 29, metadata !37, i32 166} ; [ DW_TAG_lexical_block ]
!2224 = metadata !{i32 786443, metadata !2220, i32 1287, i32 55, metadata !37, i32 165} ; [ DW_TAG_lexical_block ]
!2225 = metadata !{i32 1290, i32 7, metadata !2223, metadata !1930}
!2226 = metadata !{i32 1291, i32 38, metadata !2224, metadata !1930}
!2227 = metadata !{i32 1292, i32 6, metadata !2224, metadata !1930}
!2228 = metadata !{i32 1293, i32 7, metadata !2229, metadata !1930}
!2229 = metadata !{i32 786443, metadata !2220, i32 1292, i32 13, metadata !37, i32 167} ; [ DW_TAG_lexical_block ]
!2230 = metadata !{i32 1296, i32 5, metadata !1153, metadata !1930}
!2231 = metadata !{i32 1297, i32 6, metadata !2232, metadata !1930}
!2232 = metadata !{i32 786443, metadata !1153, i32 1296, i32 13, metadata !37, i32 168} ; [ DW_TAG_lexical_block ]
!2233 = metadata !{i32 1298, i32 5, metadata !2232, metadata !1930}
!2234 = metadata !{i32 1301, i32 5, metadata !2235, metadata !1930}
!2235 = metadata !{i32 786443, metadata !1097, i32 1299, i32 11, metadata !37, i32 169} ; [ DW_TAG_lexical_block ]
!2236 = metadata !{i32 1303, i32 6, metadata !2235, metadata !1930}
!2237 = metadata !{i32 1305, i32 7, metadata !2238, metadata !1930}
!2238 = metadata !{i32 786443, metadata !2239, i32 1304, i32 32, metadata !37, i32 171} ; [ DW_TAG_lexical_block ]
!2239 = metadata !{i32 786443, metadata !2235, i32 1303, i32 66, metadata !37, i32 170} ; [ DW_TAG_lexical_block ]
!2240 = metadata !{i32 1306, i32 6, metadata !2238, metadata !1930}
!2241 = metadata !{i32 1307, i32 31, metadata !2239, metadata !1930}
!2242 = metadata !{i32 1308, i32 5, metadata !2239, metadata !1930}
!2243 = metadata !{i32 1309, i32 5, metadata !2235, metadata !1930}
!2244 = metadata !{i32 1310, i32 6, metadata !2245, metadata !1930}
!2245 = metadata !{i32 786443, metadata !2235, i32 1309, i32 27, metadata !37, i32 172} ; [ DW_TAG_lexical_block ]
!2246 = metadata !{i32 1311, i32 7, metadata !2247, metadata !1930}
!2247 = metadata !{i32 786443, metadata !2245, i32 1310, i32 26, metadata !37, i32 173} ; [ DW_TAG_lexical_block ]
!2248 = metadata !{i32 786689, metadata !1178, metadata !"name", metadata !37, i32 16777741, metadata !57, i32 0, metadata !2249} ; [ DW_TAG_arg_variable ]
!2249 = metadata !{i32 1312, i32 7, metadata !2247, metadata !1930}
!2250 = metadata !{i32 525, i32 40, metadata !1178, metadata !2249}
!2251 = metadata !{i32 786689, metadata !1178, metadata !"value", metadata !37, i32 33554957, metadata !57, i32 0, metadata !2249} ; [ DW_TAG_arg_variable ]
!2252 = metadata !{i32 525, i32 52, metadata !1178, metadata !2249}
!2253 = metadata !{i32 542, i32 6, metadata !1186, metadata !2249}
!2254 = metadata !{i32 543, i32 61, metadata !1188, metadata !2249}
!2255 = metadata !{i32 786688, metadata !1188, metadata !"request", metadata !37, i32 543, metadata !674, i32 0, metadata !2249} ; [ DW_TAG_auto_variable ]
!2256 = metadata !{i32 544, i32 10, metadata !1188, metadata !2249}
!2257 = metadata !{i32 554, i32 3, metadata !2214, metadata !2249}
!2258 = metadata !{i32 582, i32 9, metadata !1186, metadata !2249}
!2259 = metadata !{i32 1314, i32 6, metadata !2245, metadata !1930}
!2260 = metadata !{i32 1315, i32 7, metadata !2261, metadata !1930}
!2261 = metadata !{i32 786443, metadata !2245, i32 1314, i32 32, metadata !37, i32 174} ; [ DW_TAG_lexical_block ]
!2262 = metadata !{i32 786689, metadata !1178, metadata !"name", metadata !37, i32 16777741, metadata !57, i32 0, metadata !2263} ; [ DW_TAG_arg_variable ]
!2263 = metadata !{i32 1316, i32 7, metadata !2261, metadata !1930}
!2264 = metadata !{i32 525, i32 40, metadata !1178, metadata !2263}
!2265 = metadata !{i32 786689, metadata !1178, metadata !"value", metadata !37, i32 33554957, metadata !57, i32 0, metadata !2263} ; [ DW_TAG_arg_variable ]
!2266 = metadata !{i32 525, i32 52, metadata !1178, metadata !2263}
!2267 = metadata !{i32 542, i32 6, metadata !1186, metadata !2263}
!2268 = metadata !{i32 543, i32 61, metadata !1188, metadata !2263}
!2269 = metadata !{i32 786688, metadata !1188, metadata !"request", metadata !37, i32 543, metadata !674, i32 0, metadata !2263} ; [ DW_TAG_auto_variable ]
!2270 = metadata !{i32 544, i32 10, metadata !1188, metadata !2263}
!2271 = metadata !{i32 554, i32 3, metadata !2214, metadata !2263}
!2272 = metadata !{i32 582, i32 9, metadata !1186, metadata !2263}
!2273 = metadata !{i32 1319, i32 5, metadata !2235, metadata !1930}
!2274 = metadata !{i32 1320, i32 6, metadata !2275, metadata !1930}
!2275 = metadata !{i32 786443, metadata !2235, i32 1319, i32 46, metadata !37, i32 175} ; [ DW_TAG_lexical_block ]
!2276 = metadata !{i32 1321, i32 7, metadata !2277, metadata !1930}
!2277 = metadata !{i32 786443, metadata !2275, i32 1320, i32 28, metadata !37, i32 176} ; [ DW_TAG_lexical_block ]
!2278 = metadata !{i32 1322, i32 6, metadata !2277, metadata !1930}
!2279 = metadata !{i32 1323, i32 37, metadata !2275, metadata !1930}
!2280 = metadata !{i32 1324, i32 5, metadata !2275, metadata !1930}
!2281 = metadata !{i32 1327, i32 5, metadata !2235, metadata !1930}
!2282 = metadata !{i32 1331, i32 4, metadata !2283, metadata !1930}
!2283 = metadata !{i32 786443, metadata !1090, i32 1329, i32 10, metadata !37, i32 178} ; [ DW_TAG_lexical_block ]
!2284 = metadata !{i32 1332, i32 5, metadata !2285, metadata !1930}
!2285 = metadata !{i32 786443, metadata !2283, i32 1331, i32 23, metadata !37, i32 179} ; [ DW_TAG_lexical_block ]
!2286 = metadata !{i32 1336, i32 4, metadata !2283, metadata !1930}
!2287 = metadata !{i32 786689, metadata !1172, metadata !"path", metadata !37, i32 16778186, metadata !227, i32 0, metadata !2288} ; [ DW_TAG_arg_variable ]
!2288 = metadata !{i32 1341, i32 7, metadata !1090, metadata !1930}
!2289 = metadata !{i32 970, i32 38, metadata !1172, metadata !2288}
!2290 = metadata !{i32 974, i32 2, metadata !1177, metadata !2288}
!2291 = metadata !{i32 977, i32 6, metadata !1177, metadata !2288}
!2292 = metadata !{i32 786688, metadata !1177, metadata !"p", metadata !37, i32 972, metadata !227, i32 0, metadata !2288} ; [ DW_TAG_auto_variable ]
!2293 = metadata !{i32 978, i32 2, metadata !1177, metadata !2288}
!2294 = metadata !{i32 979, i32 3, metadata !2295, metadata !2288}
!2295 = metadata !{i32 786443, metadata !1177, i32 978, i32 9, metadata !37, i32 185} ; [ DW_TAG_lexical_block ]
!2296 = metadata !{i32 985, i32 8, metadata !2297, metadata !2288}
!2297 = metadata !{i32 786443, metadata !2295, i32 984, i32 13, metadata !37, i32 187} ; [ DW_TAG_lexical_block ]
!2298 = metadata !{i32 986, i32 4, metadata !2297, metadata !2288}
!2299 = metadata !{i32 989, i32 4, metadata !2297, metadata !2288}
!2300 = metadata !{i32 1342, i32 39, metadata !2301, metadata !1930}
!2301 = metadata !{i32 786443, metadata !1090, i32 1341, i32 46, metadata !37, i32 182} ; [ DW_TAG_lexical_block ]
!2302 = metadata !{i32 1343, i32 3, metadata !2301, metadata !1930}
!2303 = metadata !{i8* getelementptr inbounds ([15 x i8]* @.str310, i64 0, i64 0)}
!2304 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2305} ; [ DW_TAG_arg_variable ]
!2305 = metadata !{i32 1345, i32 37, metadata !1090, metadata !1930}
!2306 = metadata !{i32 510, i32 39, metadata !1189, metadata !2305}
!2307 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2305} ; [ DW_TAG_arg_variable ]
!2308 = metadata !{i32 510, i32 52, metadata !1189, metadata !2305}
!2309 = metadata !{i32 516, i32 6, metadata !1198, metadata !2305}
!2310 = metadata !{i32 517, i32 61, metadata !1197, metadata !2305}
!2311 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2305} ; [ DW_TAG_auto_variable ]
!2312 = metadata !{i32 518, i32 10, metadata !1197, metadata !2305}
!2313 = metadata !{i32 522, i32 9, metadata !1198, metadata !2305}
!2314 = metadata !{i8* getelementptr inbounds ([13 x i8]* @.str49, i64 0, i64 0)}
!2315 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2316} ; [ DW_TAG_arg_variable ]
!2316 = metadata !{i32 1347, i32 35, metadata !1090, metadata !1930}
!2317 = metadata !{i32 510, i32 39, metadata !1189, metadata !2316}
!2318 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2316} ; [ DW_TAG_arg_variable ]
!2319 = metadata !{i32 510, i32 52, metadata !1189, metadata !2316}
!2320 = metadata !{i32 516, i32 6, metadata !1198, metadata !2316}
!2321 = metadata !{i32 517, i32 61, metadata !1197, metadata !2316}
!2322 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2316} ; [ DW_TAG_auto_variable ]
!2323 = metadata !{i32 518, i32 10, metadata !1197, metadata !2316}
!2324 = metadata !{i32 522, i32 9, metadata !1198, metadata !2316}
!2325 = metadata !{i32 1348, i32 3, metadata !1090, metadata !1930}
!2326 = metadata !{i32 1349, i32 3, metadata !1090, metadata !1930}
!2327 = metadata !{i32 1349, i32 55, metadata !1090, metadata !1930}
!2328 = metadata !{i8* getelementptr inbounds ([19 x i8]* @.str51, i64 0, i64 0)}
!2329 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2330} ; [ DW_TAG_arg_variable ]
!2330 = metadata !{i32 1352, i32 10, metadata !1090, metadata !1930}
!2331 = metadata !{i32 510, i32 39, metadata !1189, metadata !2330}
!2332 = metadata !{i64 18}
!2333 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2330} ; [ DW_TAG_arg_variable ]
!2334 = metadata !{i32 510, i32 52, metadata !1189, metadata !2330}
!2335 = metadata !{i32 516, i32 6, metadata !1198, metadata !2330}
!2336 = metadata !{i32 517, i32 61, metadata !1197, metadata !2330}
!2337 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2330} ; [ DW_TAG_auto_variable ]
!2338 = metadata !{i32 518, i32 10, metadata !1197, metadata !2330}
!2339 = metadata !{i32 522, i32 9, metadata !1198, metadata !2330}
!2340 = metadata !{i32 786688, metadata !1090, metadata !"auth", metadata !37, i32 1094, metadata !227, i32 0, metadata !1930} ; [ DW_TAG_auto_variable ]
!2341 = metadata !{i32 1353, i32 3, metadata !1090, metadata !1930}
!2342 = metadata !{i32 1354, i32 2, metadata !1090, metadata !1930}
!2343 = metadata !{i32 1355, i32 1, metadata !1086, metadata !1930}
!2344 = metadata !{i32 1836, i32 4, metadata !914, null}
!2345 = metadata !{i32 1838, i32 4, metadata !914, null}
!2346 = metadata !{i32 1839, i32 17, metadata !913, null}
!2347 = metadata !{i32 1843, i32 8, metadata !2348, null}
!2348 = metadata !{i32 786443, metadata !2349, i32 1840, i32 17, metadata !37, i32 60} ; [ DW_TAG_lexical_block ]
!2349 = metadata !{i32 786443, metadata !913, i32 1839, i32 89, metadata !37, i32 59} ; [ DW_TAG_lexical_block ]
!2350 = metadata !{i32 1844, i32 8, metadata !2348, null}
!2351 = metadata !{i32 1845, i32 8, metadata !2348, null}
!2352 = metadata !{i32 1848, i32 8, metadata !2348, null}
!2353 = metadata !{i32 1849, i32 8, metadata !2348, null}
!2354 = metadata !{i32 1852, i32 8, metadata !2348, null}
!2355 = metadata !{i32 1853, i32 8, metadata !2348, null}
!2356 = metadata !{i32 1856, i32 8, metadata !2348, null}
!2357 = metadata !{i32 1857, i32 9, metadata !2358, null}
!2358 = metadata !{i32 786443, metadata !2348, i32 1856, i32 25, metadata !37, i32 61} ; [ DW_TAG_lexical_block ]
!2359 = metadata !{i32 1858, i32 8, metadata !2358, null}
!2360 = metadata !{i32 1859, i32 22, metadata !2348, null}
!2361 = metadata !{i32 1860, i32 8, metadata !2348, null}
!2362 = metadata !{i32 1861, i32 8, metadata !2348, null}
!2363 = metadata !{i32 1864, i32 8, metadata !2348, null}
!2364 = metadata !{i32 1865, i32 9, metadata !2365, null}
!2365 = metadata !{i32 786443, metadata !2348, i32 1864, i32 25, metadata !37, i32 62} ; [ DW_TAG_lexical_block ]
!2366 = metadata !{i32 1866, i32 8, metadata !2365, null}
!2367 = metadata !{i32 1867, i32 12, metadata !2348, null}
!2368 = metadata !{i32 1868, i32 9, metadata !2369, null}
!2369 = metadata !{i32 786443, metadata !2348, i32 1867, i32 54, metadata !37, i32 63} ; [ DW_TAG_lexical_block ]
!2370 = metadata !{i32 1869, i32 9, metadata !2369, null}
!2371 = metadata !{i32 1870, i32 9, metadata !2369, null}
!2372 = metadata !{i32 1872, i32 8, metadata !2348, null}
!2373 = metadata !{i32 1873, i32 9, metadata !2374, null}
!2374 = metadata !{i32 786443, metadata !2348, i32 1872, i32 24, metadata !37, i32 64} ; [ DW_TAG_lexical_block ]
!2375 = metadata !{i32 1874, i32 9, metadata !2374, null}
!2376 = metadata !{i32 1875, i32 8, metadata !2374, null}
!2377 = metadata !{i32 1876, i32 8, metadata !2348, null}
!2378 = metadata !{i32 1877, i32 8, metadata !2348, null}
!2379 = metadata !{i32 1878, i32 8, metadata !2348, null}
!2380 = metadata !{i32 1879, i32 8, metadata !2348, null}
!2381 = metadata !{i32 1882, i32 8, metadata !2348, null}
!2382 = metadata !{i32 4}
!2383 = metadata !{i32 1883, i32 8, metadata !2348, null}
!2384 = metadata !{i32 1884, i32 8, metadata !2348, null}
!2385 = metadata !{i32 1887, i32 8, metadata !2348, null}
!2386 = metadata !{i32 1888, i32 9, metadata !2387, null}
!2387 = metadata !{i32 786443, metadata !2348, i32 1887, i32 25, metadata !37, i32 65} ; [ DW_TAG_lexical_block ]
!2388 = metadata !{i32 1889, i32 8, metadata !2387, null}
!2389 = metadata !{i32 1890, i32 8, metadata !2348, null}
!2390 = metadata !{i32 1891, i32 8, metadata !2348, null}
!2391 = metadata !{i32 1892, i32 8, metadata !2348, null}
!2392 = metadata !{i32 1893, i32 8, metadata !2348, null}
!2393 = metadata !{i32 233, i32 12, metadata !1061, metadata !2394}
!2394 = metadata !{i32 1894, i32 8, metadata !2348, null}
!2395 = metadata !{i32 234, i32 20, metadata !1061, metadata !2394}
!2396 = metadata !{i32 236, i32 2, metadata !1061, metadata !2394}
!2397 = metadata !{i32 237, i32 2, metadata !1061, metadata !2394}
!2398 = metadata !{i32 238, i32 2, metadata !1061, metadata !2394}
!2399 = metadata !{i32 239, i32 2, metadata !1061, metadata !2394}
!2400 = metadata !{i32 240, i32 2, metadata !1061, metadata !2394}
!2401 = metadata !{i32 241, i32 1, metadata !1061, metadata !2394}
!2402 = metadata !{i32 1895, i32 8, metadata !2348, null}
!2403 = metadata !{i32 257, i32 13, metadata !956, metadata !2404}
!2404 = metadata !{i32 1896, i32 8, metadata !2348, null}
!2405 = metadata !{i32 259, i32 2, metadata !956, metadata !2404}
!2406 = metadata !{i32 260, i32 2, metadata !956, metadata !2404}
!2407 = metadata !{i32 261, i32 2, metadata !956, metadata !2404}
!2408 = metadata !{i32 262, i32 2, metadata !956, metadata !2404}
!2409 = metadata !{i32 263, i32 2, metadata !956, metadata !2404}
!2410 = metadata !{i32 264, i32 1, metadata !956, metadata !2404}
!2411 = metadata !{i32 1897, i32 8, metadata !2348, null}
!2412 = metadata !{i32 1898, i32 8, metadata !2348, null}
!2413 = metadata !{i32 1899, i32 8, metadata !2348, null}
!2414 = metadata !{i32 1900, i32 8, metadata !2348, null}
!2415 = metadata !{i32 1909, i32 8, metadata !2348, null}
!2416 = metadata !{i32 1910, i32 8, metadata !2348, null}
!2417 = metadata !{i32 1913, i32 8, metadata !2348, null}
!2418 = metadata !{i32 1914, i32 9, metadata !2419, null}
!2419 = metadata !{i32 786443, metadata !2348, i32 1913, i32 25, metadata !37, i32 66} ; [ DW_TAG_lexical_block ]
!2420 = metadata !{i32 1915, i32 8, metadata !2419, null}
!2421 = metadata !{i32 1916, i32 8, metadata !2348, null}
!2422 = metadata !{i32 1917, i32 12, metadata !2348, null}
!2423 = metadata !{i32 1918, i32 9, metadata !2424, null}
!2424 = metadata !{i32 786443, metadata !2348, i32 1917, i32 54, metadata !37, i32 67} ; [ DW_TAG_lexical_block ]
!2425 = metadata !{i32 1919, i32 9, metadata !2424, null}
!2426 = metadata !{i32 1920, i32 9, metadata !2424, null}
!2427 = metadata !{i32 1923, i32 9, metadata !2428, null}
!2428 = metadata !{i32 786443, metadata !2348, i32 1922, i32 24, metadata !37, i32 68} ; [ DW_TAG_lexical_block ]
!2429 = metadata !{i32 1924, i32 9, metadata !2428, null}
!2430 = metadata !{i32 1929, i32 8, metadata !2348, null}
!2431 = metadata !{i32 1929, i32 143, metadata !2348, null}
!2432 = metadata !{i32 1931, i32 8, metadata !2348, null}
!2433 = metadata !{i32 1932, i32 8, metadata !2348, null}
!2434 = metadata !{i32 1933, i32 8, metadata !2348, null}
!2435 = metadata !{i32 5}
!2436 = metadata !{i32 1936, i32 8, metadata !2348, null}
!2437 = metadata !{i32 1937, i32 8, metadata !2348, null}
!2438 = metadata !{i32 1940, i32 8, metadata !2348, null}
!2439 = metadata !{i32 1941, i32 8, metadata !2348, null}
!2440 = metadata !{i32 1948, i32 5, metadata !913, null}
!2441 = metadata !{i32 1950, i32 6, metadata !1944, null}
!2442 = metadata !{i32 1950, i32 6, metadata !2443, null}
!2443 = metadata !{i32 786443, metadata !1944, i32 1950, i32 6, metadata !37, i32 70} ; [ DW_TAG_lexical_block ]
!2444 = metadata !{i32 1951, i32 6, metadata !1944, null}
!2445 = metadata !{i32 1955, i32 6, metadata !1944, null}
!2446 = metadata !{i32 1956, i32 6, metadata !1944, null}
!2447 = metadata !{i32 1957, i32 5, metadata !1944, null}
!2448 = metadata !{i32 1957, i32 12, metadata !913, null}
!2449 = metadata !{i32 1959, i32 6, metadata !2450, null}
!2450 = metadata !{i32 786443, metadata !913, i32 1957, i32 35, metadata !37, i32 71} ; [ DW_TAG_lexical_block ]
!2451 = metadata !{i32 1959, i32 6, metadata !2452, null}
!2452 = metadata !{i32 786443, metadata !2450, i32 1959, i32 6, metadata !37, i32 72} ; [ DW_TAG_lexical_block ]
!2453 = metadata !{i32 1960, i32 41, metadata !2450, null}
!2454 = metadata !{i32 1962, i32 6, metadata !2450, null}
!2455 = metadata !{i32 1963, i32 6, metadata !2450, null}
!2456 = metadata !{i32 1964, i32 5, metadata !2450, null}
!2457 = metadata !{i32 1966, i32 5, metadata !913, null}
!2458 = metadata !{i32 1967, i32 6, metadata !2459, null}
!2459 = metadata !{i32 786443, metadata !913, i32 1966, i32 21, metadata !37, i32 73} ; [ DW_TAG_lexical_block ]
!2460 = metadata !{i32 1968, i32 6, metadata !2459, null}
!2461 = metadata !{i32 1969, i32 5, metadata !2459, null}
!2462 = metadata !{i32 1980, i32 5, metadata !913, null}
!2463 = metadata !{i32 1982, i32 6, metadata !912, null}
!2464 = metadata !{i32 1983, i32 11, metadata !2465, null}
!2465 = metadata !{i32 786443, metadata !912, i32 1983, i32 6, metadata !37, i32 75} ; [ DW_TAG_lexical_block ]
!2466 = metadata !{i32 1981, i32 17, metadata !912, null}
!2467 = metadata !{i32 1985, i32 15, metadata !2468, null}
!2468 = metadata !{i32 786443, metadata !2469, i32 1984, i32 27, metadata !37, i32 77} ; [ DW_TAG_lexical_block ]
!2469 = metadata !{i32 786443, metadata !2465, i32 1983, i32 42, metadata !37, i32 76} ; [ DW_TAG_lexical_block ]
!2470 = metadata !{i32 1984, i32 7, metadata !2469, null}
!2471 = metadata !{i32 1986, i32 7, metadata !2468, null}
!2472 = metadata !{i32 1987, i32 15, metadata !2473, null}
!2473 = metadata !{i32 786443, metadata !2469, i32 1986, i32 14, metadata !37, i32 78} ; [ DW_TAG_lexical_block ]
!2474 = metadata !{i32 1992, i32 10, metadata !912, null}
!2475 = metadata !{i32 1993, i32 6, metadata !912, null}
!2476 = metadata !{i32 1994, i32 11, metadata !1942, null}
!2477 = metadata !{i32 1995, i32 7, metadata !1941, null}
!2478 = metadata !{i32 1997, i32 8, metadata !2479, null}
!2479 = metadata !{i32 786443, metadata !1941, i32 1996, i32 27, metadata !37, i32 81} ; [ DW_TAG_lexical_block ]
!2480 = metadata !{i32 1998, i32 7, metadata !2479, null}
!2481 = metadata !{i32 2000, i32 6, metadata !912, null}
!2482 = metadata !{i32 2001, i32 6, metadata !912, null}
!2483 = metadata !{i32 2002, i32 5, metadata !912, null}
!2484 = metadata !{i32 2010, i32 4, metadata !914, null}
!2485 = metadata !{i32 2014, i32 4, metadata !1932, null}
!2486 = metadata !{i32 2015, i32 5, metadata !2487, null}
!2487 = metadata !{i32 786443, metadata !914, i32 2014, i32 11, metadata !37, i32 83} ; [ DW_TAG_lexical_block ]
!2488 = metadata !{i32 2016, i32 5, metadata !2487, null}
!2489 = metadata !{i32 2017, i32 5, metadata !2487, null}
!2490 = metadata !{i32 2025, i32 8, metadata !914, null}
!2491 = metadata !{i32 2026, i32 5, metadata !2492, null}
!2492 = metadata !{i32 786443, metadata !914, i32 2025, i32 50, metadata !37, i32 84} ; [ DW_TAG_lexical_block ]
!2493 = metadata !{i32 2027, i32 6, metadata !2494, null}
!2494 = metadata !{i32 786443, metadata !2492, i32 2026, i32 18, metadata !37, i32 85} ; [ DW_TAG_lexical_block ]
!2495 = metadata !{i32 2028, i32 5, metadata !2494, null}
!2496 = metadata !{i32 2029, i32 5, metadata !2492, null}
!2497 = metadata !{i32 2030, i32 5, metadata !2492, null}
!2498 = metadata !{i32 2031, i32 5, metadata !2492, null}
!2499 = metadata !{i32 2033, i32 4, metadata !914, null}
!2500 = metadata !{i32 2034, i32 5, metadata !2501, null}
!2501 = metadata !{i32 786443, metadata !914, i32 2033, i32 20, metadata !37, i32 86} ; [ DW_TAG_lexical_block ]
!2502 = metadata !{i32 2035, i32 5, metadata !2501, null}
!2503 = metadata !{i32 2036, i32 4, metadata !2501, null}
!2504 = metadata !{i32 2043, i32 4, metadata !914, null}
!2505 = metadata !{i32 2044, i32 9, metadata !920, null}
!2506 = metadata !{i32 2046, i32 11, metadata !925, null}
!2507 = metadata !{i32 2047, i32 8, metadata !924, null}
!2508 = metadata !{i32 2048, i32 8, metadata !923, null}
!2509 = metadata !{i32 2049, i32 7, metadata !924, null}
!2510 = metadata !{i32 2050, i32 8, metadata !929, null}
!2511 = metadata !{i32 2051, i32 8, metadata !928, null}
!2512 = metadata !{i32 2053, i32 8, metadata !2513, null}
!2513 = metadata !{i32 786443, metadata !918, i32 2053, i32 8, metadata !37, i32 96} ; [ DW_TAG_lexical_block ]
!2514 = metadata !{i32 2054, i32 8, metadata !918, null}
!2515 = metadata !{i32 2058, i32 6, metadata !919, null}
!2516 = metadata !{i32 2062, i32 6, metadata !919, null}
!2517 = metadata !{i32 2062, i32 6, metadata !2518, null}
!2518 = metadata !{i32 786443, metadata !919, i32 2062, i32 6, metadata !37, i32 99} ; [ DW_TAG_lexical_block ]
!2519 = metadata !{i32 2064, i32 6, metadata !919, null}
!2520 = metadata !{i32 2065, i32 7, metadata !2521, null}
!2521 = metadata !{i32 786443, metadata !919, i32 2064, i32 62, metadata !37, i32 100} ; [ DW_TAG_lexical_block ]
!2522 = metadata !{i32 2066, i32 7, metadata !2521, null}
!2523 = metadata !{i32 2067, i32 6, metadata !2521, null}
!2524 = metadata !{i32 2069, i32 6, metadata !919, null}
!2525 = metadata !{i32 2070, i32 6, metadata !919, null}
!2526 = metadata !{i32 2071, i32 6, metadata !919, null}
!2527 = metadata !{i32 2072, i32 6, metadata !919, null}
!2528 = metadata !{i32 2076, i32 6, metadata !919, null}
!2529 = metadata !{i32 2082, i32 9, metadata !934, null}
!2530 = metadata !{i32 2083, i32 5, metadata !934, null}
!2531 = metadata !{i32 2084, i32 6, metadata !933, null}
!2532 = metadata !{i32 2085, i32 11, metadata !2533, null}
!2533 = metadata !{i32 786443, metadata !933, i32 2084, i32 49, metadata !37, i32 103} ; [ DW_TAG_lexical_block ]
!2534 = metadata !{i32 2086, i32 6, metadata !2533, null}
!2535 = metadata !{i32 2089, i32 11, metadata !932, null}
!2536 = metadata !{i32 2090, i32 19, metadata !931, null}
!2537 = metadata !{i32 2091, i32 8, metadata !931, null}
!2538 = metadata !{i32 2092, i32 7, metadata !931, null}
!2539 = metadata !{i32 2094, i32 6, metadata !933, null}
!2540 = metadata !{i32 2095, i32 5, metadata !933, null}
!2541 = metadata !{i32 2096, i32 6, metadata !2542, null}
!2542 = metadata !{i32 786443, metadata !934, i32 2095, i32 12, metadata !37, i32 106} ; [ DW_TAG_lexical_block ]
!2543 = metadata !{i32 2100, i32 4, metadata !914, null}
!2544 = metadata !{i32 2102, i32 6, metadata !937, null}
!2545 = metadata !{i32 2103, i32 6, metadata !937, null}
!2546 = metadata !{i32 2105, i32 6, metadata !937, null}
!2547 = metadata !{i32 2106, i32 20, metadata !937, null}
!2548 = metadata !{i32 2107, i32 6, metadata !937, null}
!2549 = metadata !{i32 2108, i32 7, metadata !2550, null}
!2550 = metadata !{i32 786443, metadata !937, i32 2107, i32 34, metadata !37, i32 108} ; [ DW_TAG_lexical_block ]
!2551 = metadata !{i32 2109, i32 6, metadata !2550, null}
!2552 = metadata !{i32 2110, i32 7, metadata !2553, null}
!2553 = metadata !{i32 786443, metadata !937, i32 2109, i32 13, metadata !37, i32 109} ; [ DW_TAG_lexical_block ]
!2554 = metadata !{i32 2114, i32 10, metadata !937, null}
!2555 = metadata !{i32 2115, i32 7, metadata !2556, null}
!2556 = metadata !{i32 786443, metadata !937, i32 2114, i32 69, metadata !37, i32 110} ; [ DW_TAG_lexical_block ]
!2557 = metadata !{i32 2116, i32 7, metadata !2556, null}
!2558 = metadata !{i32 2117, i32 7, metadata !2556, null}
!2559 = metadata !{i32 2118, i32 6, metadata !2556, null}
!2560 = metadata !{i32 2123, i32 35, metadata !936, null}
!2561 = metadata !{i32 2125, i32 11, metadata !936, null}
!2562 = metadata !{i32 2126, i32 8, metadata !2563, null}
!2563 = metadata !{i32 786443, metadata !936, i32 2125, i32 70, metadata !37, i32 112} ; [ DW_TAG_lexical_block ]
!2564 = metadata !{i32 2127, i32 8, metadata !2563, null}
!2565 = metadata !{i32 2128, i32 8, metadata !2563, null}
!2566 = metadata !{i32 2131, i32 8, metadata !2563, null}
!2567 = metadata !{i32 2132, i32 8, metadata !2563, null}
!2568 = metadata !{i32 2133, i32 7, metadata !2563, null}
!2569 = metadata !{i32 2150, i32 5, metadata !2570, null}
!2570 = metadata !{i32 786443, metadata !914, i32 2149, i32 4, metadata !37, i32 114} ; [ DW_TAG_lexical_block ]
!2571 = metadata !{i32 2150, i32 5, metadata !2572, null}
!2572 = metadata !{i32 786443, metadata !2570, i32 2150, i32 5, metadata !37, i32 115} ; [ DW_TAG_lexical_block ]
!2573 = metadata !{i32 2152, i32 5, metadata !2570, null}
!2574 = metadata !{i32 2154, i32 5, metadata !2570, null}
!2575 = metadata !{i32 2155, i32 6, metadata !2576, null}
!2576 = metadata !{i32 786443, metadata !2570, i32 2154, i32 27, metadata !37, i32 116} ; [ DW_TAG_lexical_block ]
!2577 = metadata !{i32 2158, i32 5, metadata !2570, null}
!2578 = metadata !{i32 2159, i32 6, metadata !2579, null}
!2579 = metadata !{i32 786443, metadata !2570, i32 2158, i32 61, metadata !37, i32 117} ; [ DW_TAG_lexical_block ]
!2580 = metadata !{i32 2160, i32 6, metadata !2579, null}
!2581 = metadata !{i32 2161, i32 5, metadata !2579, null}
!2582 = metadata !{i32 2164, i32 4, metadata !914, null}
!2583 = metadata !{i32 2166, i32 6, metadata !2584, null}
!2584 = metadata !{i32 786443, metadata !1947, i32 2165, i32 20, metadata !37, i32 119} ; [ DW_TAG_lexical_block ]
!2585 = metadata !{i32 2167, i32 6, metadata !2584, null}
!2586 = metadata !{i32 2168, i32 7, metadata !2587, null}
!2587 = metadata !{i32 786443, metadata !2584, i32 2167, i32 23, metadata !37, i32 120} ; [ DW_TAG_lexical_block ]
!2588 = metadata !{i32 2169, i32 7, metadata !2587, null}
!2589 = metadata !{i32 2170, i32 7, metadata !2587, null}
!2590 = metadata !{i32 2171, i32 7, metadata !2587, null}
!2591 = metadata !{i32 2178, i32 4, metadata !914, null}
!2592 = metadata !{i32 2180, i32 5, metadata !2593, null}
!2593 = metadata !{i32 786443, metadata !914, i32 2179, i32 52, metadata !37, i32 121} ; [ DW_TAG_lexical_block ]
!2594 = metadata !{i32 2181, i32 5, metadata !2593, null}
!2595 = metadata !{i32 2182, i32 6, metadata !2596, null}
!2596 = metadata !{i32 786443, metadata !2593, i32 2181, i32 19, metadata !37, i32 122} ; [ DW_TAG_lexical_block ]
!2597 = metadata !{i32 2183, i32 5, metadata !2596, null}
!2598 = metadata !{i32 2184, i32 5, metadata !2593, null}
!2599 = metadata !{i32 2192, i32 3, metadata !915, null}
!2600 = metadata !{i32 2194, i32 3, metadata !915, null}
!2601 = metadata !{i32 2195, i32 4, metadata !2602, null}
!2602 = metadata !{i32 786443, metadata !915, i32 2194, i32 46, metadata !37, i32 124} ; [ DW_TAG_lexical_block ]
!2603 = metadata !{i32 2196, i32 3, metadata !2602, null}
!2604 = metadata !{i32 2197, i32 3, metadata !915, null}
!2605 = metadata !{i32 2198, i32 4, metadata !2606, null}
!2606 = metadata !{i32 786443, metadata !915, i32 2197, i32 36, metadata !37, i32 125} ; [ DW_TAG_lexical_block ]
!2607 = metadata !{i32 2199, i32 3, metadata !2606, null}
!2608 = metadata !{i32 2200, i32 4, metadata !2609, null}
!2609 = metadata !{i32 786443, metadata !909, i32 2200, i32 4, metadata !37, i32 126} ; [ DW_TAG_lexical_block ]
!2610 = metadata !{i32 255}
!2611 = metadata !{i32 2201, i32 3, metadata !2612, null}
!2612 = metadata !{i32 786443, metadata !2609, i32 2200, i32 15, metadata !37, i32 127} ; [ DW_TAG_lexical_block ]
!2613 = metadata !{i32 2202, i32 4, metadata !909, null}
!2614 = metadata !{i32 2205, i32 2, metadata !732, null}
!2615 = metadata !{i32 2210, i32 3, metadata !948, null}
!2616 = metadata !{i32 2211, i32 3, metadata !948, null}
!2617 = metadata !{i32 2212, i32 3, metadata !948, null}
!2618 = metadata !{i32 2215, i32 4, metadata !2619, null}
!2619 = metadata !{i32 786443, metadata !948, i32 2214, i32 10, metadata !37, i32 130} ; [ DW_TAG_lexical_block ]
!2620 = metadata !{i32 2216, i32 4, metadata !2619, null}
!2621 = metadata !{i32 2213, i32 4, metadata !2622, null}
!2622 = metadata !{i32 786443, metadata !948, i32 2212, i32 37, metadata !37, i32 129} ; [ DW_TAG_lexical_block ]
!2623 = metadata !{i32 2218, i32 3, metadata !948, null}
!2624 = metadata !{i32 2224, i32 2, metadata !948, null}
!2625 = metadata !{i32 2230, i32 2, metadata !732, null}
!2626 = metadata !{i32 2231, i32 2, metadata !732, null}
!2627 = metadata !{i32 2232, i32 2, metadata !732, null}
!2628 = metadata !{i32 2242, i32 2, metadata !732, null}
!2629 = metadata !{i32 2243, i32 1, metadata !732, null}
!2630 = metadata !{i32 249, i32 58, metadata !1047, null}
!2631 = metadata !{i32 249, i32 88, metadata !1047, null}
!2632 = metadata !{i32 251, i32 9, metadata !2633, null}
!2633 = metadata !{i32 786443, metadata !1047, i32 250, i32 1, metadata !37, i32 133} ; [ DW_TAG_lexical_block ]
!2634 = metadata !{i32 243, i32 49, metadata !977, null}
!2635 = metadata !{i32 243, i32 60, metadata !977, null}
!2636 = metadata !{i32 245, i32 2, metadata !2637, null}
!2637 = metadata !{i32 786443, metadata !977, i32 244, i32 1, metadata !37, i32 132} ; [ DW_TAG_lexical_block ]
!2638 = metadata !{i32 246, i32 2, metadata !2637, null}
!2639 = metadata !{i32 222, i32 40, metadata !1070, null}
!2640 = metadata !{i32 222, i32 55, metadata !1070, null}
!2641 = metadata !{i32 224, i32 30, metadata !1080, null}
!2642 = metadata !{i32 225, i32 30, metadata !1080, null}
!2643 = metadata !{i32 227, i32 9, metadata !1080, null}
!2644 = metadata !{i32 216, i32 49, metadata !1063, null}
!2645 = metadata !{i32 216, i32 63, metadata !1063, null}
!2646 = metadata !{i32 218, i32 2, metadata !2647, null}
!2647 = metadata !{i32 786443, metadata !1063, i32 217, i32 1, metadata !37, i32 135} ; [ DW_TAG_lexical_block ]
!2648 = metadata !{i32 219, i32 2, metadata !2647, null}
!2649 = metadata !{i32 510, i32 39, metadata !1189, null}
!2650 = metadata !{i32 510, i32 52, metadata !1189, null}
!2651 = metadata !{i32 516, i32 6, metadata !1198, null}
!2652 = metadata !{i32 517, i32 61, metadata !1197, null}
!2653 = metadata !{i32 518, i32 10, metadata !1197, null}
!2654 = metadata !{i32 522, i32 9, metadata !1198, null}
!2655 = metadata !{i32 523, i32 1, metadata !1198, null}
!2656 = metadata !{i32 525, i32 40, metadata !1178, null}
!2657 = metadata !{i32 525, i32 52, metadata !1178, null}
!2658 = metadata !{i32 533, i32 2, metadata !1186, null}
!2659 = metadata !{i32 536, i32 13, metadata !1186, null}
!2660 = metadata !{i32 542, i32 6, metadata !1186, null}
!2661 = metadata !{i32 543, i32 61, metadata !1188, null}
!2662 = metadata !{i32 544, i32 10, metadata !1188, null}
!2663 = metadata !{i32 548, i32 2, metadata !1186, null}
!2664 = metadata !{i32 549, i32 3, metadata !2665, null}
!2665 = metadata !{i32 786443, metadata !1186, i32 548, i32 13, metadata !37, i32 193} ; [ DW_TAG_lexical_block ]
!2666 = metadata !{i32 553, i32 2, metadata !1186, null}
!2667 = metadata !{i32 554, i32 3, metadata !2214, null}
!2668 = metadata !{i32 555, i32 2, metadata !2214, null}
!2669 = metadata !{i32 582, i32 9, metadata !1186, null}
!2670 = metadata !{i32 583, i32 1, metadata !1186, null}
!2671 = metadata !{i32 874, i32 48, metadata !1385, null}
!2672 = metadata !{i32 876, i32 6, metadata !2673, null}
!2673 = metadata !{i32 786443, metadata !1385, i32 875, i32 1, metadata !37, i32 279} ; [ DW_TAG_lexical_block ]
!2674 = metadata !{i32 877, i32 3, metadata !2675, null}
!2675 = metadata !{i32 786443, metadata !2673, i32 876, i32 72, metadata !37, i32 280} ; [ DW_TAG_lexical_block ]
!2676 = metadata !{i32 880, i32 1, metadata !2673, null}
!2677 = metadata !{i32 787, i32 2, metadata !1343, null}
!2678 = metadata !{i32 791, i32 6, metadata !1343, null}
!2679 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str18, i64 0, i64 0)}
!2680 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2681} ; [ DW_TAG_arg_variable ]
!2681 = metadata !{i32 793, i32 17, metadata !2682, null}
!2682 = metadata !{i32 786443, metadata !1343, i32 791, i32 37, metadata !37, i32 260} ; [ DW_TAG_lexical_block ]
!2683 = metadata !{i32 510, i32 39, metadata !1189, metadata !2681}
!2684 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2681} ; [ DW_TAG_arg_variable ]
!2685 = metadata !{i32 510, i32 52, metadata !1189, metadata !2681}
!2686 = metadata !{i32 516, i32 6, metadata !1198, metadata !2681}
!2687 = metadata !{i32 517, i32 61, metadata !1197, metadata !2681}
!2688 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2681} ; [ DW_TAG_auto_variable ]
!2689 = metadata !{i32 518, i32 10, metadata !1197, metadata !2681}
!2690 = metadata !{i32 522, i32 9, metadata !1198, metadata !2681}
!2691 = metadata !{i32 795, i32 3, metadata !2682, null}
!2692 = metadata !{i32 796, i32 22, metadata !2693, null}
!2693 = metadata !{i32 786443, metadata !2682, i32 795, i32 20, metadata !37, i32 261} ; [ DW_TAG_lexical_block ]
!2694 = metadata !{i32 797, i32 18, metadata !2693, null}
!2695 = metadata !{i32 798, i32 4, metadata !2693, null}
!2696 = metadata !{i32 799, i32 4, metadata !2693, null}
!2697 = metadata !{i32 800, i32 4, metadata !2693, null}
!2698 = metadata !{i32 801, i32 3, metadata !2693, null}
!2699 = metadata !{i32 804, i32 6, metadata !1343, null}
!2700 = metadata !{i32 808, i32 14, metadata !2701, null}
!2701 = metadata !{i32 786443, metadata !1343, i32 806, i32 4, metadata !37, i32 262} ; [ DW_TAG_lexical_block ]
!2702 = metadata !{i32 811, i32 3, metadata !2701, null}
!2703 = metadata !{i32 812, i32 11, metadata !2704, null}
!2704 = metadata !{i32 786443, metadata !2701, i32 811, i32 62, metadata !37, i32 263} ; [ DW_TAG_lexical_block ]
!2705 = metadata !{i32 813, i32 4, metadata !2704, null}
!2706 = metadata !{i32 814, i32 15, metadata !2704, null}
!2707 = metadata !{i32 815, i32 4, metadata !2704, null}
!2708 = metadata !{i32 816, i32 3, metadata !2704, null}
!2709 = metadata !{i32 817, i32 11, metadata !2710, null}
!2710 = metadata !{i32 786443, metadata !2701, i32 816, i32 10, metadata !37, i32 264} ; [ DW_TAG_lexical_block ]
!2711 = metadata !{i32 818, i32 15, metadata !2710, null}
!2712 = metadata !{i32 820, i32 3, metadata !2701, null}
!2713 = metadata !{i32 823, i32 3, metadata !2701, null}
!2714 = metadata !{i32 826, i32 3, metadata !2701, null}
!2715 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2716} ; [ DW_TAG_arg_variable ]
!2716 = metadata !{i32 827, i32 15, metadata !2717, null}
!2717 = metadata !{i32 786443, metadata !2701, i32 826, i32 56, metadata !37, i32 265} ; [ DW_TAG_lexical_block ]
!2718 = metadata !{i32 510, i32 39, metadata !1189, metadata !2716}
!2719 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2716} ; [ DW_TAG_arg_variable ]
!2720 = metadata !{i32 510, i32 52, metadata !1189, metadata !2716}
!2721 = metadata !{i32 516, i32 6, metadata !1198, metadata !2716}
!2722 = metadata !{i32 517, i32 61, metadata !1197, metadata !2716}
!2723 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2716} ; [ DW_TAG_auto_variable ]
!2724 = metadata !{i32 518, i32 10, metadata !1197, metadata !2716}
!2725 = metadata !{i32 522, i32 9, metadata !1198, metadata !2716}
!2726 = metadata !{i32 829, i32 4, metadata !2717, null}
!2727 = metadata !{i32 830, i32 20, metadata !2728, null}
!2728 = metadata !{i32 786443, metadata !2717, i32 829, i32 18, metadata !37, i32 266} ; [ DW_TAG_lexical_block ]
!2729 = metadata !{i32 831, i32 5, metadata !2728, null}
!2730 = metadata !{i32 839, i32 5, metadata !2728, null}
!2731 = metadata !{i32 710, i32 52, metadata !1349, metadata !2730}
!2732 = metadata !{i32 786689, metadata !1349, metadata !"path", metadata !37, i32 16777926, metadata !57, i32 0, metadata !2730} ; [ DW_TAG_arg_variable ]
!2733 = metadata !{i32 786689, metadata !1349, metadata !"path_len", metadata !37, i32 33555142, metadata !60, i32 0, metadata !2730} ; [ DW_TAG_arg_variable ]
!2734 = metadata !{i32 710, i32 62, metadata !1349, metadata !2730}
!2735 = metadata !{i32 786689, metadata !1349, metadata !"doc_root", metadata !37, i32 50332358, metadata !227, i32 0, metadata !2730} ; [ DW_TAG_arg_variable ]
!2736 = metadata !{i32 710, i32 84, metadata !1349, metadata !2730}
!2737 = metadata !{i32 786689, metadata !1349, metadata !"doc_root_len", metadata !37, i32 67109574, metadata !60, i32 0, metadata !2730} ; [ DW_TAG_arg_variable ]
!2738 = metadata !{i32 710, i32 98, metadata !1349, metadata !2730}
!2739 = metadata !{i32 786689, metadata !1349, metadata !"start", metadata !37, i32 83886790, metadata !60, i32 0, metadata !2730} ; [ DW_TAG_arg_variable ]
!2740 = metadata !{i32 710, i32 116, metadata !1349, metadata !2730}
!2741 = metadata !{i32 713, i32 39, metadata !1360, metadata !2730}
!2742 = metadata !{i32 714, i32 24, metadata !1360, metadata !2730}
!2743 = metadata !{i32 786688, metadata !1360, metadata !"request_time", metadata !37, i32 714, metadata !868, i32 0, metadata !2730} ; [ DW_TAG_auto_variable ]
!2744 = metadata !{i32 717, i32 6, metadata !1360, metadata !2730}
!2745 = metadata !{i64 16}
!2746 = metadata !{i32 786689, metadata !1376, metadata !"len", metadata !1377, i32 16777309, metadata !417, i32 0, metadata !2747} ; [ DW_TAG_arg_variable ]
!2747 = metadata !{i32 718, i32 15, metadata !2748, metadata !2730}
!2748 = metadata !{i32 786443, metadata !1360, i32 717, i32 97, metadata !37, i32 269} ; [ DW_TAG_lexical_block ]
!2749 = metadata !{i32 93, i32 43, metadata !1376, metadata !2747}
!2750 = metadata !{i32 95, i32 14, metadata !1384, metadata !2747}
!2751 = metadata !{i32 786688, metadata !1384, metadata !"tmp", metadata !1377, i32 95, metadata !82, i32 0, metadata !2747} ; [ DW_TAG_auto_variable ]
!2752 = metadata !{i32 96, i32 2, metadata !1384, metadata !2747}
!2753 = metadata !{i32 99, i32 2, metadata !1384, metadata !2747}
!2754 = metadata !{i32 100, i32 2, metadata !1384, metadata !2747}
!2755 = metadata !{i32 719, i32 3, metadata !2748, metadata !2730}
!2756 = metadata !{i64 72}
!2757 = metadata !{i32 786689, metadata !1376, metadata !"len", metadata !1377, i32 16777309, metadata !417, i32 0, metadata !2758} ; [ DW_TAG_arg_variable ]
!2758 = metadata !{i32 720, i32 42, metadata !2748, metadata !2730}
!2759 = metadata !{i32 93, i32 43, metadata !1376, metadata !2758}
!2760 = metadata !{i32 95, i32 14, metadata !1384, metadata !2758}
!2761 = metadata !{i32 786688, metadata !1384, metadata !"tmp", metadata !1377, i32 95, metadata !82, i32 0, metadata !2758} ; [ DW_TAG_auto_variable ]
!2762 = metadata !{i32 96, i32 2, metadata !1384, metadata !2758}
!2763 = metadata !{i32 99, i32 2, metadata !1384, metadata !2758}
!2764 = metadata !{i32 100, i32 2, metadata !1384, metadata !2758}
!2765 = metadata !{i32 721, i32 3, metadata !2748, metadata !2730}
!2766 = metadata !{i32 722, i32 3, metadata !2748, metadata !2730}
!2767 = metadata !{i32 723, i32 3, metadata !2748, metadata !2730}
!2768 = metadata !{i32 724, i32 2, metadata !2748, metadata !2730}
!2769 = metadata !{i32 786688, metadata !1360, metadata !"entry", metadata !37, i32 713, metadata !1362, i32 0, metadata !2730} ; [ DW_TAG_auto_variable ]
!2770 = metadata !{i32 727, i32 2, metadata !1360, metadata !2730}
!2771 = metadata !{i32 734, i32 3, metadata !1371, metadata !2730}
!2772 = metadata !{i32 736, i32 3, metadata !1371, metadata !2730}
!2773 = metadata !{i32 737, i32 16, metadata !2774, metadata !2730}
!2774 = metadata !{i32 786443, metadata !1371, i32 736, i32 42, metadata !37, i32 271} ; [ DW_TAG_lexical_block ]
!2775 = metadata !{i32 786688, metadata !1371, metadata !"real_path", metadata !37, i32 728, metadata !57, i32 0, metadata !2730} ; [ DW_TAG_auto_variable ]
!2776 = metadata !{i32 738, i32 20, metadata !2774, metadata !2730}
!2777 = metadata !{i32 786688, metadata !1371, metadata !"real_path_len", metadata !37, i32 729, metadata !60, i32 0, metadata !2730} ; [ DW_TAG_auto_variable ]
!2778 = metadata !{i32 739, i32 4, metadata !2774, metadata !2730}
!2779 = metadata !{i32 740, i32 4, metadata !2774, metadata !2730}
!2780 = metadata !{i32 741, i32 3, metadata !2774, metadata !2730}
!2781 = metadata !{i32 743, i32 3, metadata !1371, metadata !2730}
!2782 = metadata !{i32 747, i32 3, metadata !2783, metadata !2730}
!2783 = metadata !{i32 786443, metadata !1371, i32 743, i32 32, metadata !37, i32 272} ; [ DW_TAG_lexical_block ]
!2784 = metadata !{i32 760, i32 7, metadata !1371, metadata !2730}
!2785 = metadata !{i32 762, i32 4, metadata !2786, metadata !2730}
!2786 = metadata !{i32 786443, metadata !1371, i32 760, i32 36, metadata !37, i32 274} ; [ DW_TAG_lexical_block ]
!2787 = metadata !{i32 786688, metadata !1360, metadata !"ptr", metadata !37, i32 712, metadata !57, i32 0, metadata !2730} ; [ DW_TAG_auto_variable ]
!2788 = metadata !{i32 763, i32 18, metadata !2786, metadata !2730}
!2789 = metadata !{i32 764, i32 5, metadata !2790, metadata !2730}
!2790 = metadata !{i32 786443, metadata !2786, i32 763, i32 55, metadata !37, i32 275} ; [ DW_TAG_lexical_block ]
!2791 = metadata !{i32 765, i32 5, metadata !2790, metadata !2730}
!2792 = metadata !{i32 766, i32 5, metadata !2790, metadata !2730}
!2793 = metadata !{i32 767, i32 5, metadata !2790, metadata !2730}
!2794 = metadata !{i32 770, i32 4, metadata !2795, metadata !2730}
!2795 = metadata !{i32 786443, metadata !1371, i32 769, i32 10, metadata !37, i32 276} ; [ DW_TAG_lexical_block ]
!2796 = metadata !{i32 773, i32 3, metadata !1371, metadata !2730}
!2797 = metadata !{i32 774, i32 2, metadata !1371, metadata !2730}
!2798 = metadata !{i32 777, i32 2, metadata !1360, metadata !2730}
!2799 = metadata !{i32 778, i32 1, metadata !1360, metadata !2730}
!2800 = metadata !{i32 840, i32 4, metadata !2728, null}
!2801 = metadata !{i32 846, i32 3, metadata !2701, null}
!2802 = metadata !{i32 847, i32 2, metadata !2701, null}
!2803 = metadata !{i32 850, i32 1, metadata !1343, null}
!2804 = metadata !{i32 858, i32 2, metadata !2805, null}
!2805 = metadata !{i32 786443, metadata !1338, i32 853, i32 1, metadata !37, i32 253} ; [ DW_TAG_lexical_block ]
!2806 = metadata !{i32 859, i32 7, metadata !2807, null}
!2807 = metadata !{i32 786443, metadata !2805, i32 858, i32 24, metadata !37, i32 254} ; [ DW_TAG_lexical_block ]
!2808 = metadata !{i32 860, i32 4, metadata !2809, null}
!2809 = metadata !{i32 786443, metadata !2807, i32 859, i32 26, metadata !37, i32 255} ; [ DW_TAG_lexical_block ]
!2810 = metadata !{i32 864, i32 6, metadata !2809, null}
!2811 = metadata !{i32 865, i32 5, metadata !2812, null}
!2812 = metadata !{i32 786443, metadata !2809, i32 864, i32 65, metadata !37, i32 256} ; [ DW_TAG_lexical_block ]
!2813 = metadata !{i32 866, i32 4, metadata !2812, null}
!2814 = metadata !{i32 868, i32 4, metadata !2815, null}
!2815 = metadata !{i32 786443, metadata !2807, i32 867, i32 10, metadata !37, i32 257} ; [ DW_TAG_lexical_block ]
!2816 = metadata !{i32 871, i32 2, metadata !2805, null}
!2817 = metadata !{i32 297, i32 45, metadata !1315, null}
!2818 = metadata !{i32 297, i32 55, metadata !1315, null}
!2819 = metadata !{i32 299, i32 23, metadata !1323, null}
!2820 = metadata !{i32 300, i32 29, metadata !1323, null}
!2821 = metadata !{i32 303, i32 2, metadata !1323, null}
!2822 = metadata !{i32 786689, metadata !1326, metadata !"str", metadata !37, i32 16777486, metadata !227, i32 0, metadata !2823} ; [ DW_TAG_arg_variable ]
!2823 = metadata !{i32 304, i32 9, metadata !2824, null}
!2824 = metadata !{i32 786443, metadata !1323, i32 303, i32 24, metadata !37, i32 248} ; [ DW_TAG_lexical_block ]
!2825 = metadata !{i32 270, i32 59, metadata !1326, metadata !2823}
!2826 = metadata !{i32 786689, metadata !1326, metadata !"str_length", metadata !37, i32 33554702, metadata !68, i32 0, metadata !2823} ; [ DW_TAG_arg_variable ]
!2827 = metadata !{i32 270, i32 69, metadata !1326, metadata !2823}
!2828 = metadata !{i32 278, i32 6, metadata !1334, metadata !2823}
!2829 = metadata !{i32 279, i32 61, metadata !1336, metadata !2823}
!2830 = metadata !{i32 786688, metadata !1336, metadata !"request", metadata !37, i32 279, metadata !674, i32 0, metadata !2823} ; [ DW_TAG_auto_variable ]
!2831 = metadata !{i32 280, i32 14, metadata !1336, metadata !2823}
!2832 = metadata !{i32 281, i32 3, metadata !1336, metadata !2823}
!2833 = metadata !{i32 288, i32 8, metadata !1334, metadata !2823}
!2834 = metadata !{i32 786688, metadata !1334, metadata !"ret", metadata !37, i32 273, metadata !50, i32 0, metadata !2823} ; [ DW_TAG_auto_variable ]
!2835 = metadata !{i32 289, i32 2, metadata !1334, metadata !2823}
!2836 = metadata !{i32 289, i32 16, metadata !1334, metadata !2823}
!2837 = metadata !{i32 305, i32 3, metadata !2824, null}
!2838 = metadata !{i32 306, i32 4, metadata !2839, null}
!2839 = metadata !{i32 786443, metadata !2824, i32 305, i32 13, metadata !37, i32 249} ; [ DW_TAG_lexical_block ]
!2840 = metadata !{i32 307, i32 4, metadata !2839, null}
!2841 = metadata !{i32 309, i32 3, metadata !2824, null}
!2842 = metadata !{i32 310, i32 3, metadata !2824, null}
!2843 = metadata !{i32 311, i32 2, metadata !2824, null}
!2844 = metadata !{i32 314, i32 1, metadata !1323, null}
!2845 = metadata !{i32 317, i32 37, metadata !1308, null}
!2846 = metadata !{i32 319, i32 6, metadata !1314, null}
!2847 = metadata !{i32 320, i32 57, metadata !1313, null}
!2848 = metadata !{i32 321, i32 3, metadata !1313, null}
!2849 = metadata !{i32 325, i32 15, metadata !1313, null}
!2850 = metadata !{i32 326, i32 4, metadata !2851, null}
!2851 = metadata !{i32 786443, metadata !1313, i32 325, i32 39, metadata !37, i32 245} ; [ DW_TAG_lexical_block ]
!2852 = metadata !{i32 327, i32 3, metadata !2851, null}
!2853 = metadata !{i32 330, i32 6, metadata !1314, null}
!2854 = metadata !{i32 331, i32 3, metadata !2855, null}
!2855 = metadata !{i32 786443, metadata !1314, i32 330, i32 29, metadata !37, i32 246} ; [ DW_TAG_lexical_block ]
!2856 = metadata !{i32 332, i32 2, metadata !2855, null}
!2857 = metadata !{i32 333, i32 1, metadata !1314, null}
!2858 = metadata !{i32 383, i32 55, metadata !1261, null}
!2859 = metadata !{i32 385, i32 7, metadata !1277, null}
!2860 = metadata !{i32 387, i32 22, metadata !1277, null}
!2861 = metadata !{i8 0}                          
!2862 = metadata !{i32 388, i32 29, metadata !1277, null}
!2863 = metadata !{i32 389, i32 59, metadata !1277, null}
!2864 = metadata !{i32 391, i32 2, metadata !1277, null}
!2865 = metadata !{i32 395, i32 2, metadata !1277, null}
!2866 = metadata !{i32 398, i32 27, metadata !1293, null}
!2867 = metadata !{i32 400, i32 3, metadata !1293, null}
!2868 = metadata !{i32 402, i32 10, metadata !1296, null}
!2869 = metadata !{i32 403, i32 13, metadata !1296, null}
!2870 = metadata !{i32 404, i32 23, metadata !2871, null}
!2871 = metadata !{i32 786443, metadata !1296, i32 403, i32 62, metadata !37, i32 224} ; [ DW_TAG_lexical_block ]
!2872 = metadata !{i32 405, i32 4, metadata !2871, null}
!2873 = metadata !{i32 407, i32 4, metadata !1296, null}
!2874 = metadata !{i32 414, i32 4, metadata !1298, null}
!2875 = metadata !{i32 415, i32 10, metadata !1298, null}
!2876 = metadata !{i32 417, i32 5, metadata !1298, null}
!2877 = metadata !{i32 419, i32 11, metadata !2878, null}
!2878 = metadata !{i32 786443, metadata !1298, i32 418, i32 6, metadata !37, i32 227} ; [ DW_TAG_lexical_block ]
!2879 = metadata !{i32 420, i32 23, metadata !2878, null}
!2880 = metadata !{i32 421, i32 4, metadata !2878, null}
!2881 = metadata !{i32 422, i32 30, metadata !1301, null}
!2882 = metadata !{i32 423, i32 5, metadata !1301, null}
!2883 = metadata !{i32 436, i32 7, metadata !2884, null}
!2884 = metadata !{i32 786443, metadata !1300, i32 435, i32 29, metadata !37, i32 232} ; [ DW_TAG_lexical_block ]
!2885 = metadata !{i32 435, i32 6, metadata !1300, null}
!2886 = metadata !{i32 424, i32 6, metadata !2887, null}
!2887 = metadata !{i32 786443, metadata !1301, i32 423, i32 15, metadata !37, i32 229} ; [ DW_TAG_lexical_block ]
!2888 = metadata !{i32 425, i32 7, metadata !2887, null}
!2889 = metadata !{i32 430, i32 31, metadata !2887, null}
!2890 = metadata !{i32 431, i32 5, metadata !2887, null}
!2891 = metadata !{i32 439, i32 7, metadata !2884, null}
!2892 = metadata !{i32 441, i32 6, metadata !1300, null}
!2893 = metadata !{i32 442, i32 13, metadata !2894, null}
!2894 = metadata !{i32 786443, metadata !1300, i32 441, i32 20, metadata !37, i32 234} ; [ DW_TAG_lexical_block ]
!2895 = metadata !{i32 443, i32 6, metadata !2894, null}
!2896 = metadata !{i32 444, i32 13, metadata !2897, null}
!2897 = metadata !{i32 786443, metadata !1300, i32 443, i32 13, metadata !37, i32 235} ; [ DW_TAG_lexical_block ]
!2898 = metadata !{i32 451, i32 4, metadata !2899, null}
!2899 = metadata !{i32 786443, metadata !1293, i32 450, i32 20, metadata !37, i32 236} ; [ DW_TAG_lexical_block ]
!2900 = metadata !{i8 1}                          ; [ DW_TAG_array_type ]
!2901 = metadata !{i32 452, i32 4, metadata !2899, null}
!2902 = metadata !{i32 453, i32 3, metadata !2899, null}
!2903 = metadata !{i32 456, i32 27, metadata !1277, null}
!2904 = metadata !{i32 468, i32 11, metadata !2905, null}
!2905 = metadata !{i32 786443, metadata !2906, i32 459, i32 22, metadata !37, i32 238} ; [ DW_TAG_lexical_block ]
!2906 = metadata !{i32 786443, metadata !1277, i32 457, i32 12, metadata !37, i32 237} ; [ DW_TAG_lexical_block ]
!2907 = metadata !{i32 457, i32 2, metadata !1277, null}
!2908 = metadata !{i32 459, i32 3, metadata !2906, null}
!2909 = metadata !{i32 460, i32 4, metadata !2905, null}
!2910 = metadata !{i32 461, i32 5, metadata !2905, null}
!2911 = metadata !{i32 463, i32 5, metadata !2912, null}
!2912 = metadata !{i32 786443, metadata !2905, i32 462, i32 6, metadata !37, i32 239} ; [ DW_TAG_lexical_block ]
!2913 = metadata !{i32 464, i32 6, metadata !2914, null}
!2914 = metadata !{i32 786443, metadata !2912, i32 463, i32 25, metadata !37, i32 240} ; [ DW_TAG_lexical_block ]
!2915 = metadata !{i32 465, i32 6, metadata !2914, null}
!2916 = metadata !{i32 466, i32 6, metadata !2914, null}
!2917 = metadata !{i32 467, i32 5, metadata !2914, null}
!2918 = metadata !{i32 469, i32 5, metadata !2905, null}
!2919 = metadata !{i32 471, i32 30, metadata !2920, null}
!2920 = metadata !{i32 786443, metadata !2905, i32 470, i32 6, metadata !37, i32 241} ; [ DW_TAG_lexical_block ]
!2921 = metadata !{i32 472, i32 5, metadata !2920, null}
!2922 = metadata !{i32 474, i32 5, metadata !2923, null}
!2923 = metadata !{i32 786443, metadata !2905, i32 473, i32 11, metadata !37, i32 242} ; [ DW_TAG_lexical_block ]
!2924 = metadata !{i32 475, i32 5, metadata !2923, null}
!2925 = metadata !{i32 478, i32 28, metadata !2906, null}
!2926 = metadata !{i32 479, i32 2, metadata !2906, null}
!2927 = metadata !{i32 480, i32 2, metadata !1277, null}
!2928 = metadata !{i32 482, i32 2, metadata !1277, null}
!2929 = metadata !{i32 483, i32 1, metadata !1277, null}
!2930 = metadata !{i32 489, i32 37, metadata !1248, null}
!2931 = metadata !{i32 489, i32 50, metadata !1248, null}
!2932 = metadata !{i32 491, i32 21, metadata !1256, null}
!2933 = metadata !{i32 494, i32 2, metadata !1256, null}
!2934 = metadata !{i32 495, i32 2, metadata !1256, null}
!2935 = metadata !{i32 496, i32 7, metadata !1260, null}
!2936 = metadata !{i32 497, i32 62, metadata !1259, null}
!2937 = metadata !{i32 498, i32 21, metadata !1259, null}
!2938 = metadata !{i32 499, i32 3, metadata !1259, null}
!2939 = metadata !{i32 500, i32 21, metadata !2940, null}
!2940 = metadata !{i32 786443, metadata !1260, i32 499, i32 10, metadata !37, i32 218} ; [ DW_TAG_lexical_block ]
!2941 = metadata !{i32 502, i32 3, metadata !1260, null}
!2942 = metadata !{i32 505, i32 3, metadata !1260, null}
!2943 = metadata !{i32 507, i32 2, metadata !1256, null}
!2944 = metadata !{i8* getelementptr inbounds ([12 x i8]* @.str80, i64 0, i64 0)}
!2945 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2946} ; [ DW_TAG_arg_variable ]
!2946 = metadata !{i32 587, i32 9, metadata !2947, null}
!2947 = metadata !{i32 786443, metadata !1243, i32 586, i32 1, metadata !37, i32 214} ; [ DW_TAG_lexical_block ]
!2948 = metadata !{i32 510, i32 39, metadata !1189, metadata !2946}
!2949 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2946} ; [ DW_TAG_arg_variable ]
!2950 = metadata !{i32 510, i32 52, metadata !1189, metadata !2946}
!2951 = metadata !{i32 516, i32 6, metadata !1198, metadata !2946}
!2952 = metadata !{i32 517, i32 61, metadata !1197, metadata !2946}
!2953 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2946} ; [ DW_TAG_auto_variable ]
!2954 = metadata !{i32 518, i32 10, metadata !1197, metadata !2946}
!2955 = metadata !{i32 522, i32 9, metadata !1198, metadata !2946}
!2956 = metadata !{i32 643, i32 47, metadata !1231, null}
!2957 = metadata !{i32 645, i32 15, metadata !1236, null}
!2958 = metadata !{i32 646, i32 8, metadata !1236, null}
!2959 = metadata !{i32 651, i32 2, metadata !1236, null}
!2960 = metadata !{i32 653, i32 2, metadata !1236, null}
!2961 = metadata !{i32 654, i32 51, metadata !1239, null}
!2962 = metadata !{i32 675, i32 3, metadata !2963, null}
!2963 = metadata !{i32 786443, metadata !1236, i32 674, i32 9, metadata !37, i32 212} ; [ DW_TAG_lexical_block ]
!2964 = metadata !{i32 655, i32 71, metadata !1239, null}
!2965 = metadata !{i32 655, i32 48, metadata !1239, null}
!2966 = metadata !{i32 786689, metadata !1189, metadata !"name", metadata !37, i32 16777726, metadata !57, i32 0, metadata !2967} ; [ DW_TAG_arg_variable ]
!2967 = metadata !{i32 656, i32 21, metadata !1239, null}
!2968 = metadata !{i32 510, i32 39, metadata !1189, metadata !2967}
!2969 = metadata !{i32 786689, metadata !1189, metadata !"name_len", metadata !37, i32 33554942, metadata !417, i32 0, metadata !2967} ; [ DW_TAG_arg_variable ]
!2970 = metadata !{i32 510, i32 52, metadata !1189, metadata !2967}
!2971 = metadata !{i32 516, i32 6, metadata !1198, metadata !2967}
!2972 = metadata !{i32 517, i32 61, metadata !1197, metadata !2967}
!2973 = metadata !{i32 786688, metadata !1197, metadata !"request", metadata !37, i32 517, metadata !674, i32 0, metadata !2967} ; [ DW_TAG_auto_variable ]
!2974 = metadata !{i32 518, i32 10, metadata !1197, metadata !2967}
!2975 = metadata !{i32 522, i32 9, metadata !1198, metadata !2967}
!2976 = metadata !{i32 657, i32 65, metadata !1239, null}
!2977 = metadata !{i32 657, i32 44, metadata !1239, null}
!2978 = metadata !{i32 659, i32 3, metadata !1239, null}
!2979 = metadata !{i32 660, i32 14, metadata !1239, null}
!2980 = metadata !{i32 662, i32 3, metadata !1239, null}
!2981 = metadata !{i32 663, i32 4, metadata !2982, null}
!2982 = metadata !{i32 786443, metadata !1239, i32 662, i32 20, metadata !37, i32 209} ; [ DW_TAG_lexical_block ]
!2983 = metadata !{i32 664, i32 3, metadata !2982, null}
!2984 = metadata !{i32 665, i32 3, metadata !1239, null}
!2985 = metadata !{i32 666, i32 4, metadata !2986, null}
!2986 = metadata !{i32 786443, metadata !1239, i32 665, i32 18, metadata !37, i32 210} ; [ DW_TAG_lexical_block ]
!2987 = metadata !{i32 667, i32 3, metadata !2986, null}
!2988 = metadata !{i32 670, i32 7, metadata !1239, null}
!2989 = metadata !{i32 671, i32 4, metadata !2990, null}
!2990 = metadata !{i32 786443, metadata !1239, i32 670, i32 109, metadata !37, i32 211} ; [ DW_TAG_lexical_block ]
!2991 = metadata !{i32 672, i32 3, metadata !2990, null}
!2992 = metadata !{i32 673, i32 3, metadata !1239, null}
!2993 = metadata !{i32 674, i32 2, metadata !1239, null}
!2994 = metadata !{i32 676, i32 18, metadata !2963, null}
!2995 = metadata !{i32 677, i32 7, metadata !2963, null}
!2996 = metadata !{i32 678, i32 4, metadata !2997, null}
!2997 = metadata !{i32 786443, metadata !2963, i32 677, i32 109, metadata !37, i32 213} ; [ DW_TAG_lexical_block ]
!2998 = metadata !{i32 679, i32 3, metadata !2997, null}
!2999 = metadata !{i32 681, i32 1, metadata !1236, null}
!3000 = metadata !{i32 683, i32 40, metadata !1221, null}
!3001 = metadata !{i32 687, i32 6, metadata !1227, null}
!3002 = metadata !{i32 690, i32 3, metadata !1226, null}
!3003 = metadata !{i32 691, i32 3, metadata !1226, null}
!3004 = metadata !{i32 692, i32 14, metadata !1229, null}
!3005 = metadata !{i32 693, i32 16, metadata !1229, null}
!3006 = metadata !{i32 695, i32 4, metadata !1229, null}
!3007 = metadata !{i32 696, i32 4, metadata !1229, null}
!3008 = metadata !{i32 697, i32 4, metadata !1229, null}
!3009 = metadata !{i32 698, i32 4, metadata !1229, null}
!3010 = metadata !{i32 699, i32 3, metadata !1229, null}
!3011 = metadata !{i32 700, i32 4, metadata !3012, null}
!3012 = metadata !{i32 786443, metadata !1226, i32 699, i32 10, metadata !37, i32 205} ; [ DW_TAG_lexical_block ]
!3013 = metadata !{i32 704, i32 3, metadata !3014, null}
!3014 = metadata !{i32 786443, metadata !1227, i32 703, i32 9, metadata !37, i32 206} ; [ DW_TAG_lexical_block ]
!3015 = metadata !{i32 706, i32 1, metadata !1227, null}
!3016 = metadata !{i32 1416, i32 8, metadata !1497, null}
!3017 = metadata !{%struct._php_cgi_globals_struct* @php_cgi_globals}
!3018 = metadata !{i32 786689, metadata !1502, metadata !"php_cgi_globals", metadata !37, i32 16778613, metadata !1505, i32 0, metadata !3019} ; [ DW_TAG_arg_variable ]
!3019 = metadata !{i32 1421, i32 2, metadata !3020, null}
!3020 = metadata !{i32 786443, metadata !1497, i32 1417, i32 1, metadata !37, i32 283} ; [ DW_TAG_lexical_block ]
!3021 = metadata !{i32 1397, i32 58, metadata !1502, metadata !3019}
!3022 = metadata !{i32 1399, i32 2, metadata !3023, metadata !3019}
!3023 = metadata !{i32 786443, metadata !1502, i32 1398, i32 1, metadata !37, i32 284} ; [ DW_TAG_lexical_block ]
!3024 = metadata !{i32 1400, i32 2, metadata !3023, metadata !3019}
!3025 = metadata !{i32 1401, i32 2, metadata !3023, metadata !3019}
!3026 = metadata !{i32 1402, i32 2, metadata !3023, metadata !3019}
!3027 = metadata !{i32 1403, i32 2, metadata !3023, metadata !3019}
!3028 = metadata !{i32 1404, i32 2, metadata !3023, metadata !3019}
!3029 = metadata !{i32 1405, i32 2, metadata !3023, metadata !3019}
!3030 = metadata !{i32 1406, i32 2, metadata !3023, metadata !3019}
!3031 = metadata !{i32 1410, i32 2, metadata !3023, metadata !3019}
!3032 = metadata !{i32 1423, i32 2, metadata !3020, null}
!3033 = metadata !{i32 1424, i32 2, metadata !3020, null}
!3034 = metadata !{i32 1430, i32 8, metadata !1492, null}
!3035 = metadata !{i32 1432, i32 2, metadata !3036, null}
!3036 = metadata !{i32 786443, metadata !1492, i32 1431, i32 1, metadata !37, i32 282} ; [ DW_TAG_lexical_block ]
!3037 = metadata !{i32 1434, i32 2, metadata !3036, null}
!3038 = metadata !{i32 1435, i32 2, metadata !3036, null}
!3039 = metadata !{i32 1441, i32 8, metadata !1488, null}
!3040 = metadata !{i32 1443, i32 2, metadata !3041, null}
!3041 = metadata !{i32 786443, metadata !1488, i32 1442, i32 1, metadata !37, i32 281} ; [ DW_TAG_lexical_block ]
!3042 = metadata !{i32 1444, i32 1, metadata !3041, null}
!3043 = metadata !{i32 188, i32 67, metadata !1521, null}
!3044 = metadata !{i32 190, i32 2, metadata !3045, null}
!3045 = metadata !{i32 786443, metadata !1521, i32 189, i32 1, metadata !37, i32 285} ; [ DW_TAG_lexical_block ]
!3046 = metadata !{i32 191, i32 2, metadata !3045, null}
!3047 = metadata !{i32 192, i32 1, metadata !3045, null}
